/**
 * @file common.h
 * @author Marko Trebovsek (trebovsek@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2022-12-20
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef _COMMON_H_
#define _COMMON_H_

typedef enum _switch_id_e_t
{
    SWITCH_ID_1     = 0u,
    SWITCH_ID_2     = 1u,
    SWITCH_ID_3     = 2u,
    SWITCH_ID_4     = 3u,
    SWITCH_ID_5     = 4u,
    SWITCH_ID_6     = 5u,
    SWITCH_ID_7     = 6u,
    SWITCH_ID_8     = 7u,
    SWITCH_ID_9     = 8u,
    SWITCH_ALL      = 9u
}switch_id_e_t;

typedef enum _stepper_e_t
{
    STEPPER_INFO_STEP   = 0u,
    STEPPER_INFO_DIR    = 1u,
    STEPPER_INFO_ENABLE = 2u,
    STEPPER_INFO_ALL    = 3u
}stepper_e_t;

typedef enum _stepper_dir_e_t
{
    STEPPER_DIR_CW  = 0u,
    STEPPER_DIR_CCW = 1u
}stepper_dir_e_t;

typedef enum _stepper_step_e_t
{
    STEPPER_STEP_OFF    = 0u,
    STEPPER_STEP_ON     = 1u
}steepper_step_e_t;

typedef enum _stepper_enable_e_t
{
    STEPPER_DISABLED    = 0u,
    STEPPER_ENABLED     = 1u
}stepper_enable_e_t;

typedef enum _switch_state_e_t
{
    SWITCH_STATE_OFF    = 0u,
    SWITCH_STATE_ON     = 1u
}switch_state_e_t;

#endif /* _COMMON_H */