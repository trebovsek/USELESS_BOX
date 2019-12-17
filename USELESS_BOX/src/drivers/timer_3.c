//------------------------------------------------------------------------------
//	PROJECT:					USELESS BOX
//------------------------------------------------------------------------------
//	DESCRIPTION:
//		Timer_3 module. PWM mode.
//		Used for driving "Tower Pro MG90S Micro Servo" motor
//		and other servo (unkonwn name atm)
//
//		Frequency: 50Hz (20ms)
//		Duty cycles:	
//			- 1,0ms (all the way to the left)
//			- 1,5ms (middle "90" degrees)
//			- 2,0ms (all the way to the right)
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// INCLUDED FILES.
//------------------------------------------------------------------------------
#include "../kernel/stm8s_map.h"
#include "../drivers/timer_3.h"

//------------------------------------------------------------------------------
//	LOCAL CONSTANTS.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	LOCAL MACROS.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// FUNCTION:
//   void Timer1Init(void)
// DESCRIPTION:
//   Initialization of Timer 1.
// INPUTS: --
// OUTPUT: --
//------------------------------------------------------------------------------

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
  
  TIM3->CCMR2 = 0x68U;
  TIM3->CCER1 |= 0x10U;

  _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_IDLE);

}

