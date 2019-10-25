// ----------------------------------------------------------------------------
// PROJECT:           C-14P [C-FS600]
// ----------------------------------------------------------------------------
// MODULE NAME:        reed.h
// CREATION DATE:      2008/09/22
// AUTHOR:             Dejan Usar
// LAST CHANGED DATE:  2013/06/05
// LAST CHANGED BY:    Dejan Usar
// REVISION:           1.0
// DESCRIPTION:
//   This module is reading status of reeds.
//    REED_RF, REED_FR
// ----------------------------------------------------------------------------
// Copyright (C) 2009 by Gorenje d.d.
// All rights reserved.
// ----------------------------------------------------------------------------
//#ifndef _SWITCH_H_
//#define _SWITCH_H_

// ----------------------------------------------------------------------------
// GLOBAL CONSTANTS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL MACROS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL TYPES.
// ----------------------------------------------------------------------------

//structure table for data of DAMPER timer counters


typedef enum
{
  ON    = 0x01,
  OFF   = 0x00
}SwitchState_typeDef;

enum
{
  SWITCH_0       = (UC_8)0x00U,    // Appliance Refrigarator REED.
  SWITCH_1,       
  SWITCH_2,       
  SWITCH_3,       
  SWITCH_4,       
  SWITCH_5,       
  SWITCH_6,       
  SWITCH_7,       
  SWITCH_8,       
  SWITCH_9,
  SWITCH_ALL
};



// ----------------------------------------------------------------------------
// GLOBAL VARIABLES.
// ----------------------------------------------------------------------------
typedef union
{
  struct
  {
    BOOL boSwitch1  : 1;
    BOOL boSwitch2  : 1;
    BOOL boSwitch3  : 1;
    BOOL boSwitch4  : 1;
    BOOL boSwitch5  : 1;
    BOOL boSwitch6  : 1;
    BOOL boSwitch7  : 1;
    BOOL boSwitch8  : 1;
    BOOL boSwitch9  : 1;
    
    UC_8 ucReserved : 7;
  }asBit;
  UC_8 asByte[2];
}SwitchStatus_typeDef;

extern SwitchState_typeDef gucSwitchState; //ON/OFF
extern SwitchStatus_typeDef SwitchStatus;


// ----------------------------------------------------------------------------
// GLOBAL FUNCTIONS.
// ----------------------------------------------------------------------------

extern void SwitchStatusReadAll(void);

// ----------------------------------------------------------------------------
// INTERRUPT DEFINITIONS.
// ----------------------------------------------------------------------------

//#endif // _SWITCH_H_
