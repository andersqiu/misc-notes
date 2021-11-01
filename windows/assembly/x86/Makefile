# Build in x86 Native Tools Command Prompt for VS2019
APP=hello

all: $(APP).exe $(APP)2.exe

$(APP).exe: $(APP).obj
	link /subsystem:console $(APP).obj

$(APP).obj: $(APP).asm
	ml /c /coff $(APP).asm

$(APP)2.exe: $(APP)2.obj
	link /subsystem:console $(APP)2.obj

$(APP)2.obj: $(APP)2.asm
	ml /c /coff $(APP)2.asm

clean:
	del $(APP).exe
	del $(APP).obj
	del $(APP)2.exe
	del $(APP)2.obj
	
