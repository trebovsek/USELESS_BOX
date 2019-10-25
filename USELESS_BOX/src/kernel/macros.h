// ----------------------------------------------------------------------------
// PROJECT:            C-14P [C-FS600]
// ----------------------------------------------------------------------------
// MODULE NAME:        macros.h
// CREATION DATE:      2007/02/28
// AUTHOR:             Timotej Globacnik
// LAST CHANGED DATE:  2009/02/28
// LAST CHANGED BY:    Dejan Usar
// REVISION:           1.0
// DESCRIPTION:
//   Commonly used macros and assembler instructions.
// ----------------------------------------------------------------------------
// Copyright (C) 2007 by Gorenje d.d.
// All rights reserved.
// ----------------------------------------------------------------------------
#ifndef _MACROS_H_
#define _MACROS_H_


// ----------------------------------------------------------------------------
// GLOBAL TYPES.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL CONSTANTS.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL MACROS.
// ----------------------------------------------------------------------------
// 1 BYTE MACROS.
// Set bit B of register A.
#define _UC_BSET(Reg, Bit) (Reg |= (UC_8)((UC_8)0x01 << (UC_8)Bit))
// Reset bit B of register A.
#define _UC_BRES(Reg, Bit) (Reg &= ((UC_8)~((UC_8)((UC_8)0x01 << (UC_8)Bit))))
// Invert bit B of register A.
#define _UC_BINV(Reg, Bit) (Reg ^= (UC_8)((UC_8)0x01 << (UC_8)Bit))
// Test bit B of register A.
#define _UC_BTST(Reg, Bit) ((UC_8)Reg & (UC_8)((UC_8)0x01 << (UC_8)Bit))
// 2 BYTE MACROS.
// Set bit B of register A.
#define _UI_BSET(Reg, Bit) (Reg |= (UI_16)((UI_16)0x0001 << (UC_8)Bit))
// Reset bit B of register A.
#define _UI_BRES(Reg, Bit) \
  (Reg &= ((UI_16)~((UI_16)((UI_16)0x0001 << (UC_8)Bit))))
// Test bit B of register A.
#define _UI_BTST(Reg, Bit) ((UI_16)Reg & (UI_16)((UI_16)0x0001 << (UC_8)Bit))


//Test Dejan

#define _ChgBit(VAR, Place)         ( (VAR) ^= (UC_8)((UC_8)1<<(UC_8)(Place)) )
#define _AffBit(VAR, Place, Value)   ((Value) ? \
                                    ((VAR) |= ((UC_8)1<<(Place))) : \
                                   ((VAR) &= (((UC_8)1<<(Place))^(UC_8)255)))
#define _MskBit(Dest, Msk, Src)      \
                              ( (Dest) = ((Msk) & (Src)) | ((~(Msk)) & (Dest)) )

#define _ValBit(VAR, Place)       ((UC_8)(VAR) & (UC_8)((UC_8)1<<(UC_8)(Place)))

/*!< Returns the low byte of the 32-bit value */
#define _BYTE_0(n)                 ((UC_8)((n) & (UC_8)0xFF))
/*!< Returns the second byte of the 32-bit value */
#define _BYTE_1(n)                 ((UC_8)(_BYTE_0((n) >> (UC_8)8)))
/*!< Returns the third byte of the 32-bit value */
#define _BYTE_2(n)                 ((UC_8)(_BYTE_0((n) >> (UC_8)16)))
/*!< Returns the high byte of the 32-bit value */
#define _BYTE_3(n)                 ((UC_8)(_BYTE_0((n) >> (UC_8)24)))








// ----------------------------------------------------------------------------
// GLOBAL VARIABLES.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// GLOBAL FUNCTIONS.
// ----------------------------------------------------------------------------
// Enable global interrupts.
extern void GlobalIrqEnable(void);
// Disable global interrupts.
extern void GlobalIrqDisable(void);
// Get status of global interrupts.
//extern BOOL GlobalIrqGetStatus(void);




#endif // _MACROS_H_
