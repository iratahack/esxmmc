PROJ:=ESXMMC

all: $(PROJ).bin

clean:
	rm -f *.map *.o *.bin *.asm

$(PROJ).asm:
	skool2asm.py -c -H $(PROJ).skool > $(PROJ).asm

$(PROJ).bin: $(PROJ).asm
	z88dk-z80asm -mz80 -m -b -o$@ $<
