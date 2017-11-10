# Introduction
**COMSPEC** or **ComSpec** is one of the environment variables used in DOS, OS/2 and Windows, which normally points to the command line interpreter, which is by default **COMMAND.COM** in DOS or **CMD.EXE** in OS/2 and Windows NT. The variable name is written in all-uppercase under DOS and OS/2. Under Windows, which also supports lowercase environment variable names, the variable name is COMSPEC inside the DOS emulator NTVDM and for any DOS programs, and ComSpec under CMD.EXE.

The variable's contents can be displayed by typing `SET` or `ECHO %COMSPEC%` at the command prompt.

The environment variable by default points to the full **path** of the command line interpreter. It can also be made by a different company or be a different version.

```
echo %comspec%
C:\WINDOWS\system32\cmd.exe
```


## Options
Use `cmd /?` to show the help documentation. 

> /C      Carries out the command specified by string and then terminates
> /K      Carries out the command specified by string but remains
