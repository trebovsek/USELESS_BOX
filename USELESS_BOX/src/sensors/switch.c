//------------------------------------------------------------------------------
// PROJECT:            USELESS BOX
//------------------------------------------------------------------------------
// DESCRIPTION:
//   This module is reading status of switches.
//    SWITCH_1, SWITCH_2... SWITCH_9
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
//	INCLUDED FILES.
//------------------------------------------------------------------------------

#include "../kernel/types.h"
#include "../kernel/stm8s_map.h"
#include "../kernel/macros.h"
#include "../kernel/portdrv.h"
#include "../sensors/switch.h"
#include "../drivers/timer_3.h"

//------------------------------------------------------------------------------
// GLOBAL VARIABLE DEFINITIONS.
//------------------------------------------------------------------------------
SwitchStatus_typeDef SwitchStatus;
SwitchState_typeDef gucSwitchState;

//------------------------------------------------------------------------------
//	LOCAL FUNCTIONS.
//------------------------------------------------------------------------------
void SwitchStatusReadAll(void);

//------------------------------------------------------------------------------
//	LOCAL CONSTANTS.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	LOCAL MACROS.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	LOCAL VARIABLES.
// ----------------------------------------------------------------------------

void SwitchStatusReadAll(void)
{
  //SWITCH 1 [OK]
  if (_PD_PORT_B0_CHECK()) 
  {
    SwitchStatus.asBit.boSwitch1 = OFF;
    _TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  }
  else
  {
    SwitchStatus.asBit.boSwitch1 = ON;
    _TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
  }
  
  //SWITCH 2 [OK]
  if (_PD_PORT_E6_CHECK())
  {
    SwitchStatus.asBit.boSwitch2 = OFF;
    _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  }
  else
  {
    SwitchStatus.asBit.boSwitch2 = ON;
    _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
    
  }
  
  //SWITCH 3 [OK]
  if (_PD_PORT_B4_CHECK())
  {
    SwitchStatus.asBit.boSwitch3 = OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch3 = ON;
  }
  
  //SWITCH 4 [OK]
  if (_PD_PORT_B2_CHECK())
  {
    SwitchStatus.asBit.boSwitch4 = OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch4 = ON;
  }
  
  //SWITCH 5 [OK]
  if (_PD_PORT_B3_CHECK())
  {
    SwitchStatus.asBit.boSwitch5 = OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch5 = ON;
  }
  
  //SWITCH 6 [OK]
  if (_PD_PORT_E7_CHECK())
  {
    SwitchStatus.asBit.boSwitch6 = OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch6 = ON;
  }
  
  //SWITCH 7 [OK]
  if (_PD_PORT_B6_CHECK())
  {
    SwitchStatus.asBit.boSwitch7= OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch7 = ON;
  }
  
  //SWITCH 8 [OK]
  if (_PD_PORT_B1_CHECK())
  {
    SwitchStatus.asBit.boSwitch8 = OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch8 = ON;
  }
  
  //SWITCH 9 [OK]
  if (_PD_PORT_B5_CHECK())
  {
    SwitchStatus.asBit.boSwitch9 = OFF;
  }
  else
  {
    SwitchStatus.asBit.boSwitch9 = ON;
  }  
}

