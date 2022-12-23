/**
 * @file drv_stepper.h
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-12-22
 * 
 * @copyright Copyright (c) 2022
 * 
 */

extern void drv_stepper_init(void);
extern void drv_stepper_set_dir(stepper_dir_e_t stepper_dir);
void drv_stepper_set_step(steepper_step_e_t stepper_step);
void drv_stepper_enable(stepper_enable_e_t stepper_enable);

void drv_stepper_ms1(stepper_enable_e_t stepper_enable);
void drv_stepper_ms2(stepper_enable_e_t stepper_enable);
void drv_stepper_ms3(stepper_enable_e_t stepper_enable);