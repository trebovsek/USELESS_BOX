   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.10 - 25 Sep 2019
  46                     ; 43 void main()
  46                     ; 44 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 46   sim();
  56  0000 9b            sim
  58                     ; 48   PortInit();
  61  0001 cd0000        	call	_PortInit
  63                     ; 49   Timer3Init();
  65  0004 cd0000        	call	_Timer3Init
  67                     ; 52   rim();
  70  0007 9a            rim
  72  0008               L12:
  73                     ; 56     SwitchStatusReadAll();
  75  0008 cd0000        	call	_SwitchStatusReadAll
  78  000b 20fb          	jra	L12
  91                     	xdef	_main
  92                     	xref	_Timer3Init
  93                     	xref	_SwitchStatusReadAll
  94                     	xref	_PortInit
 113                     	end
