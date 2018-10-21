# Introduction
Add media repo from DVD iso

## How to add repo
* Insert the DVD iso file
* Run command
```
$ sudo sed -i "s/media\/CentOS/media\/CentOS_6.10_Final/" /etc/yum.repos.d/CentOS-Media.repo
$ sudo yum-config-manager --disable base extras updates
$ sudo yum-config-manager --enable c6-media
$ sudo yum makecache
```
* Check the added repo
```
$ sudo yum repolist
Loaded plugins: fastestmirror, refresh-packagekit, security
Loading mirror speeds from cached hostfile
 * c6-media: 
c6-media                                                                                                                                                              | 4.0 kB     00:00 ... 
repo id                                                                                repo name                                                                                       status
c6-media                                                                               CentOS-6 - Media                                                                                5,075
repolist: 5,075
```
