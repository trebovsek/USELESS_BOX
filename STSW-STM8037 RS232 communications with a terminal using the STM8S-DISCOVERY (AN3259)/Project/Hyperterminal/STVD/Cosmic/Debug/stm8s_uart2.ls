   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
  54                     ; 46 void UART2_DeInit(void)
  54                     ; 47 {
  56                     	switch	.text
  57  0000               _UART2_DeInit:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 48     u8 dummy = 0;
  65  0001 7b01          	ld	a,(OFST+0,sp)
  66                     ; 51     dummy = UART2->SR;
  68  0003 7b01          	ld	a,(OFST+0,sp)
  69  0005 c65240        	ld	a,21056
  70                     ; 52     dummy = UART2->DR;
  72  0008 7b01          	ld	a,(OFST+0,sp)
  73  000a c65241        	ld	a,21057
  74                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*< Set UART2_BRR2 to reset value 0x00 */
  76  000d 725f5243      	clr	21059
  77                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*< Set UART2_BRR1 to reset value 0x00 */
  79  0011 725f5242      	clr	21058
  80                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*< Set UART2_CR1 to reset value 0x00  */
  82  0015 725f5244      	clr	21060
  83                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*< Set UART2_CR2 to reset value 0x00  */
  85  0019 725f5245      	clr	21061
  86                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE;  /*< Set UART2_CR3 to reset value 0x00  */
  88  001d 725f5246      	clr	21062
  89                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE;  /*< Set UART2_CR4 to reset value 0x00  */
  91  0021 725f5247      	clr	21063
  92                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*< Set UART2_CR5 to reset value 0x00  */
  94  0025 725f5248      	clr	21064
  95                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*< Set UART2_CR6 to reset value 0x00  */
  97  0029 725f5249      	clr	21065
  98                     ; 64 }
 101  002d 84            	pop	a
 102  002e 81            	ret
 423                     .const:	section	.text
 424  0000               L01:
 425  0000 00000064      	dc.l	100
 426                     ; 76 void UART2_Init(u32 BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 426                     ; 77 {
 427                     	switch	.text
 428  002f               _UART2_Init:
 430  002f 520e          	subw	sp,#14
 431       0000000e      OFST:	set	14
 434                     ; 78     u8 BRR2_1, BRR2_2 = 0;
 436  0031 7b06          	ld	a,(OFST-8,sp)
 437                     ; 79     u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;
 439  0033 96            	ldw	x,sp
 440  0034 1c0007        	addw	x,#OFST-7
 441  0037 cd0000        	call	c_ltor
 443                     ; 82     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 445                     ; 84     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 447                     ; 86     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 449                     ; 88     assert_param(IS_UART2_PARITY_OK(Parity));
 451                     ; 91     assert_param(IS_UART2_MODE_OK((u8)Mode));
 453                     ; 95     assert_param(IS_UART2_SYNCMODE_OK((u8)SyncMode));
 455                     ; 97     UART2->CR1 &= (u8)(~UART2_CR1_M);  /**< Clear the word length bit */
 457  003a 72195244      	bres	21060,#4
 458                     ; 98     UART2->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART2_WordLength value */
 460  003e c65244        	ld	a,21060
 461  0041 1a15          	or	a,(OFST+7,sp)
 462  0043 c75244        	ld	21060,a
 463                     ; 100     UART2->CR3 &= (u8)(~UART2_CR3_STOP);  /**< Clear the STOP bits */
 465  0046 c65246        	ld	a,21062
 466  0049 a4cf          	and	a,#207
 467  004b c75246        	ld	21062,a
 468                     ; 101     UART2->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART2_StopBits value  */
 470  004e c65246        	ld	a,21062
 471  0051 1a16          	or	a,(OFST+8,sp)
 472  0053 c75246        	ld	21062,a
 473                     ; 103     UART2->CR1 &= (u8)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));  /**< Clear the Parity Control bit */
 475  0056 c65244        	ld	a,21060
 476  0059 a4f9          	and	a,#249
 477  005b c75244        	ld	21060,a
 478                     ; 104     UART2->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART2_Parity value */
 480  005e c65244        	ld	a,21060
 481  0061 1a17          	or	a,(OFST+9,sp)
 482  0063 c75244        	ld	21060,a
 483                     ; 106     UART2->BRR1 &= (u8)(~UART2_BRR1_DIVM);  /**< Clear the LSB mantissa of UARTDIV  */
 485  0066 725f5242      	clr	21058
 486                     ; 107     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVM);  /**< Clear the MSB mantissa of UARTDIV  */
 488  006a c65243        	ld	a,21059
 489  006d a40f          	and	a,#15
 490  006f c75243        	ld	21059,a
 491                     ; 108     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVF);  /**< Clear the Fraction bits of UARTDIV */
 493  0072 c65243        	ld	a,21059
 494  0075 a4f0          	and	a,#240
 495  0077 c75243        	ld	21059,a
 496                     ; 111     BaudRate_Mantissa    = ((u32)CLK_GetClockFreq() / (BaudRate << 4));
 498  007a 96            	ldw	x,sp
 499  007b 1c0011        	addw	x,#OFST+3
 500  007e cd0000        	call	c_ltor
 502  0081 a604          	ld	a,#4
 503  0083 cd0000        	call	c_llsh
 505  0086 96            	ldw	x,sp
 506  0087 1c0001        	addw	x,#OFST-13
 507  008a cd0000        	call	c_rtol
 509  008d cd0000        	call	_CLK_GetClockFreq
 511  0090 96            	ldw	x,sp
 512  0091 1c0001        	addw	x,#OFST-13
 513  0094 cd0000        	call	c_ludv
 515  0097 96            	ldw	x,sp
 516  0098 1c000b        	addw	x,#OFST-3
 517  009b cd0000        	call	c_rtol
 519                     ; 112     BaudRate_Mantissa100 = (((u32)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 521  009e 96            	ldw	x,sp
 522  009f 1c0011        	addw	x,#OFST+3
 523  00a2 cd0000        	call	c_ltor
 525  00a5 a604          	ld	a,#4
 526  00a7 cd0000        	call	c_llsh
 528  00aa 96            	ldw	x,sp
 529  00ab 1c0001        	addw	x,#OFST-13
 530  00ae cd0000        	call	c_rtol
 532  00b1 cd0000        	call	_CLK_GetClockFreq
 534  00b4 a664          	ld	a,#100
 535  00b6 cd0000        	call	c_smul
 537  00b9 96            	ldw	x,sp
 538  00ba 1c0001        	addw	x,#OFST-13
 539  00bd cd0000        	call	c_ludv
 541  00c0 96            	ldw	x,sp
 542  00c1 1c0007        	addw	x,#OFST-7
 543  00c4 cd0000        	call	c_rtol
 545                     ; 114     BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 545                     ; 115                         << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
 547  00c7 96            	ldw	x,sp
 548  00c8 1c000b        	addw	x,#OFST-3
 549  00cb cd0000        	call	c_ltor
 551  00ce a664          	ld	a,#100
 552  00d0 cd0000        	call	c_smul
 554  00d3 96            	ldw	x,sp
 555  00d4 1c0001        	addw	x,#OFST-13
 556  00d7 cd0000        	call	c_rtol
 558  00da 96            	ldw	x,sp
 559  00db 1c0007        	addw	x,#OFST-7
 560  00de cd0000        	call	c_ltor
 562  00e1 96            	ldw	x,sp
 563  00e2 1c0001        	addw	x,#OFST-13
 564  00e5 cd0000        	call	c_lsub
 566  00e8 a604          	ld	a,#4
 567  00ea cd0000        	call	c_llsh
 569  00ed ae0000        	ldw	x,#L01
 570  00f0 cd0000        	call	c_ludv
 572  00f3 b603          	ld	a,c_lreg+3
 573  00f5 a40f          	and	a,#15
 574  00f7 6b05          	ld	(OFST-9,sp),a
 575                     ; 116     BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);
 577  00f9 96            	ldw	x,sp
 578  00fa 1c000b        	addw	x,#OFST-3
 579  00fd cd0000        	call	c_ltor
 581  0100 a604          	ld	a,#4
 582  0102 cd0000        	call	c_lursh
 584  0105 b603          	ld	a,c_lreg+3
 585  0107 a4f0          	and	a,#240
 586  0109 b703          	ld	c_lreg+3,a
 587  010b 3f02          	clr	c_lreg+2
 588  010d 3f01          	clr	c_lreg+1
 589  010f 3f00          	clr	c_lreg
 590  0111 b603          	ld	a,c_lreg+3
 591  0113 6b06          	ld	(OFST-8,sp),a
 592                     ; 118     UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);
 594  0115 7b05          	ld	a,(OFST-9,sp)
 595  0117 1a06          	or	a,(OFST-8,sp)
 596  0119 c75243        	ld	21059,a
 597                     ; 119     UART2->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UARTDIV  */
 599  011c 7b0e          	ld	a,(OFST+0,sp)
 600  011e c75242        	ld	21058,a
 601                     ; 121     UART2->CR2 &= (u8)~(UART2_CR2_TEN | UART2_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
 603  0121 c65245        	ld	a,21061
 604  0124 a4f3          	and	a,#243
 605  0126 c75245        	ld	21061,a
 606                     ; 122     UART2->CR3 &= (u8)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
 608  0129 c65246        	ld	a,21062
 609  012c a4f8          	and	a,#248
 610  012e c75246        	ld	21062,a
 611                     ; 123     UART2->CR3 |= (u8)((u8)SyncMode & (u8)(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
 613  0131 7b18          	ld	a,(OFST+10,sp)
 614  0133 a407          	and	a,#7
 615  0135 ca5246        	or	a,21062
 616  0138 c75246        	ld	21062,a
 617                     ; 125     if ((u8)Mode & (u8)UART2_MODE_TX_ENABLE)
 619  013b 7b19          	ld	a,(OFST+11,sp)
 620  013d a504          	bcp	a,#4
 621  013f 2706          	jreq	L112
 622                     ; 127         UART2->CR2 |= (u8)UART2_CR2_TEN;  /**< Set the Transmitter Enable bit */
 624  0141 72165245      	bset	21061,#3
 626  0145 2004          	jra	L312
 627  0147               L112:
 628                     ; 131         UART2->CR2 &= (u8)(~UART2_CR2_TEN);  /**< Clear the Transmitter Disable bit */
 630  0147 72175245      	bres	21061,#3
 631  014b               L312:
 632                     ; 133     if ((u8)Mode & (u8)UART2_MODE_RX_ENABLE)
 634  014b 7b19          	ld	a,(OFST+11,sp)
 635  014d a508          	bcp	a,#8
 636  014f 2706          	jreq	L512
 637                     ; 135         UART2->CR2 |= (u8)UART2_CR2_REN;  /**< Set the Receiver Enable bit */
 639  0151 72145245      	bset	21061,#2
 641  0155 2004          	jra	L712
 642  0157               L512:
 643                     ; 139         UART2->CR2 &= (u8)(~UART2_CR2_REN);  /**< Clear the Receiver Disable bit */
 645  0157 72155245      	bres	21061,#2
 646  015b               L712:
 647                     ; 142     if ((u8)SyncMode&(u8)UART2_SYNCMODE_CLOCK_DISABLE)
 649  015b 7b18          	ld	a,(OFST+10,sp)
 650  015d a580          	bcp	a,#128
 651  015f 2706          	jreq	L122
 652                     ; 144         UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /**< Clear the Clock Enable bit */
 654  0161 72175246      	bres	21062,#3
 656  0165 200a          	jra	L322
 657  0167               L122:
 658                     ; 149         UART2->CR3 |= (u8)((u8)SyncMode & UART2_CR3_CKEN);
 660  0167 7b18          	ld	a,(OFST+10,sp)
 661  0169 a408          	and	a,#8
 662  016b ca5246        	or	a,21062
 663  016e c75246        	ld	21062,a
 664  0171               L322:
 665                     ; 151 }
 668  0171 5b0e          	addw	sp,#14
 669  0173 81            	ret
 724                     ; 162 void UART2_Cmd(FunctionalState NewState)
 724                     ; 163 {
 725                     	switch	.text
 726  0174               _UART2_Cmd:
 730                     ; 165     if (NewState != DISABLE)
 732  0174 4d            	tnz	a
 733  0175 2706          	jreq	L352
 734                     ; 167         UART2->CR1 &= (u8)(~UART2_CR1_UARTD); /**< UART2 Enable */
 736  0177 721b5244      	bres	21060,#5
 738  017b 2004          	jra	L552
 739  017d               L352:
 740                     ; 171         UART2->CR1 |= UART2_CR1_UARTD;  /**< UART2 Disable (for low power consumption) */
 742  017d 721a5244      	bset	21060,#5
 743  0181               L552:
 744                     ; 173 }
 747  0181 81            	ret
 879                     ; 192 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 879                     ; 193 {
 880                     	switch	.text
 881  0182               _UART2_ITConfig:
 883  0182 89            	pushw	x
 884  0183 89            	pushw	x
 885       00000002      OFST:	set	2
 888                     ; 194     u8 uartreg, itpos = 0x00;
 890  0184 7b02          	ld	a,(OFST+0,sp)
 891                     ; 195     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 893                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 895                     ; 199     uartreg = (u8)(UART2_IT >> 0x08);
 897  0186 9e            	ld	a,xh
 898  0187 6b01          	ld	(OFST-1,sp),a
 899                     ; 202     itpos = (u8)((u8)1 << (u8)((u8)UART2_IT & (u8)0x0F));
 901  0189 9f            	ld	a,xl
 902  018a a40f          	and	a,#15
 903  018c 5f            	clrw	x
 904  018d 97            	ld	xl,a
 905  018e a601          	ld	a,#1
 906  0190 5d            	tnzw	x
 907  0191 2704          	jreq	L61
 908  0193               L02:
 909  0193 48            	sll	a
 910  0194 5a            	decw	x
 911  0195 26fc          	jrne	L02
 912  0197               L61:
 913  0197 6b02          	ld	(OFST+0,sp),a
 914                     ; 204     if (NewState != DISABLE)
 916  0199 0d07          	tnz	(OFST+5,sp)
 917  019b 273a          	jreq	L733
 918                     ; 207         if (uartreg == 0x01)
 920  019d 7b01          	ld	a,(OFST-1,sp)
 921  019f a101          	cp	a,#1
 922  01a1 260a          	jrne	L143
 923                     ; 209             UART2->CR1 |= itpos;
 925  01a3 c65244        	ld	a,21060
 926  01a6 1a02          	or	a,(OFST+0,sp)
 927  01a8 c75244        	ld	21060,a
 929  01ab 2066          	jra	L553
 930  01ad               L143:
 931                     ; 211         else if (uartreg == 0x02)
 933  01ad 7b01          	ld	a,(OFST-1,sp)
 934  01af a102          	cp	a,#2
 935  01b1 260a          	jrne	L543
 936                     ; 213             UART2->CR2 |= itpos;
 938  01b3 c65245        	ld	a,21061
 939  01b6 1a02          	or	a,(OFST+0,sp)
 940  01b8 c75245        	ld	21061,a
 942  01bb 2056          	jra	L553
 943  01bd               L543:
 944                     ; 215         else if (uartreg == 0x03)
 946  01bd 7b01          	ld	a,(OFST-1,sp)
 947  01bf a103          	cp	a,#3
 948  01c1 260a          	jrne	L153
 949                     ; 217             UART2->CR4 |= itpos;
 951  01c3 c65247        	ld	a,21063
 952  01c6 1a02          	or	a,(OFST+0,sp)
 953  01c8 c75247        	ld	21063,a
 955  01cb 2046          	jra	L553
 956  01cd               L153:
 957                     ; 221             UART2->CR6 |= itpos;
 959  01cd c65249        	ld	a,21065
 960  01d0 1a02          	or	a,(OFST+0,sp)
 961  01d2 c75249        	ld	21065,a
 962  01d5 203c          	jra	L553
 963  01d7               L733:
 964                     ; 227         if (uartreg == 0x01)
 966  01d7 7b01          	ld	a,(OFST-1,sp)
 967  01d9 a101          	cp	a,#1
 968  01db 260b          	jrne	L753
 969                     ; 229             UART2->CR1 &= (u8)(~itpos);
 971  01dd 7b02          	ld	a,(OFST+0,sp)
 972  01df 43            	cpl	a
 973  01e0 c45244        	and	a,21060
 974  01e3 c75244        	ld	21060,a
 976  01e6 202b          	jra	L553
 977  01e8               L753:
 978                     ; 231         else if (uartreg == 0x02)
 980  01e8 7b01          	ld	a,(OFST-1,sp)
 981  01ea a102          	cp	a,#2
 982  01ec 260b          	jrne	L363
 983                     ; 233             UART2->CR2 &= (u8)(~itpos);
 985  01ee 7b02          	ld	a,(OFST+0,sp)
 986  01f0 43            	cpl	a
 987  01f1 c45245        	and	a,21061
 988  01f4 c75245        	ld	21061,a
 990  01f7 201a          	jra	L553
 991  01f9               L363:
 992                     ; 235         else if (uartreg == 0x03)
 994  01f9 7b01          	ld	a,(OFST-1,sp)
 995  01fb a103          	cp	a,#3
 996  01fd 260b          	jrne	L763
 997                     ; 237             UART2->CR4 &= (u8)(~itpos);
 999  01ff 7b02          	ld	a,(OFST+0,sp)
1000  0201 43            	cpl	a
1001  0202 c45247        	and	a,21063
1002  0205 c75247        	ld	21063,a
1004  0208 2009          	jra	L553
1005  020a               L763:
1006                     ; 241             UART2->CR6 &= (u8)(~itpos);
1008  020a 7b02          	ld	a,(OFST+0,sp)
1009  020c 43            	cpl	a
1010  020d c45249        	and	a,21065
1011  0210 c75249        	ld	21065,a
1012  0213               L553:
1013                     ; 244 }
1016  0213 5b04          	addw	sp,#4
1017  0215 81            	ret
1074                     ; 254 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1074                     ; 255 {
1075                     	switch	.text
1076  0216               _UART2_IrDAConfig:
1080                     ; 256     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1082                     ; 258     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1084  0216 4d            	tnz	a
1085  0217 2706          	jreq	L124
1086                     ; 260         UART2->CR5 |= UART2_CR5_IRLP;
1088  0219 72145248      	bset	21064,#2
1090  021d 2004          	jra	L324
1091  021f               L124:
1092                     ; 264         UART2->CR5 &= ((u8)~UART2_CR5_IRLP);
1094  021f 72155248      	bres	21064,#2
1095  0223               L324:
1096                     ; 266 }
1099  0223 81            	ret
1134                     ; 277 void UART2_IrDACmd(FunctionalState NewState)
1134                     ; 278 {
1135                     	switch	.text
1136  0224               _UART2_IrDACmd:
1140                     ; 281     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1142                     ; 283     if (NewState != DISABLE)
1144  0224 4d            	tnz	a
1145  0225 2706          	jreq	L344
1146                     ; 286         UART2->CR5 |= UART2_CR5_IREN;
1148  0227 72125248      	bset	21064,#1
1150  022b 2004          	jra	L544
1151  022d               L344:
1152                     ; 291         UART2->CR5 &= ((u8)~UART2_CR5_IREN);
1154  022d 72135248      	bres	21064,#1
1155  0231               L544:
1156                     ; 293 }
1159  0231 81            	ret
1218                     ; 303 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1218                     ; 304 {
1219                     	switch	.text
1220  0232               _UART2_LINBreakDetectionConfig:
1224                     ; 305     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1226                     ; 307     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1228  0232 4d            	tnz	a
1229  0233 2706          	jreq	L574
1230                     ; 309         UART2->CR4 |= UART2_CR4_LBDL;
1232  0235 721a5247      	bset	21063,#5
1234  0239 2004          	jra	L774
1235  023b               L574:
1236                     ; 313         UART2->CR4 &= ((u8)~UART2_CR4_LBDL);
1238  023b 721b5247      	bres	21063,#5
1239  023f               L774:
1240                     ; 315 }
1243  023f 81            	ret
1364                     ; 329 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, UART2_LinAutosync_TypeDef UART2_Autosync, UART2_LinDivUp_TypeDef UART2_DivUp)
1364                     ; 330 {
1365                     	switch	.text
1366  0240               _UART2_LINConfig:
1368  0240 89            	pushw	x
1369       00000000      OFST:	set	0
1372                     ; 331     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1374                     ; 333     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1376                     ; 335     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1378                     ; 337     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1380  0241 9e            	ld	a,xh
1381  0242 4d            	tnz	a
1382  0243 2706          	jreq	L755
1383                     ; 339         UART2->CR6 |=  UART2_CR6_LSLV;
1385  0245 721a5249      	bset	21065,#5
1387  0249 2004          	jra	L165
1388  024b               L755:
1389                     ; 343         UART2->CR6 &= ((u8)~UART2_CR6_LSLV);
1391  024b 721b5249      	bres	21065,#5
1392  024f               L165:
1393                     ; 346     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1395  024f 0d02          	tnz	(OFST+2,sp)
1396  0251 2706          	jreq	L365
1397                     ; 348         UART2->CR6 |=  UART2_CR6_LASE ;
1399  0253 72185249      	bset	21065,#4
1401  0257 2004          	jra	L565
1402  0259               L365:
1403                     ; 352         UART2->CR6 &= ((u8)~ UART2_CR6_LASE );
1405  0259 72195249      	bres	21065,#4
1406  025d               L565:
1407                     ; 355     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1409  025d 0d05          	tnz	(OFST+5,sp)
1410  025f 2706          	jreq	L765
1411                     ; 357         UART2->CR6 |=  UART2_CR6_LDUM;
1413  0261 721e5249      	bset	21065,#7
1415  0265 2004          	jra	L175
1416  0267               L765:
1417                     ; 361         UART2->CR6 &= ((u8)~ UART2_CR6_LDUM);
1419  0267 721f5249      	bres	21065,#7
1420  026b               L175:
1421                     ; 364 }
1424  026b 85            	popw	x
1425  026c 81            	ret
1460                     ; 376 void UART2_LINCmd(FunctionalState NewState)
1460                     ; 377 {
1461                     	switch	.text
1462  026d               _UART2_LINCmd:
1466                     ; 378     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1468                     ; 380     if (NewState != DISABLE)
1470  026d 4d            	tnz	a
1471  026e 2706          	jreq	L116
1472                     ; 383         UART2->CR3 |= UART2_CR3_LINEN;
1474  0270 721c5246      	bset	21062,#6
1476  0274 2004          	jra	L316
1477  0276               L116:
1478                     ; 388         UART2->CR3 &= ((u8)~UART2_CR3_LINEN);
1480  0276 721d5246      	bres	21062,#6
1481  027a               L316:
1482                     ; 390 }
1485  027a 81            	ret
1520                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1520                     ; 401 {
1521                     	switch	.text
1522  027b               _UART2_SmartCardCmd:
1526                     ; 402     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1528                     ; 404     if (NewState != DISABLE)
1530  027b 4d            	tnz	a
1531  027c 2706          	jreq	L336
1532                     ; 407         UART2->CR5 |= UART2_CR5_SCEN;
1534  027e 721a5248      	bset	21064,#5
1536  0282 2004          	jra	L536
1537  0284               L336:
1538                     ; 412         UART2->CR5 &= ((u8)(~UART2_CR5_SCEN));
1540  0284 721b5248      	bres	21064,#5
1541  0288               L536:
1542                     ; 414 }
1545  0288 81            	ret
1581                     ; 425 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1581                     ; 426 {
1582                     	switch	.text
1583  0289               _UART2_SmartCardNACKCmd:
1587                     ; 427     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1589                     ; 429     if (NewState != DISABLE)
1591  0289 4d            	tnz	a
1592  028a 2706          	jreq	L556
1593                     ; 432         UART2->CR5 |= UART2_CR5_NACK;
1595  028c 72185248      	bset	21064,#4
1597  0290 2004          	jra	L756
1598  0292               L556:
1599                     ; 437         UART2->CR5 &= ((u8)~(UART2_CR5_NACK));
1601  0292 72195248      	bres	21064,#4
1602  0296               L756:
1603                     ; 439 }
1606  0296 81            	ret
1663                     ; 448 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1663                     ; 449 {
1664                     	switch	.text
1665  0297               _UART2_WakeUpConfig:
1669                     ; 450     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1671                     ; 452     UART2->CR1 &= ((u8)~UART2_CR1_WAKE);
1673  0297 72175244      	bres	21060,#3
1674                     ; 453     UART2->CR1 |= (u8)UART2_WakeUp;
1676  029b ca5244        	or	a,21060
1677  029e c75244        	ld	21060,a
1678                     ; 454 }
1681  02a1 81            	ret
1717                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1717                     ; 467 {
1718                     	switch	.text
1719  02a2               _UART2_ReceiverWakeUpCmd:
1723                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1725                     ; 470     if (NewState != DISABLE)
1727  02a2 4d            	tnz	a
1728  02a3 2706          	jreq	L527
1729                     ; 473         UART2->CR2 |= UART2_CR2_RWU;
1731  02a5 72125245      	bset	21061,#1
1733  02a9 2004          	jra	L727
1734  02ab               L527:
1735                     ; 478         UART2->CR2 &= ((u8)~UART2_CR2_RWU);
1737  02ab 72135245      	bres	21061,#1
1738  02af               L727:
1739                     ; 480 }
1742  02af 81            	ret
1765                     ; 491 u8 UART2_ReceiveData8(void)
1765                     ; 492 {
1766                     	switch	.text
1767  02b0               _UART2_ReceiveData8:
1771                     ; 493     return ((u8)UART2->DR);
1773  02b0 c65241        	ld	a,21057
1776  02b3 81            	ret
1799                     ; 504 u16 UART2_ReceiveData9(void)
1799                     ; 505 {
1800                     	switch	.text
1801  02b4               _UART2_ReceiveData9:
1803  02b4 89            	pushw	x
1804       00000002      OFST:	set	2
1807                     ; 506     return (u16)((((u16)UART2->DR) | ((u16)(((u16)((u16)UART2->CR1 & (u16)UART2_CR1_R8)) << 1))) & ((u16)0x01FF));
1809  02b5 c65244        	ld	a,21060
1810  02b8 5f            	clrw	x
1811  02b9 a480          	and	a,#128
1812  02bb 5f            	clrw	x
1813  02bc 02            	rlwa	x,a
1814  02bd 58            	sllw	x
1815  02be 1f01          	ldw	(OFST-1,sp),x
1816  02c0 c65241        	ld	a,21057
1817  02c3 5f            	clrw	x
1818  02c4 97            	ld	xl,a
1819  02c5 01            	rrwa	x,a
1820  02c6 1a02          	or	a,(OFST+0,sp)
1821  02c8 01            	rrwa	x,a
1822  02c9 1a01          	or	a,(OFST-1,sp)
1823  02cb 01            	rrwa	x,a
1824  02cc 01            	rrwa	x,a
1825  02cd a4ff          	and	a,#255
1826  02cf 01            	rrwa	x,a
1827  02d0 a401          	and	a,#1
1828  02d2 01            	rrwa	x,a
1831  02d3 5b02          	addw	sp,#2
1832  02d5 81            	ret
1866                     ; 520 void UART2_SendData8(u8 Data)
1866                     ; 521 {
1867                     	switch	.text
1868  02d6               _UART2_SendData8:
1872                     ; 523     UART2->DR = Data;
1874  02d6 c75241        	ld	21057,a
1875                     ; 524 }
1878  02d9 81            	ret
1912                     ; 535 void UART2_SendData9(u16 Data)
1912                     ; 536 {
1913                     	switch	.text
1914  02da               _UART2_SendData9:
1916  02da 89            	pushw	x
1917       00000000      OFST:	set	0
1920                     ; 537     UART2->CR1 &= ((u8)~UART2_CR1_T8);                  /* Clear the transmit data bit 8     */
1922  02db 721d5244      	bres	21060,#6
1923                     ; 538     UART2->CR1 |= (u8)(((u8)(Data >> 2)) & UART2_CR1_T8); /* Write the transmit data bit [8]   */
1925  02df 54            	srlw	x
1926  02e0 54            	srlw	x
1927  02e1 9f            	ld	a,xl
1928  02e2 a440          	and	a,#64
1929  02e4 ca5244        	or	a,21060
1930  02e7 c75244        	ld	21060,a
1931                     ; 539     UART2->DR   = (u8)(Data);                    /* Write the transmit data bit [0:7] */
1933  02ea 7b02          	ld	a,(OFST+2,sp)
1934  02ec c75241        	ld	21057,a
1935                     ; 541 }
1938  02ef 85            	popw	x
1939  02f0 81            	ret
1962                     ; 548 void UART2_SendBreak(void)
1962                     ; 549 {
1963                     	switch	.text
1964  02f1               _UART2_SendBreak:
1968                     ; 550     UART2->CR2 |= UART2_CR2_SBK;
1970  02f1 72105245      	bset	21061,#0
1971                     ; 551 }
1974  02f5 81            	ret
2008                     ; 560 void UART2_SetAddress(u8 UART2_Address)
2008                     ; 561 {
2009                     	switch	.text
2010  02f6               _UART2_SetAddress:
2012  02f6 88            	push	a
2013       00000000      OFST:	set	0
2016                     ; 563     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2018                     ; 566     UART2->CR4 &= ((u8)~UART2_CR4_ADD);
2020  02f7 c65247        	ld	a,21063
2021  02fa a4f0          	and	a,#240
2022  02fc c75247        	ld	21063,a
2023                     ; 568     UART2->CR4 |= UART2_Address;
2025  02ff c65247        	ld	a,21063
2026  0302 1a01          	or	a,(OFST+1,sp)
2027  0304 c75247        	ld	21063,a
2028                     ; 569 }
2031  0307 84            	pop	a
2032  0308 81            	ret
2066                     ; 580 void UART2_SetGuardTime(u8 UART2_GuardTime)
2066                     ; 581 {
2067                     	switch	.text
2068  0309               _UART2_SetGuardTime:
2072                     ; 583     UART2->GTR = UART2_GuardTime;
2074  0309 c7524a        	ld	21066,a
2075                     ; 584 }
2078  030c 81            	ret
2112                     ; 610 void UART2_SetPrescaler(u8 UART2_Prescaler)
2112                     ; 611 {
2113                     	switch	.text
2114  030d               _UART2_SetPrescaler:
2118                     ; 613     UART2->PSCR = UART2_Prescaler;
2120  030d c7524b        	ld	21067,a
2121                     ; 614 }
2124  0310 81            	ret
2281                     ; 625 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2281                     ; 626 {
2282                     	switch	.text
2283  0311               _UART2_GetFlagStatus:
2285  0311 89            	pushw	x
2286  0312 88            	push	a
2287       00000001      OFST:	set	1
2290                     ; 627     FlagStatus status = RESET;
2292  0313 7b01          	ld	a,(OFST+0,sp)
2293                     ; 630     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2295                     ; 633     if (UART2_FLAG == UART2_FLAG_LBDF)
2297  0315 a30210        	cpw	x,#528
2298  0318 2610          	jrne	L5511
2299                     ; 635         if ((UART2->CR4 & (u8)UART2_FLAG) != (u8)0x00)
2301  031a 9f            	ld	a,xl
2302  031b c45247        	and	a,21063
2303  031e 2706          	jreq	L7511
2304                     ; 638             status = SET;
2306  0320 a601          	ld	a,#1
2307  0322 6b01          	ld	(OFST+0,sp),a
2309  0324 2039          	jra	L3611
2310  0326               L7511:
2311                     ; 643             status = RESET;
2313  0326 0f01          	clr	(OFST+0,sp)
2314  0328 2035          	jra	L3611
2315  032a               L5511:
2316                     ; 646     else if (UART2_FLAG == UART2_FLAG_SBK)
2318  032a 1e02          	ldw	x,(OFST+1,sp)
2319  032c a30101        	cpw	x,#257
2320  032f 2611          	jrne	L5611
2321                     ; 648         if ((UART2->CR2 & (u8)UART2_FLAG) != (u8)0x00)
2323  0331 c65245        	ld	a,21061
2324  0334 1503          	bcp	a,(OFST+2,sp)
2325  0336 2706          	jreq	L7611
2326                     ; 651             status = SET;
2328  0338 a601          	ld	a,#1
2329  033a 6b01          	ld	(OFST+0,sp),a
2331  033c 2021          	jra	L3611
2332  033e               L7611:
2333                     ; 656             status = RESET;
2335  033e 0f01          	clr	(OFST+0,sp)
2336  0340 201d          	jra	L3611
2337  0342               L5611:
2338                     ; 659     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2340  0342 1e02          	ldw	x,(OFST+1,sp)
2341  0344 a30302        	cpw	x,#770
2342  0347 2707          	jreq	L7711
2344  0349 1e02          	ldw	x,(OFST+1,sp)
2345  034b a30301        	cpw	x,#769
2346  034e 2614          	jrne	L5711
2347  0350               L7711:
2348                     ; 661         if ((UART2->CR6 & (u8)UART2_FLAG) != (u8)0x00)
2350  0350 c65249        	ld	a,21065
2351  0353 1503          	bcp	a,(OFST+2,sp)
2352  0355 2706          	jreq	L1021
2353                     ; 664             status = SET;
2355  0357 a601          	ld	a,#1
2356  0359 6b01          	ld	(OFST+0,sp),a
2358  035b 2002          	jra	L3611
2359  035d               L1021:
2360                     ; 669             status = RESET;
2362  035d 0f01          	clr	(OFST+0,sp)
2363  035f               L3611:
2364                     ; 687     return  status;
2366  035f 7b01          	ld	a,(OFST+0,sp)
2369  0361 5b03          	addw	sp,#3
2370  0363 81            	ret
2371  0364               L5711:
2372                     ; 674         if ((UART2->SR & (u8)UART2_FLAG) != (u8)0x00)
2374  0364 c65240        	ld	a,21056
2375  0367 1503          	bcp	a,(OFST+2,sp)
2376  0369 2706          	jreq	L7021
2377                     ; 677             status = SET;
2379  036b a601          	ld	a,#1
2380  036d 6b01          	ld	(OFST+0,sp),a
2382  036f 20ee          	jra	L3611
2383  0371               L7021:
2384                     ; 682             status = RESET;
2386  0371 0f01          	clr	(OFST+0,sp)
2387  0373 20ea          	jra	L3611
2422                     ; 715 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2422                     ; 716 {
2423                     	switch	.text
2424  0375               _UART2_ClearFlag:
2426  0375 89            	pushw	x
2427       00000000      OFST:	set	0
2430                     ; 717     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2432                     ; 720     if (UART2_FLAG == UART2_FLAG_RXNE)
2434  0376 a30020        	cpw	x,#32
2435  0379 2606          	jrne	L1321
2436                     ; 722         UART2->SR = (u8)~(UART2_SR_RXNE);
2438  037b 35df5240      	mov	21056,#223
2440  037f 201e          	jra	L3321
2441  0381               L1321:
2442                     ; 725     else if (UART2_FLAG == UART2_FLAG_LBDF)
2444  0381 1e01          	ldw	x,(OFST+1,sp)
2445  0383 a30210        	cpw	x,#528
2446  0386 2606          	jrne	L5321
2447                     ; 727         UART2->CR4 &= (u8)(~UART2_CR4_LBDF);
2449  0388 72195247      	bres	21063,#4
2451  038c 2011          	jra	L3321
2452  038e               L5321:
2453                     ; 730     else if (UART2_FLAG == UART2_FLAG_LHDF)
2455  038e 1e01          	ldw	x,(OFST+1,sp)
2456  0390 a30302        	cpw	x,#770
2457  0393 2606          	jrne	L1421
2458                     ; 732         UART2->CR6 &= (u8)(~UART2_CR6_LHDF);
2460  0395 72135249      	bres	21065,#1
2462  0399 2004          	jra	L3321
2463  039b               L1421:
2464                     ; 737         UART2->CR6 &= (u8)(~UART2_CR6_LSF);
2466  039b 72115249      	bres	21065,#0
2467  039f               L3321:
2468                     ; 740 }
2471  039f 85            	popw	x
2472  03a0 81            	ret
2554                     ; 758 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2554                     ; 759 {
2555                     	switch	.text
2556  03a1               _UART2_GetITStatus:
2558  03a1 89            	pushw	x
2559  03a2 89            	pushw	x
2560       00000002      OFST:	set	2
2563                     ; 760     ITStatus pendingbitstatus = RESET;
2565  03a3 7b02          	ld	a,(OFST+0,sp)
2566                     ; 761     u8 itpos = 0;
2568  03a5 7b01          	ld	a,(OFST-1,sp)
2569                     ; 762     u8 itmask1 = 0;
2571  03a7 7b02          	ld	a,(OFST+0,sp)
2572                     ; 763     u8 itmask2 = 0;
2574  03a9 7b02          	ld	a,(OFST+0,sp)
2575                     ; 764     u8 enablestatus = 0;
2577  03ab 7b02          	ld	a,(OFST+0,sp)
2578                     ; 767     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2580                     ; 770     itpos = (u8)((u8)1 << (u8)((u8)UART2_IT & (u8)0x0F));
2582  03ad 9f            	ld	a,xl
2583  03ae a40f          	and	a,#15
2584  03b0 5f            	clrw	x
2585  03b1 97            	ld	xl,a
2586  03b2 a601          	ld	a,#1
2587  03b4 5d            	tnzw	x
2588  03b5 2704          	jreq	L27
2589  03b7               L47:
2590  03b7 48            	sll	a
2591  03b8 5a            	decw	x
2592  03b9 26fc          	jrne	L47
2593  03bb               L27:
2594  03bb 6b01          	ld	(OFST-1,sp),a
2595                     ; 772     itmask1 = (u8)((u8)UART2_IT >> (u8)4);
2597  03bd 7b04          	ld	a,(OFST+2,sp)
2598  03bf 4e            	swap	a
2599  03c0 a40f          	and	a,#15
2600  03c2 6b02          	ld	(OFST+0,sp),a
2601                     ; 774     itmask2 = (u8)((u8)1 << itmask1);
2603  03c4 7b02          	ld	a,(OFST+0,sp)
2604  03c6 5f            	clrw	x
2605  03c7 97            	ld	xl,a
2606  03c8 a601          	ld	a,#1
2607  03ca 5d            	tnzw	x
2608  03cb 2704          	jreq	L67
2609  03cd               L001:
2610  03cd 48            	sll	a
2611  03ce 5a            	decw	x
2612  03cf 26fc          	jrne	L001
2613  03d1               L67:
2614  03d1 6b02          	ld	(OFST+0,sp),a
2615                     ; 779     if (UART2_IT == UART2_IT_PE)
2617  03d3 1e03          	ldw	x,(OFST+1,sp)
2618  03d5 a30100        	cpw	x,#256
2619  03d8 261c          	jrne	L7031
2620                     ; 782         enablestatus = (u8)((u8)UART2->CR1 & itmask2);
2622  03da c65244        	ld	a,21060
2623  03dd 1402          	and	a,(OFST+0,sp)
2624  03df 6b02          	ld	(OFST+0,sp),a
2625                     ; 785         if (((UART2->SR & itpos) != (u8)0x00) && enablestatus)
2627  03e1 c65240        	ld	a,21056
2628  03e4 1501          	bcp	a,(OFST-1,sp)
2629  03e6 270a          	jreq	L1131
2631  03e8 0d02          	tnz	(OFST+0,sp)
2632  03ea 2706          	jreq	L1131
2633                     ; 788             pendingbitstatus = SET;
2635  03ec a601          	ld	a,#1
2636  03ee 6b02          	ld	(OFST+0,sp),a
2638  03f0 2064          	jra	L5131
2639  03f2               L1131:
2640                     ; 793             pendingbitstatus = RESET;
2642  03f2 0f02          	clr	(OFST+0,sp)
2643  03f4 2060          	jra	L5131
2644  03f6               L7031:
2645                     ; 797     else if (UART2_IT == UART2_IT_LBDF)
2647  03f6 1e03          	ldw	x,(OFST+1,sp)
2648  03f8 a30346        	cpw	x,#838
2649  03fb 261c          	jrne	L7131
2650                     ; 800         enablestatus = (u8)((u8)UART2->CR4 & itmask2);
2652  03fd c65247        	ld	a,21063
2653  0400 1402          	and	a,(OFST+0,sp)
2654  0402 6b02          	ld	(OFST+0,sp),a
2655                     ; 802         if (((UART2->CR4 & itpos) != (u8)0x00) && enablestatus)
2657  0404 c65247        	ld	a,21063
2658  0407 1501          	bcp	a,(OFST-1,sp)
2659  0409 270a          	jreq	L1231
2661  040b 0d02          	tnz	(OFST+0,sp)
2662  040d 2706          	jreq	L1231
2663                     ; 805             pendingbitstatus = SET;
2665  040f a601          	ld	a,#1
2666  0411 6b02          	ld	(OFST+0,sp),a
2668  0413 2041          	jra	L5131
2669  0415               L1231:
2670                     ; 810             pendingbitstatus = RESET;
2672  0415 0f02          	clr	(OFST+0,sp)
2673  0417 203d          	jra	L5131
2674  0419               L7131:
2675                     ; 813     else if (UART2_IT == UART2_IT_LHDF)
2677  0419 1e03          	ldw	x,(OFST+1,sp)
2678  041b a30412        	cpw	x,#1042
2679  041e 261c          	jrne	L7231
2680                     ; 816         enablestatus = (u8)((u8)UART2->CR6 & itmask2);
2682  0420 c65249        	ld	a,21065
2683  0423 1402          	and	a,(OFST+0,sp)
2684  0425 6b02          	ld	(OFST+0,sp),a
2685                     ; 818         if (((UART2->CR6 & itpos) != (u8)0x00) && enablestatus)
2687  0427 c65249        	ld	a,21065
2688  042a 1501          	bcp	a,(OFST-1,sp)
2689  042c 270a          	jreq	L1331
2691  042e 0d02          	tnz	(OFST+0,sp)
2692  0430 2706          	jreq	L1331
2693                     ; 821             pendingbitstatus = SET;
2695  0432 a601          	ld	a,#1
2696  0434 6b02          	ld	(OFST+0,sp),a
2698  0436 201e          	jra	L5131
2699  0438               L1331:
2700                     ; 826             pendingbitstatus = RESET;
2702  0438 0f02          	clr	(OFST+0,sp)
2703  043a 201a          	jra	L5131
2704  043c               L7231:
2705                     ; 832         enablestatus = (u8)((u8)UART2->CR2 & itmask2);
2707  043c c65245        	ld	a,21061
2708  043f 1402          	and	a,(OFST+0,sp)
2709  0441 6b02          	ld	(OFST+0,sp),a
2710                     ; 834         if (((UART2->SR & itpos) != (u8)0x00) && enablestatus)
2712  0443 c65240        	ld	a,21056
2713  0446 1501          	bcp	a,(OFST-1,sp)
2714  0448 270a          	jreq	L7331
2716  044a 0d02          	tnz	(OFST+0,sp)
2717  044c 2706          	jreq	L7331
2718                     ; 837             pendingbitstatus = SET;
2720  044e a601          	ld	a,#1
2721  0450 6b02          	ld	(OFST+0,sp),a
2723  0452 2002          	jra	L5131
2724  0454               L7331:
2725                     ; 842             pendingbitstatus = RESET;
2727  0454 0f02          	clr	(OFST+0,sp)
2728  0456               L5131:
2729                     ; 846     return  pendingbitstatus;
2731  0456 7b02          	ld	a,(OFST+0,sp)
2734  0458 5b04          	addw	sp,#4
2735  045a 81            	ret
2771                     ; 873 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2771                     ; 874 {
2772                     	switch	.text
2773  045b               _UART2_ClearITPendingBit:
2775  045b 89            	pushw	x
2776       00000000      OFST:	set	0
2779                     ; 875     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2781                     ; 878     if (UART2_IT == UART2_IT_RXNE)
2783  045c a30255        	cpw	x,#597
2784  045f 2606          	jrne	L1631
2785                     ; 880         UART2->SR = (u8)~(UART2_SR_RXNE);
2787  0461 35df5240      	mov	21056,#223
2789  0465 2011          	jra	L3631
2790  0467               L1631:
2791                     ; 883     else if (UART2_IT == UART2_IT_LBDF)
2793  0467 1e01          	ldw	x,(OFST+1,sp)
2794  0469 a30346        	cpw	x,#838
2795  046c 2606          	jrne	L5631
2796                     ; 885         UART2->CR4 &= (u8)~(UART2_CR4_LBDF);
2798  046e 72195247      	bres	21063,#4
2800  0472 2004          	jra	L3631
2801  0474               L5631:
2802                     ; 890         UART2->CR6 &= (u8)(~UART2_CR6_LHDF);
2804  0474 72135249      	bres	21065,#1
2805  0478               L3631:
2806                     ; 892 }
2809  0478 85            	popw	x
2810  0479 81            	ret
2823                     	xdef	_UART2_ClearITPendingBit
2824                     	xdef	_UART2_GetITStatus
2825                     	xdef	_UART2_ClearFlag
2826                     	xdef	_UART2_GetFlagStatus
2827                     	xdef	_UART2_SetPrescaler
2828                     	xdef	_UART2_SetGuardTime
2829                     	xdef	_UART2_SetAddress
2830                     	xdef	_UART2_SendBreak
2831                     	xdef	_UART2_SendData9
2832                     	xdef	_UART2_SendData8
2833                     	xdef	_UART2_ReceiveData9
2834                     	xdef	_UART2_ReceiveData8
2835                     	xdef	_UART2_ReceiverWakeUpCmd
2836                     	xdef	_UART2_WakeUpConfig
2837                     	xdef	_UART2_SmartCardNACKCmd
2838                     	xdef	_UART2_SmartCardCmd
2839                     	xdef	_UART2_LINCmd
2840                     	xdef	_UART2_LINConfig
2841                     	xdef	_UART2_LINBreakDetectionConfig
2842                     	xdef	_UART2_IrDACmd
2843                     	xdef	_UART2_IrDAConfig
2844                     	xdef	_UART2_ITConfig
2845                     	xdef	_UART2_Cmd
2846                     	xdef	_UART2_Init
2847                     	xdef	_UART2_DeInit
2848                     	xref	_CLK_GetClockFreq
2849                     	xref.b	c_lreg
2850                     	xref.b	c_x
2869                     	xref	c_lursh
2870                     	xref	c_lsub
2871                     	xref	c_smul
2872                     	xref	c_ludv
2873                     	xref	c_rtol
2874                     	xref	c_llsh
2875                     	xref	c_ltor
2876                     	end
