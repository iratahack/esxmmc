PROJ:=ESXMMC

.PHONY: all clean html tap

all: $(PROJ).bin

clean:
	rm -f *.map *.o *.bin *.asm

html:
	skool2html.py -a -C -l -H $(PROJ).skool

./taput/taput:
	make -C taput

tap: $(PROJ).bin ./taput/taput
	./taput/taput replace -s 4 $(PROJ).bin $(PROJ).TAP

$(PROJ).asm: $(PROJ).skool
	skool2asm.py -c -H $(PROJ).skool > $(PROJ).asm

$(PROJ).bin: $(PROJ).asm
	z88dk-z80asm -mz80 -m -b -o$@ $<
	diff $(PROJ).bin $(PROJ).BIN
