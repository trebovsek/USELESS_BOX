// ----------------------------------------------------------------------------
// PROJECT:            USELESS BOX
// ----------------------------------------------------------------------------
// MODULE NAME:        timer_3.h
// CREATION DATE:      28/10/2019
// AUTHOR:             Marko Trebovsek
// LAST CHANGED DATE:
// LAST CHANGED BY:
// REVISION:           1.0
// DESCRIPTION:
//   Low level handle of all ports.
// ----------------------------------------------------------------------------
#ifndef _PORTDRV_H
#define _PORTDRV_H

// ************************************************
// #region Port A
// ****************

// ****************
// #endregion Port A
// ************************************************


// ************************************************
// #region Port B
// ****************

extern @tiny UC_8 gucPortB;      // Image of Port B, for request or status info

#define _PORT_B0    0U        //[OK]
#define _PORT_B1    1U        //[OK]
#define _PORT_B2    2U        //[OK]
#define _PORT_B3    3U        //[OK]
#define _PORT_B4    4U        //[OK]
#define _PORT_B5    5U        //[OK]
#define _PORT_B6    6U        //[OK]
#define _PORT_B7    7U        //[OK]

// _PORT_B0
#define _PD_PORT_B0_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B0))
#define _PD_PORT_B0_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B0); _UC_BSET(GPIOB -> CR1, _PORT_B0); _UC_BRES(GPIOB -> CR2, _PORT_B0 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B1
#define _PD_PORT_B1_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B1))
#define _PD_PORT_B1_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B1); _UC_BSET(GPIOB -> CR1, _PORT_B1); _UC_BRES(GPIOB -> CR2, _PORT_B1 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B2
#define _PD_PORT_B2_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B2))
#define _PD_PORT_B2_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B2); _UC_BSET(GPIOB -> CR1, _PORT_B2); _UC_BRES(GPIOB -> CR2, _PORT_B2 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B3
#define _PD_PORT_B3_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B3))
#define _PD_PORT_B3_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B3); _UC_BSET(GPIOB -> CR1, _PORT_B3); _UC_BRES(GPIOB -> CR2, _PORT_B3 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B4
#define _PD_PORT_B4_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B4))
#define _PD_PORT_B4_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B4); _UC_BSET(GPIOB -> CR1, _PORT_B4); _UC_BRES(GPIOB -> CR2, _PORT_B4 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B5
#define _PD_PORT_B5_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B5))
#define _PD_PORT_B5_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B5); _UC_BSET(GPIOB -> CR1, _PORT_B5); _UC_BRES(GPIOB -> CR2, _PORT_B5 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B6
#define _PD_PORT_B6_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B6))
#define _PD_PORT_B6_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B6); _UC_BSET(GPIOB -> CR1, _PORT_B6); _UC_BRES(GPIOB -> CR2, _PORT_B6 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_B7
#define _PD_PORT_B7_CHECK()   (_UC_BTST(GPIOB -> IDR, _PORT_B7))
#define _PD_PORT_B7_CONF()    _UC_BRES(GPIOB -> DDR, _PORT_B7); _UC_BSET(GPIOB -> CR1, _PORT_B7); _UC_BRES(GPIOB -> CR2, _PORT_B7 ) //INPUT, PUUL-UP, NO INTERRUPT

// ****************
// #endregion Port B
// ************************************************

// ************************************************
// #region Port C
// ****************

// ****************
// #endregion Port C
// ************************************************

// ************************************************
// #region Port D
// ****************


// ****************
// #endregion Port D
// ************************************************


// ************************************************
// # region Port E
// ****************
extern @tiny UC_8 gucPortE;      // Image of Port B, for request or status info

#define _PORT_E0    0U        //not in use
#define _PORT_E1    1U        //not in use
#define _PORT_E2    2U        //not in use
#define _PORT_E3    3U        //not in use
#define _PORT_E4    4U        //not in use
#define _PORT_E5    5U        //not in use
#define _PORT_E6    6U        //[OK]
#define _PORT_E7    7U        //[OK]

// _PORT_E6
#define _PD_PORT_E6_CHECK()   (_UC_BTST(GPIOE -> IDR, _PORT_E6))
#define _PD_PORT_E6_CONF()    _UC_BRES(GPIOE -> DDR, _PORT_E6); _UC_BSET(GPIOE -> CR1, _PORT_E6); _UC_BRES(GPIOE -> CR2, _PORT_E6 ) //INPUT, PUUL-UP, NO INTERRUPT
// _PORT_E7
#define _PD_PORT_E7_CHECK()   (_UC_BTST(GPIOE -> IDR, _PORT_E7))
#define _PD_PORT_E7_CONF()    _UC_BRES(GPIOE -> DDR, _PORT_E7); _UC_BSET(GPIOE -> CR1, _PORT_E7); _UC_BRES(GPIOE -> CR2, _PORT_E7 ) //INPUT, PUUL-UP, NO INTERRUPT

// ****************
// # endregion Port E
// ************************************************


// ************************************************
// # region Port F
// ****************


// ****************
// # endregion Port F
// ************************************************

// ************************************************
// # region Port G
// ****************

// ****************
// # endregion Port G
// ************************************************



// ************************************************
// # region Port H
// ****************

// ****************
// # endregion Port H
// ************************************************



// ************************************************
// # region Port I
// ****************

// ****************
// # endregion Port I
// ************************************************

extern void PortInit(void);
extern UC_8 CheckSwitchInput(void);

#endif
