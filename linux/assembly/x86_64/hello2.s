.section .data
hello_world:
	.ascii "Hello World!\n"

.section .text
.global _start
_start:
	movl $1, %eax		# default operand is 32-bit on Linux x64
	movl $1, %edi
	movq $hello_world, %rsi # default address is 64-bit on Linux x64
	movl $13, %edx
	syscall

	movl $60, %eax
	xor  %edi, %edi
	syscall

