.section .data
hello_world:
	.ascii "Hello World!\n"

.section .text
.global _start
_start:
	movl $4, %eax
	movl $1, %ebx
	movl $hello_world, %ecx
	movl $13, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80

