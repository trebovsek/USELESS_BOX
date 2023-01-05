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

#ifndef _TIMER_3_H_
#define _TIMER_3_H_

#define _TIMER_3_DUTY_IDLE      (UI_16)3000
#define _TIMER_3_DUTY_OPEN      (UI_16)5000
#define _TIMER_3_DUTY_CLOSE     (UI_16)2200

#define _TIMER_DUTY_IDLE      (UI_16)3000
#define _TIMER_DUTY_OPEN      (UI_16)4200
#define _TIMER_DUTY_CLOSE     (UI_16)2100

#define _TIMER_3_PWM_DUTY_SET(uiPwm) \
        TIM3->CCR1H =(UC_8)(uiPwm >> 8U);  TIM3->CCR1L = (UC_8)(uiPwm & 0x00FFU)

#define _TIMER_32_PWM_DUTY_SET(uiPwm) \
        TIM3->CCR2H =(UC_8)(uiPwm >> 8U);  TIM3->CCR2L = (UC_8)(uiPwm & 0x00FFU)

//50 Hz
#define _TIMER_3_ARR (UI_16)39910


extern void timer_3_init(void);
extern void timer_door_pwm_set(UI_16 timer_duty);
extern void timer_arm_pwm_set(UI_16 timer_duty);

#endif //_TIMER_3_H
