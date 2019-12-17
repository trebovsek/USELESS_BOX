// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        timer_3.c
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
#include "../kernel/stm8s_map.h"
#include "../drivers/timer_3.h"
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

void Timer3Init(void)
{
  // Select the PWM mode in up-counting mode
  // Set the timer in order to output a PWM signal on CC1 (several registers have to be set)
  TIM3->CCMR1 = 0x68U;
  
  //Duty cycles
  TIM3->CCR1H = 0x00U; 
  TIM3->CCR1L = 0x00U;

  TIM3->CCER1 = 0x01U;

  //Enable TIM3 peripheral Preload register on ARR
  TIM3->CR1 |= 0x80U;

  // load the value for the frequency in ARR
  _TIMER_3_PWM_FREQ_SET(_TIMER_3_ARR); //s tem nastavim frekvenco

  //Select the Counter Mode
  TIM3->CR1 &= (UC_8)~0x10U; // up-counting mode
  
  //Disable the Interrupt sources
  TIM3->IER &= 0x00U;
  
  //Counter Enable
  TIM3->CR1 |= 0x01U;
  
  //Duty cycles on channel 1
  //_TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_IDLE);

  //////////////////////////////////////////////////////////////////////
  
  TIM3->CCMR2 = 0x68U;  //0/*reserved*/110/*PWM mode1*/1/*preload register enabe*/0/*no fast OC*/00
  TIM3->CCER1 |= 0x10U; //1000*CC2 enable*0001*CC2 enable*

  //chanel 2 or 3, above configuration for chanel 1
  _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_IDLE);

}

