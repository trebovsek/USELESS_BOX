/**
  ******************************************************************************
  * @file I2C_EEPROM\main.c
  * @brief This file contains the main function for I2C EEPROM Read Write example.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.1.1
  * @date 06/05/2009
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "i2c_cr14_ee.h"

/**
  * @addtogroup I2C_EEPROM
  * @{
  */

/* Private define ------------------------------------------------------------*/
/* I/Os configuration */
#define LEDS_PORT (GPIOD)
#define LED1_PIN  (GPIO_PIN_0)

#define BUFFER_SIZE1  ((u8)1)
#define BUFFER_SIZE2  ((u8)2)
#define BUFFER_SIZE3  ((u8)3)
#define BUFFER_SIZE36 ((u8)36)
#define UID_SIZE      ((u8)8)

#define BASE_ADDRESS0 ((u16)0x0000)
#define BASE_ADDRESS1 ((u16)0x0001)
#define BASE_ADDRESS3 ((u16)0x0003)

/* Private typedef -----------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern u8 EEPROM_ADDRESS;
u8 Chip_ID = 0;
u8 UID[UID_SIZE]={0,0,0,0,0,0,0,0};
/* Private function prototypes -----------------------------------------------*/
void Delay (u16 nCount);
u32 LSIMeasurment(void);


/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief How to make  a write followed by a read in the E²PROM.
  * @par Examples description
	* - Write 8 bytes on the devive  (E²PROM) 0xA0.
  * - Read back the 8 bytes written on the devive  (E²PROM) 0xA0.
	* - Check the coherency between the written and read Data.
  * @par Parameters:
  * None
  * @retval 
  * None
  */

void main()
{
		u8 Buffer_size1 = BUFFER_SIZE1;
		u8 Buffer_size2 = BUFFER_SIZE2;
		u8 Buffer_size3 = BUFFER_SIZE3;

		u8 Data[36];
		
	  u8 Buffer0[BUFFER_SIZE1];
	  u8 Buffer1[BUFFER_SIZE3];
    u16 Base_Add0 = BASE_ADDRESS0;
		u16 Base_Add1 = BASE_ADDRESS1;
		u16 Base_Add3 = BASE_ADDRESS3;

    u8 i, cmpt;
//		static u8 UID[8]={0,0,0,0,0,0,0,0};

    /*** Initialization of the clock ***/
    /*** Fmaster = 16MHz divided by 4  ***/
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);

    /*** Initialize LED1_PIN in Output Mode HIGH***/
    GPIO_Init(LEDS_PORT, LED1_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
		
		/*** BEEP LSI calibration ***/    
    BEEP_LSICalibrationConfig(LSIMeasurment());

    /*** Configure beep output frequency ***/
    BEEP_Init(BEEP_FREQUENCY_4KHZ);
		
		/*** Configure wake-up time base ***/ 
		AWU_Init(AWU_TIMEBASE_512MS);
		
    /*** Optional: put here as example only ***/
    I2C_DeInit();

    /*** Initialize the I2C ***/
    I2C_CR14_EEInit();

		/*** CR14 RF on ***/
    Buffer0[0] = 0x30;		
    I2C_CR14_EE_PageWrite(Buffer0, Base_Add0, Buffer_size1);

    while(1)
    {
         Data[0]=0x00;
				
         /*** While Chip_ID not received */
				 while(Data[0]==0x0)
         {
            /*** entering active halt mode for 512ms ***/
					  halt();	
				
					  /*** Send Cmd Initiate ***/
					  Buffer1[0] = 0x02;
					  Buffer1[1] = 0x06;
					  Buffer1[2] = 0x00;
            I2C_CR14_EE_PageWrite(Buffer1, Base_Add1, Buffer_size3);
					  
						/*** Ack polling sequence             ***/
						/*** Waiting for CR14 I2C reconnected ***/
            I2C_CR14_EE_AckPolling();
						
            /*** Read the Chip_ID ***/
            I2C_CR14_EE_BufferRead_PostPolling(Data, Buffer_size3);
         }		

         /*** If Chip_ID detected  ***/
         if (Data[0] != 0x0)
         {
				    /* Save Chip ID */
	          Chip_ID = Data[1];

            /*** Send Cmd Select + Chip_ID ***/
            Buffer1[0] = 0x02;
            Buffer1[1] = 0x0E;
            Buffer1[2] = Data[1];
            I2C_CR14_EE_PageWrite(Buffer1, Base_Add1, Buffer_size3);

            /*** Ack polling sequence             ***/
				    /*** Waiting for CR14 I2C reconnected ***/
				    I2C_CR14_EE_AckPolling();

            /*** Read the Chip_ID ***/
	          I2C_CR14_EE_BufferRead_PostPolling(Data, Buffer_size2);

            /*** If TAG selected ***/
            if (Data[0] != 0x0)
            {
               /*** Switch-on led LD1 ***/
				       GPIO_WriteLow(LEDS_PORT, LED1_PIN);
							 
               /*** Emit a beep ***/				 
               BEEP_Cmd(ENABLE);
				       Delay((u16)100000);
							 
				       /*** Stop emitting the beep ***/
               BEEP_Cmd(DISABLE);
							 
				       /*** Switch-off the led LD1 ***/
				       GPIO_WriteHigh(LEDS_PORT, LED1_PIN);
							 
               /*** Send Cmd Get_UID ***/
	             Buffer1[0] = 0x01;
               Buffer1[1] = 0x0B;
               I2C_CR14_EE_PageWrite(Buffer1, Base_Add1, 0x2);
						
               /*** Ack polling sequence             ***/
				       /*** Waiting for CR14 I2C reconnected ***/
               I2C_CR14_EE_AckPolling();
						
               /*** Get UID ***/
							 I2C_CR14_EE_BufferRead_PostPolling(Data, 0x9);
						   for (i=0; i<8; i++)
							 { 
						      UID[i] = Data[i+1];
							 }							 

            }
						else
						{ 
						   cmpt = 0;
							 while(cmpt < 30)
							 {
						      GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
                  Delay(40000);
             	    cmpt++;	
						   }							
						}

         }

    }

}



