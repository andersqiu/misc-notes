# Introduction
x86 assembly language example on Linux

## Examples
* Hello World example for both Linux x86 and x86-64

## Arguments passing convention
* x86: passing arguments via stack
  | Fucntion parameter 1 |	   16(%ebp)
  | Function parameter 2 |	   12(%ebp)
  | Function parameter 3 |	   8(%ebp)
  | 	Return Address   |	   4(%ebp)
  | 	Old EBP Value    | --> ESP  (%ebp)
  
  ```
  function:
	pushl %ebp
	movl %esp, %ebp
	.
	.
	movl %ebp, %esp
	popl %ebp
	ret
  ```

* x86-64: The first 6 integer parameters in a function under Linux are passed in registers **RDI, RSI, RDX, RCX, R8, R9**, 
  Windows uses **RCX, RDX, R8, R9** for the first 4 integer parameters. Others are pushed on the stack in reverse order.
