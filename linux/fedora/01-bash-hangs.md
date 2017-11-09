## Environments
* Fedora 26 x86_64

## Issue behavior:
Enter an unrecogized command and run it, the bash complains `command not found` but it then hangs. 
For example, suppose you have installed `clang` package on your system and enter `clang` command, you will get:
```
$ clang
bash: clang: command not found...
```

The bash didn't even exit, you have to press `CTRL + C` to interrupt it.

## Solution
Switch to root account and run:
```
# sed -i 's/SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf
``` 

## Reference
* [bash hangs on "command not found"](https://forums.fedoraforum.org/showthread.php?t=240982)
* [Why a long delay after command not found?](https://unix.stackexchange.com/questions/25681/why-a-long-delay-after-command-not-found)
