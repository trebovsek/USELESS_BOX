   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
  54                     ; 41 void main(void)
  54                     ; 42 {
  56                     	switch	.text
  57  0000               _main:
  61                     ; 43 	  TIM3_DeInit();
  63  0000 cd0000        	call	_TIM3_DeInit
  65                     ; 45 		TIM3_TimeBaseInit(TIM3_PRESCALER_1,0xFFFF);
  67  0003 aeffff        	ldw	x,#65535
  68  0006 89            	pushw	x
  69  0007 4f            	clr	a
  70  0008 cd0000        	call	_TIM3_TimeBaseInit
  72  000b 85            	popw	x
  73                     ; 46 		TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
  75  000c ae0001        	ldw	x,#1
  76  000f a601          	ld	a,#1
  77  0011 95            	ld	xh,a
  78  0012 cd0000        	call	_TIM3_ITConfig
  80                     ; 49     enableInterrupts();
  83  0015 9a            rim
  85                     ; 52 		GPIO_Init(GPIOD, 0x01 , GPIO_MODE_OUT_PP_LOW_FAST);
  88  0016 4be0          	push	#224
  89  0018 4b01          	push	#1
  90  001a ae500f        	ldw	x,#20495
  91  001d cd0000        	call	_GPIO_Init
  93  0020 85            	popw	x
  94                     ; 55     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  96  0021 4f            	clr	a
  97  0022 cd0000        	call	_CLK_HSIPrescalerConfig
  99                     ; 67 		UART2_DeInit();
 101  0025 cd0000        	call	_UART2_DeInit
 103                     ; 68     UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_ODD, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);
 105  0028 4b0c          	push	#12
 106  002a 4b80          	push	#128
 107  002c 4b06          	push	#6
 108  002e 4b00          	push	#0
 109  0030 4b00          	push	#0
 110  0032 ae2580        	ldw	x,#9600
 111  0035 89            	pushw	x
 112  0036 ae0000        	ldw	x,#0
 113  0039 89            	pushw	x
 114  003a cd0000        	call	_UART2_Init
 116  003d 5b09          	addw	sp,#9
 117                     ; 71     BEEP_LSICalibrationConfig(LSIMeasurment());		
 119  003f ad10          	call	_LSIMeasurment
 121  0041 be02          	ldw	x,c_lreg+2
 122  0043 89            	pushw	x
 123  0044 be00          	ldw	x,c_lreg
 124  0046 89            	pushw	x
 125  0047 cd0000        	call	_BEEP_LSICalibrationConfig
 127  004a 5b04          	addw	sp,#4
 128  004c               L12:
 129                     ; 75 			Main_Menu();
 131  004c cd0000        	call	_Main_Menu
 134  004f 20fb          	jra	L12
 200                     ; 80 u32 LSIMeasurment(void)
 200                     ; 81 {
 201                     	switch	.text
 202  0051               _LSIMeasurment:
 204  0051 520c          	subw	sp,#12
 205       0000000c      OFST:	set	12
 208                     ; 83   u32 lsi_freq_hz = 0x0;
 210  0053 96            	ldw	x,sp
 211  0054 1c0009        	addw	x,#OFST-3
 212  0057 cd0000        	call	c_ltor
 214                     ; 84   u32 fmaster = 0x0;
 216  005a 96            	ldw	x,sp
 217  005b 1c0009        	addw	x,#OFST-3
 218  005e cd0000        	call	c_ltor
 220                     ; 85   u16 ICValue1 = 0x0;
 222  0061 1e05          	ldw	x,(OFST-7,sp)
 223                     ; 86   u16 ICValue2 = 0x0;
 225  0063 1e07          	ldw	x,(OFST-5,sp)
 226                     ; 89   fmaster = CLK_GetClockFreq();
 228  0065 cd0000        	call	_CLK_GetClockFreq
 230  0068 96            	ldw	x,sp
 231  0069 1c0009        	addw	x,#OFST-3
 232  006c cd0000        	call	c_rtol
 234                     ; 92   AWU->CSR |= AWU_CSR_MSR;
 236  006f 721050f0      	bset	20720,#0
 237                     ; 126   TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI, TIM3_ICPSC_DIV8, 0);
 239  0073 4b00          	push	#0
 240  0075 4b0c          	push	#12
 241  0077 4b01          	push	#1
 242  0079 5f            	clrw	x
 243  007a 4f            	clr	a
 244  007b 95            	ld	xh,a
 245  007c cd0000        	call	_TIM3_ICInit
 247  007f 5b03          	addw	sp,#3
 248                     ; 129   TIM3_Cmd(ENABLE);
 250  0081 a601          	ld	a,#1
 251  0083 cd0000        	call	_TIM3_Cmd
 254  0086               L16:
 255                     ; 132   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 257  0086 c65322        	ld	a,21282
 258  0089 a402          	and	a,#2
 259  008b a102          	cp	a,#2
 260  008d 26f7          	jrne	L16
 261                     ; 134   ICValue1 = TIM3_GetCapture1();
 263  008f cd0000        	call	_TIM3_GetCapture1
 265  0092 1f05          	ldw	(OFST-7,sp),x
 266                     ; 135   TIM3_ClearFlag(TIM3_FLAG_CC1);
 268  0094 ae0002        	ldw	x,#2
 269  0097 cd0000        	call	_TIM3_ClearFlag
 272  009a               L76:
 273                     ; 138   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 275  009a c65322        	ld	a,21282
 276  009d a402          	and	a,#2
 277  009f a102          	cp	a,#2
 278  00a1 26f7          	jrne	L76
 279                     ; 140   ICValue2 = TIM3_GetCapture1();
 281  00a3 cd0000        	call	_TIM3_GetCapture1
 283  00a6 1f07          	ldw	(OFST-5,sp),x
 284                     ; 141 	TIM3_ClearFlag(TIM3_FLAG_CC1);
 286  00a8 ae0002        	ldw	x,#2
 287  00ab cd0000        	call	_TIM3_ClearFlag
 289                     ; 144   TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
 291  00ae 72115327      	bres	21287,#0
 292                     ; 146   TIM3_Cmd(DISABLE);
 294  00b2 4f            	clr	a
 295  00b3 cd0000        	call	_TIM3_Cmd
 297                     ; 150   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 299  00b6 1e07          	ldw	x,(OFST-5,sp)
 300  00b8 72f005        	subw	x,(OFST-7,sp)
 301  00bb cd0000        	call	c_uitolx
 303  00be 96            	ldw	x,sp
 304  00bf 1c0001        	addw	x,#OFST-11
 305  00c2 cd0000        	call	c_rtol
 307  00c5 96            	ldw	x,sp
 308  00c6 1c0009        	addw	x,#OFST-3
 309  00c9 cd0000        	call	c_ltor
 311  00cc a603          	ld	a,#3
 312  00ce cd0000        	call	c_llsh
 314  00d1 96            	ldw	x,sp
 315  00d2 1c0001        	addw	x,#OFST-11
 316  00d5 cd0000        	call	c_ludv
 318  00d8 96            	ldw	x,sp
 319  00d9 1c0009        	addw	x,#OFST-3
 320  00dc cd0000        	call	c_rtol
 322                     ; 153   AWU->CSR &= (u8)(~AWU_CSR_MSR);
 324  00df 721150f0      	bres	20720,#0
 325                     ; 155  return (lsi_freq_hz);
 327  00e3 96            	ldw	x,sp
 328  00e4 1c0009        	addw	x,#OFST-3
 329  00e7 cd0000        	call	c_ltor
 333  00ea 5b0c          	addw	sp,#12
 334  00ec 81            	ret
 347                     	xdef	_main
 348                     	xdef	_LSIMeasurment
 349                     	xref	_Main_Menu
 350                     	xref	_UART2_Init
 351                     	xref	_UART2_DeInit
 352                     	xref	_TIM3_ClearFlag
 353                     	xref	_TIM3_GetCapture1
 354                     	xref	_TIM3_ITConfig
 355                     	xref	_TIM3_Cmd
 356                     	xref	_TIM3_ICInit
 357                     	xref	_TIM3_TimeBaseInit
 358                     	xref	_TIM3_DeInit
 359                     	xref	_GPIO_Init
 360                     	xref	_CLK_GetClockFreq
 361                     	xref	_CLK_HSIPrescalerConfig
 362                     	xref	_BEEP_LSICalibrationConfig
 363                     	xref.b	c_lreg
 364                     	xref.b	c_x
 383                     	xref	c_ludv
 384                     	xref	c_uitolx
 385                     	xref	c_llsh
 386                     	xref	c_rtol
 387                     	xref	c_ltor
 388                     	end
