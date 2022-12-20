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

typedef enum _switch_state_e_t
{
    SWITCH_STATE_OFF    = 0u,
    SWITCH_STATE_ON     = 1u
}switch_state_e_t;

#endif /* _COMMON_H */