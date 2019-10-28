   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator V4.3.13 - 22 Oct 2014
  47                     ; 35 void main()
  47                     ; 36 {
  49                     	switch	.text
  50  0000               _main:
  54                     ; 37   sim();
  57  0000 9b            sim
  59                     ; 39   PortInit();
  62  0001 cd0000        	call	_PortInit
  64                     ; 40   Timer1Init();
  66  0004 cd0000        	call	_Timer1Init
  68                     ; 43   rim();
  71  0007 9a            rim
  73  0008               L12:
  74                     ; 48     SwitchStatusReadAll();
  76  0008 cd0000        	call	_SwitchStatusReadAll
  79  000b 20fb          	jra	L12
  92                     	xdef	_main
  93                     	xref	_Timer1Init
  94                     	xref	_SwitchStatusReadAll
  95                     	xref	_PortInit
 114                     	end
