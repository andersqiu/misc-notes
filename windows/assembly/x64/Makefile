# Build in x64 Native Tools Command Prompt for VS2019
APP=hello

$(APP).exe: $(APP).obj
	link /subsystem:console /entry:main $(APP).obj

$(APP).obj: $(APP).asm
	ml64 /c $(APP).asm
	
clean:
	del $(APP).exe
	del $(APP).obj
	