/**
  * @brief Measure the LSI frequency using timer IC1 and update the calibration registers.
  * @par Parameters:
  * None
  * @retval 
	* None
  * @par Required preconditions:
  * It is recommanded to use a timer clock frequency of at least 10MHz in order 
	* to obtain a better in the LSI frequency measurement.
  */
u32 LSIMeasurment(void)
{

  u32 lsi_freq_hz = 0x0;
  u32 fmaster = 0x0;
  u16 ICValue1 = 0x0;
  u16 ICValue2 = 0x0;

  /* Get master frequency */
  fmaster = CLK_GetClockFreq();

  /* Enable the LSI measurement: LSI clock connected to timer Input Capture 1 */
  AWU->CSR |= AWU_CSR_MSR;

#if defined (STM8S903) || defined (STM8S103)
  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV8, 0);
	
  /* Enable TIM1 */
  TIM1_Cmd(ENABLE);
  
  /* wait a capture on cc1 */
  while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM1_GetCapture1();
  TIM1_ClearFlag(TIM1_FLAG_CC1);
  
  /* wait a capture on cc1 */
  while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue2 = TIM1_GetCapture1();
  TIM1_ClearFlag(TIM1_FLAG_CC1);
  
  /* Disable IC1 input capture */
  TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1E);
  /* Disable timer2 */
  TIM1_Cmd(DISABLE);
  
#else  
  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
  TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI, TIM3_ICPSC_DIV8, 0);

  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);

	/* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
	/* Get CCR1 value*/
  ICValue1 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
    /* Get CCR1 value*/
  ICValue2 = TIM3_GetCapture1();
	TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
  /* Disable timer3 */
  TIM3_Cmd(DISABLE);
#endif

  /* Compute LSI clock frequency */
  lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
  
  /* Disable the LSI measurement: LSI clock disconnected from timer Input Capture 1 */
  AWU->CSR &= (u8)(~AWU_CSR_MSR);

 return (lsi_freq_hz);
}


/**
  * @brief Delay.
  * @param[in] nCount
  * @retval 
  * None
  */
void Delay(u16 nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}


#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval 
  * None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/