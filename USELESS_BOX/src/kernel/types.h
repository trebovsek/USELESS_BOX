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

//Will be removed
//****Added Usar Dejan
typedef enum {
  RESET = 0,
  SET = !RESET
}
FlagStatus, ITStatus, BitStatus;

typedef enum {
  DISABLE = 0,
  ENABLE = !DISABLE
}
FunctionalState;

#define _IS_FUNCTIONALSTATE_OK(VALUE) ( (VALUE == ENABLE) || (VALUE == DISABLE) )

typedef enum {
  ERROR = 0,
  SUCCESS = !ERROR
}
ErrorStatus;
//****Added Usar Dejan


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

//****Added Usar Dejan
// 1 - byte volatile unsigned char
typedef volatile unsigned char VUC_8; // Unsigned char (8-bit)
//****Added Usar Dejan

// ----------------------------------------------------------------------------
// GLOBAL CONSTANTS.
// ----------------------------------------------------------------------------
// Signed char limits.
#define _SC_8_MIN  ((SC_8)-128)
#define _SC_8_MAX  ((SC_8) 127)
// Unsigned char limits.
#define _UC_8_MIN  ((UC_8)   0)
#define _UC_8_MAX  ((UC_8) 255)
// Signed int type limits.
#define _SI_16_MIN ((SI_16)-32768)
#define _SI_16_MAX ((SI_16) 32767)
// Unsigned int type limits.
#define _UI_16_MIN ((UI_16)0)
#define _UI_16_MAX ((UI_16)65535)
// Signed long type limits.
#define _SL_32_MIN ((SL_32)-2147483648)
#define _SL_32_MAX ((SL_32) 2147483647)
// Unsigned long type limits.
#define _UL_32_MIN ((UL_32)0)
#define _UL_32_MAX ((UL_32)4294967295)
// Null constant (used for initializing pointers).
#define NULL 0U

void _asm(void*);

#endif // _TYPES_H_
