/**
 * @file timer_3.h
 * @author Marko Trebovsek (trebovsek@gmail.com)
 * @brief module for pwm driving
 * @version 0.1
 * @date 2022-12-22
 * 
 * @copyright Copyright (c) 2022
 * 
 * Used for driving "Tower Pro MG90S Micro Servo" motor
 * and other servo (unkonwn name atm)
 *
 * Frequency: 50Hz (20ms)
 * Duty cycles: - 1,0ms (all the way to the left)
 *              - 1,5ms (middle "90" degrees)
 *              - 2,0ms (all the way to the right)
 */

#include "../kernel/stm8s_map.h"
#include "../drivers/timer_3.h"
#include "../kernel/kernel.h"

void timer_3_init(void)
{
  //TIM3_CH1 on port D2 [PD2] - DOOR!
  //Capture/compare mode register 1 (TIMx_CCMR1)
  TIM3->CCMR1 |= 0x08U;   //OC1PE: Output compare 1 preload enable
  TIM3->CCMR1 |= 0x60U;   //OC1M[2:0]: Output compare 1 mode -> (110) pwm mode
  
  //TIM3_CH2 on port D0 [PD0] - ARM!
  //Capture/compare mode register 2 (TIMx_CCMR2)
  TIM3->CCMR2 |= 0x08U;   //OC2PE: Output compare 2 preload enable
  TIM3->CCMR2 |= 0x60U;   //OC2M[2:0]: Output compare 2 mode -> (110) pwm mode
  
  //Duty cycles 
  //Capture/compare register 1 high and low (TIMx_CCR1H and TIMx_CCR1L)
  TIM3->CCR1H = 0x00U; 
  TIM3->CCR1L = 0x00U;

  //Capture/compare register 2 high and low (TIMx_CCR2H and TIMx_CCR2L)
  TIM3->CCR2H = 0x00U; 
  TIM3->CCR2L = 0x00U;

  //Capture/compare enable register 1 (TIMx_CCER1)
  TIM3->CCER1 |= 0x01U;   //CC1E: Capture/Compare 1 output Enable.
  TIM3->CCER1 |= 0x10U;   //CC2E: Capture/compare 2 output enable

  TIM3->CR1 |= 0x80U;     //ARPE: Auto-reload preload enable

  // load the value for the frequency in ARR
  TIM3->ARRH = (UC_8)(_TIMER_3_ARR >> 8U);      //ARR[15:8]: Auto-reload value (MSB)
  TIM3->ARRL = (UC_8)(_TIMER_3_ARR & 0x00FFU);  //ARR[7:0]: Auto-reload value (LSB)

  //Select the Counter Mode
  TIM3->CR1 &= (UC_8)~0x10U; // up-counting mode
  
  //Disable the Interrupt sources
  TIM3->IER &= 0x00U;
  
  //Counter Enable
  TIM3->CR1 |= 0x01U;
}

extern void timer_door_pwm_set(UI_16 timer_duty)
{
  TIM3->CCR1H = (UC_8)(timer_duty >> 8U);
  TIM3->CCR1L = (UC_8)(timer_duty & 0x00FFU);
}

extern void timer_arm_pwm_set(UI_16 timer_duty)
{
  TIM3->CCR2H =(UC_8)(timer_duty >> 8U);
  TIM3->CCR2L = (UC_8)(timer_duty & 0x00FFU);
}
