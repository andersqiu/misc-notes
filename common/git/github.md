# Introduction
How to set up github SSH config

## Generate SSH Keys
```
$ ssh-keygen -t rsa -b 4096 -C "qiuzhong0917@gmail.com"
$ ssh-add ~/.ssh/id_rsa
```

## Copy the public key to github.com
* Login github.com
* Go to **Settings** -> **SSH and GPG keys**
* Click **New SSH key**

## Add ~/.ssh/config file
```
$ touch ~/.ssh/config
$ chmod 600 ~/.ssh/config
```

For the content of ~/.ssh/config, please see the example file ssh.config.example.

## Check connection
```
$ ssh -T git@github.com
Hi andersqiu! You've successfully authenticated, but GitHub does not provide shell access.
```
