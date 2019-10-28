// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        timer_1.c
// CREATION DATE:      28/10/2019
// AUTHOR:             Marko Trebovšek
// LAST CHANGED DATE:
// LAST CHANGED BY:
// REVISION:           1.0
// DESCRIPTION:
//   Timer_1 module. PWM mode.
// Used for driving "Tower Pro MG90S Micro Servo" motor
// Frequency: 50Hz (20ms)
// Duty cycles: - 1,0ms (all the way to the left)
//              - 1,5ms (middle "90" degrees)
//              - 2,0ms (all the way to the right)
// ----------------------------------------------------------------------------
#include "../kernel/stm8s_map.h"
#include "../drivers/timer_1.h"
#include "../kernel/kernel.h"

// ----------------------------------------------------------------------------
// LOCAL CONSTANTS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// LOCAL MACROS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// FUNCTION:
//   void Timer1Init(void)
// DESCRIPTION:
//   Initialization of Timer 1.
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------

void Timer1Init(void)
{
   // Select the PWM mode in up-counting mode
  // Set the timer in order to output a PWM signal on CC1 (several registers have to be set)
  TIM3->CCMR1 = 0x68U;  //0/*reserved*/110/*PWM mode1*/1/*preload register enabe*/0/*no fast OC*/00
  
  TIM3->CCR1H = 0x00U;  //ARR/2 wih ARR=0x3FF;
  TIM3->CCR1L = 0x00U;

  TIM3->CCER1 = 0x01U; //0001*CC1 enable*0001*CC2 enable*

  //Enable TIM3 peripheral Preload register on ARR
  TIM3->CR1 |= 0x80U;

  // load the value for the frequency in ARR
  //TIM3->ARRH = (UC_8)(_TIMER_3_ARR >> 8U);
  //TIM3->ARRL = (UC_8)(_TIMER_3_ARR & 0x00FFU);
  
  _TIMER_3_PWM_FREQ_SET(_TIMER_3_ARR_4); //s tem nastavim frekvenco

  //Set the Prescaler value
  //TIM3->PSCR = 0x03U;


  //Select the Counter Mode
  TIM3->CR1 &= (UC_8)~0x10U; // up-counting mode
  //Disable the Interrupt sources
  TIM3->IER &= 0x00U;
  //Counter Enable

  //Duty cycles
  TIM3->CCR1H =  0x00U;
  TIM3->CCR1L =  0x00U;

  TIM3->CR1 |= 0x01U;
  
  //Duty cycle init OFF
  //_TIMER_3_PWM_DUTY_SET(1000); //1ms [OK]
  
  _TIMER_3_PWM_DUTY_SET(3000); //1,5 ms - middle
  
  //_TIMER_3_PWM_DUTY_SET(4500); //2,0 ms
  
}

// ----------------------------------------------------------------------------
// FUNCTION:
//   void Timer3Reset(void)
// DESCRIPTION:
//   Reset of Timer 3.
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------
/*
void Timer3Reset(void)
{
  TIM3->CCMR1 = 0x00U;
  TIM3->CCMR2 = 0x00U;

  TIM3->CCR1H = 0x00U;
  TIM3->CCR1L = 0x00U;

  TIM3->CCER1= 0x00U;

  TIM3->CR1 = 0x00U;

  // load the value for the frequency in ARR
  TIM3->ARRH = (UC_8) 0xFFU;
  TIM3->ARRL = (UC_8) 0xFFU;

  //Set the Prescaler value
  TIM3->PSCR = 0x00U;

  //Disable the Interrupt sources
  TIM3->IER &= 0x00U;
}
*/

