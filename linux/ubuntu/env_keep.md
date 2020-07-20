# Introduction
Add proxy to `/etc/sudoers` to make the proxy take effect in `sudo` commands

## Solution
```
$ sudo visudo
```
Add this line:
```
Defaults        env_keep += "http_proxy https_proxy"
```

Save and exit.

## Check
Now you can run `sudo apt update` without `-E` option to make sure the proxies are applied
