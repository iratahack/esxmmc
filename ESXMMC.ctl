@ 00000 start
@ 00000 equ=INIT_FLAG=11586
@ 00000 equ=TAPEIN=11595
@ 00000 equ=TAPEOUT=11596
@ 00000 equ=DE_SAVE=15858
@ 00000 equ=HL_SAVE=15860
@ 00000 equ=BC_SAVE=15862
@ 00000 equ=CURRENT_BANK=15865
@ 00000 equ=A_SAVE=15866
c 00000 DivMMC RST $00 entry point
D 00000 Execution resumes here after reset
@ 00000 org $0000
@ 00000 label=start
C 00000,1 Disable interrupts
N 00001 Entry point for RST $00 when called from the 48K ROM
C 00001,3 Setup the stack pointer
C 00004,3 Continue initialization
u 00007 Unused
B 00007,1,1
c 00008 DivMMC RST $08 entry point
D 00008 This entry point is used by the routines at #R237, #R673, #R717, #R735, #R1073, #R1519, #R1777, #R1860, #R2806, #R3540, #R4261, #R4271, #R4277, #R4683, #R4952, #R6082, #R6856, #R6894 and #R8076.
N 00011 Entry point for RST $08 when called from the 48K ROM
C 00011,3 Get CH-ADD - Address of the next character to be interpreted.
c 00016 DivMMC RST $10 entry point
D 00016 Display the character in the 'a' register.
N 00016 Used by the routines at #R257, #R673, #R1107, #R1162, #R1329, #R2127, #R2160, #R2213, #R2238, #R2276, #R2283, #R3232 and #R6993.
u 00019 Unused
B 00019,2,2
c 00021 Spring-board to $0ce4
D 00021 This entry point is used by the routine at #R11.
c 00024 DivMMC RST $18 entry point
D 00024 RST $18; DEFW address. Call any routine in the standard 48K BASIC ROM.
N 00024 Used by the routines at #R1541, #R1719, #R2134, #R3101, #R3300, #R3367 and #R3429.
c 00027 Spring-board to $0c1d
D 00027 Used by the routine at #R35.
u 00030 Unused
B 00030,1,1
c 00031 Spring-board to $004b
B 00031,1,1 This op-code (jr) when combined with the byte from the next address will form the instruction jr $004b.
c 00032 DivMMC RST $20 entry point
D 00032 Used by the routines at #R3348 and #R3481.
C 00032,3 Get CH-ADD - Address of the next character to be interpreted
c 00040 DivMMC RST $28 entry point
D 00040 Used by the routines at #R6760.
u 00046 Unused
B 00046,2,2
c 00048 DivMMC RST $30 entry point
D 00048 Used by the routines at #R673, #R3018, #R3429, #R3607, #R3667, #R3719, #R3909, #R4037, #R4472, #R4588, #R4874, #R4938, #R5434, #R5773, #R5862, #R5928, #R6082, #R6255, #R6489, #R6564, #R6568 and #R7438.
t 00050 /BIN/ message
T 00050,5,5
u 00055 Unused
B 00055,1,1
c 00056 DivMMC RST $38 entry point
B 00056,1,1 This op-code (jr) when combined with the byte from the next address will form the instruction jr $001f.
N 00057 Entry point for RST $38 when called from the 48K ROM
C 00057,1 Save hl, same instruction as the 48K ROM at this address. It will be discarded from the stack later. When this op-code ($e5) is combined with the op-code at address $38 ($18) you end up with a jr $001f instruction. This will be executed when an RST $38 is executed from the DivMMC ROM. The instruction at $1f jumps to $4b which performs an ei; ret. A confusing way to support both entry points for RST $38.
C 00058,3 Address to return to in 48K ROM.
C 00061,3 Handle the transfer from DivMMC to 48K ROM.
t 00064 PLUS3DOS message
T 00064,11,8:n3
c 00075 Return from RST
t 00077 /SYS message
T 00077,5,4:n1
c 00082 Copy non-zero Data
D 00082 Copy data from hl to de while the data is non-zero.
R 00082 hl Source address
R 00082 de Destination address
N 00083 This entry point is used by the routines at #R770 and #R792.
C 00083,1 Read data from hl and check if it is zero.
C 00085,1 If it is zero, we are done.
C 00086,1 If not zero, store it and
C 00087,1 increment the pointers
C 00089,2 Loop to the next byte.
c 00091 Return from DivMMC
c 00102 DivMMC NMI entry point
C 00102,1 NMI does nothing in DivMMC
N 00103 NMI entry point from 48K ROM
C 00104,3 Save hl.
C 00107,3 Get the currently selected DivMMC RAM bank into l.
C 00110,1 Save a in h
C 00111,2 Map in RAM bank 0.
C 00115,3 Save currently selected RAM bank and the original value in a.
C 00118,1 Switch back to the RAM bank we started with.
C 00119,2 Map in the bank.
C 00121,3 Restore hl.
C 00124,2 Map in RAM bank 0.
C 00128,3 ???
C 00131,3 Spring-board into the NMI handler in RAM.
c 00134 Routine at 134
D 00134 Used by the routine at #R46.
C 00134,3 Save hl
C 00137,1 Pop the return address and
C 00138,1 increment it to skip over the op-code and
C 00139,1 put it back on the stack.
C 00140,1 Decrement it back to where it was.
C 00141,1 Save de
C 00144,1 Read the op-code
C 00145,3 Get the jump table address
C 00148,1 Add the op-code twice to
C 00149,1 get a pointer to the word address.
C 00150,1 Read the low order address byte from the table
C 00151,1 Point to the next byte
C 00152,1 Read the high order address byte from the table
C 00153,1 Copy the low order address byte into l
C 00154,1 Restore de
C 00155,1 Save the address from the table onto the stack
C 00156,3 Restore hl
C 00159,1 Return to the address read from the table
u 00160 Unused
B 00160,1,1
t 00161 Version string
B 00161,7,7 BRIGHT 1; TAB 256 + 19; BRIGHT 0
T 00168,13,13
B 00181,8,8 <CR>; BRIGHT 1; TAB 256 + 21; BRIGHT 0
B 00189,1,1 (C) + end of message
t 00190 Copyright date
T 00190,10,10
B 00200,8,8 <CR>; BRIGHT 1; TAB 256 + 19; BRIGHT 0
T 00208,13,13
B 00221,2,2 <CR>; <CR> + end of message
c 00223 Map 48K ROM
D 00223 The upper bit of the ROM selection is in bit 2 of the ZX Spectrum +2A/+3 page control register at $1ffd and the lower bit is in bit 4 of the ZX Spectrum 128 page control register at $7ffd.
D 00223 This routine works on all Spectrums >= 128K
D 00223 ROM selection is as follows: #LIST { 00b: 128k editor, menu system and self-test program } { 01b: 128k syntax checker } { 10b: +3DOS } { 11b: 48K BASIC } LIST#
N 00223 Used by the routine at #R257.
@ 00223 label=map48ROM
C 00223,3 ZX Spectrum +2A/+3 page control register
C 00226,2 Upper bit of ROM selection
C 00230,2 ZX Spectrum 128 page control register
C 00232,2 Lower bit of ROM selection
c 00237 Routine at 237
D 00237 Used by the routines at #R699, #R717, #R735 and #R1410.
C 00241,1 ESXDOS_SYS_CALL
c 00244 Routine at 244
D 00244 Used by the routine at #R257.
b 00254 Data at 254
B 00254,3,3
c 00257 Controller init
D 00257 Used by the routine at #R0.
@ 00257 label=init
C 00257,3 Delay counter
C 00260,1 Map DivMMC RAM bank 0 to address $2000
@ 00263 label=delay
C 00263,1 Decrement delay counter
C 00264,1 4 t-states
C 00265,1 4 t-states
C 00266,1 4 t-states
C 00267,1 4 t-states
C 00268,1 Check if counter is zero
C 00269,1 and continue to loop if
C 00270,2 its not.
C 00272,3 Map the Spectrum 48K ROM
C 00275,3 Initialize the AY sound chip
C 00278,2 Write $f to offset $1f in
C 00280,3 DivMMC RAM bank 0.
C 00283,3 Read initFlag
C 00286,2 Is it equal to $aa?
C 00288,2 If not, jump to full init
C 00290,2 Check if the break key is being pressed
C 00292,2 Read the port
C 00294,1 Break key is in bit 0, move it to the carry flag
C 00295,3 If break not pressed jump to normalInit
@ 00298 label=fullInit
C 00298,1 Set the border to black
N 00301 Clear the screen (backwards)
C 00301,3 Source address
C 00304,3 Destination address
C 00307,3 Length
C 00310,1 Set the source data
C 00311,2 Fill the screen with 0's
N 00313 Setup the DivMMC memory banks
C 00313,2 Start with bank 4
@ 00315 label=nextBank
C 00315,2 Select the bank
C 00317,3 Source address = start of DivMMC RAM bank
C 00320,3 Destination address = start address + 1
C 00323,3 Length
C 00326,1 Write 0 to the source address
C 00327,2 Fill the memory with 0's
C 00329,3 Save the current bank selected
C 00332,3 Write op-code $c9 (ret) to $3dfd
C 00337,3 and $3d30
C 00342,1 On to the next bank
C 00343,2 Is it the last bank?
C 00345,2 If not, loop
C 00347,2 Select DivMMC bank 4
C 00351,2 Set l = 0, h already equals $3d from above
C 00353,1 Read the value from $3d00
C 00354,1 Now increment the value at $3d00
C 00355,1 Compare the 2 values
C 00356,2 If they are not equal, jump forward
C 00358,2 otherwise l = $1c
C 00360,1 Select DivMMC bank 0
C 00363,1 Save the value from l
C 00367,2 Set the initFlag to $aa so as
C 00369,3 not to go through the full init on the next reset.
C 00389,3 Screen address ?
C 00407,3 Version string
C 00410,3 Display string
C 00413,3 Date string
C 00416,3 Display string
C 00419,3 Display the ESXDOS logo.
C 00422,3 ???
C 00428,3 Destination address for the code copy performed by the next call.
C 00431,3 Do the copy.
C 00443,2 Op-code for jr
C 00445,3 8222 is the address jumped to after a 48K ROM NMI
C 00454,3 Address of return from DivMMC
C 00474,3 Detecting devices... message
C 00477,3 Display null terminated string pointed to by hl.
C 00480,2 <CR>
C 00482,1 Display character
C 00496,3 Display null terminated string pointed to by hl.
C 00514,2 <CR>
C 00516,1 Display character
c 00610 Normal Initialization
D 00610 Used by the routine at #R257.
@ 00610 label=normalInit
C 00610,3 Call into ESXDOS.SYS to see if Caps Shift is pressed. If not pressed, carry flag is set and a = ($2e8d). If pressed a = ($2e8d) ^ 3 and carry is clear.
C 00615,3 If zero flag is not set, call into ESXDOS.SYS to perform the auto load operation (ESXDOS_SYS_AUTOLOAD). The auto- load filename is /SYS/AUTOBOOT.BAS
N 00618 This entry point is used by the routine at #R257.
C 00618,3 Wait for SPACE to be released. If SPACE is held down it holds the startup sequence here so the user can read the screen.
C 00621,3 Now continue the 48K ROM reset sequence. The 1st instruction (DI) of the ROM has already been executed. This caused the DivMMC memory mapper to kick-in and map the DivMMC ROM at address $0. The next instruction fetch came from address $1 of the DivMMC ROM which we are still executing from. hl contains the address we wich to continue executing from.
C 00624,3 $1ffb is a special address. Executing an instruction at this address causes the DivMMC mapper to be reset so that the original 48K ROM is mapped in.
c 00627 Wait for the SPACE key to be released
D 00627 Used by the routines at #R257 and #R610.
C 00627,2 Read the keyboard half row
C 00629,2 containing the SPACE key.
C 00631,1 Move the bit (bit-0) representing the SPACE key to the carry flag.
C 00632,1 Return if SPACE is not pressed
C 00633,2 else, keep looping.
c 00635 Routine at 635
D 00635 Used by the routine at #R257.
C 00639,3 Display null terminated string pointed to by hl.
C 00651,3 Display null terminated string pointed to by hl.
C 00657,3 Display null terminated string pointed to by hl.
c 00662 Routine at 662
D 00662 Used by the routine at #R257.
c 00673 Display disk label
D 00673 Used by the routine at #R257.
@ 00673 label=getDiskStatus
C 00673,3 Pointer to buffer to receive data from RST $08
C 00676,1 ESXDOS_SYS_CALL
B 00677,1,1 RST $08 op-code (ESXDOS_SYS_DISK_STATUS)
C 00678,1 Carry set if an error occurred.
B 00682,1,1 RST $30 op-code
C 00683,2 ':'
C 00685,1 Display character
C 00686,2 ' '
C 00688,1 Display character
C 00689,3 Address of string returned from ESXDOS_SYS_DISK_STATUS
C 00692,3 Display null terminated string pointed to by hl.
C 00695,2 <CR>
C 00697,1 Display character
c 00699 Routine at 699
D 00699 Used by the routine at #R257.
c 00717 Routine at 717
D 00717 Used by the routine at #R257.
N 00727 This entry point is used by the routines at #R699 and #R1410.
C 00729,1 ESXDOS_SYS_CALL
c 00735 Routine at 735
D 00735 Used by the routine at #R257.
C 00746,1 ESXDOS_SYS_CALL
C 00760,1 ESXDOS_SYS_CALL
N 00763 This entry point is used by the routine at #R717.
C 00763,1 ESXDOS_SYS_CALL
c 00770 Routine at 770
D 00770 Used by the routine at #R635.
N 00776 This entry point is used by the routine at #R784.
c 00784 Routine at 784
c 00792 Routine at 792
D 00792 Used by the routines at #R770 and #R784.
c 00815 Routine at 815
D 00815 Used by the routine at #R257.
c 00833 Routine at 833
D 00833 Used by the routine at #R7954.
c 00854 Routine at 854
D 00854 Used by the routine at #R833.
c 00863 Routine at 863
D 00863 Used by the routine at #R2560.
c 00875 Routine at 875
D 00875 Used by the routines at #R2648 and #R2965.
c 00886 Routine at 886
D 00886 Used by the routines at #R863, #R875 and #R2590.
c 00906 Routine at 906
D 00906 Used by the routine at #R886.
c 00913 Routine at 913
D 00913 Used by the routines at #R1058 and #R2840.
c 00919 Routine at 919
c 00954 Routine at 954
D 00954 Used by the routine at #R257.
C 00973,2 Select DivMMC RAM bank 1
C 00980,2 Select DivMMC RAM bank 0
s 00983 Unused
D 00983 Used by the routine at #R257.
S 00983,5,5
c 00988 Routine at 988
c 00999 Routine at 999
D 00999 Used by the routine at #R919.
c 01018 Routine at 1018
D 01018 Used by the routine at #R999.
c 01021 Routine at 1021
D 01021 Used by the routine at #R1894.
c 01054 Routine at 1054
D 01054 Used by the routine at #R1021.
c 01058 Routine at 1058
D 01058 Used by the routine at #R1021.
c 01073 Routine at 1073
D 01073 Used by the routine at #R257.
C 01077,1 ESXDOS_SYS_CALL
B 01078,1,1 RST $08 op-code
b 01091 Data block at 1091
D 01091 Used by the routine at #R1073.
B 01091,16,8
c 01107 Routine at 1107
C 01128,1 Display character
c 01131 Routine at 1131
D 01131 Used by the routine at #R257.
c 01162 Display drive device name
D 01162 Display Unix style device name, e.g. sda, sda1, etc.
C 01191,1 Display character
C 01194,1 Display character
C 01202,1 Display character
C 01209,1 Display character
s 01211 Unused
S 01211,11,11
c 01222 SA_BYTES entry point from 48K ROM
c 01255 Routine at 1255
D 01255 Used by the routines at #R1021 and #R2840.
c 01275 Routine at 1275
D 01275 Used by the routine at #R1255.
c 01279 Routine at 1279
D 01279 Used by the routine at #R257.
@ 01279 label=initAY
C 01279,3 Register select port
C 01284,2 Select the mixer register
C 01288,2 Register data port
C 01290,2 Disable all tone and noise channels
c 01293 Routine at 1293
N 01322 This entry point is used by the routine at #R1629.
c 01329 Routine at 1329
C 01361,1 Display character
C 01364,1 Display character
C 01371,1 Display character
C 01374,1 Display character
c 01378 LD_BYTES entry point from 48K ROM
N 01390 This entry point is used by the routine at #R1399.
c 01399 Routine at 1399
D 01399 Used by the routine at #R1378.
b 01409 Data block at 1409
B 01409,1,1
c 01410 Routine at 1410
N 01413 This entry point is used by the routine at #R257.
c 01426 Routine at 1426
D 01426 Used by the routine at #R1131.
t 01449 BETADISK message
T 01449,9,8:n1
b 01458 Lookup table for RST $30
W 01458,2,2 Op-code $00
W 01460,2,2 $01
W 01462,2,2 $02
W 01464,2,2 $03
W 01466,2,2 $04
W 01468,2,2 $05
W 01470,2,2 $06
W 01472,2,2 $07
W 01474,2,2 $08
W 01476,2,2 $09
W 01478,2,2 $0a
W 01480,2,2 $0b
W 01482,2,2 $0c
W 01484,2,2 $0d
W 01486,2,2 $0e
c 01488 Routine at 1488
c 01493 Routine at 1493
c 01498 Routine at 1498
D 01498 Used by the routines at #R1493.
c 01512 Routine at 1512
D 01512 Used by the routines at #R1498 and #R1519.
c 01519 Routine at 1519
C 01532,1 ESXDOS_SYS_CALL
c 01541 48K ROM: COLLECT NEXT CHARACTER
C 01541,1 ESXDOS_ROM_CALL
W 01542,2,2 Address to call in 48K ROM
c 01545 Routine at 1545
D 01545 Used by the routine at #R1579.
c 01579 Routine at 1579
c 01587 Routine at 1587
D 01587 Used by the routine at #R1621.
c 01621 Routine at 1621
c 01629 Routine at 1629
b 01666 Data block at 1666
B 01666,1,1
t 01667 Mounting drives message
T 01667,21,18:n1,n2
c 01688 Get 32-bit value
D 01688 Read a 32-bit value pointed to by hl into the register pairs bcde
c 01697 Routine at 1697
c 01702 Routine at 1702
D 01702 Used by the routines at #R2697, #R2710, #R4297, #R4632, #R5186, #R5208 and #R6760.
c 01719 48K ROM: SYNTAX-Z
C 01719,1 ESXDOS_ROM_CALL
W 01720,2,2 Address to call in 48K ROM
c 01723 Get 32-bit value
D 01723 Read a 32-bit value pointed to by hl into the register pairs bcde
N 01723 Used by the routine at #R6802.
c 01732 Routine at 1732
t 01742 [ERROR] message
T 01742,9,7:n2
t 01751 [OK] message
T 01751,9,n3:4:n2
t 01760 Loading message
T 01760,9,8:n1
t 01769 NMI message
T 01769,4,3:n1
t 01773 ... message
T 01773,4,3:n1
c 01777 Routine at 1777
D 01777 Used by the routine at #R257.
C 01781,1 ESXDOS_SYS_CALL
B 01782,1,1 RST $08 op-coode
C 01791,1 ESXDOS_SYS_CALL
B 01792,1,1 RST $08 op-coode
c 01800 Routine at 1800
c 01828 Routine at 1828
D 01828 Used by the routine at #R1800.
c 01842 Routine at 1842
D 01842 Used by the routine at #R1860.
c 01856 Routine at 1856
D 01856 Used by the routine at #R1842.
c 01860 Routine at 1860
C 01887,1 ESXDOS_SYS_CALL
c 01894 Routine at 1894
D 01894 Used by the routine at #R1860.
c 01935 Routine at 1935
D 01935 Used by the routine at #R1894.
c 01979 Routine at 1979
D 01979 Used by the routine at #R1894.
c 01988 Routine at 1988
D 01988 Used by the routine at #R1979.
c 02003 Routine at 2003
D 02003 Used by the routines at #R1800, #R1860, #R2540 and #R2840.
c 02030 Routine at 2030
D 02030 Used by the routine at #R2003.
c 02038 Routine at 2038
D 02038 Used by the routine at #R1894.
c 02055 Routine at 2055
D 02055 Used by the routine at #R2003.
c 02062 Routine at 2062
D 02062 Used by the routine at #R2003.
B 02082,1,1 M + end of message
b 02083 Data block at 2083
B 02083,1,1
t 02084 No SYSTEM
T 02084,9,8:n1
c 02093 Routine at 2093
D 02093 Used by the routines at #R4710, #R4919 and #R7979.
c 02101 Routine at 2101
D 02101 Used by the routine at #R4919.
c 02114 Routine at 2114
D 02114 Used by the routines at #R3719, #R4472 and #R6608.
c 02119 Routine at 2119
D 02119 Used by the routines at #R3909 and #R6894.
c 02127 Display null terminated string
D 02127 Display the null terminated string pointed to by hl.
R 02127 Used by the routines at #R257, #R635, #R662, #R673 and #R6993.
@ 02127 label=displayCString
C 02130,1 Display character
c 02134 48K ROM:
D 02134 Used by the routine at #R16.
C 02144,1 ESXDOS_ROM_CALL
W 02145,2,2 Address to call in 48K ROM
c 02154 Routine at 2154
D 02154 Used by the routine at #R3191.
c 02160 Routine at 2160
N 02162 This entry point is used by the routine at #R2283.
N 02180 This entry point is used by the routine at #R2154.
c 02213 Routine at 2213
D 02213 Used by the routine at #R2160.
N 02215 This entry point is used by the routine at #R2160.
C 02217,1 Display character
c 02219 Routine at 2219
D 02219 Used by the routine at #R1107.
c 02238 Routine at 2238
D 02238 Used by the routine at #R2219.
C 02267,1 Display character
N 02268 This entry point is used by the routine at #R2219.
C 02274,1 Display character
c 02276 Routine at 2276
D 02276 Used by the routine at #R2219.
C 02281,1 Display character
c 02283 Routine at 2283
D 02283 Used by the routines at #R2238 and #R2276.
C 02317,1 Display character
C 02321,1 Display character
c 02323 Routine at 2323
D 02323 Used by the routine at #R2283.
b 02350 Data block at 2350
B 02350,16,8
c 02366 Routine at 2366
b 02368 Data block at 2368
B 02368,30,8*3,6
c 02398 Routine at 2398
c 02452 Routine at 2452
N 02456 This entry point is used by the routine at #R7.
N 02463 This entry point is used by the routines at #R2398 and #R3348.
c 02503 Routine at 2503
D 02503 Used by the routine at #R2452.
c 02523 Routine at 2523
c 02527 Routine at 2527
c 02532 Routine at 2532
c 02540 Routine at 2540
D 02540 Used by the routine at #R2532.
c 02560 Routine at 2560
c 02590 Routine at 2590
c 02632 Routine at 2632
D 02632 Used by the routine at #R2590.
c 02648 Routine at 2648
D 02648 Used by the routines at #R2659 and #R2673.
c 02659 Routine at 2659
c 02673 Routine at 2673
D 02673 Used by the routine at #R2560.
N 02677 This entry point is used by the routine at #R2659.
c 02697 Routine at 2697
D 02697 Used by the routine at #R2659.
c 02710 Routine at 2710
D 02710 Used by the routine at #R2697.
c 02740 Routine at 2740
c 02764 Routine at 2764
c 02786 Routine at 2786
D 02786 Used by the routine at #R2764.
N 02803 This entry point is used by the routine at #R2840.
c 02806 Routine at 2806
C 02826,1 ESXDOS_SYS_CALL
c 02840 Routine at 2840
N 02859 This entry point is used by the routines at #R1800 and #R2740.
N 02864 This entry point is used by the routine at #R2786.
N 02924 This entry point is used by the routine at #R1058.
c 02944 Routine at 2944
D 02944 Used by the routine at #R2840.
c 02949 Routine at 2949
D 02949 Used by the routine at #R2740.
c 02965 Routine at 2965
N 02974 This entry point is used by the routine at #R2977.
c 02977 Routine at 2977
D 02977 Used by the routine at #R2965.
c 03018 Routine at 3018
D 03018 Used by the routine at #R2965.
N 03088 This entry point is used by the routine at #R2977.
c 03096 Routine at 3096
c 03101 Routine at 3101
D 03101 Used by the routine at #R27.
C 03112,1 ESXDOS_ROM_CALL
W 03113,2,2 Address to call in 48K ROM (SYNTAX-Z)
C 03137,1 ESXDOS_ROM_CALL
W 03138,2,2 Address to call in 48K ROM (SET-MIN)
C 03144,1 ESXDOS_ROM_CALL
W 03145,2,2 Address to call in 48K ROM (within TEMPORARY COLOUR ITEMS)
c 03191 Routine at 3191
D 03191 Used by the routine at #R3101.
C 03196,3 ESXDOS error # message
C 03199,3 Display message
c 03208 Routine at 3208
D 03208 Used by the routines at #R3101 and #R3191.
N 03218 This entry point is used by the routine at #R3101.
C 03218,3 Display message
N 03221 This entry point is used by the routine at #R3191.
c 03232 Display message
D 03232 Display the string pointed to by hl terminated by a value >= $7f.
R 03232 Used by the routines at #R257, #R3191 and #R3208.
@ 03232 label=displayMessage
C 03232,1 Get a character from the string
C 03233,2 and compare it with $7f.
C 03235,1 Save the flags and
C 03236,2 remove bit 7.
C 03238,1 Display character
C 03239,1 Restore the flags.
C 03240,1 If no carry, end of string.
C 03241,1 Move the string pointer to the next character
C 03242,2 and loop.
t 03244 Error message
T 03244,13,13
B 03257,1,1 '#' + end of message
t 03258 Too many open files message
T 03258,18,18
B 03276,1,1 'S' + end of message
c 03277 Routine at 3277
D 03277 Used by the routine at #R24.
c 03300 Routine at 3300
D 03300 Used by the routine at #R19.
C 03317,1 ESXDOS_ROM_CALL
c 03348 Routine at 3348
D 03348 Used by the routine at #R3300.
N 03351 This entry point is used by the routine at #R3300.
c 03367 Routine at 3367
D 03367 Used by the routines at #R3300 and #R3348.
C 03420,1 ESXDOS_ROM_CALL
c 03429 Routine at 3429
D 03429 Used by the routine at #R3367.
C 03432,1 ESXDOS_ROM_CALL
N 03438 This entry point is used by the routine at #R3367.
C 03448,1 ESXDOS_ROM_CALL
C 03455,1 ESXDOS_ROM_CALL
N 03466 This entry point is used by the routine at #R3367.
c 03481 Routine at 3481
c 03513 Routine at 3513
c 03540 Routine at 3540
D 03540 Used by the routines at #R3481 and #R3513.
C 03553,1 ESXDOS_SYS_CALL
C 03558,1 ESXDOS_SYS_CALL
b 03568 Data block at 3568
D 03568 Used by the routine at #R3481.
B 03568,39,8*4,7
c 03607 Routine at 3607
c 03667 Routine at 3667
D 03667 Used by the routine at #R3607.
c 03700 Routine at 3700
D 03700 Used by the routine at #R3667.
c 03713 Routine at 3713
D 03713 Used by the routine at #R3719.
c 03719 Routine at 3719
D 03719 Used by the routine at #R3667.
c 03909 Routine at 3909
D 03909 Used by the routine at #R3719.
N 03951 This entry point is used by the routine at #R3719.
c 03989 Routine at 3989
D 03989 Used by the routine at #R3909.
c 04024 Routine at 4024
D 04024 Used by the routine at #R3989.
c 04037 Routine at 4037
D 04037 Used by the routine at #R3909.
c 04126 Routine at 4126
D 04126 Used by the routine at #R4037.
N 04135 This entry point is used by the routine at #R4037.
c 04144 Routine at 4144
D 04144 Used by the routine at #R3909.
N 04166 This entry point is used by the routine at #R4186.
c 04173 Routine at 4173
D 04173 Used by the routine at #R4144.
N 04180 This entry point is used by the routine at #R4186.
c 04186 Routine at 4186
D 04186 Used by the routine at #R4173.
t 04203 Unnamed message
T 04203,9,9
c 04212 Routine at 4212.
D 04212 Used by the routine at #R3909.
c 04234 Routine at 4234
D 04234 Used by the routine at #R4212.
c 04261 Routine at 4261
D 04261 Used by the routines at #R3719, #R4037, #R4292, #R4297 and #R4625.
C 04266,1 ESXDOS_SYS_CALL
c 04271 Routine at 4271
D 04271 Used by the routine at #R4588.
C 04274,1 ESXDOS_SYS_CALL
c 04277 Routine at 4277
D 04277 Used by the routines at #R4287 and #R4384.
C 04282,1 ESXDOS_SYS_CALL
c 04287 Routine at 4287
D 04287 Used by the routine at #R4384.
c 04292 Routine at 4292
D 04292 Used by the routine at #R4297.
c 04297 Routine at 4297
D 04297 Used by the routines at #R4829 and #R4874.
c 04354 Routine at 4354
D 04354 Used by the routines at #R4297 and #R6202.
c 04377 Routine at 4377
D 04377 Used by the routine at #R4979.
c 04384 Routine at 4384
D 04384 Used by the routine at #R4354.
c 04420 Routine at 4420
D 04420 Used by the routines at #R4796, #R4808, #R5403 and #R6144.
c 04433 Routine at 4433
D 04433 Used by the routines at #R4808, #R5186, #R5208 and #R5342.
c 04446 Routine at 4446
D 04446 Used by the routines at #R4710, #R4796, #R5403, #R5862 and #R6032.
c 04459 Routine at 4459
D 04459 Used by the routines at #R4625, #R4632, #R4683, #R4710, #R4952, #R5342, #R6032, #R6082 and #R6255.
c 04472 Routine at 4472
D 04472 Used by the routines at #R4234, #R5239, #R5434, #R5630, #R5716 and #R5749.
N 04482 This entry point is used by the routines at #R3909, #R4297 and #R4384.
c 04494 Routine at 4494
D 04494 Used by the routines at #R4287 and #R4292.
c 04510 Routine at 4510
D 04510 Used by the routine at #R4494.
c 04523 Routine at 4523
D 04523 Used by the routines at #R5254 and #R5434.
c 04536 Routine at 4536
D 04536 Used by the routines at #R4588 and #R4979.
c 04549 Routine at 4549
D 04549 Used by the routines at #R4037 and #R4126.
c 04562 Routine at 4562
D 04562 Used by the routines at #R4588, #R4919 and #R4938.
c 04575 Routine at 4575
D 04575 Used by the routines at #R4037, #R4126 and #R4919.
c 04588 Routine at 4588
D 04588 Used by the routine at #R4384.
c 04618 Routine at 4618
D 04618 Used by the routine at #R6082.
c 04625 Routine at 4625
D 04625 Used by the routines at #R4632, #R5254, #R6169 and #R6506.
c 04632 Routine at 4632
D 04632 Used by the routine at #R6529.
c 04674 Routine at 4674
D 04674 Used by the routine at #R6568.
c 04683 Routine at 4683
D 04683 Used by the routine at #R6506.
C 04701,1 ESXDOS_SYS_CALL
c 04710 Routine at 4710
D 04710 Used by the routines at #R5254, #R6032 and #R6489.
c 04724 Routine at 4724
D 04724 Used by the routine at #R4710.
c 04731 Routine at 4731
D 04731 Used by the routine at #R4796.
c 04755 Routine at 4755
D 04755 Used by the routine at #R4731.
c 04772 Routine at 4772
D 04772 Used by the routine at #R4755.
c 04796 Routine at 4796
D 04796 Used by the routines at #R5254, #R5434 and #R6389.
N 04799 This entry point is used by the routine at #R4724.
c 04808 Routine at 4808
D 04808 Used by the routine at #R4724.
c 04829 Routine at 4829
D 04829 Used by the routines at #R4808 and #R4979.
N 04861 This entry point is used by the routine at #R4874.
c 04874 Routine at 4874
D 04874 Used by the routine at #R4829.
c 04919 Routine at 4919
c 04938 Routine at 4938
D 04938 Used by the routine at #R5928.
c 04952 Routine at 4952
D 04952 Used by the routine at #R6506.
C 04970,1 ESXDOS_SYS_CALL
c 04979 Routine at 4979
c 05041 Routine at 5041
D 05041 Used by the routine at #R5434.
N 05057 This entry point is used by the routine at #R5080.
N 05076 This entry point is used by the routine at #R5080.
c 05080 Routine at 5080
D 05080 Used by the routine at #R5041.
c 05105 Routine at 5105
D 05105 Used by the routines at #R5041 and #R5112.
c 05112 Routine at 5112
D 05112 Used by the routine at #R5041.
c 05134 Routine at 5134
D 05134 Used by the routine at #R5041.
b 05153 Data block at 5153
B 05153,8,8
b 05161 Data block at 5161
B 05161,2,2
c 05163 Routine at 5163
N 05165 This entry point is used by the routine at #R5376.
c 05186 Routine at 5186
D 05186 Used by the routine at #R5254.
c 05205 Routine at 5205
D 05205 Used by the routine at #R5186.
c 05208 Routine at 5208
D 05208 Used by the routine at #R5254.
c 05239 Routine at 5239
D 05239 Used by the routine at #R5254.
c 05254 Routine at 5254
D 05254 Used by the routine at #R4144.
N 05265 This entry point is used by the routine at #R5434.
N 05302 This entry point is used by the routine at #R5312.
c 05312 Routine at 5312
D 05312 Used by the routine at #R5254.
N 05331 This entry point is used by the routines at #R5337 and #R5376.
c 05337 Routine at 5337
D 05337 Used by the routine at #R5312.
c 05342 Routine at 5342
D 05342 Used by the routines at #R5337 and #R5403.
c 05376 Routine at 5376
D 05376 Used by the routine at #R5312.
c 05403 Routine at 5403
D 05403 Used by the routine at #R5312.
c 05434 Routine at 5434
D 05434 Used by the routine at #R5876.
N 05518 This entry point is used by the routine at #R5630.
c 05570 Routine at 5570
D 05570 Used by the routine at #R5434.
c 05579 Routine at 5579
D 05579 Used by the routine at #R5434.
c 05611 Routine at 5611
D 05611 Used by the routine at #R5579.
c 05627 Routine at 5627
D 05627 Used by the routine at #R5611.
c 05630 Routine at 5630
D 05630 Used by the routine at #R5579.
N 05634 This entry point is used by the routines at #R5611 and #R5627.
N 05650 This entry point is used by the routine at #R5579.
N 05663 This entry point is used by the routine at #R5434.
c 05667 Routine at 5667
D 05667 Used by the routines at #R5434 and #R5630.
N 05675 This entry point is used by the routine at #R5570.
c 05680 Routine at 5680
D 05680 Used by the routines at #R5667 and #R5709.
c 05700 Routine at 5700
D 05700 Used by the routine at #R5434.
c 05709 Routine at 5709
D 05709 Used by the routine at #R5700.
c 05716 Routine at 5716
D 05716 Used by the routines at #R5630, #R6202 and #R6255.
c 05728 Routine at 5728
D 05728 Used by the routine at #R5716.
N 05738 This entry point is used by the routine at #R5716.
N 05739 This entry point is used by the routine at #R5749.
c 05749 Routine at 5749
D 05749 Used by the routine at #R5728.
c 05761 Routine at 5761
D 05761 Used by the routine at #R5749.
c 05773 Routine at 5773
c 05783 Routine at 5783
D 05783 Used by the routine at #R6255.
c 05797 Routine at 5797
b 05805 Data block at 5805
D 05805 Used by the routines at #R5797 and #R5928.
B 05805,57,8*7,1
c 05862 Routine at 5862
c 05876 Routine at 5876
c 05907 Routine at 5907
D 05907 Used by the routine at #R5876.
c 05920 Routine at 5920
D 05920 Used by the routine at #R5907.
c 05928 Routine at 5928
D 05928 Used by the routine at #R5876.
N 05952 This entry point is used by the routine at #R6202.
c 06025 Routine at 6025
D 06025 Used by the routines at #R5928 and #R6202.
c 06032 Routine at 6032
D 06032 Used by the routine at #R5928.
c 06072 Routine at 6072
D 06072 Used by the routine at #R6032.
c 06082 Routine at 6082
D 06082 Used by the routine at #R5928.
N 06094 This entry point is used by the routine at #R6202.
C 06098,1 ESXDOS_SYS_CALL
c 06144 Routine at 6144
D 06144 Used by the routines at #R5928 and #R6202.
c 06156 Routine at 6156
D 06156 Used by the routines at #R6072 and #R6082.
c 06169 Routine at 6169
D 06169 Used by the routines at #R5862 and #R5928.
c 06202 Routine at 6202
D 06202 Used by the routine at #R5920.
c 06255 Routine at 6255
D 06255 Used by the routine at #R5920.
c 06339 Routine at 6339
D 06339 Used by the routine at #R6255.
c 06360 Routine at 6360
D 06360 Used by the routine at #R6255.
c 06389 Routine at 6389
D 06389 Used by the routine at #R6255.
c 06403 Routine at 6403
N 06419 This entry point is used by the routine at #R5783.
c 06489 Routine at 6489
D 06489 Used by the routine at #R6403.
c 06506 Routine at 6506
D 06506 Used by the routine at #R6403.
c 06529 Routine at 6529
D 06529 Used by the routine at #R6506.
c 06564 Routine at 6564
D 06564 Used by the routine at #R6529.
c 06568 Routine at 6568
D 06568 Used by the routine at #R6529.
c 06574 Routine at 6574
D 06574 Used by the routine at #R6403.
c 06608 Routine at 6608
D 06608 Used by the routine at #R6403.
c 06622 Routine at 6622
D 06622 Used by the routines at #R5342, #R5928, #R6202, #R6389 and #R6608.
c 06635 Routine at 6635
D 06635 Used by the routines at #R5403, #R6489, #R6574 and #R6608.
c 06648 Routine at 6648
D 06648 Used by the routines at #R5342 and #R6144.
c 06661 Routine at 6661
D 06661 Used by the routines at #R5403, #R6339 and #R6802.
c 06674 Routine at 6674
D 06674 Used by the routines at #R5254, #R5434 and #R6389.
c 06687 Routine at 6687
c 06700 Routine at 6700
D 06700 Used by the routine at #R6255.
c 06713 Routine at 6713
D 06713 Used by the routines at #R5862 and #R6760.
c 06726 Routine at 6726
D 06726 Used by the routine at #R6202.
c 06760 Routine at 6760
D 06760 Used by the routine at #R6726.
c 06794 Routine at 6794
c 06802 Routine at 6802
c 06817 Routine at 6817
c 06842 Routine at 6842
c 06856 Routine at 6856
C 06884,1 ESXDOS_SYS_CALL
C 06889,1 ESXDOS_SYS_CALL
c 06894 Routine at 6894
C 06962,1 ESXDOS_SYS_CALL
N 06979 This entry point is used by the routine at #R6856.
c 06993 Routine at 6993
D 06993 Used by the routine at #R1107.
C 06993,3 Display null terminated string pointed to by hl.
C 06999,1 Display character
C 07002,1 Display character
t 07004 Detecting devices
D 07004 Used by #R257
@ 07004 label=detectDev
T 07004,22,20:n2
t 07026 ESXDOS config file name
T 07026,23,22:n1
c 07049 Copy code
D 07049 Copy 4 bytes of code from $1ffc to the address passed in hl.
N 07049 Used by the routine at #R257.
C 07049,1 Move the destination address to de.
C 07050,3 Load hl with the source address.
C 07053,2 Copy 4 bytes.
c 07062 Routine at 7062
D 07062 Used by the routine at #R7852.
c 07080 Routine at 7080
D 07080 Used by the routine at #R7942.
N 07096 This entry point is used by the routine at #R7062.
b 07107 ESXDOS logo
B 07107,289,16*18,1
c 07396 Routine at 7396
c 07427 Routine at 7427
D 07427 Used by the routines at #R7438 and #R7892.
c 07438 Routine at 7438
D 07438 Used by the routine at #R7396.
c 07546 Routine at 7546
D 07546 Used by the routine at #R7438.
c 07555 Routine at 7555
D 07555 Used by the routine at #R7438.
c 07587 Routine at 7587
c 07601 Routine at 7601
D 07601 Used by the routine at #R7555.
c 07602 Routine at 7602
D 07602 Used by the routine at #R7438.
c 07619 Routine at 7619
D 07619 Used by the routine at #R7438.
N 07649 This entry point is used by the routines at #R7602, #R7656 and #R7852.
c 07656 Routine at 7656
N 07658 This entry point is used by the routines at #R7587 and #R7602.
N 07663 This entry point is used by the routines at #R7546, #R7587 and #R7892.
N 07668 This entry point is used by the routine at #R7671.
c 07671 Routine at 7671
D 07671 Used by the routines at #R7619 and #R7684.
c 07684 Routine at 7684
D 07684 Used by the routines at #R7438 and #R7555.
c 07709 Routine at 7709
D 07709 Used by the routines at #R7656 and #R7671.
c 07751 Routine at 7751
D 07751 Used by the routine at #R7602.
c 07765 Routine at 7765
D 07765 Used by the routines at #R7684, #R7709, #R7751 and #R7852.
c 07779 Routine at 7779
D 07779 Used by the routines at #R7619 and #R7709.
b 07789 Data block at 7789
B 07789,29,8*3,5
b 07818 Data block at 7818
B 07818,3,3
b 07821 Data block at 7821
B 07821,18,8*2,2
c 07839 Routine at 7839
b 07843 Data block at 7843
B 07843,9,8,1
c 07852 Routine at 7852
N 07855 This entry point is used by the routine at #R7839.
N 07880 This entry point is used by the routines at #R7892 and #R7942.
c 07892 Routine at 7892
b 07925 Data block at 7925
D 07925 Used by the routine at #R7892.
B 07925,17,8*2,1
c 07942 Routine at 7942
c 07954 Routine at 7954
D 07954 Used by the routine at #R7438.
c 07967 Routine at 7967
D 07967 Used by the routines at #R7892 and #R7979.
N 07972 This entry point is used by the routine at #R7979.
c 07979 Routine at 7979
D 07979 Used by the routine at #R7438.
c 08004 Routine at 8004
D 08004 Used by the routine at #R7979.
c 08064 Routine at 8064
D 08064 Used by the routine at #R8004.
c 08076 Routine at 8076
D 08076 Used by the routine at #R7396.
C 08084,1 ESXDOS_SYS_CALL
c 08135 Routine at 8135
s 08156 Unused
S 08156,24,24
c 08180 Routine at 8180
D 08180 Used by the routines at #R58, #R1222 and #R1378.
c 08183 Routine at 8183
c 08185 Enable interrupts, return and reset DivMMC mapper
N 08186 This entry point is used by the routines at #R91, #R3348 and #R8180.
C 08186,1 Executing an instruction at this address causes the DivMMC mapper to be reset meaning the 48K is now mapped-in.
c 08187 Jump to the address in hl and reset DivMMC mapper
D 08187 Used by the routines at #R610, #R3101, #R3208, #R3300 and #R3429.
C 08187,1 Jump to the address held in hl. Executing an instruction at this address also causes the DivMMC mapper to be reset meaning the 48K is now mapped-in.
c 08188 Routine at 8188
D 08188 Accessed by the routine at #R7049
i 08192
