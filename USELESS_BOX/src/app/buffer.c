// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        buffer
// CREATION DATE:      
// AUTHOR:             
// LAST CHANGED DATE:  
// LAST CHANGED BY:    
// REVISION:           
// DESCRIPTION:
//   This module is used for adding all active switches into a buffer
//    and then turn them all off

#include "../kernel/types.h"
#include "../kernel/stm8s_map.h"
#include "../sensors/switch.h"


// ----------------------------------------------------------------------------
// GLOBAL VARIABLE DEFINITIONS.
// ----------------------------------------------------------------------------


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
//  void BufferInit(void)
// DESCRIPTION:
//  Initialization of Buffer
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------
void BufferInit(void)
{
  static UC_8 ucBufferLenth = 0U;
}

// ----------------------------------------------------------------------------
// FUNCTION:
// 
// DESCRIPTION:
//  
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------

void BufferAddElement(void)
{
  UC_8 ucCounter;
  
  //check all switches for request
  for (ucCounter = 0U; ucCounter < SWITCH_ALL; ucCounter++)
  {
    if (Switch[ucCounter].SwitchingOFF == SWITCHING_OFF_REQUEST)
    {
      Switch[ucCounter].SwitchingOFF = SWITCHING_OFF_IN_PROGRESS;
    }
  }
}

void BufferRemoveElement(void)
{
  
}
