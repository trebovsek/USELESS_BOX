/**
 * @file drv_switch.h
 * @author Marko Trebovsek (trebovsek@gmail.com)
 * @brief drivers module for switches
 * @version 0.1
 * @date 2022-12-20
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef _DRV_SWITCH_
#define _DRV_SWITCH_

extern void drv_switch_init(void);
extern int drv_switch_status(int switch_id);

#endif /* _DRV_SWITCH_ */