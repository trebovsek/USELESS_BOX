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

#define mskLED2 		((u8)0x02)	
#define mskLED3 		((u8)0x04)
#define mskLED4 		((u8)0x08)
#define mskLED5			((u8)0x10)
#define mskALL_LEDs ((u8)0x1E)

#define mskBUTTON  	((u8)0x01)
#define mskEXTIsens ((u8)0x02)

#define mskHSEstart		((u8)0xB4)
#define mskFhseDiv1	((u8)0xF8)
#define mskFhsiDiv1	((u8)0x07)
#define CLK_SWITCH_TIMEOUT ((u16)0x491)
#define mskCSSon		((u8)0x01)
#define mskCCOon		((u8)0x01)
#define mskCCOpin		((u8)0x01)

/* Private macros ------------------------------------------------------------*/

#define switch_LED2_on			{ GPIOB->ODR |= mskLED2; }
#define switch_LED3_on			{ GPIOB->ODR |= mskLED3; }
#define switch_LED4_on			{ GPIOB->ODR |= mskLED4; }
#define switch_LED2_off			{ GPIOB->ODR &= ~mskLED2; }
#define switch_LED3_off			{ GPIOB->ODR &= ~mskLED3; }
#define switch_LED4_off			{ GPIOB->ODR &= ~mskLED4; }
#define switch_all_LEDs_on	{ GPIOB->ODR |= mskALL_LEDs; }
#define switch_all_LEDs_off	{ GPIOB->ODR &= ~mskALL_LEDs; }
#define switch_LEDs_softrst_on { GPIOB->ODR |= (mskLED3 | mskLED4); }
#define switch_LEDs_softrst_off { GPIOB->ODR &= (~mskLED3 & ~mskLED4); }
#define switch_LEDs_iwdgrst_on { GPIOB->ODR |= (mskLED2 | mskLED5); }
#define switch_LEDs_iwdgrst_off { GPIOB->ODR &= (~mskLED2 & ~mskLED5); }

/* Private variables ---------------------------------------------------------*/

u8 SystemState;								// state machine current state
u32 data_address;							// first data EEPROM byte address 

/* Public variables ---------------------------------------------------------*/

extern bool ButtonPressed;
extern bool CSS_flag;

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

/**
  * @brief Reset handling routine
  * @par Parameters: None
  * @retval: None
  */
void ResetHandling(u16 time_out) 
{	
	// 								*** TESTING RESET CONDITIONS ***
	if((RST->SR & RST_SR_WWDGF) != 0) // Reset by WWDOG?
	{	
		RST->SR = RST_SR_WWDGF;					// YES - clear WWDG reset status
		ButtonPressed = FALSE;
		
		// 								*** Clock switch to HSE ***
		CLK->CKDIVR &= mskFhseDiv1;				// fCPU = fHSE = 16 MHz
		CLK->SWR = mskHSEstart;
		
		while( !(CLK->SWCR & CLK_SWCR_SWIF) & time_out )
			time_out--; 											// wait for targeted clock to be ready
		
		if(time_out)
			CLK->SWCR|= CLK_SWCR_SWEN;					// new block is ready - make switch
		else
			CLK->SWCR &= ~CLK_SWCR_SWBSY;				// switch back to original clock source
		
		CLK->SWCR &= ~CLK_SWCR_SWIF;					// clear SWIF		
		
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
	
			CLK->CSSR |= CLK_CSSR_CSSDIE;	// enable CSS interrupts
			CLK->CSSR |= mskCSSon;				// activate CSS
		}
		else if( SystemState == 3 )		// entering fourth state
		{					
			switch_LEDs_softrst_off;
			Delay(5);
			switch_LEDs_softrst_on;
			Delay(65);						
			switch_LEDs_softrst_off;				// blink 2x with LEDs 3 & 4
			Delay(65);						
			switch_LEDs_softrst_on;	
			Delay(65);						
			switch_LEDs_softrst_off;	
			Delay(65);	
		}
	}
	else if((RST->SR & RST_SR_IWDGF) != 0) // Reset by IWDOG? 
	{ 
		ButtonPressed = FALSE;
		RST->SR = RST_SR_IWDGF;		// YES - clear IWDG status
		
		switch_LEDs_iwdgrst_off;
		Delay(5);
		switch_LEDs_iwdgrst_on;
		Delay(65);
		switch_LEDs_iwdgrst_off;				// blink 2x with LEDs 2 & 5
		Delay(65);
		switch_LEDs_iwdgrst_on;
		Delay(65);
		switch_LEDs_iwdgrst_off;
		
		SystemState = 0;		// re-entering first state
	}
	else
		SystemState = 0;	// first execution
}

/**
  * @brief state machine routine
  * @par Parameters: None
  * @retval None
  */
