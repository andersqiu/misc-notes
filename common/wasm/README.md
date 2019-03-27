# Introduction
Web Assembly notes

## Setup
```
$ git clone https://github.com/emscripten-core/emsdk.git
$ cd emsdk
$ ./emsdk install latest
$ ./emsdk activate latest # Seems not working
$ source emsdk_env.sh
```

## Hello World example
### Build
```
$ mkdir hello
$ cd hello
$ cat << EOF > hello.c
#include <stdio.h>
int main(int argc, char ** argv) {
  printf("Hello, world!\n");
}
EOF
$ emcc hello.c -s WASM=1 -o hello.html
```

### Run
```
$ emrun --no_browser --port 8080 .
```

Open the browser, go to `http://127.0.0.1:8080/hello.html`.

## Run wasm with minimal code
### Browser
Please go to the browser directory and follow the [README](./browser/README.md).

### Node.js envrionment
Please go to the node directory and follow the [README](./node/README.md).
