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

// ----------------------------------------------------------------------------
// FUNCTION:
//   void ReedStatusReadAll(void)
// DESCRIPTION:
// Reading of all reeds in appliance. Support for ESM(Embedded systems monitor).
// INPUTS: --
// OUTPUT: We put reed status in global gucReedStatus
// ----------------------------------------------------------------------------
/*void SwitchStatusReadAll(void)
{
  
  UC_8 ucCnt;
  //Use for selected reed status and for bitwise op. handle(misra rule)
  UC_8 ucReedStatusTmp;

  //Reading of current reed states
  scReedStates = GASC_APP_CONTROL[APP_C_REED_STATES];
  for (ucCnt = 0U; ucCnt < _REED_COUNT; ucCnt++)
  {
    //Reading status of selected reed
    ucReedStatusTmp = ReedStatusRead(ucCnt);
    if (ucReedStatusTmp > 0U)
    {
      //Set current reed bit
      _UC_BSET(gucReedStatus, ucCnt);

      
      //ESM need
      switch (ucCnt)
      {
        //REED REED_RF
        case REED_RF :
        {
          ucReedStatusTmp = (UC_8)scReedStates | (UC_8)APP_C_REED_RF;
          scReedStates = (SC_8)ucReedStatusTmp;
          break;
        }
        //REED_FR
        case REED_FR:
        {
          ucReedStatusTmp = (UC_8)scReedStates | (UC_8)APP_C_REED_FR;
          scReedStates = (SC_8)ucReedStatusTmp;
          break;
        }

        default :
        {
          break;
        }
      }
    }
    else
    {
      //Reset current reed bit
     _UC_BRES(gucReedStatus, ucCnt);


      //ESM need
      switch (ucCnt)
      {
        //REED_RF
        case REED_RF :
        {
          ucReedStatusTmp = \
                          (UC_8)scReedStates & (UC_8)(~(UC_8)APP_C_REED_RF);
          scReedStates = (SC_8)ucReedStatusTmp;
          break;
        }
        //REED_FR
        case REED_FR :
        {
          ucReedStatusTmp = (UC_8)scReedStates & (UC_8)(~(UC_8)APP_C_REED_FR);
          scReedStates = (SC_8)ucReedStatusTmp;
          break;
        }
 
        default :
        {
          break;
        }
      }

    }
    
  }

  GASC_APP_CONTROL[APP_C_REED_STATES] = scReedStates;
  
}

*/