void State_Machine(u8 *LED_cnt, u8 *loop_delay) 
{	
	switch( SystemState ) //at start-up and after a complete cycle
	{	
		case 0:	// first state, WWDG demo
					
				if( ButtonPressed == TRUE ) 		// Button has been pressed?
				{
					*loop_delay += 1;							// YES - increase the delay duration
					ButtonPressed = FALSE;
						
					if( *loop_delay > 2)
					{			
						// save current state in data EEPROM just before WWDG reset
						WriteFlash_Byte(data_address, SystemState);		 
					}
				}	
		
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt < 3 )
					switch_LED2_on;			// LED2 on 
					
				Delay(*loop_delay);					// delay without wdogs refresh
					
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt >= 3 )
					switch_LED2_off;		// LED2 off 
					
				Delay(*loop_delay);					// delay without wdogs refresh
					
				IWDG->KR = 0xAA;			// iwdog refresh
				
				*LED_cnt += 1;
				*LED_cnt %= 6;
				
			break;
			
		case 1:	// second state CSS demo: user has to deconnect HSE quartz
				
				if( CSS_flag == TRUE )
				{
					CSS_flag = FALSE;
					
					switch_LED4_on;
				
					SystemState = 2;
					
				}
					
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR /*&& wwdg_rfr == ENABLE */) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt < 3 )
					switch_LED3_on;			// LED3 on 
						
				Delay(2);					// delay without wdog refresh
		
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR/* && wwdg_rfr == ENABLE */) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt >= 3 )
					switch_LED3_off;		// LED3 off 
					
			  switch_LED4_off;
				Delay(2);					// delay without wdog refresh
				
				IWDG->KR = 0xAA;			// iwdog refresh 
					
				*LED_cnt += 1;
				*LED_cnt %= 6;
					
			break;
			
		case 2:	// third state, software reset after master clock switch
		
				if( ButtonPressed == TRUE ) 		// Button is pressed?
				{
					ButtonPressed = FALSE;
					
					/* save current state in data EEPROM just before WWDG reset	*/
					WriteFlash_Byte(data_address, SystemState);
					
					/*make sure the micro is not reset before the flash writing operation is complete*/
					while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) ){}
					
					WWDG->CR &= ~WWDG_CR_T6;			//triggers a software reset
				}	
					
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt < 3 )
					switch_LED3_on;			// LED3 on 
						
				Delay(2);					// delay without wdog refresh
		
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt >= 3 )
					switch_LED3_off;		// LED3 off 
					
				Delay(2);					// delay without wdog refresh
				
				IWDG->KR = 0xAA;			// iwdog refresh 
					
				*LED_cnt += 1;
				*LED_cnt %= 6;
					
			break;
				
		case 3:	// fourth state, IWDG demo: user has to deconnect HSE quartz (no CSS this time)
					
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				if( *LED_cnt < 3 )
					switch_LED4_on;			// LED4 on
		
				Delay(2);					// delay without wdogs refresh
					
				if( (WWDG->CR & (u8)~WWDG_CR_WDGA) <= WWDG->WR ) 
					WWDG->CR= (0x7F | WWDG_CR_WDGA | WWDG_CR_T6);	// wwdog refresh at the end of the legal window
					
				IWDG->KR = 0xAA;			// iwdog refresh 
					
				if( *LED_cnt >= 3 )
					switch_LED4_off;		// LED4 off 
					
				Delay(2);					// delay without wdogs refresh
					
				*LED_cnt += 1;
				*LED_cnt %= 6;
					
			break;
			
		default:
			break;
	}
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
	u8 Dly = 1;			// local variable - delay between two WDG refreshes in state 1
	u16 TimeOut = CLK_SWITCH_TIMEOUT;	// local variable - timeout for master clk switching
	data_address = 0x4000;	// data EEPROM first byte address
	
	UnlockDataFlash();			// unlock data flash for further writing
	
	//								*** CPU clock divider init ***
	CLK->CKDIVR &= mskFhsiDiv1;				// fCPU = fHSI = 16 MHz
	
	// 								*** GPIO INIT ***
	GPIOB->ODR &= ~mskALL_LEDs; 	// LEDs output settings - off
	GPIOB->DDR |= mskALL_LEDs;		// outputs
	GPIOB->CR1 |= mskALL_LEDs;		// push-pull

	/* CCO pin output push-pull */
	GPIOE->DDR |= mskCCOpin;		// output
	GPIOE->CR1 |= mskCCOpin;		// push-pull
	
	/* BUTTON input settings: Input pull-up w/ interrupt */
	GPIOB->DDR &= ~mskBUTTON;
	GPIOB->CR1 |= mskBUTTON; 	
	GPIOB->CR2 |= mskBUTTON;
	
	// 								*** EXTI INIT ***
	/* input pin sensibility on falling edges only */
	EXTI->CR1 &= (u8)(~EXTI_CR1_PBIS);
	EXTI->CR1 |= (u8)((u8)(mskEXTIsens) << 2);
	
	// 								*** CCO INIT ***
	CLK->CCOR |= CLK_CCOR_CCOSEL & (0xF << 1); //select fCPU as CCO source
	CLK->CCOR |= mskCCOon; 										 //enable CCO
	
	ResetHandling(TimeOut);
		
	enableInterrupts();
	
	// 								*** IWDOG INITIALIZATION (LSI 128khz/2)***		
	IWDG->KR = 0xCC;		// enable and start the iwdog counter at first
	IWDG->KR = 0x55;		// unlock iwdog configuration registers
	IWDG->PR = 0x06;		// divider /256
	IWDG->RLR = 0xFF;		// max refresh period  1.02 s
	IWDG->KR = 0xAA;		// lock iwdog registers & reload the iwdog counter
	
	// 								*** WWDOG INITIALIZATION (fcpu 16Mhz/12288) ***
	WWDG->CR= WWDG_CR_WDGA | WWDG_CR_T6 | 0x7F;	// wwdog configuration register (max refresh period ~49 ms )
	WWDG->WR= 0x70;															//illegal refresh window ( 15 cycles ~12.3 ms )
	
	// 								*** MAIN LOOP ***	
	while (1) 
	{				
		State_Machine(&LED_counter, &Dly);
	}
}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
