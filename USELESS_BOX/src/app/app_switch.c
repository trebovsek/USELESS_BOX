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


#include "../drivers/drv_switch.h"
#include "../app/app_switch.h"

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

    for (switch_id = 0; switch_id < SWITCH_ALL; switch_id++)
    {
        //read switch status
        stSwitch[switch_id].state_cur = drv_switch_status(switch_id);
    }
}
