// ----------------------------------------------------------------------------
// PROJECT:           USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        portdrv.c
// CREATION DATE:      
// AUTHOR:             
// LAST CHANGED DATE:  --
// LAST CHANGED BY:    --
// REVISION:           1.0
// DESCRIPTION:
//   Low level handle of all ports.
// ----------------------------------------------------------------------------

#include "../kernel/types.h"
#include "../kernel/macros.h"
#include "../kernel/stm8s_map.h"
#include "../kernel/portdrv.h"

void PortInit(void)
{
  _PD_PORT_B0_CONF();
  _PD_PORT_B1_CONF();
  _PD_PORT_B2_CONF();
  _PD_PORT_B3_CONF();
  _PD_PORT_B4_CONF();
  _PD_PORT_B5_CONF();
  _PD_PORT_B6_CONF();
  _PD_PORT_B7_CONF();
  
  _PD_PORT_E6_CONF();
  _PD_PORT_E7_CONF();
}

