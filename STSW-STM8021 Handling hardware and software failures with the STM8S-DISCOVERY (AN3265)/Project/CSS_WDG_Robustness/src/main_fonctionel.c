/**
  ******************************************************************************
  * @file CSS_WDG_Robustness_Example\src\main.c
  * @brief This file contains the main function for CSS_WDG Robustness optimized 
	* example on STM8S-Discovery.
  * @author STMicroelectronics, MCD Application Team
  * @version 1.00
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

/* General typedef -----------------------------------------------------------*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/**
  * @addtogroup CSS_WDG_Robustness_Example
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
	
/* Private define ------------------------------------------------------------*/

/* Discovery evalboard I/Os configuration */

#define mskLED1 		((u8)0x02)	
#define mskLED2 		((u8)0x04)
#define mskLED3 		((u8)0x08)
#define mskLED4			((u8)0x10)
#define mskALL_LEDs ((u8)0x1E)

#define mskBUTTON  	((u8)0x01)
#define mskEXTIsens ((u8)0x02)

#define mskHSEon		((u8)0xB4)
#define mskFhseDiv1	((u8)0xF8)
#define mskFhsiDiv1	((u8)0x07)
#define CLK_SWITCH_TIMEOUT ((u16)0x491)
#define mskCSSon		((u8)0x01)


/* Private macros ------------------------------------------------------------*/

#define switch_LED1_on			{ GPIOB->ODR |= mskLED1; }
#define switch_LED2_on			{ GPIOB->ODR |= mskLED2; }
#define switch_LED3_on			{ GPIOB->ODR |= mskLED3; }
#define switch_LED1_off			{ GPIOB->ODR &= ~mskLED1; }
#define switch_LED2_off			{ GPIOB->ODR &= ~mskLED2; }
#define switch_LED3_off			{ GPIOB->ODR &= ~mskLED3; }
#define switch_all_LEDs_on	{ GPIOB->ODR |= mskALL_LEDs; }
#define switch_all_LEDs_off	{ GPIOB->ODR &= ~mskALL_LEDs; }
#define switch_LEDs_iwdgrst_on { GPIOB->ODR |= (mskLED1 | mskLED4); }
#define switch_LEDs_iwdgrst_off { GPIOB->ODR &= (~mskLED1 & ~mskLED4); }

/* Private variables ---------------------------------------------------------*/

FunctionalState wwdg_rfr;			// flag for normal wwdog refresh blocking
u8 SystemState = 0;								// state machine current state
u32 data_address;							// first data EEPROM byte address 

/* Public variables ---------------------------------------------------------*/

extern bool ButtonPressed;

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/**
  * @brief Programable loop delay
  * @par Parameters:
  * nCnt: multiply factor of the number of loops
  * @retval None
  */
void Delay(u8 nCnt) 
{
	#ifdef _COSMIC_
	u32 nCount = nCnt*(u32)10000;
	#else
	u32 nCount = nCnt*(u32)5000;
	#endif
	
	while (nCount != 0) 
	{
		nCount--;
	}
}

/**
  * @brief Data Flash unlocking routine
  * @par Parameters: None
  * @retval None
  */
void UnlockDataFlash(void) 
{
	volatile u8 DataUnlocked = 0;
	
	/* Unlock Data memory Keys registers */		
	while( DataUnlocked == 0 )
	{
		FLASH->DUKR=0xAE;
		FLASH->DUKR=0x56;
		
		DataUnlocked = (u8)FLASH->IAPSR;	
		DataUnlocked &= FLASH_IAPSR_DUL;
	}
}

/**
  * @brief Byte Flash writing routine
  * @par Parameters:
  * add: destination adress in flash
	* data: byte to be written in flash
  * @retval None
  */
void WriteFlash_Byte(u32 add, u8 byte) 
{	
	FLASH->CR1 &= (u8)(~FLASH_CR1_FIX);		// Set Standard programming time (max 6.6 ms) 
	
	*((PointerAttr u8*) add) = byte;
}

/**
  * @brief Byte Flash reading routine
  * @par Parameters:
  * add: destination adress in flash
  * @retval Return value:
	* data: byte read in flash at address add
  */
