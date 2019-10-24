   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
  43                     ; 43 void TIM3_DeInit(void)
  43                     ; 44 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 46     TIM3->CR1 = (u8)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 47     TIM3->IER = (u8)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 48     TIM3->SR2 = (u8)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 51     TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 54     TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 55     TIM3->CCMR1 = (u8)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 56     TIM3->CCMR2 = (u8)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 57     TIM3->CNTRH = (u8)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 58     TIM3->CNTRL = (u8)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 59     TIM3->PSCR = (u8)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 60     TIM3->ARRH  = (u8)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 61     TIM3->ARRL  = (u8)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 62     TIM3->CCR1H = (u8)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 63     TIM3->CCR1L = (u8)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 64     TIM3->CCR2H = (u8)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 65     TIM3->CCR2L = (u8)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 66     TIM3->SR1 = (u8)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 67 }
 104  0044 81            	ret
 272                     ; 76 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 272                     ; 77                         u16 TIM3_Period)
 272                     ; 78 {
 273                     	switch	.text
 274  0045               _TIM3_TimeBaseInit:
 276  0045 88            	push	a
 277       00000000      OFST:	set	0
 280                     ; 80     TIM3->PSCR = (u8)(TIM3_Prescaler);
 282  0046 c7532a        	ld	21290,a
 283                     ; 82     TIM3->ARRH = (u8)(TIM3_Period >> 8);
 285  0049 7b04          	ld	a,(OFST+4,sp)
 286  004b c7532b        	ld	21291,a
 287                     ; 83     TIM3->ARRL = (u8)(TIM3_Period);
 289  004e 7b05          	ld	a,(OFST+5,sp)
 290  0050 c7532c        	ld	21292,a
 291                     ; 84 }
 294  0053 84            	pop	a
 295  0054 81            	ret
 452                     ; 94 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 452                     ; 95                   TIM3_OutputState_TypeDef TIM3_OutputState,
 452                     ; 96                   u16 TIM3_Pulse,
 452                     ; 97                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 452                     ; 98 {
 453                     	switch	.text
 454  0055               _TIM3_OC1Init:
 456  0055 89            	pushw	x
 457  0056 88            	push	a
 458       00000001      OFST:	set	1
 461                     ; 100     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 463                     ; 101     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 465                     ; 102     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 467                     ; 105     TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 469  0057 c65327        	ld	a,21287
 470  005a a4fc          	and	a,#252
 471  005c c75327        	ld	21287,a
 472                     ; 107     TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 474  005f 7b08          	ld	a,(OFST+7,sp)
 475  0061 a402          	and	a,#2
 476  0063 6b01          	ld	(OFST+0,sp),a
 477  0065 9f            	ld	a,xl
 478  0066 a401          	and	a,#1
 479  0068 1a01          	or	a,(OFST+0,sp)
 480  006a ca5327        	or	a,21287
 481  006d c75327        	ld	21287,a
 482                     ; 110     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 484  0070 c65325        	ld	a,21285
 485  0073 a48f          	and	a,#143
 486  0075 1a02          	or	a,(OFST+1,sp)
 487  0077 c75325        	ld	21285,a
 488                     ; 113     TIM3->CCR1H = (u8)(TIM3_Pulse >> 8);
 490  007a 7b06          	ld	a,(OFST+5,sp)
 491  007c c7532d        	ld	21293,a
 492                     ; 114     TIM3->CCR1L = (u8)(TIM3_Pulse);
 494  007f 7b07          	ld	a,(OFST+6,sp)
 495  0081 c7532e        	ld	21294,a
 496                     ; 115 }
 499  0084 5b03          	addw	sp,#3
 500  0086 81            	ret
 564                     ; 126 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 564                     ; 127                   TIM3_OutputState_TypeDef TIM3_OutputState,
 564                     ; 128                   u16 TIM3_Pulse,
 564                     ; 129                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 564                     ; 130 {
 565                     	switch	.text
 566  0087               _TIM3_OC2Init:
 568  0087 89            	pushw	x
 569  0088 88            	push	a
 570       00000001      OFST:	set	1
 573                     ; 132     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 575                     ; 133     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 577                     ; 134     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 579                     ; 138     TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 581  0089 c65327        	ld	a,21287
 582  008c a4cf          	and	a,#207
 583  008e c75327        	ld	21287,a
 584                     ; 140     TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 586  0091 7b08          	ld	a,(OFST+7,sp)
 587  0093 a420          	and	a,#32
 588  0095 6b01          	ld	(OFST+0,sp),a
 589  0097 9f            	ld	a,xl
 590  0098 a410          	and	a,#16
 591  009a 1a01          	or	a,(OFST+0,sp)
 592  009c ca5327        	or	a,21287
 593  009f c75327        	ld	21287,a
 594                     ; 144     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 596  00a2 c65326        	ld	a,21286
 597  00a5 a48f          	and	a,#143
 598  00a7 1a02          	or	a,(OFST+1,sp)
 599  00a9 c75326        	ld	21286,a
 600                     ; 148     TIM3->CCR2H = (u8)(TIM3_Pulse >> 8);
 602  00ac 7b06          	ld	a,(OFST+5,sp)
 603  00ae c7532f        	ld	21295,a
 604                     ; 149     TIM3->CCR2L = (u8)(TIM3_Pulse);
 606  00b1 7b07          	ld	a,(OFST+6,sp)
 607  00b3 c75330        	ld	21296,a
 608                     ; 150 }
 611  00b6 5b03          	addw	sp,#3
 612  00b8 81            	ret
 796                     ; 161 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 796                     ; 162                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 796                     ; 163                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 796                     ; 164                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 796                     ; 165                  u8 TIM3_ICFilter)
 796                     ; 166 {
 797                     	switch	.text
 798  00b9               _TIM3_ICInit:
 800  00b9 89            	pushw	x
 801       00000000      OFST:	set	0
 804                     ; 168     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 806                     ; 169     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 808                     ; 170     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 810                     ; 171     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 812                     ; 172     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 814                     ; 174     if (TIM3_Channel != TIM3_CHANNEL_2)
 816  00ba 9e            	ld	a,xh
 817  00bb a101          	cp	a,#1
 818  00bd 2714          	jreq	L343
 819                     ; 177         TI1_Config((u8)TIM3_ICPolarity,
 819                     ; 178                    (u8)TIM3_ICSelection,
 819                     ; 179                    (u8)TIM3_ICFilter);
 821  00bf 7b07          	ld	a,(OFST+7,sp)
 822  00c1 88            	push	a
 823  00c2 7b06          	ld	a,(OFST+6,sp)
 824  00c4 97            	ld	xl,a
 825  00c5 7b03          	ld	a,(OFST+3,sp)
 826  00c7 95            	ld	xh,a
 827  00c8 cd037c        	call	L3_TI1_Config
 829  00cb 84            	pop	a
 830                     ; 182         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 832  00cc 7b06          	ld	a,(OFST+6,sp)
 833  00ce cd0289        	call	_TIM3_SetIC1Prescaler
 836  00d1 2012          	jra	L543
 837  00d3               L343:
 838                     ; 187         TI2_Config((u8)TIM3_ICPolarity,
 838                     ; 188                    (u8)TIM3_ICSelection,
 838                     ; 189                    (u8)TIM3_ICFilter);
 840  00d3 7b07          	ld	a,(OFST+7,sp)
 841  00d5 88            	push	a
 842  00d6 7b06          	ld	a,(OFST+6,sp)
 843  00d8 97            	ld	xl,a
 844  00d9 7b03          	ld	a,(OFST+3,sp)
 845  00db 95            	ld	xh,a
 846  00dc cd03ac        	call	L5_TI2_Config
 848  00df 84            	pop	a
 849                     ; 192         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 851  00e0 7b06          	ld	a,(OFST+6,sp)
 852  00e2 cd0296        	call	_TIM3_SetIC2Prescaler
 854  00e5               L543:
 855                     ; 194 }
 858  00e5 85            	popw	x
 859  00e6 81            	ret
 955                     ; 204 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 955                     ; 205                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 955                     ; 206                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 955                     ; 207                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 955                     ; 208                      u8 TIM3_ICFilter)
 955                     ; 209 {
 956                     	switch	.text
 957  00e7               _TIM3_PWMIConfig:
 959  00e7 89            	pushw	x
 960  00e8 89            	pushw	x
 961       00000002      OFST:	set	2
 964                     ; 210     u8 icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 966  00e9 7b01          	ld	a,(OFST-1,sp)
 967                     ; 211     u8 icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
 969  00eb 7b02          	ld	a,(OFST+0,sp)
 970                     ; 214     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 972                     ; 215     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 974                     ; 216     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 976                     ; 217     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 978                     ; 220     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 980  00ed 9f            	ld	a,xl
 981  00ee a144          	cp	a,#68
 982  00f0 2706          	jreq	L514
 983                     ; 222         icpolarity = (u8)TIM3_ICPOLARITY_FALLING;
 985  00f2 a644          	ld	a,#68
 986  00f4 6b01          	ld	(OFST-1,sp),a
 988  00f6 2002          	jra	L714
 989  00f8               L514:
 990                     ; 226         icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 992  00f8 0f01          	clr	(OFST-1,sp)
 993  00fa               L714:
 994                     ; 230     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 996  00fa 7b07          	ld	a,(OFST+5,sp)
 997  00fc a101          	cp	a,#1
 998  00fe 2606          	jrne	L124
 999                     ; 232         icselection = (u8)TIM3_ICSELECTION_INDIRECTTI;
1001  0100 a602          	ld	a,#2
1002  0102 6b02          	ld	(OFST+0,sp),a
1004  0104 2004          	jra	L324
1005  0106               L124:
1006                     ; 236         icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
1008  0106 a601          	ld	a,#1
1009  0108 6b02          	ld	(OFST+0,sp),a
1010  010a               L324:
1011                     ; 239     if (TIM3_Channel != TIM3_CHANNEL_2)
1013  010a 7b03          	ld	a,(OFST+1,sp)
1014  010c a101          	cp	a,#1
1015  010e 2726          	jreq	L524
1016                     ; 242         TI1_Config((u8)TIM3_ICPolarity, (u8)TIM3_ICSelection,
1016                     ; 243                    (u8)TIM3_ICFilter);
1018  0110 7b09          	ld	a,(OFST+7,sp)
1019  0112 88            	push	a
1020  0113 7b08          	ld	a,(OFST+6,sp)
1021  0115 97            	ld	xl,a
1022  0116 7b05          	ld	a,(OFST+3,sp)
1023  0118 95            	ld	xh,a
1024  0119 cd037c        	call	L3_TI1_Config
1026  011c 84            	pop	a
1027                     ; 246         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1029  011d 7b08          	ld	a,(OFST+6,sp)
1030  011f cd0289        	call	_TIM3_SetIC1Prescaler
1032                     ; 249         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1034  0122 7b09          	ld	a,(OFST+7,sp)
1035  0124 88            	push	a
1036  0125 7b03          	ld	a,(OFST+1,sp)
1037  0127 97            	ld	xl,a
1038  0128 7b02          	ld	a,(OFST+0,sp)
1039  012a 95            	ld	xh,a
1040  012b cd03ac        	call	L5_TI2_Config
1042  012e 84            	pop	a
1043                     ; 252         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1045  012f 7b08          	ld	a,(OFST+6,sp)
1046  0131 cd0296        	call	_TIM3_SetIC2Prescaler
1049  0134 2024          	jra	L724
1050  0136               L524:
1051                     ; 257         TI2_Config((u8)TIM3_ICPolarity, (u8)TIM3_ICSelection,
1051                     ; 258                    (u8)TIM3_ICFilter);
1053  0136 7b09          	ld	a,(OFST+7,sp)
1054  0138 88            	push	a
1055  0139 7b08          	ld	a,(OFST+6,sp)
1056  013b 97            	ld	xl,a
1057  013c 7b05          	ld	a,(OFST+3,sp)
1058  013e 95            	ld	xh,a
1059  013f cd03ac        	call	L5_TI2_Config
1061  0142 84            	pop	a
1062                     ; 261         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1064  0143 7b08          	ld	a,(OFST+6,sp)
1065  0145 cd0296        	call	_TIM3_SetIC2Prescaler
1067                     ; 264         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1069  0148 7b09          	ld	a,(OFST+7,sp)
1070  014a 88            	push	a
1071  014b 7b03          	ld	a,(OFST+1,sp)
1072  014d 97            	ld	xl,a
1073  014e 7b02          	ld	a,(OFST+0,sp)
1074  0150 95            	ld	xh,a
1075  0151 cd037c        	call	L3_TI1_Config
1077  0154 84            	pop	a
1078                     ; 267         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1080  0155 7b08          	ld	a,(OFST+6,sp)
1081  0157 cd0289        	call	_TIM3_SetIC1Prescaler
1083  015a               L724:
1084                     ; 269 }
1087  015a 5b04          	addw	sp,#4
1088  015c 81            	ret
1143                     ; 278 void TIM3_Cmd(FunctionalState NewState)
1143                     ; 279 {
1144                     	switch	.text
1145  015d               _TIM3_Cmd:
1149                     ; 281     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1151                     ; 284     if (NewState != DISABLE)
1153  015d 4d            	tnz	a
1154  015e 2706          	jreq	L754
1155                     ; 286         TIM3->CR1 |= (u8)TIM3_CR1_CEN;
1157  0160 72105320      	bset	21280,#0
1159  0164 2004          	jra	L164
1160  0166               L754:
1161                     ; 290         TIM3->CR1 &= (u8)(~TIM3_CR1_CEN);
1163  0166 72115320      	bres	21280,#0
1164  016a               L164:
1165                     ; 292 }
1168  016a 81            	ret
1240                     ; 307 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1240                     ; 308 {
1241                     	switch	.text
1242  016b               _TIM3_ITConfig:
1244  016b 89            	pushw	x
1245       00000000      OFST:	set	0
1248                     ; 310     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1250                     ; 311     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1252                     ; 313     if (NewState != DISABLE)
1254  016c 9f            	ld	a,xl
1255  016d 4d            	tnz	a
1256  016e 2709          	jreq	L715
1257                     ; 316         TIM3->IER |= (u8)TIM3_IT;
1259  0170 9e            	ld	a,xh
1260  0171 ca5321        	or	a,21281
1261  0174 c75321        	ld	21281,a
1263  0177 2009          	jra	L125
1264  0179               L715:
1265                     ; 321         TIM3->IER &= (u8)(~TIM3_IT);
1267  0179 7b01          	ld	a,(OFST+1,sp)
1268  017b 43            	cpl	a
1269  017c c45321        	and	a,21281
1270  017f c75321        	ld	21281,a
1271  0182               L125:
1272                     ; 323 }
1275  0182 85            	popw	x
1276  0183 81            	ret
1312                     ; 332 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1312                     ; 333 {
1313                     	switch	.text
1314  0184               _TIM3_UpdateDisableConfig:
1318                     ; 335     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1320                     ; 338     if (NewState != DISABLE)
1322  0184 4d            	tnz	a
1323  0185 2706          	jreq	L145
1324                     ; 340         TIM3->CR1 |= TIM3_CR1_UDIS;
1326  0187 72125320      	bset	21280,#1
1328  018b 2004          	jra	L345
1329  018d               L145:
1330                     ; 344         TIM3->CR1 &= (u8)(~TIM3_CR1_UDIS);
1332  018d 72135320      	bres	21280,#1
1333  0191               L345:
1334                     ; 346 }
1337  0191 81            	ret
1395                     ; 356 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1395                     ; 357 {
1396                     	switch	.text
1397  0192               _TIM3_UpdateRequestConfig:
1401                     ; 359     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1403                     ; 362     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1405  0192 4d            	tnz	a
1406  0193 2706          	jreq	L375
1407                     ; 364         TIM3->CR1 |= TIM3_CR1_URS;
1409  0195 72145320      	bset	21280,#2
1411  0199 2004          	jra	L575
1412  019b               L375:
1413                     ; 368         TIM3->CR1 &= (u8)(~TIM3_CR1_URS);
1415  019b 72155320      	bres	21280,#2
1416  019f               L575:
1417                     ; 370 }
1420  019f 81            	ret
1477                     ; 381 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1477                     ; 382 {
1478                     	switch	.text
1479  01a0               _TIM3_SelectOnePulseMode:
1483                     ; 384     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1485                     ; 387     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1487  01a0 4d            	tnz	a
1488  01a1 2706          	jreq	L526
1489                     ; 389         TIM3->CR1 |= TIM3_CR1_OPM;
1491  01a3 72165320      	bset	21280,#3
1493  01a7 2004          	jra	L726
1494  01a9               L526:
1495                     ; 393         TIM3->CR1 &= (u8)(~TIM3_CR1_OPM);
1497  01a9 72175320      	bres	21280,#3
1498  01ad               L726:
1499                     ; 396 }
1502  01ad 81            	ret
1570                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1570                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1570                     ; 429 {
1571                     	switch	.text
1572  01ae               _TIM3_PrescalerConfig:
1576                     ; 431     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1578                     ; 432     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1580                     ; 435     TIM3->PSCR = (u8)Prescaler;
1582  01ae 9e            	ld	a,xh
1583  01af c7532a        	ld	21290,a
1584                     ; 438     TIM3->EGR = (u8)TIM3_PSCReloadMode;
1586  01b2 9f            	ld	a,xl
1587  01b3 c75324        	ld	21284,a
1588                     ; 439 }
1591  01b6 81            	ret
1649                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1649                     ; 451 {
1650                     	switch	.text
1651  01b7               _TIM3_ForcedOC1Config:
1653  01b7 88            	push	a
1654       00000000      OFST:	set	0
1657                     ; 453     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1659                     ; 456     TIM3->CCMR1 =  (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM))  | (u8)TIM3_ForcedAction);
1661  01b8 c65325        	ld	a,21285
1662  01bb a48f          	and	a,#143
1663  01bd 1a01          	or	a,(OFST+1,sp)
1664  01bf c75325        	ld	21285,a
1665                     ; 457 }
1668  01c2 84            	pop	a
1669  01c3 81            	ret
1705                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1705                     ; 469 {
1706                     	switch	.text
1707  01c4               _TIM3_ForcedOC2Config:
1709  01c4 88            	push	a
1710       00000000      OFST:	set	0
1713                     ; 471     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1715                     ; 474     TIM3->CCMR2 =  (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_ForcedAction);
1717  01c5 c65326        	ld	a,21286
1718  01c8 a48f          	and	a,#143
1719  01ca 1a01          	or	a,(OFST+1,sp)
1720  01cc c75326        	ld	21286,a
1721                     ; 475 }
1724  01cf 84            	pop	a
1725  01d0 81            	ret
1761                     ; 484 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1761                     ; 485 {
1762                     	switch	.text
1763  01d1               _TIM3_ARRPreloadConfig:
1767                     ; 487     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1769                     ; 490     if (NewState != DISABLE)
1771  01d1 4d            	tnz	a
1772  01d2 2706          	jreq	L547
1773                     ; 492         TIM3->CR1 |= TIM3_CR1_ARPE;
1775  01d4 721e5320      	bset	21280,#7
1777  01d8 2004          	jra	L747
1778  01da               L547:
1779                     ; 496         TIM3->CR1 &= (u8)(~TIM3_CR1_ARPE);
1781  01da 721f5320      	bres	21280,#7
1782  01de               L747:
1783                     ; 498 }
1786  01de 81            	ret
1822                     ; 507 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1822                     ; 508 {
1823                     	switch	.text
1824  01df               _TIM3_OC1PreloadConfig:
1828                     ; 510     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1830                     ; 513     if (NewState != DISABLE)
1832  01df 4d            	tnz	a
1833  01e0 2706          	jreq	L767
1834                     ; 515         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1836  01e2 72165325      	bset	21285,#3
1838  01e6 2004          	jra	L177
1839  01e8               L767:
1840                     ; 519         TIM3->CCMR1 &= (u8)(~TIM3_CCMR_OCxPE);
1842  01e8 72175325      	bres	21285,#3
1843  01ec               L177:
1844                     ; 521 }
1847  01ec 81            	ret
1883                     ; 530 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1883                     ; 531 {
1884                     	switch	.text
1885  01ed               _TIM3_OC2PreloadConfig:
1889                     ; 533     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1891                     ; 536     if (NewState != DISABLE)
1893  01ed 4d            	tnz	a
1894  01ee 2706          	jreq	L1101
1895                     ; 538         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1897  01f0 72165326      	bset	21286,#3
1899  01f4 2004          	jra	L3101
1900  01f6               L1101:
1901                     ; 542         TIM3->CCMR2 &= (u8)(~TIM3_CCMR_OCxPE);
1903  01f6 72175326      	bres	21286,#3
1904  01fa               L3101:
1905                     ; 544 }
1908  01fa 81            	ret
1973                     ; 555 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1973                     ; 556 {
1974                     	switch	.text
1975  01fb               _TIM3_GenerateEvent:
1979                     ; 558     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1981                     ; 561     TIM3->EGR = (u8)TIM3_EventSource;
1983  01fb c75324        	ld	21284,a
1984                     ; 562 }
1987  01fe 81            	ret
2023                     ; 573 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2023                     ; 574 {
2024                     	switch	.text
2025  01ff               _TIM3_OC1PolarityConfig:
2029                     ; 576     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2031                     ; 579     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2033  01ff 4d            	tnz	a
2034  0200 2706          	jreq	L3601
2035                     ; 581         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2037  0202 72125327      	bset	21287,#1
2039  0206 2004          	jra	L5601
2040  0208               L3601:
2041                     ; 585         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
2043  0208 72135327      	bres	21287,#1
2044  020c               L5601:
2045                     ; 587 }
2048  020c 81            	ret
2084                     ; 598 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2084                     ; 599 {
2085                     	switch	.text
2086  020d               _TIM3_OC2PolarityConfig:
2090                     ; 601     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2092                     ; 604     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2094  020d 4d            	tnz	a
2095  020e 2706          	jreq	L5011
2096                     ; 606         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2098  0210 721a5327      	bset	21287,#5
2100  0214 2004          	jra	L7011
2101  0216               L5011:
2102                     ; 610         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
2104  0216 721b5327      	bres	21287,#5
2105  021a               L7011:
2106                     ; 612 }
2109  021a 81            	ret
2154                     ; 625 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2154                     ; 626 {
2155                     	switch	.text
2156  021b               _TIM3_CCxCmd:
2158  021b 89            	pushw	x
2159       00000000      OFST:	set	0
2162                     ; 628     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2164                     ; 629     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2166                     ; 631     if (TIM3_Channel == TIM3_CHANNEL_1)
2168  021c 9e            	ld	a,xh
2169  021d 4d            	tnz	a
2170  021e 2610          	jrne	L3311
2171                     ; 634         if (NewState != DISABLE)
2173  0220 9f            	ld	a,xl
2174  0221 4d            	tnz	a
2175  0222 2706          	jreq	L5311
2176                     ; 636             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2178  0224 72105327      	bset	21287,#0
2180  0228 2014          	jra	L1411
2181  022a               L5311:
2182                     ; 640             TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2184  022a 72115327      	bres	21287,#0
2185  022e 200e          	jra	L1411
2186  0230               L3311:
2187                     ; 647         if (NewState != DISABLE)
2189  0230 0d02          	tnz	(OFST+2,sp)
2190  0232 2706          	jreq	L3411
2191                     ; 649             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2193  0234 72185327      	bset	21287,#4
2195  0238 2004          	jra	L1411
2196  023a               L3411:
2197                     ; 653             TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2199  023a 72195327      	bres	21287,#4
2200  023e               L1411:
2201                     ; 657 }
2204  023e 85            	popw	x
2205  023f 81            	ret
2250                     ; 678 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2250                     ; 679 {
2251                     	switch	.text
2252  0240               _TIM3_SelectOCxM:
2254  0240 89            	pushw	x
2255       00000000      OFST:	set	0
2258                     ; 681     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2260                     ; 682     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2262                     ; 684     if (TIM3_Channel == TIM3_CHANNEL_1)
2264  0241 9e            	ld	a,xh
2265  0242 4d            	tnz	a
2266  0243 2610          	jrne	L1711
2267                     ; 687         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2269  0245 72115327      	bres	21287,#0
2270                     ; 690         TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2272  0249 c65325        	ld	a,21285
2273  024c a48f          	and	a,#143
2274  024e 1a02          	or	a,(OFST+2,sp)
2275  0250 c75325        	ld	21285,a
2277  0253 200e          	jra	L3711
2278  0255               L1711:
2279                     ; 695         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2281  0255 72195327      	bres	21287,#4
2282                     ; 698         TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2284  0259 c65326        	ld	a,21286
2285  025c a48f          	and	a,#143
2286  025e 1a02          	or	a,(OFST+2,sp)
2287  0260 c75326        	ld	21286,a
2288  0263               L3711:
2289                     ; 700 }
2292  0263 85            	popw	x
2293  0264 81            	ret
2327                     ; 709 void TIM3_SetCounter(u16 Counter)
2327                     ; 710 {
2328                     	switch	.text
2329  0265               _TIM3_SetCounter:
2333                     ; 712     TIM3->CNTRH = (u8)(Counter >> 8);
2335  0265 9e            	ld	a,xh
2336  0266 c75328        	ld	21288,a
2337                     ; 713     TIM3->CNTRL = (u8)(Counter);
2339  0269 9f            	ld	a,xl
2340  026a c75329        	ld	21289,a
2341                     ; 715 }
2344  026d 81            	ret
2378                     ; 724 void TIM3_SetAutoreload(u16 Autoreload)
2378                     ; 725 {
2379                     	switch	.text
2380  026e               _TIM3_SetAutoreload:
2384                     ; 727     TIM3->ARRH = (u8)(Autoreload >> 8);
2386  026e 9e            	ld	a,xh
2387  026f c7532b        	ld	21291,a
2388                     ; 728     TIM3->ARRL = (u8)(Autoreload);
2390  0272 9f            	ld	a,xl
2391  0273 c7532c        	ld	21292,a
2392                     ; 729 }
2395  0276 81            	ret
2429                     ; 738 void TIM3_SetCompare1(u16 Compare1)
2429                     ; 739 {
2430                     	switch	.text
2431  0277               _TIM3_SetCompare1:
2435                     ; 741     TIM3->CCR1H = (u8)(Compare1 >> 8);
2437  0277 9e            	ld	a,xh
2438  0278 c7532d        	ld	21293,a
2439                     ; 742     TIM3->CCR1L = (u8)(Compare1);
2441  027b 9f            	ld	a,xl
2442  027c c7532e        	ld	21294,a
2443                     ; 743 }
2446  027f 81            	ret
2480                     ; 752 void TIM3_SetCompare2(u16 Compare2)
2480                     ; 753 {
2481                     	switch	.text
2482  0280               _TIM3_SetCompare2:
2486                     ; 755     TIM3->CCR2H = (u8)(Compare2 >> 8);
2488  0280 9e            	ld	a,xh
2489  0281 c7532f        	ld	21295,a
2490                     ; 756     TIM3->CCR2L = (u8)(Compare2);
2492  0284 9f            	ld	a,xl
2493  0285 c75330        	ld	21296,a
2494                     ; 757 }
2497  0288 81            	ret
2533                     ; 770 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2533                     ; 771 {
2534                     	switch	.text
2535  0289               _TIM3_SetIC1Prescaler:
2537  0289 88            	push	a
2538       00000000      OFST:	set	0
2541                     ; 773     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2543                     ; 776     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC1Prescaler);
2545  028a c65325        	ld	a,21285
2546  028d a4f3          	and	a,#243
2547  028f 1a01          	or	a,(OFST+1,sp)
2548  0291 c75325        	ld	21285,a
2549                     ; 777 }
2552  0294 84            	pop	a
2553  0295 81            	ret
2589                     ; 789 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2589                     ; 790 {
2590                     	switch	.text
2591  0296               _TIM3_SetIC2Prescaler:
2593  0296 88            	push	a
2594       00000000      OFST:	set	0
2597                     ; 792     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2599                     ; 795     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC2Prescaler);
2601  0297 c65326        	ld	a,21286
2602  029a a4f3          	and	a,#243
2603  029c 1a01          	or	a,(OFST+1,sp)
2604  029e c75326        	ld	21286,a
2605                     ; 796 }
2608  02a1 84            	pop	a
2609  02a2 81            	ret
2661                     ; 803 u16 TIM3_GetCapture1(void)
2661                     ; 804 {
2662                     	switch	.text
2663  02a3               _TIM3_GetCapture1:
2665  02a3 5204          	subw	sp,#4
2666       00000004      OFST:	set	4
2669                     ; 806     u16 tmpccr1 = 0;
2671  02a5 1e03          	ldw	x,(OFST-1,sp)
2672                     ; 807     u8 tmpccr1l=0, tmpccr1h=0;
2674  02a7 7b01          	ld	a,(OFST-3,sp)
2677  02a9 7b02          	ld	a,(OFST-2,sp)
2678                     ; 809     tmpccr1h = TIM3->CCR1H;
2680  02ab c6532d        	ld	a,21293
2681  02ae 6b02          	ld	(OFST-2,sp),a
2682                     ; 810     tmpccr1l = TIM3->CCR1L;
2684  02b0 c6532e        	ld	a,21294
2685  02b3 6b01          	ld	(OFST-3,sp),a
2686                     ; 812     tmpccr1 = (u16)(tmpccr1l);
2688  02b5 7b01          	ld	a,(OFST-3,sp)
2689  02b7 5f            	clrw	x
2690  02b8 97            	ld	xl,a
2691  02b9 1f03          	ldw	(OFST-1,sp),x
2692                     ; 813     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
2694  02bb 7b02          	ld	a,(OFST-2,sp)
2695  02bd 5f            	clrw	x
2696  02be 97            	ld	xl,a
2697  02bf 4f            	clr	a
2698  02c0 02            	rlwa	x,a
2699  02c1 01            	rrwa	x,a
2700  02c2 1a04          	or	a,(OFST+0,sp)
2701  02c4 01            	rrwa	x,a
2702  02c5 1a03          	or	a,(OFST-1,sp)
2703  02c7 01            	rrwa	x,a
2704  02c8 1f03          	ldw	(OFST-1,sp),x
2705                     ; 815     return (u16)tmpccr1;
2707  02ca 1e03          	ldw	x,(OFST-1,sp)
2710  02cc 5b04          	addw	sp,#4
2711  02ce 81            	ret
2763                     ; 824 u16 TIM3_GetCapture2(void)
2763                     ; 825 {
2764                     	switch	.text
2765  02cf               _TIM3_GetCapture2:
2767  02cf 5204          	subw	sp,#4
2768       00000004      OFST:	set	4
2771                     ; 827     u16 tmpccr2 = 0;
2773  02d1 1e03          	ldw	x,(OFST-1,sp)
2774                     ; 828     u8 tmpccr2l=0, tmpccr2h=0;
2776  02d3 7b01          	ld	a,(OFST-3,sp)
2779  02d5 7b02          	ld	a,(OFST-2,sp)
2780                     ; 830     tmpccr2h = TIM3->CCR2H;
2782  02d7 c6532f        	ld	a,21295
2783  02da 6b02          	ld	(OFST-2,sp),a
2784                     ; 831     tmpccr2l = TIM3->CCR2L;
2786  02dc c65330        	ld	a,21296
2787  02df 6b01          	ld	(OFST-3,sp),a
2788                     ; 833     tmpccr2 = (u16)(tmpccr2l);
2790  02e1 7b01          	ld	a,(OFST-3,sp)
2791  02e3 5f            	clrw	x
2792  02e4 97            	ld	xl,a
2793  02e5 1f03          	ldw	(OFST-1,sp),x
2794                     ; 834     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
2796  02e7 7b02          	ld	a,(OFST-2,sp)
2797  02e9 5f            	clrw	x
2798  02ea 97            	ld	xl,a
2799  02eb 4f            	clr	a
2800  02ec 02            	rlwa	x,a
2801  02ed 01            	rrwa	x,a
2802  02ee 1a04          	or	a,(OFST+0,sp)
2803  02f0 01            	rrwa	x,a
2804  02f1 1a03          	or	a,(OFST-1,sp)
2805  02f3 01            	rrwa	x,a
2806  02f4 1f03          	ldw	(OFST-1,sp),x
2807                     ; 836     return (u16)tmpccr2;
2809  02f6 1e03          	ldw	x,(OFST-1,sp)
2812  02f8 5b04          	addw	sp,#4
2813  02fa 81            	ret
2836                     ; 845 u16 TIM3_GetCounter(void)
2836                     ; 846 {
2837                     	switch	.text
2838  02fb               _TIM3_GetCounter:
2840  02fb 89            	pushw	x
2841       00000002      OFST:	set	2
2844                     ; 848     return (u16)(((u16)TIM3->CNTRH << 8) | (u16)(TIM3->CNTRL));
2846  02fc c65329        	ld	a,21289
2847  02ff 5f            	clrw	x
2848  0300 97            	ld	xl,a
2849  0301 1f01          	ldw	(OFST-1,sp),x
2850  0303 c65328        	ld	a,21288
2851  0306 5f            	clrw	x
2852  0307 97            	ld	xl,a
2853  0308 4f            	clr	a
2854  0309 02            	rlwa	x,a
2855  030a 01            	rrwa	x,a
2856  030b 1a02          	or	a,(OFST+0,sp)
2857  030d 01            	rrwa	x,a
2858  030e 1a01          	or	a,(OFST-1,sp)
2859  0310 01            	rrwa	x,a
2862  0311 5b02          	addw	sp,#2
2863  0313 81            	ret
2887                     ; 858 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2887                     ; 859 {
2888                     	switch	.text
2889  0314               _TIM3_GetPrescaler:
2893                     ; 861     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2895  0314 c6532a        	ld	a,21290
2898  0317 81            	ret
3023                     ; 876 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3023                     ; 877 {
3024                     	switch	.text
3025  0318               _TIM3_GetFlagStatus:
3027  0318 5204          	subw	sp,#4
3028       00000004      OFST:	set	4
3031                     ; 878     volatile FlagStatus bitstatus = RESET;
3033  031a 0f04          	clr	(OFST+0,sp)
3034                     ; 882     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3036                     ; 884     tim3_flag_l = (u8)(TIM3_FLAG);
3038  031c 9f            	ld	a,xl
3039  031d 6b02          	ld	(OFST-2,sp),a
3040                     ; 885     tim3_flag_h = (u8)(TIM3_FLAG >> 8);
3042  031f 9e            	ld	a,xh
3043  0320 6b03          	ld	(OFST-1,sp),a
3044                     ; 887     if (((TIM3->SR1 & tim3_flag_l) | (TIM3->SR2 & tim3_flag_h)) != (u8)RESET )
3046  0322 c65323        	ld	a,21283
3047  0325 1403          	and	a,(OFST-1,sp)
3048  0327 6b01          	ld	(OFST-3,sp),a
3049  0329 c65322        	ld	a,21282
3050  032c 1402          	and	a,(OFST-2,sp)
3051  032e 1a01          	or	a,(OFST-3,sp)
3052  0330 2706          	jreq	L5741
3053                     ; 889         bitstatus = SET;
3055  0332 a601          	ld	a,#1
3056  0334 6b04          	ld	(OFST+0,sp),a
3058  0336 2002          	jra	L7741
3059  0338               L5741:
3060                     ; 893         bitstatus = RESET;
3062  0338 0f04          	clr	(OFST+0,sp)
3063  033a               L7741:
3064                     ; 895     return (FlagStatus)bitstatus;
3066  033a 7b04          	ld	a,(OFST+0,sp)
3069  033c 5b04          	addw	sp,#4
3070  033e 81            	ret
3105                     ; 910 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3105                     ; 911 {
3106                     	switch	.text
3107  033f               _TIM3_ClearFlag:
3109  033f 89            	pushw	x
3110       00000000      OFST:	set	0
3113                     ; 913     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3115                     ; 916     TIM3->SR1 = (u8)(~((u8)(TIM3_FLAG)));
3117  0340 9f            	ld	a,xl
3118  0341 43            	cpl	a
3119  0342 c75322        	ld	21282,a
3120                     ; 917     TIM3->SR2 = (u8)(~((u8)(TIM3_FLAG >> 8)));
3122  0345 7b01          	ld	a,(OFST+1,sp)
3123  0347 43            	cpl	a
3124  0348 c75323        	ld	21283,a
3125                     ; 918 }
3128  034b 85            	popw	x
3129  034c 81            	ret
3193                     ; 931 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3193                     ; 932 {
3194                     	switch	.text
3195  034d               _TIM3_GetITStatus:
3197  034d 88            	push	a
3198  034e 5203          	subw	sp,#3
3199       00000003      OFST:	set	3
3202                     ; 933     volatile ITStatus bitstatus = RESET;
3204  0350 0f03          	clr	(OFST+0,sp)
3205                     ; 934     vu8 TIM3_itStatus = 0, TIM3_itEnable = 0;
3207  0352 0f01          	clr	(OFST-2,sp)
3210  0354 0f02          	clr	(OFST-1,sp)
3211                     ; 937     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3213                     ; 939     TIM3_itStatus = (u8)(TIM3->SR1 & TIM3_IT);
3215  0356 c45322        	and	a,21282
3216  0359 6b01          	ld	(OFST-2,sp),a
3217                     ; 941     TIM3_itEnable = (u8)(TIM3->IER & TIM3_IT);
3219  035b c65321        	ld	a,21281
3220  035e 1404          	and	a,(OFST+1,sp)
3221  0360 6b02          	ld	(OFST-1,sp),a
3222                     ; 943     if ((TIM3_itStatus != (u8)RESET ) && (TIM3_itEnable != (u8)RESET ))
3224  0362 0d01          	tnz	(OFST-2,sp)
3225  0364 270a          	jreq	L1551
3227  0366 0d02          	tnz	(OFST-1,sp)
3228  0368 2706          	jreq	L1551
3229                     ; 945         bitstatus = SET;
3231  036a a601          	ld	a,#1
3232  036c 6b03          	ld	(OFST+0,sp),a
3234  036e 2002          	jra	L3551
3235  0370               L1551:
3236                     ; 949         bitstatus = RESET;
3238  0370 0f03          	clr	(OFST+0,sp)
3239  0372               L3551:
3240                     ; 951     return (ITStatus)(bitstatus);
3242  0372 7b03          	ld	a,(OFST+0,sp)
3245  0374 5b04          	addw	sp,#4
3246  0376 81            	ret
3282                     ; 964 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3282                     ; 965 {
3283                     	switch	.text
3284  0377               _TIM3_ClearITPendingBit:
3288                     ; 967     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3290                     ; 970     TIM3->SR1 = (u8)(~TIM3_IT);
3292  0377 43            	cpl	a
3293  0378 c75322        	ld	21282,a
3294                     ; 971 }
3297  037b 81            	ret
3349                     ; 990 static void TI1_Config(u8 TIM3_ICPolarity,
3349                     ; 991                        u8 TIM3_ICSelection,
3349                     ; 992                        u8 TIM3_ICFilter)
3349                     ; 993 {
3350                     	switch	.text
3351  037c               L3_TI1_Config:
3353  037c 89            	pushw	x
3354  037d 88            	push	a
3355       00000001      OFST:	set	1
3358                     ; 995     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
3360  037e 72115327      	bres	21287,#0
3361                     ; 998     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3363  0382 7b06          	ld	a,(OFST+5,sp)
3364  0384 97            	ld	xl,a
3365  0385 a610          	ld	a,#16
3366  0387 42            	mul	x,a
3367  0388 9f            	ld	a,xl
3368  0389 1a03          	or	a,(OFST+2,sp)
3369  038b 6b01          	ld	(OFST+0,sp),a
3370  038d c65325        	ld	a,21285
3371  0390 a40c          	and	a,#12
3372  0392 1a01          	or	a,(OFST+0,sp)
3373  0394 c75325        	ld	21285,a
3374                     ; 1001     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3376  0397 0d02          	tnz	(OFST+1,sp)
3377  0399 2706          	jreq	L1261
3378                     ; 1003         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3380  039b 72125327      	bset	21287,#1
3382  039f 2004          	jra	L3261
3383  03a1               L1261:
3384                     ; 1007         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
3386  03a1 72135327      	bres	21287,#1
3387  03a5               L3261:
3388                     ; 1010     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3390  03a5 72105327      	bset	21287,#0
3391                     ; 1011 }
3394  03a9 5b03          	addw	sp,#3
3395  03ab 81            	ret
3447                     ; 1030 static void TI2_Config(u8 TIM3_ICPolarity,
3447                     ; 1031                        u8 TIM3_ICSelection,
3447                     ; 1032                        u8 TIM3_ICFilter)
3447                     ; 1033 {
3448                     	switch	.text
3449  03ac               L5_TI2_Config:
3451  03ac 89            	pushw	x
3452  03ad 88            	push	a
3453       00000001      OFST:	set	1
3456                     ; 1035     TIM3->CCER1 &=  (u8)(~TIM3_CCER1_CC2E);
3458  03ae 72195327      	bres	21287,#4
3459                     ; 1038     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3461  03b2 7b06          	ld	a,(OFST+5,sp)
3462  03b4 97            	ld	xl,a
3463  03b5 a610          	ld	a,#16
3464  03b7 42            	mul	x,a
3465  03b8 9f            	ld	a,xl
3466  03b9 1a03          	or	a,(OFST+2,sp)
3467  03bb 6b01          	ld	(OFST+0,sp),a
3468  03bd c65326        	ld	a,21286
3469  03c0 a40c          	and	a,#12
3470  03c2 1a01          	or	a,(OFST+0,sp)
3471  03c4 c75326        	ld	21286,a
3472                     ; 1042     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3474  03c7 0d02          	tnz	(OFST+1,sp)
3475  03c9 2706          	jreq	L3561
3476                     ; 1044         TIM3->CCER1 |= TIM3_CCER1_CC2P;
3478  03cb 721a5327      	bset	21287,#5
3480  03cf 2004          	jra	L5561
3481  03d1               L3561:
3482                     ; 1048         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
3484  03d1 721b5327      	bres	21287,#5
3485  03d5               L5561:
3486                     ; 1052     TIM3->CCER1 |= TIM3_CCER1_CC2E;
3488  03d5 72185327      	bset	21287,#4
3489                     ; 1054 }
3492  03d9 5b03          	addw	sp,#3
3493  03db 81            	ret
3506                     	xdef	_TIM3_ClearITPendingBit
3507                     	xdef	_TIM3_GetITStatus
3508                     	xdef	_TIM3_ClearFlag
3509                     	xdef	_TIM3_GetFlagStatus
3510                     	xdef	_TIM3_GetPrescaler
3511                     	xdef	_TIM3_GetCounter
3512                     	xdef	_TIM3_GetCapture2
3513                     	xdef	_TIM3_GetCapture1
3514                     	xdef	_TIM3_SetIC2Prescaler
3515                     	xdef	_TIM3_SetIC1Prescaler
3516                     	xdef	_TIM3_SetCompare2
3517                     	xdef	_TIM3_SetCompare1
3518                     	xdef	_TIM3_SetAutoreload
3519                     	xdef	_TIM3_SetCounter
3520                     	xdef	_TIM3_SelectOCxM
3521                     	xdef	_TIM3_CCxCmd
3522                     	xdef	_TIM3_OC2PolarityConfig
3523                     	xdef	_TIM3_OC1PolarityConfig
3524                     	xdef	_TIM3_GenerateEvent
3525                     	xdef	_TIM3_OC2PreloadConfig
3526                     	xdef	_TIM3_OC1PreloadConfig
3527                     	xdef	_TIM3_ARRPreloadConfig
3528                     	xdef	_TIM3_ForcedOC2Config
3529                     	xdef	_TIM3_ForcedOC1Config
3530                     	xdef	_TIM3_PrescalerConfig
3531                     	xdef	_TIM3_SelectOnePulseMode
3532                     	xdef	_TIM3_UpdateRequestConfig
3533                     	xdef	_TIM3_UpdateDisableConfig
3534                     	xdef	_TIM3_ITConfig
3535                     	xdef	_TIM3_Cmd
3536                     	xdef	_TIM3_PWMIConfig
3537                     	xdef	_TIM3_ICInit
3538                     	xdef	_TIM3_OC2Init
3539                     	xdef	_TIM3_OC1Init
3540                     	xdef	_TIM3_TimeBaseInit
3541                     	xdef	_TIM3_DeInit
3560                     	end
