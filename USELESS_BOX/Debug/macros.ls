   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.10 - 25 Sep 2019
  42                     ; 39 void GlobalIrqEnable(void)
  42                     ; 40 {
  44                     	switch	.text
  45  0000               _GlobalIrqEnable:
  49                     ; 42   rim
  52  0000 9a            rim
  54                     ; 44 }
  57  0001 81            	ret
  80                     ; 54 void GlobalIrqDisable(void)
  80                     ; 55 {
  81                     	switch	.text
  82  0002               _GlobalIrqDisable:
  86                     ; 57   sim
  89  0002 9b            sim
  91                     ; 59 }
  94  0003 81            	ret
 107                     	xdef	_GlobalIrqDisable
 108                     	xdef	_GlobalIrqEnable
 127                     	end
