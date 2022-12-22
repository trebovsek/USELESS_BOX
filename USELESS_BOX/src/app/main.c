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
#include "../drivers/timer_3.h"

#include "../app/app_switch.h"

#include "../drivers/drv_switch.h"
#include "../drivers/drv_arm_motor.h"


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
	
  drv_switch_init();
  drv_arm_motor_init();

  //PortInit();
  timer_3_init();
  //SwitchInit();
  
	//enable interrupts
  rim();
  
	while (1)
  {
    app_switch_handle();
    //SwitchStatusReadAll(); 
    
    //nekako dati state oz. aktivna stikala v neko vrsto/buffer
    //BufferAddElement();
    
    //DeaktivateActiveSwitch();

  }
}