u8 ReadFlash_Byte(u32 add) 
{
	return(*((u8*) add));
}

/* Public functions ----------------------------------------------------------*/

/**
  * @brief Main entry point.
  * @par Parameters:
  * None
  * @retval void None
  */
void main(void) 
{	
	u8 LED_counter = 0;	// local variable - slows the LEDs toggling
	u8 Dly = 1;			// local variable - main loop delay
	u16 TimeOut = CLK_SWITCH_TIMEOUT;	// local variable - timeout for master clk switching
	data_address = 0x4000;	// data EEPROM first byte address
	wwdg_rfr = ENABLE;			// enable wwdg refreshing
	
	UnlockDataFlash();			// unlock data flash for further writing
	
	//								*** CPU clock divider init ***
	CLK->CKDIVR &= mskFhsiDiv1;				// fCPU = fHSI = 16 MHz
	
	// 								*** GPIO INIT ***
	GPIOB->ODR &= ~mskALL_LEDs; 	// LEDs output settings - off
	GPIOB->DDR |= mskALL_LEDs;		// outputs
	GPIOB->CR1 |= mskALL_LEDs;		// push-pull
	
	/* BUTTON input settings: Input floating w/ interrupt */
	GPIOB->DDR |= ~mskBUTTON;			
	GPIOB->CR1 |= ~mskBUTTON; 	
	GPIOB->CR2 |= mskBUTTON;
	
	/* input pin sensibility on falling edges only */
	EXTI->CR1 &= (u8)(~EXTI_CR1_PBIS);
	EXTI->CR1 |= (u8)((u8)(mskEXTIsens) << 2);
	
	// 								*** TESTING RESET CONDITIONS ***
	if((RST->SR & RST_SR_WWDGF) != 0) // Reseted by WWDOG?
	{	
		RST->SR = RST_SR_WWDGF;					// YES - clear WWDG reset status
		ButtonPressed = FALSE;
		
		/* read state machine previous status in data EEPROM after a wwdg reset */
		SystemState = ReadFlash_Byte(data_address); 
		
		SystemState++;
		
		if( SystemState == 1 )				// entering second state
		{
			switch_all_LEDs_off;
			Delay(5);			
			switch_all_LEDs_on;					// blink 1x with all LEDs
			Delay(125);						
			switch_all_LEDs_off;				
			Delay(125);
		}
		else if( SystemState == 2 )		// entering third state
		{					
			switch_all_LEDs_off;
			Delay(5);
			switch_all_LEDs_on;
			Delay(65);						
			switch_all_LEDs_off;				// blink 2x with all LEDs (faster)
			Delay(65);						
			switch_all_LEDs_on;	
			Delay(65);						
			switch_all_LEDs_off;	
			Delay(65);
		}
		
		// 								*** Clock switch to HSE ***
		CLK->CKDIVR &= mskFhseDiv1;				// fCPU = fHSE = 16 MHz
		CLK->SWR = mskHSEon;
		
		while( !(CLK->SWCR & CLK_SWCR_SWIF)  &&  TimeOut )
			TimeOut--; 											// wait for targeted block to be ready
		
		if(TimeOut)
			CLK->SWCR|= CLK_SWCR_SWEN;					// new block is ready - make switch
		else
			CLK->SWCR &= ~CLK_SWCR_SWBSY;				// switch back to original clock source
		
		CLK->SWCR &= ~CLK_SWCR_SWIF;					// clear SWIF
	}
	
	if((RST->SR & RST_SR_IWDGF) != 0) // Reseted by IWDOG? 
	{ 
		ButtonPressed = FALSE;
		RST->SR = RST_SR_IWDGF;		// YES - clear IWDG status
		
		switch_LEDs_iwdgrst_off;
		Delay(5);
		switch_LEDs_iwdgrst_on;
		Delay(65);
		switch_LEDs_iwdgrst_off;				// blink 2x with LEDs 1 & 4
		Delay(65);
		switch_LEDs_iwdgrst_on;
		Delay(65);
		switch_LEDs_iwdgrst_off;
		
		SystemState = 0;		// re-entering first state
	}	
		
	enableInterrupts();
	
	// 								*** IWDOG INITIALIZATION (LSI 128khz/2)***		
	IWDG->KR = 0xCC;		// enable and start the iwdog counter at first
	IWDG->KR = 0x55;		// unlock iwdog configuration registers
	IWDG->PR = 0x06;		// divider /256
	IWDG->RLR = 0xFF;		// max refresh period  1.02 s
	IWDG->KR = 0xAA;		// lock iwdog registers & reload the iwdog counter
	
	// 								*** WWDOG INITIALIZATION (fcpu 16Mhz/12288) ***
	WWDG->CR= WWDG_CR_WDGA | WWDG_CR_T6 | 0x7F;	// wwdog configuration register (max refresh period ~ 49 ms )
	WWDG->WR= 0x70;															//illegal refresh window ( 15 cycles ~12.3 ms )
	
	// 								*** MAIN LOOP ***	
	while (1) 
	{				
		switch( SystemState ) //at start-up and after a complete cycle
		{	
			case 0:	// first state, WWDG demo
						
					if( ButtonPressed == TRUE ) 		// Button is pressed?
					{
						Dly +=1;							// YES - prolong the main loop
						ButtonPressed = FALSE;
							
						if( Dly > 2)
						{			
							// save next state in data EEPROM just before WWDG reset
							WriteFlash_Byte(data_address, SystemState);		 
						}
					}	
			
					if( (WWDG->CR  & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
						WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
						
					if( LED_counter < 3 )
						switch_LED1_on;			// LED 1 on 
						
					Delay(Dly);					// delay without wdogs refresh
						
					if( (WWDG->CR  & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
						WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
						
					if( LED_counter >= 3 )
						switch_LED1_off;		// LED1 off 
						
					Delay(Dly);					// delay without wdogs refresh
						
					IWDG->KR = 0xAA;			// iwdog refresh
					
					LED_counter +=1;
					LED_counter %= 6;
	
				break;
				
			case 1:	// second state, CSS (and WWDG) demo: user has to deconnect HSE quartz
			
					/* if CSS triggered switch from HSE to HSI occured, re-init prescaler for HSI */				
					if( CLK->CSSR & CLK_CSSR_AUX )
					{
						CLK->CSSR &= ~CLK_CSSR_CSSD;
						CLK->CKDIVR &= mskFhsiDiv1;				// fCPU = fHSI = 16 MHz
					}
	
					if( ButtonPressed == TRUE ) 		// Button is pressed?
					{
						ButtonPressed = FALSE;
						wwdg_rfr = DISABLE;						// stop WWDG refreshing
							
						/* save current state in data EEPROM just before WWDG reset	*/
						WriteFlash_Byte(data_address, SystemState); 				
					}	
						
					if( (WWDG->CR  & (u8)~WWDG_CR_WDGA) <= WWDG->WR && wwdg_rfr == ENABLE ) 
						WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
						
					if( LED_counter < 3 )
						switch_LED2_on;			// LED 1 on 
							
					Delay(2);					// delay without wdog refresh
			
					if( (WWDG->CR  & (u8)~WWDG_CR_WDGA) <= WWDG->WR && wwdg_rfr == ENABLE ) 
						WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
						
					if( LED_counter >= 3 )
						switch_LED2_off;		// LED1 off 
						
					Delay(2);					// delay without wdog refresh
					
					IWDG->KR = 0xAA;			// iwdog refresh 
						
					LED_counter += 1;
					LED_counter %= 6;
						
				break;
					
			case 2:	// third state, IWDG demo: user has to deconnect HSE quartz (no CSS this time)
						
					if( (WWDG->CR  & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
						WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
						
					if( LED_counter < 3 )
						switch_LED3_on;			// LED 1 on
			
					Delay(2);					// delay without wdogs refresh
						
					if( (WWDG->CR  & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
						WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
						
					IWDG->KR = 0xAA;			// iwdog refresh 
						
					if( LED_counter >= 3 )
						switch_LED3_off;		// LED2 off 
						
					Delay(2);					// delay without wdogs refresh
						
					LED_counter += 1;
					LED_counter %= 6;
						
				break;
		}
	}
}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
