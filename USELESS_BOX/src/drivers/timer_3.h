// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        timer_3.h
// CREATION DATE:      28/10/2019
// AUTHOR:             Marko Trebovsek
// LAST CHANGED DATE:
// LAST CHANGED BY:
// REVISION:           1.0
// DESCRIPTION:
//   Timer_1 module. PWM mode.
// Used for driving "Tower Pro MG90S Micro Servo" motor
// and other servo (unkonwn name atm)
//
// Frequency: 50Hz (20ms)
// Duty cycles: - 1,0ms (all the way to the left)
//              - 1,5ms (middle "90" degrees)
//              - 2,0ms (all the way to the right)
// ----------------------------------------------------------------------------

#ifndef _TIMER_3_H_
#define _TIMER_3_H_

#define _TIMER_3_DUTY_IDLE      (UI_16)3000  //Duty Cycle   1,5ms HIGH
#define _TIMER_3_DUTY_OPEN      (UI_16)4500  //Duty Cycle   1,5ms HIGH
#define _TIMER_3_DUTY_CLOSE     (UI_16)1000  //Duty Cycle   1,5ms HIGH


#define _TIMER_3_DUTY_OFF  (UI_16)0

#define _TIMER_3_PWM_FREQ_SET(uiPwmFr) \
      TIM3->ARRH = (UC_8)(uiPwmFr >> 8U); TIM3->ARRL = (UC_8)(uiPwmFr & 0x00FFU)
#define _TIMER_3_PWM_DUTY_SET(uiPwm) \
        TIM3->CCR1H =(UC_8)(uiPwm >> 8U);  TIM3->CCR1L = (UC_8)(uiPwm & 0x00FFU)

#define _TIMER_32_PWM_DUTY_SET(uiPwm) \
        TIM3->CCR2H =(UC_8)(uiPwm >> 8U);  TIM3->CCR2L = (UC_8)(uiPwm & 0x00FFU)


//50 Hz
#define _TIMER_3_ARR (UI_16)39910    //TIM3->PSCR = 0x03U;


// ----------------------------------------------------------------------------
// INTERRUPT DEFINITIONS
// ----------------------------------------------------------------------------
extern void Timer3Init(void);

// ----------------------------------------------------------------------------
// CONTROL REGISTER(S)INITIALIZATION VALUES
// ----------------------------------------------------------------------------

#endif //_TIMER_3_H
