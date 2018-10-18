# Introduction
How to upgrade git from 1.7.1 to 2.19.1

## Environment
* CentOS 6.10 i686
* Python 2.7.15 installed

## Build from git from source
```
$ sudo yum install dh-autoreconf curl-devel expat-devel gettext-devel \
  openssl-devel perl-devel zlib-devel
$ sudo yum install asciidoc xmlto
$ sudo rpm -vi docbook2x-0.8.8-1.el6.rf.i686.rpm
$ sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

$ tar -zxf git-2.19.1.tar.gz
$ cd git-2.19.1
$ make configure
$ ./configure --prefix=/usr
$ make all doc info
$ sudo make install install-doc install-html install-info
```
