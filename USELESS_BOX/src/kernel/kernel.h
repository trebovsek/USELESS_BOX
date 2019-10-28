// ----------------------------------------------------------------------------
// PROJECT:            C-14P [C-FS600]
// ----------------------------------------------------------------------------
// MODULE NAME:        kernel.h
// CREATION DATE:      2007/02/28
// AUTHOR:             Timotej Globacnik
// LAST CHANGED DATE:  2009/06/08
// LAST CHANGED BY:    Dejan Usar
// REVISION:           1.0
// DESCRIPTION:
//   Kernel dependent functions and variables are defined here.
//   ie.: task pooling period flags, macros used by kernel, etc
// ----------------------------------------------------------------------------
// Copyright (C) 2007 by Gorenje d.d.
// All rights reserved.
// ----------------------------------------------------------------------------
#ifndef _KERNEL_H_
#define _KERNEL_H_


// ----------------------------------------------------------------------------
// GLOBAL TYPES.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL CONSTANTS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL MACROS.
// ----------------------------------------------------------------------------
// Flag in time period register which is set every 1MS.
#define _TIME_PERIOD_FLAG_1MS     (UC_8)0x00U
// Flag in time period register which is set every 2MS.
#define _TIME_PERIOD_FLAG_2MS     (UC_8)0x01U
// Flag in time period register which is set every 2MS.
#define _TIME_PERIOD_FLAG_4MS     (UC_8)0x02U
// Flag in time period register which is set every 10MS.
#define _TIME_PERIOD_FLAG_10MS    (UC_8)0x03U
// Flag in time period register which is set every 100MS.
#define _TIME_PERIOD_FLAG_100MS   (UC_8)0x04U
// Flag in time period register which is set every 100MS.
#define _TIME_PERIOD_FLAG_200MS   (UC_8)0x05U
// Flag in time period register which is set every 1000MS.
#define _TIME_PERIOD_FLAG_1000MS  (UC_8)0x06U
// Flag in time period register which is set every 30 000MS.
#define _TIME_PERIOD_FLAG_0_5MIN  (UC_8)0x07U


// ----------------------------------------------------------------------------
// GLOBAL VARIABLES.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL FUNCTIONS.
// ----------------------------------------------------------------------------
// Set base event period flag.
//lint ++flb
extern void KernelSetEventBasePeriodFlag(void);
//lint --flb
// Set other event period flags.
extern void KernelSetEventPeriodFlags(void);
// Check event flag status (TRUE if flag is set, FALSE otherwise).
extern BOOL KernelGetEventPeriodFlag(UC_8 ucPeriodFlag);
// Clear event period flag.
extern void KernelClearEventPeriodFlag(UC_8 ucPeriodFlag);

//Set base timer flag
extern void KernelSetBaseEventPeriodFlag(void);

// ----------------------------------------------------------------------------
// INTERRUPT DEFINITIONS.
// ----------------------------------------------------------------------------


#endif // _KERNEL_H_
