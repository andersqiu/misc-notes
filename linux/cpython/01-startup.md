# Startup
For all C programs, the entry point is `main` function.

In CPython, the `main` function is located at `./Modules/python.c:10`

| Calling loop | Function | File | Line |
| --- | --- | --- | --- |
| 1 | `main` | ./Modules/python.c | 10 |
| 2 | `Py_Main` | ./Modules/main.c | 218 |
