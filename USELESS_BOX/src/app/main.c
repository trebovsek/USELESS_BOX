// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        main
// CREATION DATE:      
// AUTHOR:             
// LAST CHANGED DATE:  
// LAST CHANGED BY:    
// REVISION:           
// DESCRIPTION:
//   Main module
// ----------------------------------------------------------------------------

#include "../kernel/stm8s_map.h"
#include "../kernel/portdrv.h"
#include "../kernel/types.h"
#include "../kernel/macros.h"
#include "../kernel/stm8s_map.h"
#include "../kernel/portdrv.h"
#include "../sensors/switch.h"
#include "../drivers/timer_3.h"

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

void main()
{
	//disable interrupts
  sim();
	
  PortInit();
  Timer3Init();
  SwitchInit();
  
	//enable interrupts
  rim();
  
	while (1)
  {
    SwitchStatusReadAll();
    
    //nekako dati state oz. aktivna stikala v neko vrsto/buffer
    BufferAddActiveSwitch();
    
  }
}