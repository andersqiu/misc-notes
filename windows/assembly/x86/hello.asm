.model flat, stdcall

.data
szHelloWorld db "Hello World!", 0dh, 0ah

extern GetStdHandle@4: proc
extern WriteConsoleA@20: proc
extern ExitProcess@4: proc
 
includelib kernel32.lib

.code
start:
    push -11
    call GetStdHandle@4

    push 0
    push ebx
    push 14
    mov edx, offset szHelloWorld
    push edx
    push eax
    call WriteConsoleA@20

    push 0
    call ExitProcess@4

end start
