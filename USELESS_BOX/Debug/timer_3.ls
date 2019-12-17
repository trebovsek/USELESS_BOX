   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.10 - 25 Sep 2019
  42                     ; 39 void Timer3Init(void)
  42                     ; 40 {
  44                     	switch	.text
  45  0000               _Timer3Init:
  49                     ; 43   TIM3->CCMR1 = 0x68U;
  51  0000 35685325      	mov	21285,#104
  52                     ; 46   TIM3->CCR1H = 0x00U; 
  54  0004 725f532d      	clr	21293
  55                     ; 47   TIM3->CCR1L = 0x00U;
  57  0008 725f532e      	clr	21294
  58                     ; 49   TIM3->CCER1 = 0x01U;
  60  000c 35015327      	mov	21287,#1
  61                     ; 52   TIM3->CR1 |= 0x80U;
  63  0010 721e5320      	bset	21280,#7
  64                     ; 55   _TIMER_3_PWM_FREQ_SET(_TIMER_3_ARR); //s tem nastavim frekvenco
  66  0014 359b532b      	mov	21291,#155
  69  0018 35e6532c      	mov	21292,#230
  70                     ; 58   TIM3->CR1 &= (UC_8)~0x10U; // up-counting mode
  72  001c 72195320      	bres	21280,#4
  73                     ; 61   TIM3->IER &= 0x00U;
  75  0020 725f5321      	clr	21281
  76                     ; 64   TIM3->CR1 |= 0x01U;
  78  0024 72105320      	bset	21280,#0
  79                     ; 66   TIM3->CCMR2 = 0x68U;
  81  0028 35685326      	mov	21286,#104
  82                     ; 67   TIM3->CCER1 |= 0x10U;
  84  002c 72185327      	bset	21287,#4
  85                     ; 69   _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_IDLE);
  87  0030 350b532f      	mov	21295,#11
  90  0034 35b85330      	mov	21296,#184
  91                     ; 71 }
  94  0038 81            	ret
 107                     	xdef	_Timer3Init
 126                     	end
