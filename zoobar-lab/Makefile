ASFLAGS := -m32
CFLAGS  := -m32 -g -std=c99 -fno-stack-protector -Wall -D_GNU_SOURCE
LDFLAGS := -m32
LDLIBS  := -lcrypto

all = shellcode.bin sp
all: $(all)

zookld: zookld.o http.o

zookd: zookd.o http.o

zookfs: zookfs.o http.o

%.bin: %.o
	objcopy -S -O binary -j .text $< $@

clean:
	rm -f *.o *.bin $(all)

