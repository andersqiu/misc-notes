# Introduction
Add media repo from DVD iso

## How to add repo
* Insert the DVD iso file
* Run command
```
$ sudo sed -i "s/media\/CentOS/run\/media\/andersqiu\/CentOS\\\ 7\\\ x86_64/" /etc/yum.repos.d/CentOS-Media.repo
$ sudo yum-config-manager --disable base extras updates
$ sudo yum-config-manager --enable c7-media
$ sudo yum makecache
```
* Check the added repo
```
$ sudo yum repolist
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * c7-media: 
repo id                                                                                 repo name                                                                                       status
c7-media                                                                                CentOS-7 - Media                                                                                9,911
repolist: 9,911
```
