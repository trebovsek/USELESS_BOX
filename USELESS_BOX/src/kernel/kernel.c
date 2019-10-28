// ----------------------------------------------------------------------------
// PROJECT:            C-14P [C-FS600]
// ----------------------------------------------------------------------------
// MODULE NAME:        kernel.c
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



#include "../kernel/types.h"
#include "../kernel/macros.h"
#include "../kernel/kernel.h"


// ----------------------------------------------------------------------------
// LOCAL FUNCTIONS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// LOCAL CONSTANTS.
// ----------------------------------------------------------------------------
// How many periods are defined.
#define _EVENT_PERIOD_COUNT         (UC_8)8
// Base event period duration in MS.
#define _BASE_EVENT_PERIOD_DURATION (UC_8)1

// ----------------------------------------------------------------------------
// LOCAL MACROS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// LOCAL VARIABLES.
// ----------------------------------------------------------------------------
// How many base periods must expire before flag
// for longer periods are set.
static const UI_16 AUI_PERIOD_LENGTH[_EVENT_PERIOD_COUNT] =
{
  /*(UC_8)*/((UI_16)1    / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 1ms.
  /*(UC_8)*/((UI_16)2    / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 2ms.
  /*(UC_8)*/((UI_16)4    / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 4ms.
  /*(UC_8)*/((UI_16)10   / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 10ms.
  /*(UC_8)*/((UI_16)100  / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 100ms.
  /*(UC_8)*/((UI_16)200  / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 200ms.
  /*(UC_8)*/((UI_16)1000 / (UI_16)_BASE_EVENT_PERIOD_DURATION),   // 1000ms.
  /*(UC_8)*/((UI_16)30000 / (UI_16)_BASE_EVENT_PERIOD_DURATION)  // 30000ms- 30s
};
// Counts number of expired base periods for each event period.
static UI_16 auiPeriodCounter[_EVENT_PERIOD_COUNT] =
{
  (UI_16)0,  // 1ms.
  (UI_16)0,  // 2ms.
  (UI_16)0,  // 4ms.
  (UI_16)0,  // 10ms.
  (UI_16)0,  // 100ms.
  (UI_16)0,  // 200ms.
  (UI_16)0,  // 1000ms.
//((UI_16)0, // 10000ms.
  (UI_16)0  // 30 000 ms.
};
// Each bit represents expiration of time period when set.
static UC_8 ucEventPeriodFlags = (UC_8)0;

// ----------------------------------------------------------------------------
// FUNCTION:
//   void KernelSetEventBasePeriodFlag(void)
// DESCRIPTION:
//   Set base event period flag.
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------
//lint ++flb
void KernelSetEventBasePeriodFlag(void)
{
  auiPeriodCounter[_TIME_PERIOD_FLAG_1MS]++;
  if (auiPeriodCounter[_TIME_PERIOD_FLAG_1MS] >=
      AUI_PERIOD_LENGTH[_TIME_PERIOD_FLAG_1MS])
  {
    // Period expired -> set flag.
    _UC_BSET(ucEventPeriodFlags, _TIME_PERIOD_FLAG_1MS);
    auiPeriodCounter[_TIME_PERIOD_FLAG_1MS] = (UC_8)0;
  }
}
//lint --flb

// ----------------------------------------------------------------------------
// FUNCTION:
//   void KernelSetEventPeriodFlags(void)
// DESCRIPTION:
//   Set event period flags. This function must be invoked every time
//   after base period expires (usually within timer interrupt routine).
// INPUTS: --
// OUTPUT: --
// ----------------------------------------------------------------------------
void KernelSetEventPeriodFlags(void)
{
  // Period index.
  UC_8 ucIndex;

  for (ucIndex = (UC_8)1; ucIndex < _EVENT_PERIOD_COUNT; ucIndex++)
  {
    auiPeriodCounter[ucIndex]++;
    if (auiPeriodCounter[ucIndex] >= AUI_PERIOD_LENGTH[ucIndex])
    {
      // Period expired -> set flag.
      _UC_BSET(ucEventPeriodFlags, ucIndex);
      auiPeriodCounter[ucIndex] = (UC_8)0;
    }
  }
}

// ----------------------------------------------------------------------------
// FUNCTION:
//   BOOL KernelGetEventPeriodFlag(UC_8 ucPeriodFlag)
// DESCRIPTION:
//   Check event flag status.
// INPUTS:
//   ucPeriodFlag - index of selected period
// OUTPUT:
//   TRUE if flag is set, FALSE otherwise
// ----------------------------------------------------------------------------
BOOL KernelGetEventPeriodFlag(UC_8 ucPeriodFlag)
{
  // If > 0, flag is set.
  UC_8 ucFlagStatus;

  ucFlagStatus = _UC_BTST(ucEventPeriodFlags, ucPeriodFlag);
  if (ucFlagStatus > (UC_8)0)
  {
    // Flag is set.
    ucFlagStatus = 1U;
  }
  return ((BOOL)ucFlagStatus);
}

// ----------------------------------------------------------------------------
// FUNCTION:
//   void KernelClearEventPeriodFlag(UC_8 ucPeriodFlag)
// DESCRIPTION:
//   Clear event period flag.
// INPUTS:
//   ucPeriodFlag - index of selected period
// OUTPUT: --
// ----------------------------------------------------------------------------
void KernelClearEventPeriodFlag(UC_8 ucPeriodFlag)
{
  _UC_BRES(ucEventPeriodFlags, ucPeriodFlag);
}

// ----------------------------------------------------------------------------
// FUNCTION:
//   void KernelSetBaseEventPeriodFlag()
// DESCRIPTION:
//   Set event period flag.
// INPUTS: --
//
// OUTPUT: --
// ----------------------------------------------------------------------------
void KernelSetBaseEventPeriodFlag()
{
  _UC_BSET(ucEventPeriodFlags, 0U);
}
