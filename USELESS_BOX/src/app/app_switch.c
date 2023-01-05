/**
 * @file app_switch.c
 * @author Marko Trebovsek (trebovsek@gmail.com)
 * @brief application module for switches
 * @version 0.1
 * @date 2022-12-20
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include "../common.h"
#include "../kernel/types.h"
#include "../drivers/timer_3.h"
#include "../drivers/drv_switch.h"
#include "../app/app_switch.h"
#include "../drivers/drv_stepper.h"

typedef struct _switch_s_t
{
    switch_id_e_t switch_id;
    switch_state_e_t state_cur;
    switch_state_e_t state_req;
}switch_s_t;

switch_s_t stSwitch[SWITCH_ALL];

void app_switch_init(void)
{
    int switch_id = 0;

    for (switch_id = 0; switch_id < SWITCH_ALL; switch_id++)
    {
        //stSwitch[switch_id].switch_id = switch_id;
        stSwitch[switch_id].state_cur = SWITCH_STATE_OFF;
        stSwitch[switch_id].state_req = SWITCH_STATE_OFF;
    }
}

void app_switch_handle(void)
{
    int switch_id = 0;
    int loop = 0;

    for (switch_id = 0; switch_id < SWITCH_ALL; switch_id++)
    {
        //read switch status
        stSwitch[switch_id].state_cur = (switch_state_e_t)drv_switch_status(switch_id);
    }

    /* test of lid handle */
    if (stSwitch[SWITCH_ID_1].state_cur == SWITCH_STATE_ON)
    {
        //lid_open
        timer_door_pwm_set(_TIMER_3_DUTY_OPEN);   
    }
    else
    {
        //lid_close
        timer_door_pwm_set(_TIMER_3_DUTY_CLOSE);
    }

    /* test of arm handle */
    if (stSwitch[SWITCH_ID_2].state_cur == SWITCH_STATE_ON)
    {
        //arm_close
        timer_arm_pwm_set(_TIMER_DUTY_OPEN);
    }
    else
    {
        //arm_open
        timer_arm_pwm_set(_TIMER_DUTY_CLOSE);
    }

    /* test of stepping*/
    if (stSwitch[SWITCH_ID_3].state_cur == SWITCH_STATE_ON)
    {
        //stepper_step_on
        drv_stepper_set_step(STEPPER_STEP_ON);
        //stepper_step_off
        drv_stepper_set_step(STEPPER_STEP_OFF);
        for(loop = 0; loop < 1000; loop++)
        {}

        
    }
    else
    {
        //stepper_step_off
        drv_stepper_set_step(STEPPER_STEP_OFF);
    }

    /* test of direction */
    if (stSwitch[SWITCH_ID_4].state_cur == SWITCH_STATE_ON)
    {
        //stepper_direction_cw
        drv_stepper_set_dir(STEPPER_DIR_CW);
    }
    else
    {
        //stepper_direction_ccw
        drv_stepper_set_dir(STEPPER_DIR_CCW);
    }

    /* test of arm handle */
    if (stSwitch[SWITCH_ID_5].state_cur == SWITCH_STATE_ON)
    {
        //stepper_enabled
        drv_stepper_enable(STEPPER_ENABLED);
    }
    else
    {
        //stepper_disabled
        drv_stepper_enable(STEPPER_DISABLED);
    }

    /* test of ms 1 */
    if (stSwitch[SWITCH_ID_6].state_cur == SWITCH_STATE_ON)
    {
        //stepper_enabled
        drv_stepper_ms1(STEPPER_DISABLED);
    }
    else
    {
        //stepper_disabled
        drv_stepper_ms1(STEPPER_ENABLED);
    }

    /* test of ms 1 */
    if (stSwitch[SWITCH_ID_7].state_cur == SWITCH_STATE_ON)
    {
        //stepper_enabled
        drv_stepper_ms2(STEPPER_DISABLED);
    }
    else
    {
        //stepper_disabled
        drv_stepper_ms2(STEPPER_ENABLED);
    }

    /* test of ms 1 */
    if (stSwitch[SWITCH_ID_8].state_cur == SWITCH_STATE_ON)
    {
        //stepper_enabled
        drv_stepper_ms3(STEPPER_DISABLED);
    }
    else
    {
        //stepper_disabled
        drv_stepper_ms3(STEPPER_ENABLED);
    }
}
