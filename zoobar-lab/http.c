#include "http.h"
#include <sys/param.h>

#ifndef BSD

#include <sys/sendfile.h>

#endif

#include <sys/uio.h>
#include <ctype.h>
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int http_read_line(int fd, char *buf, size_t size) {
    size_t i = 0;

    for (;;) {
        // printf("%zu vs %zu\n", i, size);

        if (i > size) {
            printf("Hacking !!!!\n");
        }

        int cc = read(fd, &buf[i], 1);
        if (cc <= 0)
            break;

        if (buf[i] == '\r') {
            buf[i] = '\0';      /* skip */
            continue;
        }

        if (buf[i] == '\n') {
            buf[i] = '\0';
            return 0;
        }

        if (i >= size - 1) {
            buf[i] = '\0';
            return 0;
        }

        i++;
    }

    return -1;
}

const char *http_request_line(int fd, char *reqpath, char *env, size_t *env_len) {
    static char buf[8192];      /* static variables are not on the stack */
    char *sp1, *sp2, *qp, *envp = env;

    if (http_read_line(fd, buf, sizeof(buf)) < 0)
        return "Socket IO error";

    /* Parse request like "GET /foo.html HTTP/1.0" */
    sp1 = strchr(buf, ' ');
    if (!sp1)
        return "Cannot parse HTTP request (1)";
    *sp1 = '\0';
    sp1++;
    if (*sp1 != '/')
        return "Bad request path";

    sp2 = strchr(sp1, ' ');
    if (!sp2)
        return "Cannot parse HTTP request (2)";
    *sp2 = '\0';
    sp2++;

    /* We only support GET and POST requests */
    if (strcmp(buf, "GET") && strcmp(buf, "POST"))
        return "Unsupported request (not GET or POST)";

    envp += sprintf(envp, "REQUEST_METHOD=%s", buf) + 1;

    // Hacker may smash the stack since the request path buffer size is limited to 2048 characters
    int j = 0;
    while (*(sp1 + j) != '\0') {
        // printf("%c", *(sp1 + j));
        j++;

        if (j >= 2048) {
            return "Hacking (request path too long), drop";
        }
    }

    /* decode URL escape sequences in the requested path into reqpath */
    url_decode(reqpath, sp1);

    /* parse out query string, e.g. "foo.py?user=bob" */
    if ((qp = strchr(reqpath, '?'))) {
        *qp = '\0';
        envp += sprintf(envp, "QUERY_STRING=%s", qp + 1) + 1;
    }
    envp += sprintf(envp, "SCRIPT_NAME=%s", reqpath) + 1;

    *envp = 0;
    *env_len = envp - env + 1;
    return NULL;
}

const char *http_request_headers(int fd) {
    static char buf[8192];      /* static variables are not on the stack */
    int i;
    char value[512];
    char envvar[512];

    /* Now parse HTTP headers */
    for (;;) {
        if (http_read_line(fd, buf, sizeof(buf)) < 0)
            return "Socket IO error";

        if (buf[0] == '\0')     /* end of headers */
            break;

        /* Parse things like "Cookie: foo bar" */
        char *sp = strchr(buf, ' ');
        if (!sp)
            return "Header parse error (1)";
        *sp = '\0';
        sp++;

        /* Strip off the colon, making sure it's there */
        if (strlen(buf) == 0)
            return "Header parse error (2)";

        char *colon = &buf[strlen(buf) - 1];
        if (*colon != ':')
            return "Header parse error (3)";
        *colon = '\0';

        /* Set the header name to uppercase */
        for (i = 0; i < strlen(buf); i++)
            buf[i] = toupper(buf[i]);

        /* Decode URL escape sequences in the value */

        url_decode(value, sp);

        /* Store header in env. variable for application code */
        sprintf(envvar, "HTTP_%s", buf);
        setenv(envvar, value, 1);

        /* Some special headers go into env. vars of their own */
        if (!strcasecmp(buf, "Content-Type"))
            setenv("CONTENT_TYPE", value, 1);
        if (!strcasecmp(buf, "Content-Length"))
            setenv("CONTENT_LENGTH", value, 1);
    }

    return 0;
}

void http_err(int fd, int code, char *fmt, ...) {
    fdprintf(fd, "HTTP/1.0 %d Error\r\n", code);
    fdprintf(fd, "Content-Type: text/html\r\n");
    fdprintf(fd, "\r\n");
    fdprintf(fd, "<H1>An error occurred</H1>\r\n");

    char *msg = 0;
    va_list ap;
    va_start(ap, fmt);
    vasprintf(&msg, fmt, ap);
    va_end(ap);

    fdprintf(fd, "%s\n", msg);

    close(fd);
    warnx("[%d] Request failed: %s", getpid(), msg);
    free(msg);
}

