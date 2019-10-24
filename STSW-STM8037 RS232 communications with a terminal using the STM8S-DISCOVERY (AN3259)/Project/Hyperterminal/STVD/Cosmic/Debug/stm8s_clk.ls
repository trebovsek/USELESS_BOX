   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 64 void CLK_DeInit(void)
  58                     ; 65 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 67     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 68     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 69     CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 70     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 71     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 72     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 73     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 74     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 75     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 76     while (CLK->CCOR & CLK_CCOR_CCOEN)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 78     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 79     CLK->CANCCR = CLK_CANCCR_RESET_VALUE;
 104  002f 725f50cb      	clr	20683
 105                     ; 80     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  0033 725f50cc      	clr	20684
 108                     ; 81     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0037 725f50cd      	clr	20685
 111                     ; 83 }
 114  003b 81            	ret
 170                     ; 94 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 95 {
 171                     	switch	.text
 172  003c               _CLK_FastHaltWakeUpCmd:
 176                     ; 98     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178                     ; 100     if (NewState != DISABLE)
 180  003c 4d            	tnz	a
 181  003d 2706          	jreq	L75
 182                     ; 103         CLK->ICKR |= CLK_ICKR_FHWU;
 184  003f 721450c0      	bset	20672,#2
 186  0043 2004          	jra	L16
 187  0045               L75:
 188                     ; 108         CLK->ICKR &= (u8)(~CLK_ICKR_FHWU);
 190  0045 721550c0      	bres	20672,#2
 191  0049               L16:
 192                     ; 111 }
 195  0049 81            	ret
 230                     ; 118 void CLK_HSECmd(FunctionalState NewState)
 230                     ; 119 {
 231                     	switch	.text
 232  004a               _CLK_HSECmd:
 236                     ; 122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 238                     ; 124     if (NewState != DISABLE)
 240  004a 4d            	tnz	a
 241  004b 2706          	jreq	L101
 242                     ; 127         CLK->ECKR |= CLK_ECKR_HSEEN;
 244  004d 721050c1      	bset	20673,#0
 246  0051 2004          	jra	L301
 247  0053               L101:
 248                     ; 132         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
 250  0053 721150c1      	bres	20673,#0
 251  0057               L301:
 252                     ; 135 }
 255  0057 81            	ret
 290                     ; 142 void CLK_HSICmd(FunctionalState NewState)
 290                     ; 143 {
 291                     	switch	.text
 292  0058               _CLK_HSICmd:
 296                     ; 146     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298                     ; 148     if (NewState != DISABLE)
 300  0058 4d            	tnz	a
 301  0059 2706          	jreq	L321
 302                     ; 151         CLK->ICKR |= CLK_ICKR_HSIEN;
 304  005b 721050c0      	bset	20672,#0
 306  005f 2004          	jra	L521
 307  0061               L321:
 308                     ; 156         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
 310  0061 721150c0      	bres	20672,#0
 311  0065               L521:
 312                     ; 159 }
 315  0065 81            	ret
 350                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 350                     ; 167 {
 351                     	switch	.text
 352  0066               _CLK_LSICmd:
 356                     ; 170     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 358                     ; 172     if (NewState != DISABLE)
 360  0066 4d            	tnz	a
 361  0067 2706          	jreq	L541
 362                     ; 175         CLK->ICKR |= CLK_ICKR_LSIEN;
 364  0069 721650c0      	bset	20672,#3
 366  006d 2004          	jra	L741
 367  006f               L541:
 368                     ; 180         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
 370  006f 721750c0      	bres	20672,#3
 371  0073               L741:
 372                     ; 183 }
 375  0073 81            	ret
 410                     ; 191 void CLK_CCOCmd(FunctionalState NewState)
 410                     ; 192 {
 411                     	switch	.text
 412  0074               _CLK_CCOCmd:
 416                     ; 195     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 197     if (NewState != DISABLE)
 420  0074 4d            	tnz	a
 421  0075 2706          	jreq	L761
 422                     ; 200         CLK->CCOR |= CLK_CCOR_CCOEN;
 424  0077 721050c9      	bset	20681,#0
 426  007b 2004          	jra	L171
 427  007d               L761:
 428                     ; 205         CLK->CCOR &= (u8)(~CLK_CCOR_CCOEN);
 430  007d 721150c9      	bres	20681,#0
 431  0081               L171:
 432                     ; 208 }
 435  0081 81            	ret
 470                     ; 217 void CLK_ClockSwitchCmd(FunctionalState NewState)
 470                     ; 218 {
 471                     	switch	.text
 472  0082               _CLK_ClockSwitchCmd:
 476                     ; 221     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478                     ; 223     if (NewState != DISABLE )
 480  0082 4d            	tnz	a
 481  0083 2706          	jreq	L112
 482                     ; 226         CLK->SWCR |= CLK_SWCR_SWEN;
 484  0085 721250c5      	bset	20677,#1
 486  0089 2004          	jra	L312
 487  008b               L112:
 488                     ; 231         CLK->SWCR &= (u8)(~CLK_SWCR_SWEN);
 490  008b 721350c5      	bres	20677,#1
 491  008f               L312:
 492                     ; 234 }
 495  008f 81            	ret
 531                     ; 244 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 531                     ; 245 {
 532                     	switch	.text
 533  0090               _CLK_SlowActiveHaltWakeUpCmd:
 537                     ; 248     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 539                     ; 250     if (NewState != DISABLE)
 541  0090 4d            	tnz	a
 542  0091 2706          	jreq	L332
 543                     ; 253         CLK->ICKR |= CLK_ICKR_SWUAH;
 545  0093 721a50c0      	bset	20672,#5
 547  0097 2004          	jra	L532
 548  0099               L332:
 549                     ; 258         CLK->ICKR &= (u8)(~CLK_ICKR_SWUAH);
 551  0099 721b50c0      	bres	20672,#5
 552  009d               L532:
 553                     ; 261 }
 556  009d 81            	ret
 715                     ; 271 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 715                     ; 272 {
 716                     	switch	.text
 717  009e               _CLK_PeripheralClockConfig:
 719  009e 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 275     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 276     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 727                     ; 278     if (((u8)CLK_Peripheral & (u8)0x10) == 0x00)
 729  009f 9e            	ld	a,xh
 730  00a0 a510          	bcp	a,#16
 731  00a2 2633          	jrne	L123
 732                     ; 280         if (NewState != DISABLE)
 734  00a4 0d02          	tnz	(OFST+2,sp)
 735  00a6 2717          	jreq	L323
 736                     ; 283             CLK->PCKENR1 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 738  00a8 7b01          	ld	a,(OFST+1,sp)
 739  00aa a40f          	and	a,#15
 740  00ac 5f            	clrw	x
 741  00ad 97            	ld	xl,a
 742  00ae a601          	ld	a,#1
 743  00b0 5d            	tnzw	x
 744  00b1 2704          	jreq	L62
 745  00b3               L03:
 746  00b3 48            	sll	a
 747  00b4 5a            	decw	x
 748  00b5 26fc          	jrne	L03
 749  00b7               L62:
 750  00b7 ca50c7        	or	a,20679
 751  00ba c750c7        	ld	20679,a
 753  00bd 2049          	jra	L723
 754  00bf               L323:
 755                     ; 288             CLK->PCKENR1 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 757  00bf 7b01          	ld	a,(OFST+1,sp)
 758  00c1 a40f          	and	a,#15
 759  00c3 5f            	clrw	x
 760  00c4 97            	ld	xl,a
 761  00c5 a601          	ld	a,#1
 762  00c7 5d            	tnzw	x
 763  00c8 2704          	jreq	L23
 764  00ca               L43:
 765  00ca 48            	sll	a
 766  00cb 5a            	decw	x
 767  00cc 26fc          	jrne	L43
 768  00ce               L23:
 769  00ce 43            	cpl	a
 770  00cf c450c7        	and	a,20679
 771  00d2 c750c7        	ld	20679,a
 772  00d5 2031          	jra	L723
 773  00d7               L123:
 774                     ; 293         if (NewState != DISABLE)
 776  00d7 0d02          	tnz	(OFST+2,sp)
 777  00d9 2717          	jreq	L133
 778                     ; 296             CLK->PCKENR2 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 780  00db 7b01          	ld	a,(OFST+1,sp)
 781  00dd a40f          	and	a,#15
 782  00df 5f            	clrw	x
 783  00e0 97            	ld	xl,a
 784  00e1 a601          	ld	a,#1
 785  00e3 5d            	tnzw	x
 786  00e4 2704          	jreq	L63
 787  00e6               L04:
 788  00e6 48            	sll	a
 789  00e7 5a            	decw	x
 790  00e8 26fc          	jrne	L04
 791  00ea               L63:
 792  00ea ca50ca        	or	a,20682
 793  00ed c750ca        	ld	20682,a
 795  00f0 2016          	jra	L723
 796  00f2               L133:
 797                     ; 301             CLK->PCKENR2 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 799  00f2 7b01          	ld	a,(OFST+1,sp)
 800  00f4 a40f          	and	a,#15
 801  00f6 5f            	clrw	x
 802  00f7 97            	ld	xl,a
 803  00f8 a601          	ld	a,#1
 804  00fa 5d            	tnzw	x
 805  00fb 2704          	jreq	L24
 806  00fd               L44:
 807  00fd 48            	sll	a
 808  00fe 5a            	decw	x
 809  00ff 26fc          	jrne	L44
 810  0101               L24:
 811  0101 43            	cpl	a
 812  0102 c450ca        	and	a,20682
 813  0105 c750ca        	ld	20682,a
 814  0108               L723:
 815                     ; 305 }
 818  0108 85            	popw	x
 819  0109 81            	ret
