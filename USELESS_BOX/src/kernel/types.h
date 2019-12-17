// ----------------------------------------------------------------------------
// PROJECT:            C-14P [C-FS600]
// ----------------------------------------------------------------------------
// MODULE NAME:        types.h
// CREATION DATE:      2007/02/28
// AUTHOR:             Timotej Globacnik
// LAST CHANGED DATE:  --
// LAST CHANGED BY:    Dejan Usar
// REVISION:           1.0
// DESCRIPTION:
//   Basic data types renamed to follow MISRA rules.
//   Added NULL pointer definition.
//   Minimum and maximum limits defined for each data type.
// ----------------------------------------------------------------------------
// Copyright (C) 2007 by Gorenje d.d.
// All rights reserved.
// ----------------------------------------------------------------------------
#ifndef _TYPES_H_
#define _TYPES_H_

// ----------------------------------------------------------------------------
// GLOBAL TYPES.
// ----------------------------------------------------------------------------
// Boolean type.
typedef enum
{
  FALSE = 0,
  TRUE  = 1
} BOOL;

// Boolean type (8 bit).
// 1 - byte integer types.
typedef signed char SC_8;           // Signed char (8 bit).
typedef unsigned char UC_8;         // Unsigned char (8 bit).
// 2 - byte integer types.
typedef signed int SI_16;           // Signed int (16 bit).
typedef unsigned int UI_16;         // Unsigned int (16 bit).
// 4 - byte integer types.
typedef signed long SL_32;          // Signed long (32 bit).
typedef unsigned long UL_32;        // Unsigned long (32 bit).
// 4 - byte real types.
typedef float SFLOAT_32;            // Signed float (32 bit).
// 1 - byte volatile unsigned char
typedef volatile unsigned char VUC_8; // Unsigned char (8-bit)






// ----------------------------------------------------------------------------
// GLOBAL CONSTANTS.
// ----------------------------------------------------------------------------

void _asm(void*);

#endif // _TYPES_H_
