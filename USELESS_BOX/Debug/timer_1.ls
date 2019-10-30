   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator V4.3.13 - 22 Oct 2014
  43                     ; 39 void Timer1Init(void)
  43                     ; 40 {
  45                     	switch	.text
  46  0000               _Timer1Init:
  50                     ; 43   TIM3->CCMR1 = 0x68U;  //0/*reserved*/110/*PWM mode1*/1/*preload register enabe*/0/*no fast OC*/00
  52  0000 35685325      	mov	21285,#104
  53                     ; 46   TIM3->CCR1H = 0x00U; 
  55  0004 725f532d      	clr	21293
  56                     ; 47   TIM3->CCR1L = 0x00U;
  58  0008 725f532e      	clr	21294
  59                     ; 49   TIM3->CCER1 = 0x01U; //0001*CC1 enable*0001*CC2 enable*
  61  000c 35015327      	mov	21287,#1
  62                     ; 52   TIM3->CR1 |= 0x80U;
  64  0010 721e5320      	bset	21280,#7
  65                     ; 55   _TIMER_3_PWM_FREQ_SET(_TIMER_3_ARR); //s tem nastavim frekvenco
  67  0014 359b532b      	mov	21291,#155
  70  0018 35e6532c      	mov	21292,#230
  71                     ; 58   TIM3->CR1 &= (UC_8)~0x10U; // up-counting mode
  73  001c 72195320      	bres	21280,#4
  74                     ; 61   TIM3->IER &= 0x00U;
  76  0020 725f5321      	clr	21281
  77                     ; 64   TIM3->CR1 |= 0x01U;
  79  0024 72105320      	bset	21280,#0
  80                     ; 71   TIM3->CCMR2 = 0x68U;  //0/*reserved*/110/*PWM mode1*/1/*preload register enabe*/0/*no fast OC*/00
  82  0028 35685326      	mov	21286,#104
  83                     ; 72   TIM3->CCER1 |= 0x10U; //1000*CC2 enable*0001*CC2 enable*
  85  002c 72185327      	bset	21287,#4
  86                     ; 75   _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_IDLE);
  88  0030 350b532f      	mov	21295,#11
  91  0034 35b85330      	mov	21296,#184
  92                     ; 77 }
  95  0038 81            	ret
 108                     	xdef	_Timer1Init
 127                     	end
