#include <stdio.h>

unsigned int get_sp(void) {
	__asm__("movl %esp,%eax");
}

int main(int argc, char *argv[]) {
	printf("Using address: 0x%x\n", get_sp());
}
