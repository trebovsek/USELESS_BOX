/**
 * @file drv_switch.c
 * @author Marko Trebovsek (trebovsek@gmail.com)
 * @brief drivers module for switches
 * @version 0.1
 * @date 2022-12-20
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include "../kernel/macros.h"
#include "../kernel/stm8s_map.h"
#include "../common.h"
#include "../drivers/drv_switch.h"

typedef struct _port_pin_s_t
{
    GPIO_TypeDef *p_port;
    int pin;
}port_pin_s_t;

static const port_pin_s_t stSwitch[SWITCH_ALL] = {
  {GPIOB, 0},   //SWITCH_ID_1
  {GPIOE, 6},   //SWITCH_ID_2
  {GPIOB, 4},   //SWITCH_ID_3
  {GPIOB, 2},   //SWITCH_ID_4
  {GPIOB, 3},   //SWITCH_ID_5
  {GPIOE, 7},   //SWITCH_ID_6
  {GPIOB, 6},   //SWITCH_ID_7
  {GPIOB, 1},   //SWITCH_ID_8
  {GPIOB, 5}    //SWITCH_ID_9

};

void drv_switch_init(void)
{
    int switch_id = 0;
    for (switch_id = 0; switch_id < SWITCH_ALL; switch_id++)
    {
        _UC_BRES(stSwitch[switch_id].p_port->DDR, stSwitch[switch_id].pin); //INPUT
        _UC_BSET(stSwitch[switch_id].p_port->CR1, stSwitch[switch_id].pin); //PUUL-UP
        _UC_BRES(stSwitch[switch_id].p_port->CR2, stSwitch[switch_id].pin); //NO INTERRUPT
    }
}

int drv_switch_status(int switch_id)
{
    if (_UC_BTST(stSwitch[switch_id].p_port->IDR, stSwitch[switch_id].pin))
    {
        return SWITCH_STATE_OFF;
    }
    else
    {
        return SWITCH_STATE_ON;
    }
}
