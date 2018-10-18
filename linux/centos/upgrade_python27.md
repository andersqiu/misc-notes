# Introduction
Upgrade Python 2.7 on CentOS 6.x

## Environment
* CentOS 6.10 i686

## Build Python 2.7 from source
```
$ tar -xvf Python-2.7.15.tgz
$ cd Python-2.7.15
$ ./configure --enable-shared --with-ensurepip=install
$ make
$ sudo make install
```

## Configuration
```
$ sudo sh -c "echo /usr/local/lib > /etc/ld.so.conf.d/python27.conf"
$ sudo ldconfig
```
