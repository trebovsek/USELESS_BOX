/**
  ******************************************************************************
  * @file CSS_WDG_Robustness_Example\src\stm8s_it.c
  * @brief This file contains the interrupt vectors table for CSS_WDG Robustness 
	* optimized example
  * @author STMicroelectronics, MCD Application Team
  * @version 1.02
  * @date 18-FEB-2010
  ******************************************************************************
  *
  * THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/

#include "stm8s.h"

/**
  * @addtogroup CSS_WDG_Robustness_Example
  * @{
  */

/* button event flag */
bool ButtonPressed;
bool CSS_flag;

#ifdef _COSMIC_			/* COSMIC compiler */

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

/**
  * @brief Dummy interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
@far @interrupt void NonHandledInterrupt(void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

/**
  * @brief CLK controller interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
@far @interrupt void CLK_IRQHandler(void)
{
	CLK->CSSR &= ~CLK_CSSR_CSSD;
				
	CSS_flag = TRUE;
}


/**
  * @brief PORTB interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
@far @interrupt void PORTB_IRQHandler(void)
{
	ButtonPressed = TRUE;
}

/* startup routine */
extern void _stext();     

/* interrupt vectors table */
struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq0  */
	{0x82, NonHandledInterrupt}, /* irq1  */
	{0x82, (interrupt_handler_t)CLK_IRQHandler}, /* irq2  */
	{0x82, NonHandledInterrupt}, /* irq3  */
	{0x82, (interrupt_handler_t)PORTB_IRQHandler}, /* irq4  */
	{0x82, NonHandledInterrupt}, /* irq5  */
	{0x82, NonHandledInterrupt}, /* irq6  */
	{0x82, NonHandledInterrupt}, /* irq7  */
	{0x82, NonHandledInterrupt}, /* irq8  */
	{0x82, NonHandledInterrupt}, /* irq9  */
	{0x82, NonHandledInterrupt}, /* irq10 */
	{0x82, NonHandledInterrupt}, /* irq11 */
	{0x82, NonHandledInterrupt}, /* irq12 */
	{0x82, NonHandledInterrupt}, /* irq13 */
	{0x82, NonHandledInterrupt}, /* irq14 */
	{0x82, NonHandledInterrupt}, /* irq15 */
	{0x82, NonHandledInterrupt}, /* irq16 */
	{0x82, NonHandledInterrupt}, /* irq17 */
	{0x82, NonHandledInterrupt}, /* irq18 */
	{0x82, NonHandledInterrupt}, /* irq19 */
	{0x82, NonHandledInterrupt}, /* irq20 */
	{0x82, NonHandledInterrupt}, /* irq21 */
	{0x82, NonHandledInterrupt}, /* irq22 */
	{0x82, NonHandledInterrupt}, /* irq23 */
	{0x82, NonHandledInterrupt}, /* irq24 */
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, NonHandledInterrupt}, /* irq29 */
};

#else /* Raisonance */

/**
  * @brief TRAP interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
void TRAP_IRQHandler(void) trap
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief CLK controller interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
void CLK_IRQHandler(void) interrupt 2
{
	CLK->CSSR &= ~CLK_CSSR_CSSD;
					
	CSS_flag = TRUE;
}

/**
  * @brief PORTB interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
void PORTB_IRQHandler(void) interrupt 4
{
	ButtonPressed = TRUE;
}
#endif	/* _COSMIC_ */
/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
