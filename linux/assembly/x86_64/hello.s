.section .data
hello_world:
	.ascii "Hello World!\n"

.section .text
.global _start
_start:
	movq $1, %rax
	movq $1, %rdi
	movq $hello_world, %rsi
	movq $13, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall

