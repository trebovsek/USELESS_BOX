   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator V4.3.13 - 22 Oct 2014
  46                     ; 34 main()
  46                     ; 35 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 36   sim();
  56  0000 9b            sim
  58                     ; 38   PortInit();
  61  0001 cd0000        	call	_PortInit
  63                     ; 42   rim();
  66  0004 9a            rim
  68  0005               L12:
  69                     ; 47     SwitchStatusReadAll();
  71  0005 cd0000        	call	_SwitchStatusReadAll
  74  0008 20fb          	jra	L12
  87                     	xdef	_main
  88                     	xref	_SwitchStatusReadAll
  89                     	xref	_PortInit
 108                     	end
