   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.10 - 25 Sep 2019
  47                     ; 39 void main()
  47                     ; 40 {
  49                     	switch	.text
  50  0000               _main:
  54                     ; 42   sim();
  57  0000 9b            sim
  59                     ; 44   PortInit();
  62  0001 cd0000        	call	_PortInit
  64                     ; 45   Timer3Init();
  66  0004 cd0000        	call	_Timer3Init
  68                     ; 48   rim();
  71  0007 9a            rim
  73  0008               L12:
  74                     ; 52     SwitchStatusReadAll();
  76  0008 cd0000        	call	_SwitchStatusReadAll
  79  000b 20fb          	jra	L12
  92                     	xdef	_main
  93                     	xref	_Timer3Init
  94                     	xref	_SwitchStatusReadAll
  95                     	xref	_PortInit
 114                     	end
