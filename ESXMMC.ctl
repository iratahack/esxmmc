@ 00000 start
c 00000 Entry point for RST $00
@ 00000 org $0000
@ 00000 label=start
C 00000,1 Disable interrupts
C 00001,3 Setup the stack pointer
C 00004,3 Continue initialization
c 00007 Routine at 7
N 00008 This entry point is used by the routines at #R237, #R673, #R717, #R735, #R1073, #R1519, #R1777, #R1860, #R2806, #R3540, #R4261, #R4271, #R4277, #R4683, #R4952, #R6082, #R6856, #R6894 and #R8076.
c 00011 Entry point for RST $08
c 00016 Routine at 16
D 00016 Used by the routines at #R257, #R673, #R1107, #R1162, #R1329, #R2127, #R2160, #R2213, #R2238, #R2276, #R2283, #R3232 and #R6993.
c 00019 Routine at 19
N 00021 This entry point is used by the routine at #R11.
c 00024 Routine at 24
D 00024 Used by the routines at #R1541, #R1719, #R2134, #R3101, #R3300, #R3367 and #R3429.
c 00027 Routine at 27
D 00027 Used by the routine at #R35.
c 00030 Routine at 30
N 00031 This entry point is used by the routine at #R53.
b 00033 Data block at 33
B 00033,2,2
c 00035 Routine at 35
c 00040 Routine at 40
D 00040 Used by the routines at #R1477, #R6760 and #R7122.
c 00046 Routine at 46
N 00048 This entry point is used by the routines at #R673, #R3018, #R3429, #R3607, #R3667, #R3719, #R3909, #R4037, #R4472, #R4588, #R4874, #R4938, #R5434, #R5773, #R5862, #R5928, #R6082, #R6255, #R6489, #R6564, #R6568 and #R7438.
t 00050 Message at 50
T 00050,3,3
c 00053 Routine at 53
N 00056 This entry point is used by the routines at #R7, #R19, #R30, #R46, #R7212 and #R7383.
c 00058 Routine at 58
t 00064 Message at 64
T 00064,4,4
c 00068 Routine at 68
c 00077 Routine at 77
c 00083 Routine at 83
D 00083 Used by the routines at #R770 and #R792.
c 00091 Routine at 91
c 00102 Routine at 102
s 00103 Unused
S 00103,1,1
c 00104 Routine at 104
c 00134 Routine at 134
D 00134 Used by the routine at #R46.
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
C 00290,2 Check if the break key is being pressed
C 00292,2 Read the port
C 00294,1 Break key is in bit 0, move it to the carry flag
C 00295,3 Carry flag is set if break key is not pressed
N 00298 Set the border to black
N 00301 Clear the screen (backwards)
N 00313 Setup the DivMMC memory banks
C 00313,2 Start with bank 4
@ 00315 label=nextBank
C 00315,2 Select the bank
N 00317 Write the entire bank with 0's
C 00329,3 Save the last bank selected
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
C 00358,2 l = $1c
C 00360,1 Select DivMMC bank 0
C 00363,1 Save the value from l
C 00367,2 a = $aa
C 00369,3 Save it
C 00407,3 Version string
C 00410,3 Display message
C 00413,3 Date string
C 00416,3 Display message
c 00610 Routine at 610
D 00610 Used by the routine at #R257.
N 00618 This entry point is used by the routine at #R257.
c 00627 Routine at 627
D 00627 Used by the routines at #R257 and #R610.
c 00635 Routine at 635
D 00635 Used by the routine at #R257.
c 00662 Routine at 662
D 00662 Used by the routine at #R257.
c 00673 Routine at 673
D 00673 Used by the routine at #R257.
c 00699 Routine at 699
D 00699 Used by the routine at #R257.
c 00717 Routine at 717
D 00717 Used by the routine at #R257.
N 00727 This entry point is used by the routines at #R699 and #R1410.
c 00735 Routine at 735
D 00735 Used by the routine at #R257.
N 00763 This entry point is used by the routine at #R717.
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
b 01091 Data block at 1091
D 01091 Used by the routine at #R1073.
B 01091,16,8
c 01107 Routine at 1107
c 01131 Routine at 1131
D 01131 Used by the routine at #R257.
c 01162 Routine at 1162
s 01211 Unused
S 01211,11,11
c 01222 Routine at 1222
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
c 01378 Routine at 1378
N 01390 This entry point is used by the routine at #R1399.
c 01399 Routine at 1399
D 01399 Used by the routine at #R1378.
b 01409 Data block at 1409
B 01409,1,1
c 01410 Routine at 1410
N 01413 This entry point is used by the routine at #R257.
c 01426 Routine at 1426
D 01426 Used by the routine at #R1131.
t 01449 Message at 1449
T 01449,8,8
b 01457 Data block at 1457
B 01457,20,8*2,4
c 01477 Routine at 1477
c 01493 Routine at 1493
c 01498 Routine at 1498
D 01498 Used by the routines at #R1477 and #R1493.
c 01512 Routine at 1512
D 01512 Used by the routines at #R1498 and #R1519.
c 01519 Routine at 1519
c 01541 Routine at 1541
c 01545 Routine at 1545
D 01545 Used by the routine at #R1579.
c 01579 Routine at 1579
c 01587 Routine at 1587
D 01587 Used by the routine at #R1621.
c 01621 Routine at 1621
c 01629 Routine at 1629
b 01666 Data block at 1666
B 01666,1,1
t 01667 Message at 1667
T 01667,18,18
b 01685 Data block at 1685
B 01685,1,1
c 01686 Routine at 1686
c 01697 Routine at 1697
c 01702 Routine at 1702
D 01702 Used by the routines at #R2697, #R2710, #R4297, #R4632, #R5186, #R5208 and #R6760.
c 01719 Routine at 1719
c 01723 Routine at 1723
D 01723 Used by the routine at #R6802.
c 01732 Routine at 1732
t 01742 Message at 1742
T 01742,7,7
b 01749 Data block at 1749
B 01749,5,5
t 01754 Message at 1754
T 01754,4,4
b 01758 Data block at 1758
B 01758,2,2
t 01760 Message at 1760
T 01760,8,8
b 01768 Data block at 1768
B 01768,1,1
t 01769 Message at 1769
T 01769,3,3
b 01772 Data block at 1772
B 01772,1,1
t 01773 Message at 1773
T 01773,3,3
b 01776 Data block at 1776
B 01776,1,1
c 01777 Routine at 1777
D 01777 Used by the routine at #R257.
c 01800 Routine at 1800
c 01828 Routine at 1828
D 01828 Used by the routine at #R1800.
c 01842 Routine at 1842
D 01842 Used by the routine at #R1860.
c 01856 Routine at 1856
D 01856 Used by the routine at #R1842.
c 01860 Routine at 1860
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
b 02083 Data block at 2083
B 02083,1,1
t 02084 Message at 2084
T 02084,7,7
c 02091 Routine at 2091
c 02101 Routine at 2101
D 02101 Used by the routine at #R4919.
c 02114 Routine at 2114
D 02114 Used by the routines at #R3719, #R4472 and #R6608.
c 02119 Routine at 2119
D 02119 Used by the routines at #R3909 and #R6894.
c 02127 Routine at 2127
D 02127 Used by the routines at #R257, #R635, #R662, #R673 and #R6993.
c 02134 Routine at 2134
D 02134 Used by the routine at #R16.
c 02154 Routine at 2154
D 02154 Used by the routine at #R3191.
c 02160 Routine at 2160
N 02162 This entry point is used by the routine at #R2283.
N 02180 This entry point is used by the routine at #R2154.
c 02213 Routine at 2213
D 02213 Used by the routine at #R2160.
N 02215 This entry point is used by the routine at #R2160.
c 02219 Routine at 2219
D 02219 Used by the routine at #R1107.
c 02238 Routine at 2238
D 02238 Used by the routine at #R2219.
N 02268 This entry point is used by the routine at #R2219.
c 02276 Routine at 2276
D 02276 Used by the routine at #R2219.
c 02283 Routine at 2283
D 02283 Used by the routines at #R2238 and #R2276.
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
C 03238,1 Display the character.
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
c 03348 Routine at 3348
D 03348 Used by the routine at #R3300.
N 03351 This entry point is used by the routine at #R3300.
c 03367 Routine at 3367
D 03367 Used by the routines at #R3300 and #R3348.
c 03429 Routine at 3429
D 03429 Used by the routine at #R3367.
N 03438 This entry point is used by the routine at #R3367.
N 03466 This entry point is used by the routine at #R3367.
c 03481 Routine at 3481
c 03513 Routine at 3513
c 03540 Routine at 3540
D 03540 Used by the routines at #R3481 and #R3513.
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
t 04203 Message at 4203
T 04203,7,7
c 04210 Routine at 4210
N 04212 This entry point is used by the routine at #R3909.
c 04234 Routine at 4234
D 04234 Used by the routine at #R4210.
N 04244 This entry point is used by the routine at #R4210.
c 04261 Routine at 4261
D 04261 Used by the routines at #R3719, #R4037, #R4292, #R4297 and #R4625.
c 04271 Routine at 4271
D 04271 Used by the routine at #R4588.
c 04277 Routine at 4277
D 04277 Used by the routines at #R4287 and #R4384.
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
D 04472 Used by the routines at #R4210, #R4234, #R5239, #R5434, #R5630, #R5716 and #R5749.
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
t 05153 Message at 5153
T 05153,8,8
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
c 06894 Routine at 6894
N 06979 This entry point is used by the routine at #R6856.
c 06993 Routine at 6993
D 06993 Used by the routine at #R1107.
t 07004 Message at 7004
T 07004,20,20
b 07024 Data block at 7024
B 07024,2,2
t 07026 Message at 7026
T 07026,22,22
b 07048 Data block at 7048
B 07048,1,1
c 07049 Routine at 7049
D 07049 Used by the routine at #R257.
c 07062 Routine at 7062
D 07062 Used by the routine at #R7852.
c 07080 Routine at 7080
D 07080 Used by the routine at #R7942.
N 07096 This entry point is used by the routine at #R7062.
b 07107 Data block at 7107
B 07107,15,8,7
c 07122 Routine at 7122
B 07140,1,1
b 07168 Data block at 7168
B 07168,44,8*5,4
c 07212 Routine at 7212
b 07225 Data block at 7225
B 07225,158,8*19,6
c 07383 Routine at 7383
c 07427 Routine at 7427
D 07427 Used by the routines at #R7438 and #R7892.
c 07438 Routine at 7438
D 07438 Used by the routine at #R7383.
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
t 07818 Message at 7818
T 07818,3,3
b 07821 Data block at 7821
B 07821,18,8*2,2
c 07839 Routine at 7839
N 07841 This entry point is used by the routine at #R7212.
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
D 08076 Used by the routine at #R7383.
c 08135 Routine at 8135
s 08156 Unused
S 08156,24,24
c 08180 Routine at 8180
D 08180 Used by the routines at #R58, #R1222 and #R1378.
c 08183 Routine at 8183
c 08185 Routine at 8185
N 08186 This entry point is used by the routines at #R91, #R3348 and #R8180.
c 08187 Routine at 8187
D 08187 Used by the routines at #R610, #R3101, #R3208, #R3300 and #R3429.
c 08188 Routine at 8188
i 08192
