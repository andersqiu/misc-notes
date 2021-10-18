all: hello hello2

hello: hello.s
	as -o hello.o hello.s
	ld -o hello hello.o

hello2: hello2.s
	as -o hello2.o hello2.s
	ld -o hello2 hello2.o

clean:
	rm -fv hello.o hello
	rm -fv hello2.o hello2

