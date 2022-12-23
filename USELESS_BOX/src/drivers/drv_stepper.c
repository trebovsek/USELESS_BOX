/**
 * @file drv_stepper.c
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-12-22
 * 
 * @copyright Copyright (c) 2022
 * 
 * A4988 Stepper Motor Driver 
 *      https://www.pololu.com/product/1182
 * oukeda motor ok42sth47-1684a 
 *      https://www.reichelt.com/de/en/stepper-motor-high-torque-hybrid-2-phase-nema17-01-p219027.html?r=1
 * 
 * 1A – green +
 * 1B – black -
 * 2A – blue  +
 * 2B – red   -
 */

#include "../kernel/macros.h"
#include "../kernel/stm8s_map.h"
#include "../common.h"

typedef struct _port_pin_s_t
{
    GPIO_TypeDef *p_port;
    int pin;
}port_pin_s_t;

static const port_pin_s_t stStepper[STEPPER_INFO_ALL] = {
    {GPIOG, 0}, //STEPPER_INFO_STEP
    {GPIOG, 1}, //STEPPER_INFO_DIRECTION
    {GPIOC, 7}  //STEPPER_INFO_ENABLE
};

void drv_stepper_init(void)
{
    int stepper_info = 0;
    for (stepper_info = 0; stepper_info < STEPPER_INFO_ALL; stepper_info++)
    {
        //_UC_BSET(stStepper[stepper_info].p_port->DDR, stStepper[stepper_info].pin); //OUTPUT
        //_UC_BSET(stStepper[stepper_info].p_port->CR1, stStepper[stepper_info].pin); //PUUL-UP
        //_UC_BRES(stStepper[stepper_info].p_port->CR2, stStepper[stepper_info].pin); //NO INTERRUPT
    }

}

void drv_stepper_set_dir(stepper_dir_e_t stepper_dir)
{
    if (stepper_dir == STEPPER_DIR_CW)
    {
        _UC_BSET(GPIOG -> DDR, 1);
        _UC_BSET(GPIOG -> CR1, 1);
        _UC_BSET(GPIOG -> CR2, 1);
        _UC_BRES(GPIOG -> ODR, 1);
    }
    else
    {
        _UC_BSET(GPIOG -> DDR, 1); 
        _UC_BSET(GPIOG -> CR1, 1); 
        _UC_BSET(GPIOG -> CR2, 1); 
        _UC_BSET(GPIOG -> ODR, 1);
    }
}

void drv_stepper_set_step(steepper_step_e_t stepper_step)
{
    if (stepper_step == STEPPER_STEP_OFF)
    {
        _UC_BSET(GPIOG -> DDR, 0);
        _UC_BSET(GPIOG -> CR1, 0);
        _UC_BSET(GPIOG -> CR2, 0);
        _UC_BRES(GPIOG -> ODR, 0);
    }
    else
    {
        _UC_BSET(GPIOG -> DDR, 0); 
        _UC_BSET(GPIOG -> CR1, 0); 
        _UC_BSET(GPIOG -> CR2, 0); 
        _UC_BSET(GPIOG -> ODR, 0);
    }
}


void drv_stepper_enable(stepper_enable_e_t stepper_enable)
{
    if (stepper_enable == STEPPER_ENABLED)
    {
        _UC_BSET(GPIOC -> DDR, 7);
        _UC_BSET(GPIOC -> CR1, 7);
        _UC_BSET(GPIOC -> CR2, 7);
        _UC_BRES(GPIOC -> ODR, 7);
    }
    else
    {
        _UC_BSET(GPIOC -> DDR, 7); 
        _UC_BSET(GPIOC -> CR1, 7); 
        _UC_BSET(GPIOC -> CR2, 7); 
        _UC_BSET(GPIOC -> ODR, 7);
    }
}

void drv_stepper_ms1(stepper_enable_e_t stepper_enable)
{
    if (stepper_enable == STEPPER_ENABLED)
    {
        //PE5,
        _UC_BSET(GPIOE -> DDR, 5);
        _UC_BSET(GPIOE -> CR1, 5);
        _UC_BSET(GPIOE -> CR2, 5);
        _UC_BRES(GPIOE -> ODR, 5);

        //PC2

        //PC4
    }
    else
    {
        _UC_BSET(GPIOE -> DDR, 5); 
        _UC_BSET(GPIOE -> CR1, 5); 
        _UC_BSET(GPIOE -> CR2, 5); 
        _UC_BSET(GPIOE -> ODR, 5);
    }
}

void drv_stepper_ms2(stepper_enable_e_t stepper_enable)
{
    if (stepper_enable == STEPPER_ENABLED)
    {
        
        _UC_BSET(GPIOC -> DDR, 2);
        _UC_BSET(GPIOC -> CR1, 2);
        _UC_BSET(GPIOC -> CR2, 2);
        _UC_BRES(GPIOC -> ODR, 2);
    }
    else
    {
        _UC_BSET(GPIOC -> DDR, 2); 
        _UC_BSET(GPIOC -> CR1, 2); 
        _UC_BSET(GPIOC -> CR2, 2); 
        _UC_BSET(GPIOC -> ODR, 2);
    }
}

void drv_stepper_ms3(stepper_enable_e_t stepper_enable)
{
    if (stepper_enable == STEPPER_ENABLED)
    {
        _UC_BSET(GPIOC -> DDR, 4);
        _UC_BSET(GPIOC -> CR1, 4);
        _UC_BSET(GPIOC -> CR2, 4);
        _UC_BRES(GPIOC -> ODR, 4);
        //PC4
    }
    else
    {
        _UC_BSET(GPIOC -> DDR, 4); 
        _UC_BSET(GPIOC -> CR1, 4); 
        _UC_BSET(GPIOC -> CR2, 4); 
        _UC_BSET(GPIOC -> ODR, 4);
    }
}