OBJS = bank0.asm
OBJS_NAME = bank0

OBJ_NAME = gb

ASM = rgbasm

LINK = rgblink

FIX = rgbfix

all : $(OBJS)
	$(ASM) -o$(OBJS_NAME).obj $(OBJS)
	$(LINK) -m$(OBJ_NAME).map -n$(OBJ_NAME).sym -o$(OBJ_NAME).gb $(OBJS_NAME).obj
	$(FIX) -v -p 0x00 $(OBJ_NAME).gb
	rm $(OBJS_NAME).obj

allrun:
	make
	gambatte --scale 6 gb.gb