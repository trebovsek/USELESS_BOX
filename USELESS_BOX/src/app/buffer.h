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

#define BUFFER_SIZE 9U //9 elements in buffer

// ----------------------------------------------------------------------------
// GLOBAL MACROS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL TYPES.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL VARIABLES.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL FUNCTIONS.
// ----------------------------------------------------------------------------

extern void BufferInit(void);
extern void BufferAddElement(void);
extern void BufferRemoveElement(void);

// ----------------------------------------------------------------------------
// INTERRUPT DEFINITIONS.
// ----------------------------------------------------------------------------

//#endif // _SWITCH_H_
