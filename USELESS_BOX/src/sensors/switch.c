// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        switch
// CREATION DATE:      
// AUTHOR:             
// LAST CHANGED DATE:  
// LAST CHANGED BY:    
// REVISION:           
// DESCRIPTION:
//   This module is reading status of switches.
//    SWITCH_1, SWITCH_2... SWITCH_9

#include "../kernel/types.h"
#include "../kernel/stm8s_map.h"
#include "../kernel/macros.h"
#include "../kernel/portdrv.h"
#include "../sensors/switch.h"
#include "../drivers/timer_3.h"

// ----------------------------------------------------------------------------
// GLOBAL VARIABLE DEFINITIONS.
// ----------------------------------------------------------------------------

SwitchStatus_typeDef SwitchStatus;
SwitchState_typeDef gucSwitchState;

strSwitchState Switch[SWITCH_ALL];
// ----------------------------------------------------------------------------
// LOCAL FUNCTIONS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// LOCAL CONSTANTS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// LOCAL MACROS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// LOCAL VARIABLES.
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// FUNCTION:
//  void SwitchInit(void)
// DESCRIPTION:
//  Initialization of all switches
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------
void SwitchInit(void)
{
  UC_8 ucCounter;
  
  for (ucCounter = 0U; ucCounter < SWITCH_ALL; ucCounter++)
  {
    Switch[ucCounter].SwitchState   = SWITCH_STATE_OFF;
    Switch[ucCounter].SwitchingOFF  = SWITCHING_OFF_IDLE; 
  }
}

// ----------------------------------------------------------------------------
// FUNCTION:
// void SwitchStatusReadAll(void)
// DESCRIPTION:
//  Reads states of all switches (ON or OFF)
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------

void SwitchStatusReadAll(void)
{
  //SWITCH 1 [OK]
  if (_PD_PORT_B0_CHECK()) 
  {
    Switch[SWITCH_1].SwitchState = SWITCH_STATE_OFF;
    //_TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  }
  else
  {
    Switch[SWITCH_1].SwitchState = SWITCH_STATE_ON;
    //_TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
  }
  
  //SWITCH 2 [OK]
  if (_PD_PORT_E6_CHECK())
  {
    Switch[SWITCH_2].SwitchState = SWITCH_STATE_OFF;
    //_TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  }
  else
  {
    Switch[SWITCH_2].SwitchState = SWITCH_STATE_ON;
    //_TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
  }
  
  //SWITCH 3 [OK]
  if (_PD_PORT_B4_CHECK())
  {
    Switch[SWITCH_3].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_3].SwitchState = SWITCH_STATE_ON;
  }
  
  //SWITCH 4 [OK]
  if (_PD_PORT_B2_CHECK())
  {
    Switch[SWITCH_4].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_4].SwitchState = SWITCH_STATE_ON;
  }
  
  //SWITCH 5 [OK]
  if (_PD_PORT_B3_CHECK())
  {
    Switch[SWITCH_5].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_5].SwitchState = SWITCH_STATE_ON;
  }
  
  //SWITCH 6 [OK]
  if (_PD_PORT_E7_CHECK())
  {
    Switch[SWITCH_6].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_6].SwitchState = SWITCH_STATE_ON;
  }
  
  //SWITCH 7 [OK]
  if (_PD_PORT_B6_CHECK())
  {
    Switch[SWITCH_7].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_7].SwitchState = SWITCH_STATE_ON;
  }
  
  //SWITCH 8 [OK]
  if (_PD_PORT_B1_CHECK())
  {
    Switch[SWITCH_8].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_8].SwitchState = SWITCH_STATE_ON;
  }
  
  //SWITCH 9 [OK]
  if (_PD_PORT_B5_CHECK())
  {
    Switch[SWITCH_9].SwitchState = SWITCH_STATE_OFF;
  }
  else
  {
    Switch[SWITCH_9].SwitchState = SWITCH_STATE_ON;
  }  

}
