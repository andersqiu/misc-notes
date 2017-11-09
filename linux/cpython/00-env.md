# CPython study environments
* CentOS 6.9 i386
* GCC 4.4.7

## Build CPython

```
$ tar -xvf Python-2.5.6.tgz
$ cd Python-2.5.6
$ ./configure
$ make
$ ./python -V
Python 2.5.6
``` 

## Data types of the environment
| Data Type | Length |
| --- | --- |
| (signed) char | 1 Byte |
| unsigned char | 1 Byte |
| (signed) short (int) | 2 Bytes |
| unsigned short (int) | 2 Bytes |
| (signed) int | 4 Bytes |
| unsigned int | 4 Bytes |
| (signed) long (int) | 4 Bytes |
| unsigned long (int) | 4 Bytes |
| (signed) long long (int) | 8 Bytes |
| unsigned long long (int) | 8 Bytes |
| float | 4 Bytes |
| double | 8 Bytes |
| long double | 12 Bytes |
| void* | 4 Bytes |

## Typedef in C header files
| Typedef | Actual Data Type |
| --- | --- |
| __ssize_t | int |
| ssize_t | int |
| size_t | unsigned int |

## Typedef in CPython source code
| Typedef | Actual Data Type |
| --- | --- |
| Py_ssize_t | int |