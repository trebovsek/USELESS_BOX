// ----------------------------------------------------------------------------
// PROJECT:            C-14P [C-FS600]
// ----------------------------------------------------------------------------
// MODULE NAME:        timer_3.h
// CREATION DATE:      2008/04/23
// AUTHOR:             Dejan Usar
// LAST CHANGED DATE:  2013/07/01
// LAST CHANGED BY:    Dejan Usar
// REVISION:           1.0
// DESCRIPTION:
//   Timer_3 module. PWM mode.
// Used for driving Secop compresor XV72KA _COMPR_VS_XV72KA
// Fixed 1,5ms on-time, Variable off-time (according to the required frequency)
//
// ----------------------------------------------------------------------------
// Copyright (C) 2013 by Gorenje d.d.
// All rights reserved.
// ----------------------------------------------------------------------------

#ifndef _TIMER_1_H_
#define _TIMER_1_H_

#define _TIMER_3_DUTY_IDLE      (UI_16)3000  //Duty Cycle   1,5ms HIGH
#define _TIMER_3_DUTY_OPEN      (UI_16)4500  //Duty Cycle   1,5ms HIGH
#define _TIMER_3_DUTY_CLOSE     (UI_16)1000  //Duty Cycle   1,5ms HIGH


#define _TIMER_3_DUTY_OFF  (UI_16)0

#define _TIMER_3_PWM_FREQ_SET(uiPwmFr) \
      TIM3->ARRH = (UC_8)(uiPwmFr >> 8U); TIM3->ARRL = (UC_8)(uiPwmFr & 0x00FFU)
#define _TIMER_3_PWM_DUTY_SET(uiPwm) \
        TIM3->CCR1H =(UC_8)(uiPwm >> 8U);  TIM3->CCR1L = (UC_8)(uiPwm & 0x00FFU)

//50 Hz
#define _TIMER_3_ARR (UI_16)39910    //TIM3->PSCR = 0x03U;


// ----------------------------------------------------------------------------
// INTERRUPT DEFINITIONS
// ----------------------------------------------------------------------------
extern void Timer1Init(void);

// ----------------------------------------------------------------------------
// CONTROL REGISTER(S)INITIALIZATION VALUES
// ----------------------------------------------------------------------------

#endif //_TIMER_3_H