void http_serve(int fd, const char *name) {
    void (*handler)(int, const char *) = http_serve_none;
    char pn[1024];
    struct stat st;

    getcwd(pn, sizeof(pn));
    strcat(pn, name);
    setenv("SCRIPT_FILENAME", pn, 1);

    if (!stat(pn, &st)) {
        /* executable bits -- run as CGI script */
        if (S_ISREG(st.st_mode) && (st.st_mode & S_IXUSR))
            handler = http_serve_executable;
        else if (S_ISDIR(st.st_mode))
            handler = http_serve_directory;
        else
            handler = http_serve_file;
    }

    handler(fd, pn);
}

void http_serve_none(int fd, const char *pn) {
    http_err(fd, 404, "File not exist: %s", pn);
}

void http_serve_file(int fd, const char *pn) {
    int filefd;
    off_t len = 0;

    if ((filefd = open(pn, O_RDONLY)) < 0)
        return http_err(fd, 500, "open %s: %s", pn, strerror(errno));

    const char *ext = strrchr(pn, '.');
    const char *mimetype = "text/html";
    if (ext && !strcmp(ext, ".css"))
        mimetype = "text/css";
    if (ext && !strcmp(ext, ".jpg"))
        mimetype = "image/jpeg";

    fdprintf(fd, "HTTP/1.0 200 OK\r\n");
    fdprintf(fd, "Content-Type: %s\r\n", mimetype);
    fdprintf(fd, "\r\n");

#ifndef BSD
    struct stat st;
    if (!fstat(filefd, &st))
        len = st.st_size;
    if (sendfile(fd, filefd, 0, len) < 0)
#else
        if (sendfile(filefd, fd, 0, &len, 0, 0) < 0)
#endif
        err(1, "sendfile");
    close(filefd);
}

void http_serve_directory(int fd, const char *pn) {
    char name[1024];
    strcpy(name, getenv("SCRIPT_NAME"));
    if (name[strlen(name) - 1] != '/')
        strcat(name, "/");
    /* for directories, use index.html in that directory */
    strcat(name, "index.html");
    http_serve(fd, name);
}

void http_serve_executable(int fd, const char *pn) {
    fdprintf(fd, "HTTP/1.0 200 OK\r\n");
    dup2(fd, 0);
    dup2(fd, 1);
    close(fd);
    execl(pn, pn, NULL);
    http_err(1, 500, "execl %s: %s", pn, strerror(errno));
}

void url_decode(char *dst, const char *src) {
    for (;;) {
        if (src[0] == '%' && src[1] && src[2]) {
            char hexbuf[3];
            hexbuf[0] = src[1];
            hexbuf[1] = src[2];
            hexbuf[2] = '\0';

            *dst = strtol(&hexbuf[0], 0, 16);
            src += 3;
        } else if (src[0] == '+') {
            *dst = ' ';
            src++;
        } else {
            *dst = *src;
            src++;

            if (*dst == '\0')
                break;
        }

        dst++;
    }
}

void env_deserialize(const char *env, size_t len) {
    for (;;) {
        char *p = strchr(env, '=');
        if (p == 0 || p - env > len)
            break;
        *p++ = 0;
        setenv(env, p, 1);
        p += strlen(p) + 1;
        len -= (p - env);
        env = p;
    }
    setenv("GATEWAY_INTERFACE", "CGI/1.1", 1);
    setenv("REDIRECT_STATUS", "200", 1);
}

void fdprintf(int fd, char *fmt, ...) {
    char *s = 0;

    va_list ap;
    va_start(ap, fmt);
    vasprintf(&s, fmt, ap);
    va_end(ap);

    write(fd, s, strlen(s));
    free(s);
}

ssize_t sendfd(int socket, const void *buffer, size_t length, int fd) {
    struct iovec iov = {(void *) buffer, length};
    char buf[CMSG_LEN(sizeof(int))];
    struct cmsghdr *cmsg = (struct cmsghdr *) buf;
    ssize_t r;
    cmsg->cmsg_len = sizeof(buf);
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    *((int *) CMSG_DATA(cmsg)) = fd;
    struct msghdr msg = {0};
    msg.msg_iov = &iov;
    msg.msg_iovlen = 1;
    msg.msg_control = cmsg;
    msg.msg_controllen = cmsg->cmsg_len;
    r = sendmsg(socket, &msg, 0);
    if (r <= 0)
        warn("sendmsg");
    return r;
}

ssize_t recvfd(int socket, void *buffer, size_t length, int *fd) {
    struct iovec iov = {buffer, length};
    char buf[CMSG_LEN(sizeof(int))];
    struct cmsghdr *cmsg = (struct cmsghdr *) buf;
    ssize_t r;
    cmsg->cmsg_len = sizeof(buf);
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    struct msghdr msg = {0};
    msg.msg_iov = &iov;
    msg.msg_iovlen = 1;
    msg.msg_control = cmsg;
    msg.msg_controllen = cmsg->cmsg_len;
    again:
    r = recvmsg(socket, &msg, 0);
    if (r < 0 && errno == EINTR)
        goto again;
    if (r <= 0)
        warn("recvmsg");
    else
        *fd = *((int *) CMSG_DATA(cmsg));
    return r;
}