1007                     ; 318 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1007                     ; 319 {
1008                     	switch	.text
1009  010a               _CLK_ClockSwitchConfig:
1011  010a 89            	pushw	x
1012  010b 5204          	subw	sp,#4
1013       00000004      OFST:	set	4
1016                     ; 322     u16 DownCounter = CLK_TIMEOUT;
1018  010d ae0491        	ldw	x,#1169
1019  0110 1f03          	ldw	(OFST-1,sp),x
1020                     ; 323     ErrorStatus Swif = ERROR;
1022  0112 7b02          	ld	a,(OFST-2,sp)
1023                     ; 326     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1025                     ; 327     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1027                     ; 328     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1029                     ; 329     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1031                     ; 332     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1033  0114 c650c3        	ld	a,20675
1034  0117 6b01          	ld	(OFST-3,sp),a
1035                     ; 335     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1037  0119 7b05          	ld	a,(OFST+1,sp)
1038  011b a101          	cp	a,#1
1039  011d 2639          	jrne	L544
1040                     ; 339         CLK->SWCR |= CLK_SWCR_SWEN;
1042  011f 721250c5      	bset	20677,#1
1043                     ; 342         if (ITState != DISABLE)
1045  0123 0d09          	tnz	(OFST+5,sp)
1046  0125 2706          	jreq	L744
1047                     ; 344             CLK->SWCR |= CLK_SWCR_SWIEN;
1049  0127 721450c5      	bset	20677,#2
1051  012b 2004          	jra	L154
1052  012d               L744:
1053                     ; 348             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1055  012d 721550c5      	bres	20677,#2
1056  0131               L154:
1057                     ; 352         CLK->SWR = (u8)CLK_NewClock;
1059  0131 7b06          	ld	a,(OFST+2,sp)
1060  0133 c750c4        	ld	20676,a
1062  0136 2007          	jra	L754
1063  0138               L354:
1064                     ; 356             DownCounter--;
1066  0138 1e03          	ldw	x,(OFST-1,sp)
1067  013a 1d0001        	subw	x,#1
1068  013d 1f03          	ldw	(OFST-1,sp),x
1069  013f               L754:
1070                     ; 354         while (((CLK->SWCR & CLK_SWCR_SWBSY) && (DownCounter != 0)))
1072  013f c650c5        	ld	a,20677
1073  0142 a501          	bcp	a,#1
1074  0144 2704          	jreq	L364
1076  0146 1e03          	ldw	x,(OFST-1,sp)
1077  0148 26ee          	jrne	L354
1078  014a               L364:
1079                     ; 359         if (DownCounter != 0)
1081  014a 1e03          	ldw	x,(OFST-1,sp)
1082  014c 2706          	jreq	L564
1083                     ; 361             Swif = SUCCESS;
1085  014e a601          	ld	a,#1
1086  0150 6b02          	ld	(OFST-2,sp),a
1088  0152 201b          	jra	L174
1089  0154               L564:
1090                     ; 365             Swif = ERROR;
1092  0154 0f02          	clr	(OFST-2,sp)
1093  0156 2017          	jra	L174
1094  0158               L544:
1095                     ; 373         if (ITState != DISABLE)
1097  0158 0d09          	tnz	(OFST+5,sp)
1098  015a 2706          	jreq	L374
1099                     ; 375             CLK->SWCR |= CLK_SWCR_SWIEN;
1101  015c 721450c5      	bset	20677,#2
1103  0160 2004          	jra	L574
1104  0162               L374:
1105                     ; 379             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1107  0162 721550c5      	bres	20677,#2
1108  0166               L574:
1109                     ; 383         CLK->SWR = (u8)CLK_NewClock;
1111  0166 7b06          	ld	a,(OFST+2,sp)
1112  0168 c750c4        	ld	20676,a
1113                     ; 387         Swif = SUCCESS;
1115  016b a601          	ld	a,#1
1116  016d 6b02          	ld	(OFST-2,sp),a
1117  016f               L174:
1118                     ; 392     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1120  016f 0d0a          	tnz	(OFST+6,sp)
1121  0171 260c          	jrne	L774
1123  0173 7b01          	ld	a,(OFST-3,sp)
1124  0175 a1e1          	cp	a,#225
1125  0177 2606          	jrne	L774
1126                     ; 394         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
1128  0179 721150c0      	bres	20672,#0
1130  017d 201e          	jra	L105
1131  017f               L774:
1132                     ; 396     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1134  017f 0d0a          	tnz	(OFST+6,sp)
1135  0181 260c          	jrne	L305
1137  0183 7b01          	ld	a,(OFST-3,sp)
1138  0185 a1d2          	cp	a,#210
1139  0187 2606          	jrne	L305
1140                     ; 398         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
1142  0189 721750c0      	bres	20672,#3
1144  018d 200e          	jra	L105
1145  018f               L305:
1146                     ; 400     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1148  018f 0d0a          	tnz	(OFST+6,sp)
1149  0191 260a          	jrne	L105
1151  0193 7b01          	ld	a,(OFST-3,sp)
1152  0195 a1b4          	cp	a,#180
1153  0197 2604          	jrne	L105
1154                     ; 402         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
1156  0199 721150c1      	bres	20673,#0
1157  019d               L105:
1158                     ; 405     return(Swif);
1160  019d 7b02          	ld	a,(OFST-2,sp)
1163  019f 5b06          	addw	sp,#6
1164  01a1 81            	ret
1302                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1302                     ; 416 {
1303                     	switch	.text
1304  01a2               _CLK_HSIPrescalerConfig:
1306  01a2 88            	push	a
1307       00000000      OFST:	set	0
1310                     ; 419     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1312                     ; 422     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1314  01a3 c650c6        	ld	a,20678
1315  01a6 a4e7          	and	a,#231
1316  01a8 c750c6        	ld	20678,a
1317                     ; 425     CLK->CKDIVR |= (u8)HSIPrescaler;
1319  01ab c650c6        	ld	a,20678
1320  01ae 1a01          	or	a,(OFST+1,sp)
1321  01b0 c750c6        	ld	20678,a
1322                     ; 427 }
1325  01b3 84            	pop	a
1326  01b4 81            	ret
1461                     ; 438 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1461                     ; 439 {
1462                     	switch	.text
1463  01b5               _CLK_CCOConfig:
1465  01b5 88            	push	a
1466       00000000      OFST:	set	0
1469                     ; 442     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1471                     ; 445     CLK->CCOR &= (u8)(~CLK_CCOR_CCOSEL);
1473  01b6 c650c9        	ld	a,20681
1474  01b9 a4e1          	and	a,#225
1475  01bb c750c9        	ld	20681,a
1476                     ; 448     CLK->CCOR |= (u8)CLK_CCO;
1478  01be c650c9        	ld	a,20681
1479  01c1 1a01          	or	a,(OFST+1,sp)
1480  01c3 c750c9        	ld	20681,a
1481                     ; 451     CLK->CCOR |= CLK_CCOR_CCOEN;
1483  01c6 721050c9      	bset	20681,#0
1484                     ; 453 }
1487  01ca 84            	pop	a
1488  01cb 81            	ret
1553                     ; 463 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1553                     ; 464 {
1554                     	switch	.text
1555  01cc               _CLK_ITConfig:
1557  01cc 89            	pushw	x
1558       00000000      OFST:	set	0
1561                     ; 467     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1563                     ; 468     assert_param(IS_CLK_IT_OK(CLK_IT));
1565                     ; 470     if (NewState != DISABLE)
1567  01cd 9f            	ld	a,xl
1568  01ce 4d            	tnz	a
1569  01cf 2719          	jreq	L507
1570                     ; 472         switch (CLK_IT)
1572  01d1 9e            	ld	a,xh
1574                     ; 480         default:
1574                     ; 481             break;
1575  01d2 a00c          	sub	a,#12
1576  01d4 270a          	jreq	L146
1577  01d6 a010          	sub	a,#16
1578  01d8 2624          	jrne	L317
1579                     ; 474         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1579                     ; 475             CLK->SWCR |= CLK_SWCR_SWIEN;
1581  01da 721450c5      	bset	20677,#2
1582                     ; 476             break;
1584  01de 201e          	jra	L317
1585  01e0               L146:
1586                     ; 477         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1586                     ; 478             CLK->CSSR |= CLK_CSSR_CSSDIE;
1588  01e0 721450c8      	bset	20680,#2
1589                     ; 479             break;
1591  01e4 2018          	jra	L317
1592  01e6               L346:
1593                     ; 480         default:
1593                     ; 481             break;
1595  01e6 2016          	jra	L317
1596  01e8               L117:
1598  01e8 2014          	jra	L317
1599  01ea               L507:
1600                     ; 486         switch (CLK_IT)
1602  01ea 7b01          	ld	a,(OFST+1,sp)
1604                     ; 494         default:
1604                     ; 495             break;
1605  01ec a00c          	sub	a,#12
1606  01ee 270a          	jreq	L746
1607  01f0 a010          	sub	a,#16
1608  01f2 260a          	jrne	L317
1609                     ; 488         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1609                     ; 489             CLK->SWCR  &= (u8)(~CLK_SWCR_SWIEN);
1611  01f4 721550c5      	bres	20677,#2
1612                     ; 490             break;
1614  01f8 2004          	jra	L317
1615  01fa               L746:
1616                     ; 491         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1616                     ; 492             CLK->CSSR &= (u8)(~CLK_CSSR_CSSDIE);
1618  01fa 721550c8      	bres	20680,#2
1619                     ; 493             break;
1620  01fe               L317:
1621                     ; 499 }
1624  01fe 85            	popw	x
1625  01ff 81            	ret
1626  0200               L156:
1627                     ; 494         default:
1627                     ; 495             break;
1629  0200 20fc          	jra	L317
1630  0202               L717:
1631  0202 20fa          	jra	L317
1666                     ; 506 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef ClockPrescaler)
1666                     ; 507 {
1667                     	switch	.text
1668  0204               _CLK_SYSCLKConfig:
1670  0204 88            	push	a
1671       00000000      OFST:	set	0
1674                     ; 510     assert_param(IS_CLK_PRESCALER_OK(ClockPrescaler));
1676                     ; 512     if (((u8)ClockPrescaler & (u8)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1678  0205 a580          	bcp	a,#128
1679  0207 2614          	jrne	L737
1680                     ; 514         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1682  0209 c650c6        	ld	a,20678
1683  020c a4e7          	and	a,#231
1684  020e c750c6        	ld	20678,a
1685                     ; 515         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_HSIDIV);
1687  0211 7b01          	ld	a,(OFST+1,sp)
1688  0213 a418          	and	a,#24
1689  0215 ca50c6        	or	a,20678
1690  0218 c750c6        	ld	20678,a
1692  021b 2012          	jra	L147
1693  021d               L737:
1694                     ; 519         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
1696  021d c650c6        	ld	a,20678
1697  0220 a4f8          	and	a,#248
1698  0222 c750c6        	ld	20678,a
1699                     ; 520         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_CPUDIV);
1701  0225 7b01          	ld	a,(OFST+1,sp)
1702  0227 a407          	and	a,#7
1703  0229 ca50c6        	or	a,20678
1704  022c c750c6        	ld	20678,a
1705  022f               L147:
1706                     ; 523 }
1709  022f 84            	pop	a
1710  0230 81            	ret
1766                     ; 530 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1766                     ; 531 {
1767                     	switch	.text
1768  0231               _CLK_SWIMConfig:
1772                     ; 534     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1774                     ; 536     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1776  0231 4d            	tnz	a
1777  0232 2706          	jreq	L177
1778                     ; 539         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1780  0234 721050cd      	bset	20685,#0
1782  0238 2004          	jra	L377
1783  023a               L177:
1784                     ; 544         CLK->SWIMCCR &= (u8)(~CLK_SWIMCCR_SWIMDIV);
1786  023a 721150cd      	bres	20685,#0
1787  023e               L377:
1788                     ; 547 }
1791  023e 81            	ret
1888                     ; 555 void CLK_CANConfig(CLK_CANDivider_TypeDef CLK_CANDivider)
1888                     ; 556 {
1889                     	switch	.text
1890  023f               _CLK_CANConfig:
1892  023f 88            	push	a
1893       00000000      OFST:	set	0
1896                     ; 559     assert_param(IS_CLK_CANDIVIDER_OK(CLK_CANDivider));
1898                     ; 562     CLK->CANCCR &= (u8)(~CLK_CANCCR_CANDIV);
1900  0240 c650cb        	ld	a,20683
1901  0243 a4f8          	and	a,#248
1902  0245 c750cb        	ld	20683,a
1903                     ; 565     CLK->CANCCR |= (u8)CLK_CANDivider;
1905  0248 c650cb        	ld	a,20683
1906  024b 1a01          	or	a,(OFST+1,sp)
1907  024d c750cb        	ld	20683,a
1908                     ; 567 }
1911  0250 84            	pop	a
1912  0251 81            	ret
1936                     ; 577 void CLK_ClockSecuritySystemEnable(void)
1936                     ; 578 {
1937                     	switch	.text
1938  0252               _CLK_ClockSecuritySystemEnable:
1942                     ; 580     CLK->CSSR |= CLK_CSSR_CSSEN;
1944  0252 721050c8      	bset	20680,#0
1945                     ; 581 }
1948  0256 81            	ret
1973                     ; 590 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1973                     ; 591 {
1974                     	switch	.text
1975  0257               _CLK_GetSYSCLKSource:
1979                     ; 592     return((CLK_Source_TypeDef)CLK->CMSR);
1981  0257 c650c3        	ld	a,20675
1984  025a 81            	ret
2047                     ; 602 u32 CLK_GetClockFreq(void)
2047                     ; 603 {
2048                     	switch	.text
2049  025b               _CLK_GetClockFreq:
2051  025b 5209          	subw	sp,#9
2052       00000009      OFST:	set	9
2055                     ; 605     u32 clockfrequency = 0;
2057  025d 96            	ldw	x,sp
2058  025e 1c0005        	addw	x,#OFST-4
2059  0261 cd0000        	call	c_ltor
2061                     ; 606     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2063  0264 7b09          	ld	a,(OFST+0,sp)
2064                     ; 607     u8 tmp = 0, presc = 0;
2066  0266 7b09          	ld	a,(OFST+0,sp)
2069  0268 7b09          	ld	a,(OFST+0,sp)
2070                     ; 610     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2072  026a c650c3        	ld	a,20675
2073  026d 6b09          	ld	(OFST+0,sp),a
2074                     ; 612     if (clocksource == CLK_SOURCE_HSI)
2076  026f 7b09          	ld	a,(OFST+0,sp)
2077  0271 a1e1          	cp	a,#225
2078  0273 2641          	jrne	L1111
2079                     ; 614         tmp = (u8)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2081  0275 c650c6        	ld	a,20678
2082  0278 a418          	and	a,#24
2083  027a 6b09          	ld	(OFST+0,sp),a
2084                     ; 615         tmp = (u8)(tmp >> 3);
2086  027c 0409          	srl	(OFST+0,sp)
2087  027e 0409          	srl	(OFST+0,sp)
2088  0280 0409          	srl	(OFST+0,sp)
2089                     ; 616         presc = HSIDivFactor[tmp];
2091  0282 7b09          	ld	a,(OFST+0,sp)
2092  0284 5f            	clrw	x
2093  0285 97            	ld	xl,a
2094  0286 d60000        	ld	a,(_HSIDivFactor,x)
2095  0289 6b09          	ld	(OFST+0,sp),a
2096                     ; 617         clockfrequency = HSI_VALUE / presc;
2098  028b 7b09          	ld	a,(OFST+0,sp)
2099  028d b703          	ld	c_lreg+3,a
2100  028f 3f02          	clr	c_lreg+2
2101  0291 3f01          	clr	c_lreg+1
2102  0293 3f00          	clr	c_lreg
2103  0295 96            	ldw	x,sp
2104  0296 1c0001        	addw	x,#OFST-8
2105  0299 cd0000        	call	c_rtol
2107  029c ae2400        	ldw	x,#9216
2108  029f bf02          	ldw	c_lreg+2,x
2109  02a1 ae00f4        	ldw	x,#244
2110  02a4 bf00          	ldw	c_lreg,x
2111  02a6 96            	ldw	x,sp
2112  02a7 1c0001        	addw	x,#OFST-8
2113  02aa cd0000        	call	c_ludv
2115  02ad 96            	ldw	x,sp
2116  02ae 1c0005        	addw	x,#OFST-4
2117  02b1 cd0000        	call	c_rtol
2120  02b4 201c          	jra	L3111
2121  02b6               L1111:
2122                     ; 619     else if ( clocksource == CLK_SOURCE_LSI)
2124  02b6 7b09          	ld	a,(OFST+0,sp)
2125  02b8 a1d2          	cp	a,#210
2126  02ba 260c          	jrne	L5111
2127                     ; 621         clockfrequency = LSI_VALUE;
2129  02bc aef400        	ldw	x,#62464
2130  02bf 1f07          	ldw	(OFST-2,sp),x
2131  02c1 ae0001        	ldw	x,#1
2132  02c4 1f05          	ldw	(OFST-4,sp),x
2134  02c6 200a          	jra	L3111
2135  02c8               L5111:
2136                     ; 625         clockfrequency = HSE_VALUE;
2138  02c8 ae2400        	ldw	x,#9216
2139  02cb 1f07          	ldw	(OFST-2,sp),x
2140  02cd ae00f4        	ldw	x,#244
2141  02d0 1f05          	ldw	(OFST-4,sp),x
2142  02d2               L3111:
2143                     ; 628     return((u32)clockfrequency);
2145  02d2 96            	ldw	x,sp
2146  02d3 1c0005        	addw	x,#OFST-4
2147  02d6 cd0000        	call	c_ltor
2151  02d9 5b09          	addw	sp,#9
2152  02db 81            	ret
2251                     ; 639 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2251                     ; 640 {
2252                     	switch	.text
2253  02dc               _CLK_AdjustHSICalibrationValue:
2255  02dc 88            	push	a
2256       00000000      OFST:	set	0
2259                     ; 643     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2261                     ; 646     CLK->HSITRIMR = (u8)((CLK->HSITRIMR & (u8)(~CLK_HSITRIMR_HSITRIM))|((u8)CLK_HSICalibrationValue));
2263  02dd c650cc        	ld	a,20684
2264  02e0 a4f8          	and	a,#248
2265  02e2 1a01          	or	a,(OFST+1,sp)
2266  02e4 c750cc        	ld	20684,a
2267                     ; 648 }
2270  02e7 84            	pop	a
2271  02e8 81            	ret
2295                     ; 660 void CLK_SYSCLKEmergencyClear(void)
2295                     ; 661 {
2296                     	switch	.text
2297  02e9               _CLK_SYSCLKEmergencyClear:
2301                     ; 662     CLK->SWCR &= (u8)(~CLK_SWCR_SWBSY);
2303  02e9 721150c5      	bres	20677,#0
2304                     ; 663 }
2307  02ed 81            	ret
2460                     ; 672 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2460                     ; 673 {
2461                     	switch	.text
2462  02ee               _CLK_GetFlagStatus:
2464  02ee 89            	pushw	x
2465  02ef 5203          	subw	sp,#3
2466       00000003      OFST:	set	3
2469                     ; 675     u16 statusreg = 0;
2471  02f1 1e01          	ldw	x,(OFST-2,sp)
2472                     ; 676     u8 tmpreg = 0;
2474  02f3 7b03          	ld	a,(OFST+0,sp)
2475                     ; 677     FlagStatus bitstatus = RESET;
2477  02f5 7b03          	ld	a,(OFST+0,sp)
2478                     ; 680     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2480                     ; 683     statusreg = (u16)((u16)CLK_FLAG & (u16)0xFF00);
2482  02f7 7b04          	ld	a,(OFST+1,sp)
2483  02f9 97            	ld	xl,a
2484  02fa 7b05          	ld	a,(OFST+2,sp)
2485  02fc 9f            	ld	a,xl
2486  02fd a4ff          	and	a,#255
2487  02ff 97            	ld	xl,a
2488  0300 4f            	clr	a
2489  0301 02            	rlwa	x,a
2490  0302 1f01          	ldw	(OFST-2,sp),x
2491  0304 01            	rrwa	x,a
2492                     ; 686     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2494  0305 1e01          	ldw	x,(OFST-2,sp)
2495  0307 a30100        	cpw	x,#256
2496  030a 2607          	jrne	L3621
2497                     ; 688         tmpreg = CLK->ICKR;
2499  030c c650c0        	ld	a,20672
2500  030f 6b03          	ld	(OFST+0,sp),a
2502  0311 202f          	jra	L5621
2503  0313               L3621:
2504                     ; 690     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2506  0313 1e01          	ldw	x,(OFST-2,sp)
2507  0315 a30200        	cpw	x,#512
2508  0318 2607          	jrne	L7621
2509                     ; 692         tmpreg = CLK->ECKR;
2511  031a c650c1        	ld	a,20673
2512  031d 6b03          	ld	(OFST+0,sp),a
2514  031f 2021          	jra	L5621
2515  0321               L7621:
2516                     ; 694     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2518  0321 1e01          	ldw	x,(OFST-2,sp)
2519  0323 a30300        	cpw	x,#768
2520  0326 2607          	jrne	L3721
2521                     ; 696         tmpreg = CLK->SWCR;
2523  0328 c650c5        	ld	a,20677
2524  032b 6b03          	ld	(OFST+0,sp),a
2526  032d 2013          	jra	L5621
2527  032f               L3721:
2528                     ; 698     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2530  032f 1e01          	ldw	x,(OFST-2,sp)
2531  0331 a30400        	cpw	x,#1024
2532  0334 2607          	jrne	L7721
2533                     ; 700         tmpreg = CLK->CSSR;
2535  0336 c650c8        	ld	a,20680
2536  0339 6b03          	ld	(OFST+0,sp),a
2538  033b 2005          	jra	L5621
2539  033d               L7721:
2540                     ; 704         tmpreg = CLK->CCOR;
2542  033d c650c9        	ld	a,20681
2543  0340 6b03          	ld	(OFST+0,sp),a
2544  0342               L5621:
2545                     ; 707     if ((tmpreg & (u8)CLK_FLAG) != (u8)RESET)
2547  0342 7b05          	ld	a,(OFST+2,sp)
2548  0344 1503          	bcp	a,(OFST+0,sp)
2549  0346 2706          	jreq	L3031
2550                     ; 709         bitstatus = SET;
2552  0348 a601          	ld	a,#1
2553  034a 6b03          	ld	(OFST+0,sp),a
2555  034c 2002          	jra	L5031
2556  034e               L3031:
2557                     ; 713         bitstatus = RESET;
2559  034e 0f03          	clr	(OFST+0,sp)
2560  0350               L5031:
2561                     ; 717     return((FlagStatus)bitstatus);
2563  0350 7b03          	ld	a,(OFST+0,sp)
2566  0352 5b05          	addw	sp,#5
2567  0354 81            	ret
2613                     ; 727 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2613                     ; 728 {
2614                     	switch	.text
2615  0355               _CLK_GetITStatus:
2617  0355 88            	push	a
2618  0356 88            	push	a
2619       00000001      OFST:	set	1
2622                     ; 730     ITStatus bitstatus = RESET;
2624  0357 7b01          	ld	a,(OFST+0,sp)
2625                     ; 733     assert_param(IS_CLK_IT_OK(CLK_IT));
2627                     ; 735     if (CLK_IT == CLK_IT_SWIF)
2629  0359 7b02          	ld	a,(OFST+1,sp)
2630  035b a11c          	cp	a,#28
2631  035d 2613          	jrne	L1331
2632                     ; 738         if ((CLK->SWCR & (u8)CLK_IT) == (u8)0x0C)
2634  035f c650c5        	ld	a,20677
2635  0362 1402          	and	a,(OFST+1,sp)
2636  0364 a10c          	cp	a,#12
2637  0366 2606          	jrne	L3331
2638                     ; 740             bitstatus = SET;
2640  0368 a601          	ld	a,#1
2641  036a 6b01          	ld	(OFST+0,sp),a
2643  036c 2015          	jra	L7331
2644  036e               L3331:
2645                     ; 744             bitstatus = RESET;
2647  036e 0f01          	clr	(OFST+0,sp)
2648  0370 2011          	jra	L7331
2649  0372               L1331:
2650                     ; 750         if ((CLK->CSSR & (u8)CLK_IT) == (u8)0x0C)
2652  0372 c650c8        	ld	a,20680
2653  0375 1402          	and	a,(OFST+1,sp)
2654  0377 a10c          	cp	a,#12
2655  0379 2606          	jrne	L1431
2656                     ; 752             bitstatus = SET;
2658  037b a601          	ld	a,#1
2659  037d 6b01          	ld	(OFST+0,sp),a
2661  037f 2002          	jra	L7331
2662  0381               L1431:
2663                     ; 756             bitstatus = RESET;
2665  0381 0f01          	clr	(OFST+0,sp)
2666  0383               L7331:
2667                     ; 761     return bitstatus;
2669  0383 7b01          	ld	a,(OFST+0,sp)
2672  0385 85            	popw	x
2673  0386 81            	ret
2709                     ; 771 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2709                     ; 772 {
2710                     	switch	.text
2711  0387               _CLK_ClearITPendingBit:
2715                     ; 775     assert_param(IS_CLK_IT_OK(CLK_IT));
2717                     ; 777     if (CLK_IT == (u8)CLK_IT_CSSD)
2719  0387 a10c          	cp	a,#12
2720  0389 2606          	jrne	L3631
2721                     ; 780         CLK->CSSR &= (u8)(~CLK_CSSR_CSSD);
2723  038b 721750c8      	bres	20680,#3
2725  038f 2004          	jra	L5631
2726  0391               L3631:
2727                     ; 785         CLK->SWCR &= (u8)(~CLK_SWCR_SWIF);
2729  0391 721750c5      	bres	20677,#3
2730  0395               L5631:
2731                     ; 788 }
2734  0395 81            	ret
2769                     	xdef	_CLKPrescTable
2770                     	xdef	_HSIDivFactor
2771                     	xdef	_CLK_ClearITPendingBit
2772                     	xdef	_CLK_GetITStatus
2773                     	xdef	_CLK_GetFlagStatus
2774                     	xdef	_CLK_GetSYSCLKSource
2775                     	xdef	_CLK_GetClockFreq
2776                     	xdef	_CLK_AdjustHSICalibrationValue
2777                     	xdef	_CLK_SYSCLKEmergencyClear
2778                     	xdef	_CLK_ClockSecuritySystemEnable
2779                     	xdef	_CLK_CANConfig
2780                     	xdef	_CLK_SWIMConfig
2781                     	xdef	_CLK_SYSCLKConfig
2782                     	xdef	_CLK_ITConfig
2783                     	xdef	_CLK_CCOConfig
2784                     	xdef	_CLK_HSIPrescalerConfig
2785                     	xdef	_CLK_ClockSwitchConfig
2786                     	xdef	_CLK_PeripheralClockConfig
2787                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2788                     	xdef	_CLK_FastHaltWakeUpCmd
2789                     	xdef	_CLK_ClockSwitchCmd
2790                     	xdef	_CLK_CCOCmd
2791                     	xdef	_CLK_LSICmd
2792                     	xdef	_CLK_HSICmd
2793                     	xdef	_CLK_HSECmd
2794                     	xdef	_CLK_DeInit
2795                     	xref.b	c_lreg
2796                     	xref.b	c_x
2815                     	xref	c_ludv
2816                     	xref	c_rtol
2817                     	xref	c_ltor
2818                     	end
