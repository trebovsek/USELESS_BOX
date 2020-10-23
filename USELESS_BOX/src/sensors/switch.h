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

//SWITCH_ON or SWITCH_OFF state
typedef enum
{
  SWITCH_STATE_OFF   = (UC_8)0x00,
  SWITCH_STATE_ON    = (UC_8)0x01
}SwitchState_typeDef;

//SWITCHING_OFF state (is already in switching off mode?)
typedef enum
{
  SWITCHING_OFF_IDLE        = (UC_8)0x00,
  SWITCHING_OFF_REQUEST     = (UC_8)0x01,
  SWITCHING_OFF_IN_PROGRESS = (UC_8)0x02
}SwitchingOffMode_typeDef;


enum
{
  SWITCH_1        = (UC_8)0x00U,
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

typedef struct
{
  SwitchState_typeDef       SwitchState;       //ON/OFF STATE
  SwitchingOffMode_typeDef  SwitchingOFF;    //is SWITCH in progress for autooff?
  //buffer!!!
  
}strSwitchState;

extern strSwitchState Switch[SWITCH_ALL];

// ----------------------------------------------------------------------------
// GLOBAL VARIABLES.
// ----------------------------------------------------------------------------
typedef union
{
  struct
  {
    SwitchState_typeDef boSwitch1  : 1;
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


extern SwitchStatus_typeDef SwitchStatus;
extern SwitchState_typeDef SwitchState; //ON/OFF

// ----------------------------------------------------------------------------
// GLOBAL FUNCTIONS.
// ----------------------------------------------------------------------------

extern void SwitchInit(void);
extern void SwitchStatusReadAll(void);

// ----------------------------------------------------------------------------
// INTERRUPT DEFINITIONS.
// ----------------------------------------------------------------------------

//#endif // _SWITCH_H_
