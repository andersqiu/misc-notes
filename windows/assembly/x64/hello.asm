includelib kernel32.lib

.data
szHelloWorld db "Hello World!", 0dh, 0ah
stdout dq ?

GetStdHandle PROTO
WriteConsoleA PROTO
ExitProcess PROTO

.code
main proc
	mov rcx, -11
	call GetStdHandle
	mov rcx, rax
	lea rdx, szHelloWorld
	mov r8, lengthof szHelloWorld
	mov r9, 0
	call WriteConsoleA
	
	mov rcx, 0
	call ExitProcess
main endp
	
end