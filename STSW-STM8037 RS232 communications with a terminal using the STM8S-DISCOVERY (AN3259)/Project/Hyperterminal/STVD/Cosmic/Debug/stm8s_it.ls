   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
  15                     	bsct
  16  0000               _TxBuffer:
  17  0000 00            	dc.b	0
  18  0001               _NbrOfDataToTransfer:
  19  0001 00            	dc.b	0
  20  0002               _NbrOfDataToRead:
  21  0002 20            	dc.b	32
  22  0003               _TxCounter:
  23  0003 00            	dc.b	0
  24  0004               _RxCounter:
  25  0004 0000          	dc.w	0
  26  0006               _nbintr:
  27  0006 0000          	dc.w	0
  57                     ; 59 @far @interrupt void NonHandledInterrupt(void)
  57                     ; 60 {
  58                     	switch	.text
  59  0000               f_NonHandledInterrupt:
  63                     ; 64 }
  66  0000 80            	iret
  88                     ; 73 @far @interrupt void TRAP_IRQHandler(void)
  88                     ; 74 {
  89                     	switch	.text
  90  0001               f_TRAP_IRQHandler:
  94                     ; 78 }
  97  0001 80            	iret
 119                     ; 104 @far @interrupt void TLI_IRQHandler(void)
 119                     ; 105 #else /* _RAISONANCE_ */
 119                     ; 106 void TLI_IRQHandler(void) interrupt 0
 119                     ; 107 #endif /* _COSMIC_ */
 119                     ; 108 {
 120                     	switch	.text
 121  0002               f_TLI_IRQHandler:
 125                     ; 112 }
 128  0002 80            	iret
 150                     ; 122 @far @interrupt void AWU_IRQHandler(void)
 150                     ; 123 #else /* _RAISONANCE_ */
 150                     ; 124 void AWU_IRQHandler(void) interrupt 1
 150                     ; 125 #endif /* _COSMIC_ */
 150                     ; 126 {
 151                     	switch	.text
 152  0003               f_AWU_IRQHandler:
 156                     ; 130 }
 159  0003 80            	iret
 181                     ; 140 @far @interrupt void CLK_IRQHandler(void)
 181                     ; 141 #else /* _RAISONANCE_ */
 181                     ; 142 void CLK_IRQHandler(void) interrupt 2
 181                     ; 143 #endif /* _COSMIC_ */
 181                     ; 144 {
 182                     	switch	.text
 183  0004               f_CLK_IRQHandler:
 187                     ; 148 }
 190  0004 80            	iret
 213                     ; 158 @far @interrupt void EXTI_PORTA_IRQHandler(void)
 213                     ; 159 #else /* _RAISONANCE_ */
 213                     ; 160 void EXTI_PORTA_IRQHandler(void) interrupt 3
 213                     ; 161 #endif /* _COSMIC_ */
 213                     ; 162 {
 214                     	switch	.text
 215  0005               f_EXTI_PORTA_IRQHandler:
 219                     ; 166 }
 222  0005 80            	iret
 245                     ; 176 @far @interrupt void EXTI_PORTB_IRQHandler(void)
 245                     ; 177 #else /* _RAISONANCE_ */
 245                     ; 178 void EXTI_PORTB_IRQHandler(void) interrupt 4
 245                     ; 179 #endif /* _COSMIC_ */
 245                     ; 180 {
 246                     	switch	.text
 247  0006               f_EXTI_PORTB_IRQHandler:
 251                     ; 184 }
 254  0006 80            	iret
 277                     ; 194 @far @interrupt void EXTI_PORTC_IRQHandler(void)
 277                     ; 195 #else /* _RAISONANCE_ */
 277                     ; 196 void EXTI_PORTC_IRQHandler(void) interrupt 5
 277                     ; 197 #endif /* _COSMIC_ */
 277                     ; 198 {
 278                     	switch	.text
 279  0007               f_EXTI_PORTC_IRQHandler:
 283                     ; 202 }
 286  0007 80            	iret
 309                     ; 212 @far @interrupt void EXTI_PORTD_IRQHandler(void)
 309                     ; 213 #else /* _RAISONANCE_ */
 309                     ; 214 void EXTI_PORTD_IRQHandler(void) interrupt 6
 309                     ; 215 #endif /* _COSMIC_ */
 309                     ; 216 {
 310                     	switch	.text
 311  0008               f_EXTI_PORTD_IRQHandler:
 315                     ; 220 }
 318  0008 80            	iret
 341                     ; 230 @far @interrupt void EXTI_PORTE_IRQHandler(void)
 341                     ; 231 #else /* _RAISONANCE_ */
 341                     ; 232 void EXTI_PORTE_IRQHandler(void) interrupt 7
 341                     ; 233 #endif /* _COSMIC_ */
 341                     ; 234 {
 342                     	switch	.text
 343  0009               f_EXTI_PORTE_IRQHandler:
 347                     ; 238 }
 350  0009 80            	iret
 372                     ; 305 @far @interrupt void SPI_IRQHandler(void)
 372                     ; 306 #else /* _RAISONANCE_ */
 372                     ; 307 void SPI_IRQHandler(void) interrupt 10
 372                     ; 308 #endif /* _COSMIC_ */
 372                     ; 309 {
 373                     	switch	.text
 374  000a               f_SPI_IRQHandler:
 378                     ; 313 }
 381  000a 80            	iret
 404                     ; 323 @far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
 404                     ; 324 #else /* _RAISONANCE_ */
 404                     ; 325 void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
 404                     ; 326 #endif /* _COSMIC_ */
 404                     ; 327 {
 405                     	switch	.text
 406  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 410                     ; 331 }
 413  000b 80            	iret
 436                     ; 341 @far @interrupt void TIM1_CAP_COM_IRQHandler(void)
 436                     ; 342 #else /* _RAISONANCE_ */
 436                     ; 343 void TIM1_CAP_COM_IRQHandler(void) interrupt 12
 436                     ; 344 #endif /* _COSMIC_ */
 436                     ; 345 {
 437                     	switch	.text
 438  000c               f_TIM1_CAP_COM_IRQHandler:
 442                     ; 349 }
 445  000c 80            	iret
 468                     ; 396 @far @interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
 468                     ; 397 #else /* _RAISONANCE_ */
 468                     ; 398 void TIM2_UPD_OVF_BRK_IRQHandler(void) interrupt 13
 468                     ; 399 #endif /* _COSMIC_ */
 468                     ; 400 {
 469                     	switch	.text
 470  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 474                     ; 404 }
 477  000d 80            	iret
 500                     ; 414 @far @interrupt void TIM2_CAP_COM_IRQHandler(void)
 500                     ; 415 #else /* _RAISONANCE_ */
 500                     ; 416 void TIM2_CAP_COM_IRQHandler(void) interrupt 14
 500                     ; 417 #endif /* _COSMIC_ */
 500                     ; 418 {
 501                     	switch	.text
 502  000e               f_TIM2_CAP_COM_IRQHandler:
 506                     ; 422 }
 509  000e 80            	iret
 535                     ; 434 @far @interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
 535                     ; 435 #else /* _RAISONANCE_ */
 535                     ; 436 void TIM3_UPD_OVF_BRK_IRQHandler(void) interrupt 15
 535                     ; 437 #endif /* _COSMIC_ */
 535                     ; 438 {
 536                     	switch	.text
 537  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 539  000f 3b0002        	push	c_x+2
 540  0012 be00          	ldw	x,c_x
 541  0014 89            	pushw	x
 542  0015 3b0002        	push	c_y+2
 543  0018 be00          	ldw	x,c_y
 544  001a 89            	pushw	x
 547                     ; 439 nbintr ++ ;
 549  001b be06          	ldw	x,_nbintr
 550  001d 1c0001        	addw	x,#1
 551  0020 bf06          	ldw	_nbintr,x
 552                     ; 442 if ( nbintr == 250 ) {
 554  0022 be06          	ldw	x,_nbintr
 555  0024 a300fa        	cpw	x,#250
 556  0027 260c          	jrne	L112
 557                     ; 443 	GPIO_WriteReverse(GPIOD, 0x01);
 559  0029 4b01          	push	#1
 560  002b ae500f        	ldw	x,#20495
 561  002e cd0000        	call	_GPIO_WriteReverse
 563  0031 84            	pop	a
 564                     ; 444 	nbintr = 0;
 566  0032 5f            	clrw	x
 567  0033 bf06          	ldw	_nbintr,x
 568  0035               L112:
 569                     ; 446 TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 571  0035 a601          	ld	a,#1
 572  0037 cd0000        	call	_TIM3_ClearITPendingBit
 574                     ; 447 }
 577  003a 85            	popw	x
 578  003b bf00          	ldw	c_y,x
 579  003d 320002        	pop	c_y+2
 580  0040 85            	popw	x
 581  0041 bf00          	ldw	c_x,x
 582  0043 320002        	pop	c_x+2
 583  0046 80            	iret
 606                     ; 457 @far @interrupt void TIM3_CAP_COM_IRQHandler(void)
 606                     ; 458 #else /* _RAISONANCE_ */
 606                     ; 459 void TIM3_CAP_COM_IRQHandler(void) interrupt 16
 606                     ; 460 #endif /* _COSMIC_ */
 606                     ; 461 {
 607                     	switch	.text
 608  0047               f_TIM3_CAP_COM_IRQHandler:
 612                     ; 463 }
 615  0047 80            	iret
 637                     ; 522 @far @interrupt void I2C_IRQHandler(void)
 637                     ; 523 #else /* _RAISONANCE_ */
 637                     ; 524 void I2C_IRQHandler(void) interrupt 19
 637                     ; 525 #endif /* _COSMIC_ */
 637                     ; 526 {
 638                     	switch	.text
 639  0048               f_I2C_IRQHandler:
 643                     ; 530 }
 646  0048 80            	iret
 669                     ; 541 @far @interrupt void UART2_TX_IRQHandler(void)
 669                     ; 542 #else /* _RAISONANCE_ */
 669                     ; 543 void UART2_TX_IRQHandler(void) interrupt 20
 669                     ; 544 #endif /* _COSMIC_ */
 669                     ; 545 {
 670                     	switch	.text
 671  0049               f_UART2_TX_IRQHandler:
 675                     ; 549 }
 678  0049 80            	iret
 701                     ; 559 @far @interrupt void UART2_RX_IRQHandler(void)
 701                     ; 560 #else /* _RAISONANCE_ */
 701                     ; 561 void UART2_RX_IRQHandler(void) interrupt 21
 701                     ; 562 #endif /* _COSMIC_ */
 701                     ; 563 {
 702                     	switch	.text
 703  004a               f_UART2_RX_IRQHandler:
 707                     ; 567 }
 710  004a 80            	iret
 732                     ; 638 @far @interrupt void ADC1_IRQHandler(void)
 732                     ; 639 #else /* _RAISONANCE_ */
 732                     ; 640 void ADC1_IRQHandler(void) interrupt 22
 732                     ; 641 #endif /* _COSMIC_ */
 732                     ; 642 {
 733                     	switch	.text
 734  004b               f_ADC1_IRQHandler:
 738                     ; 647     return;
 741  004b 80            	iret
 764                     ; 679 @far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
 764                     ; 680 #else /* _RAISONANCE_ */
 764                     ; 681 void TIM4_UPD_OVF_IRQHandler(void) interrupt 23
 764                     ; 682 #endif /* _COSMIC_ */
 764                     ; 683 {
 765                     	switch	.text
 766  004c               f_TIM4_UPD_OVF_IRQHandler:
 770                     ; 687 }
 773  004c 80            	iret
 796                     ; 698 @far @interrupt void EEPROM_EEC_IRQHandler(void)
 796                     ; 699 #else /* _RAISONANCE_ */
 796                     ; 700 void EEPROM_EEC_IRQHandler(void) interrupt 24
 796                     ; 701 #endif /* _COSMIC_ */
 796                     ; 702 {
 797                     	switch	.text
 798  004d               f_EEPROM_EEC_IRQHandler:
 802                     ; 706 }
 805  004d 80            	iret
 885                     	xdef	_nbintr
 886                     	xdef	_RxCounter
 887                     	xdef	_TxCounter
 888                     	xdef	_NbrOfDataToRead
 889                     	xdef	_NbrOfDataToTransfer
 890                     	switch	.ubsct
 891  0000               _RxBuffer:
 892  0000 000000000000  	ds.b	32
 893                     	xdef	_RxBuffer
 894                     	xdef	_TxBuffer
 895                     	xdef	f_EEPROM_EEC_IRQHandler
 896                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 897                     	xdef	f_ADC1_IRQHandler
 898                     	xdef	f_UART2_TX_IRQHandler
 899                     	xdef	f_UART2_RX_IRQHandler
 900                     	xdef	f_I2C_IRQHandler
 901                     	xdef	f_TIM3_CAP_COM_IRQHandler
 902                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 903                     	xdef	f_TIM2_CAP_COM_IRQHandler
 904                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 905                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 906                     	xdef	f_TIM1_CAP_COM_IRQHandler
 907                     	xdef	f_SPI_IRQHandler
 908                     	xdef	f_EXTI_PORTE_IRQHandler
 909                     	xdef	f_EXTI_PORTD_IRQHandler
 910                     	xdef	f_EXTI_PORTC_IRQHandler
 911                     	xdef	f_EXTI_PORTB_IRQHandler
 912                     	xdef	f_EXTI_PORTA_IRQHandler
 913                     	xdef	f_CLK_IRQHandler
 914                     	xdef	f_AWU_IRQHandler
 915                     	xdef	f_TLI_IRQHandler
 916                     	xdef	f_TRAP_IRQHandler
 917                     	xdef	f_NonHandledInterrupt
 918                     	xref	_TIM3_ClearITPendingBit
 919                     	xref	_GPIO_WriteReverse
 920                     	xref.b	c_x
 921                     	xref.b	c_y
 941                     	end
