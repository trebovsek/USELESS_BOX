//------------------------------------------------------------------------------
//	PROJECT:					USELESS BOX
//------------------------------------------------------------------------------
//	DESCRIPTION:
//		Low level handle of all ports.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	INCLUDED FILES.
//------------------------------------------------------------------------------
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

