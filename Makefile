.PHONY: clean
.IGNORE: clean
GCC_OPTS=-Wall -m32
NASM_OPTS=-f elf

main: main.o rule1.o rule2.o
	gcc $(GCC_OPTS) -o main main.o rule1.o rule2.o
main.o: main.c nasm_module.h
	gcc $(GCC_OPTS) -c -o main.o main.c
rule1.o: rule1.asm
	nasm $(NASM_OPTS) -o rule1.o rule1.asm
rule2.o: rule2.asm
	nasm $(NASM_OPTS) -o rule2.o rule2.asm

clean:
	rm -v main main.o rule[12].o
