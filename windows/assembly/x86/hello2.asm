.model flat, stdcall

.data
szHelloWorld db "Hello World!", 0dh, 0ah

GetStdHandle PROTO STDCALL :DWORD
WriteConsoleA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
ExitProcess PROTO STDCALL :DWORD

includelib kernel32.lib

.code
start:

    invoke GetStdHandle, -11
    invoke WriteConsoleA, eax, offset szHelloWorld, 14, ebx, 0
    invoke ExitProcess, 0

end start
