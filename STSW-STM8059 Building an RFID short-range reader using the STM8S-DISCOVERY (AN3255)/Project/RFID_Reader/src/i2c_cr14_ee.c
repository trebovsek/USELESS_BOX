/**
  ******************************************************************************
  * @file i2c_ee.c
  * @brief This file provides a set of functions needed to manage the 
	* communication between I2C peripheral and I2C M24C64 EEPROM.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.1.0
  * @date 02/27/2009
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
#include "i2c_cr14_ee.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define I2C_Speed              100000
#define I2C1_SLAVE_ADDRESS7    0xA0
#define EEPROM_BASE_ADDRESS    0x0000
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
u8 EEPROM_ADDRESS = 0xA0;
u8 tmp1 = 0;
u8 tmp2 = 0;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief Initializes the I2C peripheral registers to communicate the CR14 EEPROM
  * @par Parameters:
  * None
  * @retval None
  * @par Required preconditions:
  * None
  */
void I2C_CR14_EEInit(void)
{
   u8 Input_Clock = 0x0;
	 
	/* Get system clock frequency */
	Input_Clock = CLK_GetClockFreq()/1000000;
		
  /* I2C Peripheral Enable */
  I2C_Cmd(ENABLE);
  /* Apply I2C configuration after enabling it */
  I2C_Init(I2C_Speed, I2C1_SLAVE_ADDRESS7, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
}

/**
  * @brief Writes more than one byte to the EEPROM with a single WRITE cycle. 
  *  The number of byte can't exceed the EEPROM page size.
  * @param[in] pBuffer Pointer to the buffer containing the data to be 
	* written to the EEPROM.
  * @param[in] WriteAddr EEPROM's internal address to write to.
  * @param[in] NumByteToWrite EEPROM's number of bytes to write to the EEPROM.  
  * @retval None
  * @par Required preconditions:
  * None
  */
void I2C_CR14_EE_PageWrite(u8* pBuffer, u16 WriteAddr, u8 NumByteToWrite)
{
  /* While the bus is busy */
  while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
  
  /* Send START condition */
  I2C_GenerateSTART(ENABLE);
  
  /* Test on EV5 and clear it */
	while((I2C->SR1 & 0x1)==0x0);
  tmp1 = I2C->SR1;

  /* Send EEPROM address for write */
  I2C_Send7bitAddress(EEPROM_ADDRESS, I2C_DIRECTION_TX);

  /* Test on EV6 and clear it */
	while((I2C->SR1 & 0x2)==0x0);
  I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED); 

  /* Send Address & wait event detection */
  I2C_SendData((u8)(WriteAddr)); /* LSB */

  /* Test on EV8 and clear it */  
  while((I2C->SR1 & 0x4)==0x0);
  tmp1 = I2C->SR1;	
	
  /* While there is data to be written */
  while(NumByteToWrite--)  
  {
    /* Send the current byte */
    I2C_SendData(*pBuffer); 

    /* Point to the next byte to be written */
    pBuffer++; 
  
    /* Test on EV8 and clear it */
	  while((I2C->SR1 & 0x4)==0x0);
		 /* Read the SR1 register */
      tmp1 = I2C->SR1;
      /* Read the SR3 register */
      tmp2 = I2C->SR3;
  }

  /* Send STOP condition */
  I2C_GenerateSTOP(ENABLE);
}

/**
  * @brief During the Radio Frequency data exchange, the CR14 disconnects
  *  from the I2C bus. The time needed to complete the exchange is not fixed
	*  as it depends on the PICC comand format. To know when the exchange is complete
	*  the bus master uses an ACK polling sequence.
  *  The number of byte can't exceed the EEPROM page size.
  * @param[in] None 
  * @retval None
  * @par Required preconditions:
  * None
  */
void I2C_CR14_EE_AckPolling(void)
{
    do
		{
       /* Delay to ensure that flags are set */
			 I2C_CR14_EE_Delay(10);
			 
			 /* Clear acknoledge failure flag */ 
			 I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
       
			 /* Generate start & wait event detection */
       I2C_GenerateSTART(ENABLE);
       
			 /* Test on EV5 and clear it */
	     while((I2C->SR1 & 0x1)==0x0);
       tmp1 = I2C->SR1;
  
       /* Send slave Address in read direction & wait event */
       I2C_Send7bitAddress(EEPROM_ADDRESS, I2C_DIRECTION_RX);
       
			 /* Waiting for end of address transmission and ACK not returned */
       while (((I2C->SR1 & 0x2) == 0x0) && ((I2C->SR2 & 0x4) == 0x0));
		
		} while ((I2C->SR2 & 0x4) == 0x4);
		
    I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);

}


/**
  * @brief Reads a block of data from the EEPROM. 
  * @param[in] pBuffer pointer to the buffer that receives the data read
  * from the EEPROM.
  * @param[in] ReadAddr CR14 EEPROM's internal address to read from.
  * @param[in] NumByteToRead CR14 EEPROM's number of bytes to read from the EEPROM.  
  * @retval None
  * @par Required preconditions:
  * None
  */

void I2C_CR14_EE_BufferRead_PostPolling(u8* pBuffer,  u8 NumByteToRead)
{  
/* While there is data to be read */
  while(NumByteToRead)  
  {
    if(NumByteToRead == 1)
    {
      /* Disable Acknowledgement */
      I2C_AcknowledgeConfig(I2C_ACK_NONE);
      
      /* Send STOP Condition */
      I2C_GenerateSTOP(ENABLE);		      
    }

    /* Test on EV7 and clear it */
//    if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
	if((I2C->SR1 & 0x4) == 0x4)
    {      
      /* Read a byte from the EEPROM */
      *pBuffer = I2C_ReceiveData();

      /* Point to the next location where the byte read will be saved */
      pBuffer++; 
      
      /* Decrement the read bytes counter */
      NumByteToRead--;        
    }   
  }

  /* Enable Acknowledgement to be ready for another reception */
  I2C_AcknowledgeConfig(I2C_ACK_CURR);
}


/**
  * @brief Delay.
  * @param[in] nCount
  * @retval 
  * None
  */
void I2C_CR14_EE_Delay(u16 nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}


/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/