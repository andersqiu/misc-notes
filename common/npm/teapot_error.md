# Introduction
Npm error 418 I am a Teapot!

## Possible solution
The registry protocol use `http` but it requires `https`
```
$ vim ~/.npmrc
registry=https://registry.npm.org
```
