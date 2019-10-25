/**
  ******************************************************************************
  * @file stm8s_map.h
  * @brief This file contains all HW registers definitions and memory mapping.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.1
  * @date 09/22/2008
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2008 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8S_MAP_H
#define __STM8S_MAP_H

/* Includes ------------------------------------------------------------------*/
#include "../kernel/stm8s_conf.h"


/* Exported types ------------------------------------------------------------*/

/** @addtogroup MAP_FILE_Exported_Types_and_Constants
  * @{
  */

/******************************************************************************/
/*                          IP registers structures                           */
/******************************************************************************/

/*----------------------------------------------------------------------------*/
/**
  * @brief Analog to Digital Converter (ADC1)
  */

typedef struct ADC1_struct
{
  VUC_8 DB0RH;     /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB0RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB1RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB1RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB2RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB2RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB3RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB3RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB4RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB4RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB5RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB5RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB6RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB6RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB7RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB7RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB8RH;     /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB8RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 DB9RH;      /*!< ADC1 Data Buffer Register (MSB)  */
  VUC_8 DB9RL;      /*!< ADC1 Data Buffer Register (LSB)  */
  VUC_8 RESERVED[12]; /*!< Reserved byte */
  VUC_8 CSR;        /*!< ADC1 control status register */
  VUC_8 CR1;        /*!< ADC1 configuration register 1 */
  VUC_8 CR2;        /*!< ADC1 configuration register 2 */
  VUC_8 CR3;    /*!< ADC1 configuration register 3  */
  VUC_8 DRH;        /*!< ADC1 Data high */
  VUC_8 DRL;        /*!< ADC1 Data low */
  VUC_8 TDRH;       /*!< ADC1 Schmitt trigger disable register high  */
  VUC_8 TDRL;       /*!< ADC1 Schmitt trigger disable register low */
  VUC_8 HTRH;   /*!< ADC1 high threshold register high*/
  VUC_8 HTRL;   /*!< ADC1 high threshold register low*/
  VUC_8 LTRH;   /*!< ADC1 low threshold register high */
  VUC_8 LTRL;   /*!< ADC1 low threshold register low */
  VUC_8 AWSRH;   /*!< ADC1 watchdog status register high */
  VUC_8 AWSRL;   /*!< ADC1 watchdog status register low */
  VUC_8 AWCRH;   /*!< ADC1 watchdog control register high */
  VUC_8 AWCRL;   /*!< ADC1 watchdog control register low */
}
ADC1_TypeDef;

/** @addtogroup ADC1_Registers_Reset_Value
  * @{
  */

#define  ADC1_CSR_RESET_VALUE  ((UC_8)0x00)
#define  ADC1_CR1_RESET_VALUE  ((UC_8)0x00)
#define  ADC1_CR2_RESET_VALUE  ((UC_8)0x00)
#define  ADC1_CR3_RESET_VALUE  ((UC_8)0x00)
#define  ADC1_TDRL_RESET_VALUE ((UC_8)0x00)
#define  ADC1_TDRH_RESET_VALUE ((UC_8)0x00)
#define  ADC1_HTRL_RESET_VALUE ((UC_8)0xFF)
#define  ADC1_HTRH_RESET_VALUE ((UC_8)0x03)
#define  ADC1_LTRH_RESET_VALUE ((UC_8)0x00)
#define  ADC1_LTRL_RESET_VALUE ((UC_8)0x00)
#define  ADC1_AWCRH_RESET_VALUE ((UC_8)0x00)
#define  ADC1_AWCRL_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup ADC1_Registers_Bits_Definition
  * @{
  */

#define ADC1_CSR_EOC  ((UC_8)0x80) /*!< End of Conversion mask */
#define ADC1_CSR_AWD  ((UC_8)0x40) /*!< Analog Watch Dog Status mask */
#define ADC1_CSR_EOCIE ((UC_8)0x20) /*!< Interrupt Enable for EOC mask */
#define ADC1_CSR_AWDIE ((UC_8)0x10) /*!< Analog Watchdog interrupt enable mask */
#define ADC1_CSR_CH   ((UC_8)0x0F) /*!< Channel selection bits mask */

#define ADC1_CR1_SPSEL ((UC_8)0x70) /*!< Prescaler selectiont mask */
#define ADC1_CR1_CONT  ((UC_8)0x02) /*!< Continuous conversion mask */
#define ADC1_CR1_ADON  ((UC_8)0x01) /*!< A/D Converter on/off mask */

#define ADC1_CR2_EXTTRIG ((UC_8)0x40) /*!< External trigger enable mask */
#define ADC1_CR2_EXTSEL  ((UC_8)0x30) /*!< External event selection mask */
#define ADC1_CR2_ALIGN   ((UC_8)0x08) /*!< Data Alignment mask */
#define ADC1_CR2_SCAN   ((UC_8)0x02) /*!< Scan mode mask */

#define ADC1_CR3_DBUF   ((UC_8)0x80) /*!< Data Buffer Enable mask */
#define ADC1_CR3_OVR    ((UC_8)0x40) /*!< Overrun Status Flag mask */

/**
  * @}
  */
/*----------------------------------------------------------------------------*/
/**
  * @brief Analog to Digital Converter (ADC2)
  */

typedef struct ADC2_struct
{
  VUC_8 CSR;        /*!< ADC2 control status register */
  VUC_8 CR1;        /*!< ADC2 configuration register 1 */
  VUC_8 CR2;        /*!< ADC2 configuration register 2 */
  VUC_8 RESERVED;   /*!< Reserved byte */
  VUC_8 DRH;        /*!< ADC2 Data high */
  VUC_8 DRL;        /*!< ADC2 Data low */
  VUC_8 TDRH;       /*!< ADC2 Schmitt trigger disable register high  */
  VUC_8 TDRL;       /*!< ADC2 Schmitt trigger disable register low */
}
ADC2_TypeDef;

/** @addtogroup ADC2_Registers_Reset_Value
  * @{
  */

#define  ADC2_CSR_RESET_VALUE  ((UC_8)0x00)
#define  ADC2_CR1_RESET_VALUE  ((UC_8)0x00)
#define  ADC2_CR2_RESET_VALUE  ((UC_8)0x00)
#define  ADC2_TDRL_RESET_VALUE ((UC_8)0x00)
#define  ADC2_TDRH_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup ADC2_Registers_Bits_Definition
  * @{
  */

#define ADC2_CSR_EOC  ((UC_8)0x80) /*!< End of Conversion mask */
#define ADC2_CSR_EOCIE ((UC_8)0x20) /*!< Interrupt Enable for EOC mask */
#define ADC2_CSR_CH   ((UC_8)0x0F) /*!< Channel selection bits mask */

#define ADC2_CR1_SPSEL ((UC_8)0x70) /*!< Prescaler selectiont mask */
#define ADC2_CR1_CONT  ((UC_8)0x02) /*!< Continuous conversion mask */
#define ADC2_CR1_ADON  ((UC_8)0x01) /*!< A/D Converter on/off mask */

#define ADC2_CR2_EXTTRIG ((UC_8)0x40) /*!< External trigger enable mask */
#define ADC2_CR2_EXTSEL  ((UC_8)0x30) /*!< External event selection mask */
#define ADC2_CR2_ALIGN   ((UC_8)0x08) /*!< Data Alignment mask */

/**
  * @}
  */
/*----------------------------------------------------------------------------*/
/**
  * @brief Auto Wake Up (AWU) peripheral registers.
  */

typedef struct AWU_struct
{
  VUC_8 CSR; /*!< AWU Control status register */
  VUC_8 APR; /*!< AWU Asynchronous prescalar buffer */
  VUC_8 TBR; /*!< AWU Time base selection register */
}
AWU_TypeDef;

/** @addtogroup AWU_Registers_Reset_Value
  * @{
  */

#define AWU_CSR_RESET_VALUE ((UC_8)0x00)
#define AWU_APR_RESET_VALUE ((UC_8)0x3F)
#define AWU_TBR_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup AWU_Registers_Bits_Definition
  * @{
  */

#define AWU_CSR_AWUF  ((UC_8)0x20) /*!< Interrupt flag mask */
#define AWU_CSR_AWUEN ((UC_8)0x10) /*!< Auto Wake-up enable mask */
#define AWU_CSR_MR    ((UC_8)0x02) /*!< Master Reset mask */
#define AWU_CSR_MSR   ((UC_8)0x01) /*!< Measurement enable mask */

#define AWU_APR_APR ((UC_8)0x3F) /*!< Asynchronous Prescaler divider mask */

#define AWU_TBR_AWUTB ((UC_8)0x0F) /*!< Timebase selection mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Beeper (BEEP) peripheral registers.
  */

typedef struct BEEP_struct
{
  VUC_8 CSR; /*!< BEEP Control status register */
}
BEEP_TypeDef;

/** @addtogroup BEEP_Registers_Reset_Value
  * @{
  */

#define BEEP_CSR_RESET_VALUE ((UC_8)0x1F)

/**
  * @}
  */

/** @addtogroup BEEP_Registers_Bits_Definition
  * @{
  */

#define BEEP_CSR_BEEPSEL ((UC_8)0xC0) /*!< Beeper frequency selection mask */
#define BEEP_CSR_BEEPEN  ((UC_8)0x20) /*!< Beeper enable mask */
#define BEEP_CSR_BEEPDIV ((UC_8)0x1F) /*!< Beeper Divider prescalar mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Clock Controller (CLK)
  */

typedef struct CLK_struct
{
  VUC_8 ICKR;     /*!< Internal Clocks Control Register */
  VUC_8 ECKR;     /*!< External Clocks Control Register */
  VUC_8 RESERVED; /*!< Reserved byte */
  VUC_8 CMSR;     /*!< Clock Master Status Register */
  VUC_8 SWR;      /*!< Clock Master Switch Register */
  VUC_8 SWCR;     /*!< Switch Control Register */
  VUC_8 CKDIVR;   /*!< Clock Divider Register */
  VUC_8 PCKENR1;  /*!< Peripheral Clock Gating Register 1 */
  VUC_8 CSSR;     /*!< Clock Security SyTDRH Register */
  VUC_8 CCOR;     /*!< Configurable Clock Output Register */
  VUC_8 PCKENR2;  /*!< Peripheral Clock Gating Register 2 */
  VUC_8 CANCCR;   /*!< CAN external clock control Register */
  VUC_8 HSITRIMR; /*!< HSI Calibration Trimmer Register */
  VUC_8 SWIMCCR;  /*!< SWIM clock control register */
}
CLK_TypeDef;

/** @addtogroup CLK_Registers_Reset_Value
  * @{
  */

#define CLK_ICKR_RESET_VALUE     ((UC_8)0x01)
#define CLK_ECKR_RESET_VALUE     ((UC_8)0x00)
#define CLK_CMSR_RESET_VALUE     ((UC_8)0xE1)
#define CLK_SWR_RESET_VALUE      ((UC_8)0xE1)
#define CLK_SWCR_RESET_VALUE     ((UC_8)0x00)
#define CLK_CKDIVR_RESET_VALUE   ((UC_8)0x18)
#define CLK_PCKENR1_RESET_VALUE  ((UC_8)0xFF)
#define CLK_PCKENR2_RESET_VALUE  ((UC_8)0xFF)
#define CLK_CSSR_RESET_VALUE     ((UC_8)0x00)
#define CLK_CCOR_RESET_VALUE     ((UC_8)0x00)
#define CLK_CANCCR_RESET_VALUE   ((UC_8)0x00)
#define CLK_HSITRIMR_RESET_VALUE ((UC_8)0x00)
#define CLK_SWIMCCR_RESET_VALUE  ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup CLK_Registers_Bits_Definition
  * @{
  */

#define CLK_ICKR_SWUAH    ((UC_8)0x20) /*!< Slow Wake-up from Active Halt/Halt modes */
#define CLK_ICKR_LSIRDY ((UC_8)0x10) /*!< Low speed internal oscillator ready */
#define CLK_ICKR_LSIEN  ((UC_8)0x08) /*!< Low speed internal RC oscillator enable */
#define CLK_ICKR_FHWU    ((UC_8)0x04) /*!< Fast Wake-up from Active Halt/Halt mode */
#define CLK_ICKR_HSIRDY ((UC_8)0x02) /*!< High speed internal RC oscillator ready */
#define CLK_ICKR_HSIEN  ((UC_8)0x01) /*!< High speed internal RC oscillator enable */

#define CLK_ECKR_HSERDY ((UC_8)0x02) /*!< High speed external crystal oscillator ready */
#define CLK_ECKR_HSEEN  ((UC_8)0x01) /*!< High speed external crystal oscillator enable */

#define CLK_CMSR_CKM    ((UC_8)0xFF) /*!< Clock master status bits */

#define CLK_SWR_SWI     ((UC_8)0xFF) /*!< Clock master selection bits */

#define CLK_SWCR_SWIF   ((UC_8)0x08) /*!< Clock switch interrupt flag */
#define CLK_SWCR_SWIEN  ((UC_8)0x04) /*!< Clock switch interrupt enable */
#define CLK_SWCR_SWEN   ((UC_8)0x02) /*!< Switch start/stop */
#define CLK_SWCR_SWBSY  ((UC_8)0x01) /*!< Switch busy */

#define CLK_CKDIVR_HSIDIV ((UC_8)0x18) /*!< High speed internal clock prescaler */
#define CLK_CKDIVR_CPUDIV ((UC_8)0x07) /*!< CPU clock prescaler */

#define CLK_PCKENR1_TIM1    ((UC_8)0x80) /*!< Timer 1 clock enable */ /* TBD verify if correct timer */
#define CLK_PCKENR1_TIM3    ((UC_8)0x40) /*!< Timer 3 clock enable */
#define CLK_PCKENR1_TIM2    ((UC_8)0x20) /*!< Timer 2 clock enable */
#define CLK_PCKENR1_TIM4    ((UC_8)0x10) /*!< Timer 4 clock enable */ /* TBD verify if correct timer */
#define CLK_PCKENR1_UART3 ((UC_8)0x08) /*!< UART3 clock enable */
#define CLK_PCKENR1_UART1   ((UC_8)0x04) /*!< UART1 clock enable */
#define CLK_PCKENR1_SPI     ((UC_8)0x02) /*!< SPI clock enable */
#define CLK_PCKENR1_I2C     ((UC_8)0x01) /*!< I2C clock enable */

#define CLK_PCKENR2_CAN ((UC_8)0x80) /*!< CAN clock enable */
#define CLK_PCKENR2_ADC ((UC_8)0x08) /*!< ADC clock enable */
#define CLK_PCKENR2_AWU ((UC_8)0x04) /*!< AWU clock enable */

#define CLK_CSSR_CSSD   ((UC_8)0x08) /*!< Clock security sytem detection */
#define CLK_CSSR_CSSDIE ((UC_8)0x04) /*!< Clock security system detection interrupt enable */
#define CLK_CSSR_AUX    ((UC_8)0x02) /*!< Auxiliary oscillator connected to master clock */
#define CLK_CSSR_CSSEN  ((UC_8)0x01) /*!< Clock security system enable */

#define CLK_CCOR_CCOBSY ((UC_8)0x40) /*!< Configurable clock output busy */
#define CLK_CCOR_CCORDY ((UC_8)0x20) /*!< Configurable clock output ready */
#define CLK_CCOR_CCOSEL ((UC_8)0x1E) /*!< Configurable clock output selection */
#define CLK_CCOR_CCOEN  ((UC_8)0x01) /*!< Configurable clock output enable */

#define CLK_CANCCR_CANDIV ((UC_8)0x07) /*!< External CAN clock divider */

#define CLK_HSITRIMR_HSITRIM ((UC_8)0x07) /*!< High speed internal oscillator trimmer */

#define CLK_SWIMCCR_SWIMDIV ((UC_8)0x01) /*!< SWIM Clock Dividing Factor */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 16-bit timer with complementary PWM outputs (TIM1)
  */

typedef struct TIM1_struct
{
  VUC_8 CR1;   /*!< control register 1 */
  VUC_8 CR2;   /*!< control register 2 */
  VUC_8 SMCR;  /*!< Synchro mode control register */
  VUC_8 ETR;   /*!< external trigger register */
  VUC_8 IER;   /*!< interrupt enable register*/
  VUC_8 SR1;   /*!< status register 1 */
  VUC_8 SR2;   /*!< status register 2 */
  VUC_8 EGR;   /*!< event generation register */
  VUC_8 CCMR1; /*!< CC mode register 1 */
  VUC_8 CCMR2; /*!< CC mode register 2 */
  VUC_8 CCMR3; /*!< CC mode register 3 */
  VUC_8 CCMR4; /*!< CC mode register 4 */
  VUC_8 CCER1; /*!< CC enable register 1 */
  VUC_8 CCER2; /*!< CC enable register 2 */
  VUC_8 CNTRH; /*!< counter high */
  VUC_8 CNTRL; /*!< counter low */
  VUC_8 PSCRH; /*!< prescaler high */
  VUC_8 PSCRL; /*!< prescaler low */
  VUC_8 ARRH;  /*!< auto-reload register high */
  VUC_8 ARRL;  /*!< auto-reload register low */
  VUC_8 RCR;   /*!< Repetition Counter register */
  VUC_8 CCR1H; /*!< capture/compare register 1 high */
  VUC_8 CCR1L; /*!< capture/compare register 1 low */
  VUC_8 CCR2H; /*!< capture/compare register 2 high */
  VUC_8 CCR2L; /*!< capture/compare register 2 low */
  VUC_8 CCR3H; /*!< capture/compare register 3 high */
  VUC_8 CCR3L; /*!< capture/compare register 3 low */
  VUC_8 CCR4H; /*!< capture/compare register 3 high */
  VUC_8 CCR4L; /*!< capture/compare register 3 low */
  VUC_8 BKR;   /*!< Break Register */
  VUC_8 DTR;   /*!< dead-time register */
  VUC_8 OISR;  /*!< Output idle register */
}
TIM1_TypeDef;

/** @addtogroup TIM1_Registers_Reset_Value
  * @{
  */

#define TIM1_CR1_RESET_VALUE   ((UC_8)0x00)
#define TIM1_CR2_RESET_VALUE   ((UC_8)0x00)
#define TIM1_SMCR_RESET_VALUE  ((UC_8)0x00)
#define TIM1_ETR_RESET_VALUE   ((UC_8)0x00)
#define TIM1_IER_RESET_VALUE   ((UC_8)0x00)
#define TIM1_SR1_RESET_VALUE   ((UC_8)0x00)
#define TIM1_SR2_RESET_VALUE   ((UC_8)0x00)
#define TIM1_EGR_RESET_VALUE   ((UC_8)0x00)
#define TIM1_CCMR1_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCMR2_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCMR3_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCMR4_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCER1_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCER2_RESET_VALUE ((UC_8)0x00)
#define TIM1_CNTRH_RESET_VALUE ((UC_8)0x00)
#define TIM1_CNTRL_RESET_VALUE ((UC_8)0x00)
#define TIM1_PSCRH_RESET_VALUE ((UC_8)0x00)
#define TIM1_PSCRL_RESET_VALUE ((UC_8)0x00)
#define TIM1_ARRH_RESET_VALUE  ((UC_8)0xFF)
#define TIM1_ARRL_RESET_VALUE  ((UC_8)0xFF)
#define TIM1_RCR_RESET_VALUE   ((UC_8)0x00)
#define TIM1_CCR1H_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR1L_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR2H_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR2L_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR3H_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR3L_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR4H_RESET_VALUE ((UC_8)0x00)
#define TIM1_CCR4L_RESET_VALUE ((UC_8)0x00)
#define TIM1_BKR_RESET_VALUE   ((UC_8)0x00)
#define TIM1_DTR_RESET_VALUE   ((UC_8)0x00)
#define TIM1_OISR_RESET_VALUE  ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup TIM1_Registers_Bits_Definition
  * @{
  */

#define TIM1_CR1_ARPE ((UC_8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM1_CR1_CMS  ((UC_8)0x60) /*!< Center-aligned Mode Selection mask. */
#define TIM1_CR1_DIR  ((UC_8)0x10) /*!< Direction mask. */
#define TIM1_CR1_OPM  ((UC_8)0x08) /*!< One Pulse Mode mask. */
#define TIM1_CR1_URS  ((UC_8)0x04) /*!< Update Request Source mask. */
#define TIM1_CR1_UDIS ((UC_8)0x02) /*!< Update DIsable mask. */
#define TIM1_CR1_CEN  ((UC_8)0x01) /*!< Counter Enable mask. */

#define TIM1_CR2_TI1S ((UC_8)0x80) /*!< TI1S Selection mask. */
#define TIM1_CR2_MMS  ((UC_8)0x70) /*!< MMS Selection mask. */
#define TIM1_CR2_COMS ((UC_8)0x04) /*!< Capture/Compare Control Update Selection mask. */
#define TIM1_CR2_CCPC ((UC_8)0x01) /*!< Capture/Compare Preloaded Control mask. */

#define TIM1_SMCR_MSM ((UC_8)0x80) /*!< Master/Slave Mode mask. */
#define TIM1_SMCR_TS  ((UC_8)0x70) /*!< Trigger Selection mask. */
#define TIM1_SMCR_SMS ((UC_8)0x07) /*!< Slave Mode Selection mask. */

#define TIM1_ETR_ETP  ((UC_8)0x80) /*!< External Trigger Polarity mask. */
#define TIM1_ETR_ECE  ((UC_8)0x40)/*!< External Clock mask. */
#define TIM1_ETR_ETPS ((UC_8)0x30) /*!< External Trigger Prescaler mask. */
#define TIM1_ETR_ETF  ((UC_8)0x0F) /*!< External Trigger Filter mask. */

#define TIM1_IER_BIE   ((UC_8)0x80) /*!< Break Interrupt Enable mask. */
#define TIM1_IER_TIE   ((UC_8)0x40) /*!< Trigger Interrupt Enable mask. */
#define TIM1_IER_COMIE ((UC_8)0x20) /*!<  Commutation Interrupt Enable mask.*/
#define TIM1_IER_CC4IE ((UC_8)0x10) /*!< Capture/Compare 4 Interrupt Enable mask. */
#define TIM1_IER_CC3IE ((UC_8)0x08) /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM1_IER_CC2IE ((UC_8)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM1_IER_CC1IE ((UC_8)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM1_IER_UIE   ((UC_8)0x01) /*!< Update Interrupt Enable mask. */

#define TIM1_SR1_BIF   ((UC_8)0x80) /*!< Break Interrupt Flag mask. */
#define TIM1_SR1_TIF   ((UC_8)0x40) /*!< Trigger Interrupt Flag mask. */
#define TIM1_SR1_COMIF ((UC_8)0x20) /*!< Commutation Interrupt Flag mask. */
#define TIM1_SR1_CC4IF ((UC_8)0x10) /*!< Capture/Compare 4 Interrupt Flag mask. */
#define TIM1_SR1_CC3IF ((UC_8)0x08) /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM1_SR1_CC2IF ((UC_8)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM1_SR1_CC1IF ((UC_8)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM1_SR1_UIF   ((UC_8)0x01) /*!< Update Interrupt Flag mask. */

#define TIM1_SR2_CC4OF ((UC_8)0x10) /*!< Capture/Compare 4 Overcapture Flag mask. */
#define TIM1_SR2_CC3OF ((UC_8)0x08) /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM1_SR2_CC2OF ((UC_8)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM1_SR2_CC1OF ((UC_8)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */

#define TIM1_EGR_BG   ((UC_8)0x80) /*!< Break Generation mask. */
#define TIM1_EGR_TG   ((UC_8)0x40) /*!< Trigger Generation mask. */
#define TIM1_EGR_COMG ((UC_8)0x20) /*!< Capture/Compare Control Update Generation mask. */
#define TIM1_EGR_CC4G ((UC_8)0x10) /*!< Capture/Compare 4 Generation mask. */
#define TIM1_EGR_CC3G ((UC_8)0x08) /*!< Capture/Compare 3 Generation mask. */
#define TIM1_EGR_CC2G ((UC_8)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM1_EGR_CC1G ((UC_8)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM1_EGR_UG   ((UC_8)0x01) /*!< Update Generation mask. */

#define TIM1_CCMR_ICxPSC ((UC_8)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM1_CCMR_ICxF   ((UC_8)0xF0) /*!< Input Capture x Filter mask. */
#define TIM1_CCMR_OCM    ((UC_8)0x70) /*!< Output Compare x Mode mask. */
#define TIM1_CCMR_OCxPE  ((UC_8)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM1_CCMR_OCxFE  ((UC_8)0x04) /*!< Output Compare x Fast Enable mask. */
#define TIM1_CCMR_CCxS   ((UC_8)0x03) /*!< Capture/Compare x Selection mask. */

#define CCMR_TIxDirect_Set ((UC_8)0x01)

#define TIM1_CCER1_CC2NP ((UC_8)0x80) /*!< Capture/Compare 2 Complementary output Polarity mask. */
#define TIM1_CCER1_CC2NE ((UC_8)0x40) /*!< Capture/Compare 2 Complementary output enable mask. */
#define TIM1_CCER1_CC2P  ((UC_8)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM1_CCER1_CC2E  ((UC_8)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM1_CCER1_CC1NP ((UC_8)0x08) /*!< Capture/Compare 1 Complementary output Polarity mask. */
#define TIM1_CCER1_CC1NE ((UC_8)0x04) /*!< Capture/Compare 1 Complementary output enable mask. */
#define TIM1_CCER1_CC1P  ((UC_8)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM1_CCER1_CC1E  ((UC_8)0x01) /*!< Capture/Compare 1 output enable mask. */

#define TIM1_CCER2_CC4P  ((UC_8)0x20) /*!< Capture/Compare 4 output Polarity mask. */
#define TIM1_CCER2_CC4E  ((UC_8)0x10) /*!< Capture/Compare 4 output enable mask. */
#define TIM1_CCER2_CC3NP ((UC_8)0x08) /*!< Capture/Compare 3 Complementary output Polarity mask. */
#define TIM1_CCER2_CC3NE ((UC_8)0x04) /*!< Capture/Compare 3 Complementary output enable mask. */
#define TIM1_CCER2_CC3P  ((UC_8)0x02) /*!< Capture/Compare 3 output Polarity mask. */
#define TIM1_CCER2_CC3E  ((UC_8)0x01) /*!< Capture/Compare 3 output enable mask. */

#define TIM1_CNTRH_CNT ((UC_8)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM1_CNTRL_CNT ((UC_8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM1_PSCH_PSC ((UC_8)0xFF) /*!< Prescaler Value (MSB) mask. */
#define TIM1_PSCL_PSC ((UC_8)0xFF) /*!< Prescaler Value (LSB) mask. */

#define TIM1_ARRH_ARR ((UC_8)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM1_ARRL_ARR ((UC_8)0xFF) /*!< Autoreload Value (LSB) mask. */

#define TIM1_RCR_REP ((UC_8)0xFF) /*!< Repetition Counter Value mask. */

#define TIM1_CCR1H_CCR1 ((UC_8)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM1_CCR1L_CCR1 ((UC_8)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */

#define TIM1_CCR2H_CCR2 ((UC_8)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM1_CCR2L_CCR2 ((UC_8)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */

#define TIM1_CCR3H_CCR3 ((UC_8)0xFF) /*!< Capture/Compare 3 Value (MSB) mask. */
#define TIM1_CCR3L_CCR3 ((UC_8)0xFF) /*!< Capture/Compare 3 Value (LSB) mask. */

#define TIM1_CCR4H_CCR4 ((UC_8)0xFF) /*!< Capture/Compare 4 Value (MSB) mask. */
#define TIM1_CCR4L_CCR4 ((UC_8)0xFF) /*!< Capture/Compare 4 Value (LSB) mask. */

#define TIM1_BKR_MOE  ((UC_8)0x80) /*!< Main Output Enable mask. */
#define TIM1_BKR_AOE  ((UC_8)0x40) /*!< Automatic Output Enable mask. */
#define TIM1_BKR_BKP  ((UC_8)0x20) /*!< Break Polarity mask. */
#define TIM1_BKR_BKE  ((UC_8)0x10) /*!< Break Enable mask. */
#define TIM1_BKR_OSSR ((UC_8)0x08) /*!< Off-State Selection for Run mode mask. */
#define TIM1_BKR_OSSI ((UC_8)0x04) /*!< Off-State Selection for Idle mode mask. */
#define TIM1_BKR_LOCK ((UC_8)0x03) /*!< Lock Configuration mask. */

#define TIM1_DTR_DTG ((UC_8)0xFF) /*!< Dead-Time Generator set-up mask. */

#define TIM1_OISR_OIS4  ((UC_8)0x40) /*!< Output Idle state 4 (OC4 output) mask. */
#define TIM1_OISR_OIS3N ((UC_8)0x20) /*!< Output Idle state 3 (OC3N output) mask. */
#define TIM1_OISR_OIS3  ((UC_8)0x10) /*!< Output Idle state 3 (OC3 output) mask. */
#define TIM1_OISR_OIS2N ((UC_8)0x08) /*!< Output Idle state 2 (OC2N output) mask. */
#define TIM1_OISR_OIS2  ((UC_8)0x04) /*!< Output Idle state 2 (OC2 output) mask. */
#define TIM1_OISR_OIS1N ((UC_8)0x02) /*!< Output Idle state 1 (OC1N output) mask. */
#define TIM1_OISR_OIS1  ((UC_8)0x01) /*!< Output Idle state 1 (OC1 output) mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 16-bit timer (TIM2)
  */

typedef struct TIM2_struct
{
  VUC_8 CR1;   /*!< control register 1 */
  VUC_8 IER;   /*!< interrupt enable register */
  VUC_8 SR1;   /*!< status register 1 */
  VUC_8 SR2;   /*!< status register 2 */
  VUC_8 EGR;   /*!< event generation register */
  VUC_8 CCMR1; /*!< CC mode register 1 */
  VUC_8 CCMR2; /*!< CC mode register 2 */
  VUC_8 CCMR3; /*!< CC mode register 3 */
  VUC_8 CCER1; /*!< CC enable register 1 */
  VUC_8 CCER2; /*!< CC enable register 2 */
  VUC_8 CNTRH; /*!< counter high */
  VUC_8 CNTRL; /*!< counter low */
  VUC_8 PSCR;  /*!< prescaler register */
  VUC_8 ARRH;  /*!< auto-reload register high */
  VUC_8 ARRL;  /*!< auto-reload register low */
  VUC_8 CCR1H; /*!< capture/compare register 1 high */
  VUC_8 CCR1L; /*!< capture/compare register 1 low */
  VUC_8 CCR2H; /*!< capture/compare register 2 high */
  VUC_8 CCR2L; /*!< capture/compare register 2 low */
  VUC_8 CCR3H; /*!< capture/compare register 3 high */
  VUC_8 CCR3L; /*!< capture/compare register 3 low */
}
TIM2_TypeDef;

/** @addtogroup TIM2_Registers_Reset_Value
  * @{
  */

#define TIM2_CR1_RESET_VALUE   ((UC_8)0x00)
#define TIM2_IER_RESET_VALUE   ((UC_8)0x00)
#define TIM2_SR1_RESET_VALUE   ((UC_8)0x00)
#define TIM2_SR2_RESET_VALUE   ((UC_8)0x00)
#define TIM2_EGR_RESET_VALUE   ((UC_8)0x00)
#define TIM2_CCMR1_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCMR2_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCMR3_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCER1_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCER2_RESET_VALUE ((UC_8)0x00)
#define TIM2_CNTRH_RESET_VALUE ((UC_8)0x00)
#define TIM2_CNTRL_RESET_VALUE ((UC_8)0x00)
#define TIM2_PSCR_RESET_VALUE  ((UC_8)0x00)
#define TIM2_ARRH_RESET_VALUE  ((UC_8)0xFF)
#define TIM2_ARRL_RESET_VALUE  ((UC_8)0xFF)
#define TIM2_CCR1H_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCR1L_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCR2H_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCR2L_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCR3H_RESET_VALUE ((UC_8)0x00)
#define TIM2_CCR3L_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup TIM2_Registers_Bits_Definition
  * @{
  */

#define TIM2_CR1_ARPE ((UC_8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM2_CR1_OPM  ((UC_8)0x08) /*!< One Pulse Mode mask. */
#define TIM2_CR1_URS  ((UC_8)0x04) /*!< Update Request Source mask. */
#define TIM2_CR1_UDIS ((UC_8)0x02) /*!< Update DIsable mask. */
#define TIM2_CR1_CEN  ((UC_8)0x01) /*!< Counter Enable mask. */

#define TIM2_IER_CC3IE ((UC_8)0x08) /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM2_IER_CC2IE ((UC_8)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM2_IER_CC1IE ((UC_8)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM2_IER_UIE   ((UC_8)0x01) /*!< Update Interrupt Enable mask. */

#define TIM2_SR1_CC3IF ((UC_8)0x08) /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM2_SR1_CC2IF ((UC_8)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM2_SR1_CC1IF ((UC_8)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM2_SR1_UIF   ((UC_8)0x01) /*!< Update Interrupt Flag mask. */

#define TIM2_SR2_CC3OF ((UC_8)0x08) /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM2_SR2_CC2OF ((UC_8)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM2_SR2_CC1OF ((UC_8)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */

#define TIM2_EGR_CC3G  ((UC_8)0x08) /*!< Capture/Compare 3 Generation mask. */
#define TIM2_EGR_CC2G  ((UC_8)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM2_EGR_CC1G  ((UC_8)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM2_EGR_UG    ((UC_8)0x01) /*!< Update Generation mask. */

#define TIM2_CCMR_ICxPSC ((UC_8)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM2_CCMR_ICxF   ((UC_8)0xF0) /*!< Input Capture x Filter mask. */
#define TIM2_CCMR_OCM    ((UC_8)0x70) /*!< Output Compare x Mode mask. */
#define TIM2_CCMR_OCxPE  ((UC_8)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM2_CCMR_CCxS   ((UC_8)0x03) /*!< Capture/Compare x Selection mask. */

#define TIM2_CCER1_CC2P ((UC_8)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM2_CCER1_CC2E ((UC_8)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM2_CCER1_CC1P ((UC_8)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM2_CCER1_CC1E ((UC_8)0x01) /*!< Capture/Compare 1 output enable mask. */

#define TIM2_CCER2_CC3P ((UC_8)0x02) /*!< Capture/Compare 3 output Polarity mask. */
#define TIM2_CCER2_CC3E ((UC_8)0x01) /*!< Capture/Compare 3 output enable mask. */

#define TIM2_CNTRH_CNT ((UC_8)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM2_CNTRL_CNT ((UC_8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM2_PSCR_PSC ((UC_8)0xFF) /*!< Prescaler Value (MSB) mask. */

#define TIM2_ARRH_ARR ((UC_8)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM2_ARRL_ARR ((UC_8)0xFF) /*!< Autoreload Value (LSB) mask. */

#define TIM2_CCR1H_CCR1 ((UC_8)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM2_CCR1L_CCR1 ((UC_8)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */

#define TIM2_CCR2H_CCR2 ((UC_8)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM2_CCR2L_CCR2 ((UC_8)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */

#define TIM2_CCR3H_CCR3 ((UC_8)0xFF) /*!< Capture/Compare 3 Value (MSB) mask. */
#define TIM2_CCR3L_CCR3 ((UC_8)0xFF) /*!< Capture/Compare 3 Value (LSB) mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 16-bit timer (TIM3)
  */
typedef struct TIM3_struct
{
  VUC_8 CR1;   /*!< control register 1 */
  VUC_8 IER;   /*!< interrupt enable register */
  VUC_8 SR1;   /*!< status register 1 */
  VUC_8 SR2;   /*!< status register 2 */
  VUC_8 EGR;   /*!< event generation register */
  VUC_8 CCMR1; /*!< CC mode register 1 */
  VUC_8 CCMR2; /*!< CC mode register 2 */
  VUC_8 CCER1; /*!< CC enable register 1 */
  VUC_8 CNTRH; /*!< counter high */
  VUC_8 CNTRL; /*!< counter low */
  VUC_8 PSCR;  /*!< prescaler register */
  VUC_8 ARRH;  /*!< auto-reload register high */
  VUC_8 ARRL;  /*!< auto-reload register low */
  VUC_8 CCR1H; /*!< capture/compare register 1 high */
  VUC_8 CCR1L; /*!< capture/compare register 1 low */
  VUC_8 CCR2H; /*!< capture/compare register 2 high */
  VUC_8 CCR2L; /*!< capture/compare register 2 low */
}
TIM3_TypeDef;

/** @addtogroup TIM3_Registers_Reset_Value
  * @{
  */

#define TIM3_CR1_RESET_VALUE   ((UC_8)0x00)
#define TIM3_IER_RESET_VALUE   ((UC_8)0x00)
#define TIM3_SR1_RESET_VALUE   ((UC_8)0x00)
#define TIM3_SR2_RESET_VALUE   ((UC_8)0x00)
#define TIM3_EGR_RESET_VALUE   ((UC_8)0x00)
#define TIM3_CCMR1_RESET_VALUE ((UC_8)0x00)
#define TIM3_CCMR2_RESET_VALUE ((UC_8)0x00)
#define TIM3_CCER1_RESET_VALUE ((UC_8)0x00)
#define TIM3_CNTRH_RESET_VALUE ((UC_8)0x00)
#define TIM3_CNTRL_RESET_VALUE ((UC_8)0x00)
#define TIM3_PSCR_RESET_VALUE  ((UC_8)0x00)
#define TIM3_ARRH_RESET_VALUE  ((UC_8)0xFF)
#define TIM3_ARRL_RESET_VALUE  ((UC_8)0xFF)
#define TIM3_CCR1H_RESET_VALUE ((UC_8)0x00)
#define TIM3_CCR1L_RESET_VALUE ((UC_8)0x00)
#define TIM3_CCR2H_RESET_VALUE ((UC_8)0x00)
#define TIM3_CCR2L_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup TIM3_Registers_Bits_Definition
  * @{
  */

#define TIM3_CR1_ARPE ((UC_8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM3_CR1_OPM  ((UC_8)0x08) /*!< One Pulse Mode mask. */
#define TIM3_CR1_URS  ((UC_8)0x04) /*!< Update Request Source mask. */
#define TIM3_CR1_UDIS ((UC_8)0x02) /*!< Update DIsable mask. */
#define TIM3_CR1_CEN  ((UC_8)0x01) /*!< Counter Enable mask. */

/*#define TIM3_IER_CC3IE ((UC_8)0x08)*/ /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM3_IER_CC2IE ((UC_8)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM3_IER_CC1IE ((UC_8)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM3_IER_UIE   ((UC_8)0x01) /*!< Update Interrupt Enable mask. */

/*#define TIM3_SR1_CC3IF ((UC_8)0x08)*/ /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM3_SR1_CC2IF ((UC_8)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM3_SR1_CC1IF ((UC_8)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM3_SR1_UIF   ((UC_8)0x01) /*!< Update Interrupt Flag mask. */

/*#define TIM3_SR2_CC3OF ((UC_8)0x08)*/ /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM3_SR2_CC2OF ((UC_8)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM3_SR2_CC1OF ((UC_8)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */

/*#define TIM3_EGR_CC3G ((UC_8)0x08)*/ /*!< Capture/Compare 3 Generation mask. */
#define TIM3_EGR_CC2G ((UC_8)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM3_EGR_CC1G ((UC_8)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM3_EGR_UG   ((UC_8)0x01) /*!< Update Generation mask. */

#define TIM3_CCMR_ICxPSC ((UC_8)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM3_CCMR_ICxF   ((UC_8)0xF0) /*!< Input Capture x Filter mask. */
#define TIM3_CCMR_OCM    ((UC_8)0x70) /*!< Output Compare x Mode mask. */
#define TIM3_CCMR_OCxPE  ((UC_8)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM3_CCMR_CCxS   ((UC_8)0x03) /*!< Capture/Compare x Selection mask. */

#define TIM3_CCER1_CC2P ((UC_8)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM3_CCER1_CC2E ((UC_8)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM3_CCER1_CC1P ((UC_8)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM3_CCER1_CC1E ((UC_8)0x01) /*!< Capture/Compare 1 output enable mask. */

#define TIM3_CNTRH_CNT ((UC_8)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM3_CNTRL_CNT ((UC_8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM3_PSCR_PSC ((UC_8)0xFF) /*!< Prescaler Value (MSB) mask. */

#define TIM3_ARRH_ARR ((UC_8)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM3_ARRL_ARR ((UC_8)0xFF) /*!< Autoreload Value (LSB) mask. */

#define TIM3_CCR1H_CCR1 ((UC_8)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM3_CCR1L_CCR1 ((UC_8)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */

#define TIM3_CCR2H_CCR2 ((UC_8)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM3_CCR2L_CCR2 ((UC_8)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 8-bit syTDRH timer (TIM4)
  */

typedef struct TIM4_struct
{
  VUC_8 CR1;  /*!< control register 1 */
  VUC_8 IER;  /*!< interrupt enable register */
  VUC_8 SR1;  /*!< status register 1 */
  VUC_8 EGR;  /*!< event generation register */
  VUC_8 CNTR; /*!< counter register */
  VUC_8 PSCR; /*!< prescaler register */
  VUC_8 ARR;  /*!< auto-reload register */
}
TIM4_TypeDef;

/** @addtogroup TIM4_Registers_Reset_Value
  * @{
  */

#define TIM4_CR1_RESET_VALUE  ((UC_8)0x00)
#define TIM4_IER_RESET_VALUE  ((UC_8)0x00)
#define TIM4_SR1_RESET_VALUE  ((UC_8)0x00)
#define TIM4_EGR_RESET_VALUE  ((UC_8)0x00)
#define TIM4_CNTR_RESET_VALUE ((UC_8)0x00)
#define TIM4_PSCR_RESET_VALUE ((UC_8)0x00)
#define TIM4_ARR_RESET_VALUE  ((UC_8)0xFF)

/**
  * @}
  */

/** @addtogroup TIM4_Registers_Bits_Definition
  * @{
  */

#define TIM4_CR1_ARPE ((UC_8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM4_CR1_OPM  ((UC_8)0x08) /*!< One Pulse Mode mask. */
#define TIM4_CR1_URS  ((UC_8)0x04) /*!< Update Request Source mask. */
#define TIM4_CR1_UDIS ((UC_8)0x02) /*!< Update DIsable mask. */
#define TIM4_CR1_CEN  ((UC_8)0x01) /*!< Counter Enable mask. */

#define TIM4_IER_UIE ((UC_8)0x01) /*!< Update Interrupt Enable mask. */

#define TIM4_SR1_UIF ((UC_8)0x01) /*!< Update Interrupt Flag mask. */

#define TIM4_EGR_UG ((UC_8)0x01) /*!< Update Generation mask. */

#define TIM4_CNTR_CNT ((UC_8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM4_PSCR_PSC ((UC_8)0x07) /*!< Prescaler Value  mask. */

#define TIM4_ARR_ARR ((UC_8)0xFF) /*!< Autoreload Value mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Inter-Integrated Circuit (I2C)
  */

typedef struct I2C_struct
{
  VUC_8 CR1;       /*!< I2C control register 1 */
  VUC_8 CR2;       /*!< I2C control register 2 */
  VUC_8 FREQR;     /*!< I2C frequency register */
  VUC_8 OARL;      /*!< I2C own address register LSB */
  VUC_8 OARH;      /*!< I2C own address register MSB */
  VUC_8 RESERVED1; /*!< Reserved byte */
  VUC_8 DR;        /*!< I2C data register */
  VUC_8 SR1;       /*!< I2C status register 1 */
  VUC_8 SR2;       /*!< I2C status register 2 */
  VUC_8 SR3;       /*!< I2C status register 3 */
  VUC_8 ITR;       /*!< I2C interrupt register */
  VUC_8 CCRL;      /*!< I2C clock control register low */
  VUC_8 CCRH;      /*!< I2C clock control register high */
  VUC_8 TRISER;    /*!< I2C maximum rise time register */
  VUC_8 RESERVED2; /*!< Reserved byte */
}
I2C_TypeDef;

/** @addtogroup I2C_Registers_Reset_Value
  * @{
  */

#define I2C_CR1_RESET_VALUE    ((UC_8)0x00)
#define I2C_CR2_RESET_VALUE    ((UC_8)0x00)
#define I2C_FREQR_RESET_VALUE  ((UC_8)0x00)
#define I2C_OARL_RESET_VALUE   ((UC_8)0x00)
#define I2C_OARH_RESET_VALUE   ((UC_8)0x00)
#define I2C_DR_RESET_VALUE     ((UC_8)0x00)
#define I2C_SR1_RESET_VALUE    ((UC_8)0x00)
#define I2C_SR2_RESET_VALUE    ((UC_8)0x00)
#define I2C_SR3_RESET_VALUE    ((UC_8)0x00)
#define I2C_ITR_RESET_VALUE    ((UC_8)0x00)
#define I2C_CCRL_RESET_VALUE   ((UC_8)0x00)
#define I2C_CCRH_RESET_VALUE   ((UC_8)0x00)
#define I2C_TRISER_RESET_VALUE ((UC_8)0x02)

/**
  * @}
  */

/** @addtogroup I2C_Registers_Bits_Definition
  * @{
  */

#define I2C_CR1_NOSTRETCH ((UC_8)0x80) /*!< Clock Stretching Disable (Slave mode) */
#define I2C_CR1_ENGC      ((UC_8)0x40) /*!< General Call Enable */
#define I2C_CR1_PE        ((UC_8)0x01) /*!< Peripheral Enable */

#define I2C_CR2_SWRST ((UC_8)0x80) /*!< Software Reset */
#define I2C_CR2_POS   ((UC_8)0x08) /*!< Acknowledge */
#define I2C_CR2_ACK   ((UC_8)0x04) /*!< Acknowledge Enable */
#define I2C_CR2_STOP  ((UC_8)0x02) /*!< Stop Generation */
#define I2C_CR2_START ((UC_8)0x01) /*!< Start Generation */

#define I2C_FREQR_FREQ ((UC_8)0x3F) /*!< Peripheral Clock Frequency */

#define I2C_OARL_ADD  ((UC_8)0xFE) /*!< Interface Address bits [7..1] */
#define I2C_OARL_ADD0 ((UC_8)0x01) /*!< Interface Address bit0 */

#define I2C_OARH_ADDMODE ((UC_8)0x80) /*!< Addressing Mode (Slave mode) */
#define I2C_OARH_ADDCONF ((UC_8)0x40) /*!< Address Mode Configuration */
#define I2C_OARH_ADD     ((UC_8)0x06) /*!< Interface Address bits [9..8] */

#define I2C_DR_DR ((UC_8)0xFF) /*!< Data Register */

#define I2C_SR1_TXE   ((UC_8)0x80) /*!< Data Register Empty (transmitters) */
#define I2C_SR1_RXNE  ((UC_8)0x40) /*!< Data Register not Empty (receivers) */
#define I2C_SR1_STOPF ((UC_8)0x10) /*!< Stop detection (Slave mode) */
#define I2C_SR1_ADD10 ((UC_8)0x08) /*!< 10-bit header sent (Master mode) */
#define I2C_SR1_BTF   ((UC_8)0x04) /*!< Byte Transfer Finished */
#define I2C_SR1_ADDR  ((UC_8)0x02) /*!< Address sent (master mode)/matched (slave mode) */
#define I2C_SR1_SB    ((UC_8)0x01) /*!< Start Bit (Master mode) */

#define I2C_SR2_WUFH    ((UC_8)0x20) /*!< Wake-up from Halt */
#define I2C_SR2_OVR     ((UC_8)0x08) /*!< Overrun/Underrun */
#define I2C_SR2_AF      ((UC_8)0x04) /*!< Acknowledge Failure */
#define I2C_SR2_ARLO    ((UC_8)0x02) /*!< Arbitration Lost (master mode) */
#define I2C_SR2_BERR    ((UC_8)0x01) /*!< Bus Error */

#define I2C_SR3_GENCALL ((UC_8)0x10) /*!< General Call Header (Slave mode) */
#define I2C_SR3_TRA     ((UC_8)0x04) /*!< Transmitter/Receiver */
#define I2C_SR3_BUSY    ((UC_8)0x02) /*!< Bus Busy */
#define I2C_SR3_MSL     ((UC_8)0x01) /*!< Master/Slave */

#define I2C_ITR_ITBUFEN ((UC_8)0x04) /*!< Buffer Interrupt Enable */
#define I2C_ITR_ITEVTEN ((UC_8)0x02) /*!< Event Interrupt Enable */
#define I2C_ITR_ITERREN ((UC_8)0x01) /*!< Error Interrupt Enable */

#define I2C_CCRL_CCR ((UC_8)0xFF) /*!< Clock Control Register (Master mode) */

#define I2C_CCRH_FS   ((UC_8)0x80) /*!< Master Mode Selection */
#define I2C_CCRH_DUTY ((UC_8)0x40) /*!< Fast Mode Duty Cycle */
#define I2C_CCRH_CCR  ((UC_8)0x0F) /*!< Clock Control Register in Fast/Standard mode (Master mode) bits [11..8] */

#define I2C_TRISER_TRISE ((UC_8)0x3F) /*!< Maximum Rise Time in Fast/Standard mode (Master mode) */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Interrupt Controller (ITC)
  */

typedef struct ITC_struct
{
  VUC_8 ISPR1; /*!< Interrupt Software Priority register 1 */
  VUC_8 ISPR2; /*!< Interrupt Software Priority register 2 */
  VUC_8 ISPR3; /*!< Interrupt Software Priority register 3 */
  VUC_8 ISPR4; /*!< Interrupt Software Priority register 4 */
  VUC_8 ISPR5; /*!< Interrupt Software Priority register 5 */
  VUC_8 ISPR6; /*!< Interrupt Software Priority register 6 */
  VUC_8 ISPR7; /*!< Interrupt Software Priority register 7 */
  VUC_8 ISPR8; /*!< Interrupt Software Priority register 8 */
}
ITC_TypeDef;

/** @addtogroup ITC_Registers_Reset_Value
  * @{
  */

#define ITC_SPRX_RESET_VALUE ((UC_8)0xFF) /*!< Reset value of Software Priority registers */

/**
  * @}
  */

/** @addtogroup CPU_Registers_Bits_Definition
  * @{
  */

#define CPU_CC_I1I0 ((UC_8)0x28) /*!< Condition Code register, I1 and I0 bits mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief External Interrupt Controller (EXTI)
  */

typedef struct EXTI_struct
{
  VUC_8 CR1; /*!< External Interrupt Control Register for PORTA to PORTD */
  VUC_8 CR2; /*!< External Interrupt Control Register for PORTE and TLI */
}
EXTI_TypeDef;

/** @addtogroup EXTI_Registers_Reset_Value
  * @{
  */

#define EXTI_CR1_RESET_VALUE ((UC_8)0x00)
#define EXTI_CR2_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup EXTI_Registers_Bits_Definition
  * @{
  */

#define EXTI_CR1_PDIS ((UC_8)0xC0) /*!< PORTD external interrupt sensitivity bits mask */
#define EXTI_CR1_PCIS ((UC_8)0x30) /*!< PORTC external interrupt sensitivity bits mask */
#define EXTI_CR1_PBIS ((UC_8)0x0C) /*!< PORTB external interrupt sensitivity bits mask */
#define EXTI_CR1_PAIS ((UC_8)0x03) /*!< PORTA external interrupt sensitivity bits mask */

#define EXTI_CR2_TLIS ((UC_8)0x04) /*!< Top level interrupt sensitivity bit mask */
#define EXTI_CR2_PEIS ((UC_8)0x03) /*!< PORTE external interrupt sensitivity bits mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief General Purpose I/Os (GPIO)
  */

typedef struct GPIO_struct
{
  VUC_8 ODR; /*!< Output Data Register */
  VUC_8 IDR; /*!< Input Data Register */
  VUC_8 DDR; /*!< Data Direction Register */
  VUC_8 CR1; /*!< Configuration Register 1 */
  VUC_8 CR2; /*!< Configuration Register 2 */
}
GPIO_TypeDef;

/** @addtogroup GPIO_Registers_Reset_Value
  * @{
  */

#define GPIO_ODR_RESET_VALUE ((UC_8)0x00)
#define GPIO_DDR_RESET_VALUE ((UC_8)0x00)
#define GPIO_CR1_RESET_VALUE ((UC_8)0x00)
#define GPIO_CR2_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief FLASH program and Data memory (FLASH)
  */

typedef struct FLASH_struct
{
  VUC_8 CR1;       /*!< Flash control register 1 */
  VUC_8 CR2;       /*!< Flash control register 2 */
  VUC_8 NCR2;      /*!< Flash complementary control register 2 */
  VUC_8 FPR;       /*!< Flash protection register */
  VUC_8 NFPR;      /*!< Flash complementary protection register */
  VUC_8 IAPSR;     /*!< Flash in-application programming status register */
  VUC_8 RESERVED1; /*!< Reserved byte */
  VUC_8 RESERVED2; /*!< Reserved byte */
  VUC_8 PUKR;      /*!< Flash program memory unprotection register */
  VUC_8 RESERVED3; /*!< Reserved byte */
  VUC_8 DUKR;      /*!< Data EEPROM unprotection register */
}
FLASH_TypeDef;

/** @addtogroup FLASH_Registers_Reset_Value
  * @{
  */

#define FLASH_CR1_RESET_VALUE   ((UC_8)0x00)
#define FLASH_CR2_RESET_VALUE   ((UC_8)0x00)
#define FLASH_NCR2_RESET_VALUE  ((UC_8)0xFF)
#define FLASH_IAPSR_RESET_VALUE ((UC_8)0x40)
#define FLASH_PUKR_RESET_VALUE  ((UC_8)0x00)
#define FLASH_DUKR_RESET_VALUE  ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup FLASH_Registers_Bits_Definition
  * @{
  */

#define FLASH_CR1_HALT  ((UC_8)0x08) /*!< Standby in Halt mode mask */
#define FLASH_CR1_AHALT ((UC_8)0x04) /*!< Standby in Active Halt mode mask */
#define FLASH_CR1_IE    ((UC_8)0x02) /*!< Flash Interrupt enable mask */
#define FLASH_CR1_FIX   ((UC_8)0x01) /*!< Fix programming time mask */

#define FLASH_CR2_OPT   ((UC_8)0x80) /*!< Select option byte mask */
#define FLASH_CR2_WPRG  ((UC_8)0x40) /*!< Word Programming mask */
#define FLASH_CR2_ERASE ((UC_8)0x20) /*!< Erase block mask */
#define FLASH_CR2_FPRG  ((UC_8)0x10) /*!< Fast programming mode mask */
#define FLASH_CR2_PRG   ((UC_8)0x01) /*!< Program block mask */

#define FLASH_NCR2_NOPT   ((UC_8)0x80) /*!< Select option byte mask */
#define FLASH_NCR2_NWPRG  ((UC_8)0x40) /*!< Word Programming mask */
#define FLASH_NCR2_NERASE ((UC_8)0x20) /*!< Erase block mask */
#define FLASH_NCR2_NFPRG  ((UC_8)0x10) /*!< Fast programming mode mask */
#define FLASH_NCR2_NPRG   ((UC_8)0x01) /*!< Program block mask */

#define FLASH_IAPSR_HVOFF     ((UC_8)0x40) /*!< End of high voltage flag mask */
#define FLASH_IAPSR_DUL       ((UC_8)0x08) /*!< Data EEPROM unlocked flag mask */
#define FLASH_IAPSR_EOP       ((UC_8)0x04) /*!< End of operation flag mask */
#define FLASH_IAPSR_PUL       ((UC_8)0x02) /*!< Flash Program memory unlocked flag mask */
#define FLASH_IAPSR_WR_PG_DIS ((UC_8)0x01) /*!< Write attempted to protected page mask */

#define FLASH_PUKR_PUK ((UC_8)0xFF) /*!< Flash Program memory unprotection mask */

#define FLASH_DUKR_DUK ((UC_8)0xFF) /*!< Data EEPROM unprotection mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Option Bytes (OPT)
  */
typedef struct OPT_struct
{
  VUC_8 OPT0;  /*!< Option byte 0: Read-out protection (not accessible in IAP mode) */
  VUC_8 OPT1;  /*!< Option byte 1: User boot code */
  VUC_8 NOPT1; /*!< Complementary Option byte 1 */
  VUC_8 OPT2;  /*!< Option byte 2: Alternate function remapping */
  VUC_8 NOPT2; /*!< Complementary Option byte 2 */
  VUC_8 OPT3;  /*!< Option byte 3: Watchdog option */
  VUC_8 NOPT3; /*!< Complementary Option byte 3 */
  VUC_8 OPT4;  /*!< Option byte 4: Clock option */
  VUC_8 NOPT4; /*!< Complementary Option byte 4 */
  VUC_8 OPT5;  /*!< Option byte 5: HSE clock startup */
  VUC_8 NOPT5; /*!< Complementary Option byte 5 */
  VUC_8 RESERVED1;  /*!< Reserved Option byte*/
  VUC_8 RESERVED2; /*!< Reserved Option byte*/
  VUC_8 OPT7;  /*!< Option byte 7: flash wait states */
  VUC_8 NOPT7; /*!< Complementary Option byte 7 */
}
OPT_TypeDef;

/*----------------------------------------------------------------------------*/
/**
  * @brief Independent Watchdog (IWDG)
  */

typedef struct IWDG_struct
{
  VUC_8 KR;  /*!< Key Register */
  VUC_8 PR;  /*!< Prescaler Register */
  VUC_8 RLR; /*!< Reload Register */
}
IWDG_TypeDef;

/** @addtogroup IWDG_Registers_Reset_Value
  * @{
  */

#define IWDG_PR_RESET_VALUE  ((UC_8)0x00)
#define IWDG_RLR_RESET_VALUE ((UC_8)0xFF)

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Window Watchdog (WWDG)
  */

typedef struct WWDG_struct
{
  VUC_8 CR; /*!< Control Register */
  VUC_8 WR; /*!< Window Register */
}
WWDG_TypeDef;

/** @addtogroup WWDG_Registers_Reset_Value
  * @{
  */

#define WWDG_CR_RESET_VALUE ((UC_8)0x7F)
#define WWDG_WR_RESET_VALUE ((UC_8)0x7F)

/**
  * @}
  */

/** @addtogroup WWDG_Registers_Bits_Definition
  * @{
  */

#define WWDG_CR_WDGA ((UC_8)0x80) /*!< WDGA bit mask */
#define WWDG_CR_T6   ((UC_8)0x40) /*!< T6 bit mask */
#define WWDG_CR_T    ((UC_8)0x7F) /*!< T bits mask */

#define WWDG_WR_MSB  ((UC_8)0x80) /*!< MSB bit mask */
#define WWDG_WR_W    ((UC_8)0x7F) /*!< W bits mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Reset Controller (RST)
  */

typedef struct RST_struct
{
  VUC_8 SR; /*!< Reset status register */
}
RST_TypeDef;

/** @addtogroup RST_Registers_Bits_Definition
  * @{
  */

#define RST_SR_EMCF   ((UC_8)0x10) /*!< EMC reset flag bit mask */
#define RST_SR_SWIMF  ((UC_8)0x08) /*!< SWIM reset flag bit mask */
#define RST_SR_ILLOPF ((UC_8)0x04) /*!< Illegal opcode reset flag bit mask */
#define RST_SR_IWDGF  ((UC_8)0x02) /*!< IWDG reset flag bit mask */
#define RST_SR_WWDGF  ((UC_8)0x01) /*!< WWDG reset flag bit mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Serial Peripheral Interface (SPI)
  */

typedef struct SPI_struct
{
  VUC_8 CR1;    /*!< SPI control register 1 */
  VUC_8 CR2;    /*!< SPI control register 2 */
  VUC_8 ICR;    /*!< SPI interrupt control register */
  VUC_8 SR;     /*!< SPI status register */
  VUC_8 DR;     /*!< SPI data I/O register */
  VUC_8 CRCPR;  /*!< SPI CRC polynomial register */
  VUC_8 RXCRCR; /*!< SPI Rx CRC register */
  VUC_8 TXCRCR; /*!< SPI Tx CRC register */
}
SPI_TypeDef;

/** @addtogroup SPI_Registers_Reset_Value
  * @{
  */

#define SPI_CR1_RESET_VALUE    ((UC_8)0x00) /*!< Control Register 1 reset value */
#define SPI_CR2_RESET_VALUE    ((UC_8)0x00) /*!< Control Register 2 reset value */
#define SPI_ICR_RESET_VALUE    ((UC_8)0x00) /*!< Interrupt Control Register reset value */
#define SPI_SR_RESET_VALUE     ((UC_8)0x02) /*!< Status Register reset value */
#define SPI_DR_RESET_VALUE     ((UC_8)0x00) /*!< Data Register reset value */
#define SPI_CRCPR_RESET_VALUE  ((UC_8)0x07) /*!< Polynomial Register reset value */
#define SPI_RXCRCR_RESET_VALUE ((UC_8)0x00) /*!< RX CRC Register reset value */
#define SPI_TXCRCR_RESET_VALUE ((UC_8)0x00) /*!< TX CRC Register reset value */

/**
  * @}
  */

/** @addtogroup SPI_Registers_Bits_Definition
  * @{
  */

#define SPI_CR1_LSBFIRST ((UC_8)0x80) /*!< Frame format mask */
#define SPI_CR1_SPE      ((UC_8)0x40) /*!< Enable bits mask */
#define SPI_CR1_BR       ((UC_8)0x38) /*!< Baud rate control mask */
#define SPI_CR1_MSTR     ((UC_8)0x04) /*!< Master Selection mask */
#define SPI_CR1_CPOL     ((UC_8)0x02) /*!< Clock Polarity mask */
#define SPI_CR1_CPHA     ((UC_8)0x01) /*!< Clock Phase mask */

#define SPI_CR2_BDM     ((UC_8)0x80) /*!< Bi-directional data mode enable mask */
#define SPI_CR2_BDOE       ((UC_8)0x40) /*!< Output enable in bi-directional mode mask */
#define SPI_CR2_CRCEN        ((UC_8)0x20) /*!< Hardware CRC calculation enable mask */
#define SPI_CR2_CRCNEXT      ((UC_8)0x10) /*!< Transmit CRC next mask */
#define SPI_CR2_RXONLY       ((UC_8)0x04) /*!< Receive only mask */
#define SPI_CR2_SSM          ((UC_8)0x02) /*!< Software slave management mask */
#define SPI_CR2_SSI          ((UC_8)0x01) /*!< Internal slave select mask */

#define SPI_ICR_TXEI     ((UC_8)0x80) /*!< Tx buffer empty interrupt enable mask */
#define SPI_ICR_RXEI     ((UC_8)0x40) /*!< Rx buffer empty interrupt enable mask */
#define SPI_ICR_ERRIE     ((UC_8)0x20) /*!< Error interrupt enable mask */
#define SPI_ICR_WKIE    ((UC_8)0x10) /*!< Wake-up interrupt enable mask */

#define SPI_SR_BSY    ((UC_8)0x80) /*!< Busy flag */
#define SPI_SR_OVR    ((UC_8)0x40) /*!< Overrun flag */
#define SPI_SR_MODF   ((UC_8)0x20) /*!< Mode fault */
#define SPI_SR_CRCERR ((UC_8)0x10) /*!< CRC error flag */
#define SPI_SR_WKUP   ((UC_8)0x08) /*!< Wake-Up flag */
#define SPI_SR_TXE    ((UC_8)0x02) /*!< Transmit buffer empty */
#define SPI_SR_RXNE   ((UC_8)0x01) /*!< Receive buffer not empty */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Single Wire Interface Module (SWIM)
  */
typedef struct SWIM_struct
{
  VUC_8 CSR; /*!< Control/Status register */
  VUC_8 DR;  /*!< Data register */
}
SWIM_TypeDef;

/*----------------------------------------------------------------------------*/
/**
  * @brief Universal Synchronous Asynchronous Receiver Transmitter (UART1)
  */

typedef struct UART1_struct
{
  VUC_8 SR;   /*!< UART1 status register */
  VUC_8 DR;   /*!< UART1 data register */
  VUC_8 BRR1; /*!< UART1 baud rate register */
  VUC_8 BRR2; /*!< UART1 DIV mantissa[11:8] SCIDIV fraction */
  VUC_8 CR1;  /*!< UART1 control register 1 */
  VUC_8 CR2;  /*!< UART1 control register 2 */
  VUC_8 CR3;  /*!< UART1 control register 3 */
  VUC_8 CR4;  /*!< UART1 control register 4 */
  VUC_8 CR5;  /*!< UART1 control register 5 */
  VUC_8 GTR;  /*!< UART1 guard time register */
  VUC_8 PSCR; /*!< UART1 prescaler register */
}
UART1_TypeDef;

/** @addtogroup UART1_Registers_Reset_Value
  * @{
  */

#define UART1_SR_RESET_VALUE   ((UC_8)0xC0)
#define UART1_BRR1_RESET_VALUE ((UC_8)0x00)
#define UART1_BRR2_RESET_VALUE ((UC_8)0x00)
#define UART1_CR1_RESET_VALUE  ((UC_8)0x00)
#define UART1_CR2_RESET_VALUE  ((UC_8)0x00)
#define UART1_CR3_RESET_VALUE  ((UC_8)0x00)
#define UART1_CR4_RESET_VALUE  ((UC_8)0x00)
#define UART1_CR5_RESET_VALUE  ((UC_8)0x00)
#define UART1_GTR_RESET_VALUE  ((UC_8)0x00)
#define UART1_PSCR_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup UART1_Registers_Bits_Definition
  * @{
  */

#define UART1_SR_TXE   ((UC_8)0x80) /*!< Transmit Data Register Empty mask */
#define UART1_SR_TC    ((UC_8)0x40) /*!< Transmission Complete mask */
#define UART1_SR_RXNE  ((UC_8)0x20) /*!< Read Data Register Not Empty mask */
#define UART1_SR_IDLE  ((UC_8)0x10) /*!< IDLE line detected mask */
#define UART1_SR_OR   ((UC_8)0x08) /*!< OverRun error mask */
#define UART1_SR_NF    ((UC_8)0x04) /*!< Noise Flag mask */
#define UART1_SR_FE    ((UC_8)0x02) /*!< Framing Error mask */
#define UART1_SR_PE    ((UC_8)0x01) /*!< Parity Error mask */

#define UART1_BRR1_DIVM  ((UC_8)0xFF) /*!< LSB mantissa of UART1DIV [7:0] mask */

#define UART1_BRR2_DIVM  ((UC_8)0xF0) /*!< MSB mantissa of UART1DIV [11:8] mask */
#define UART1_BRR2_DIVF  ((UC_8)0x0F) /*!< Fraction bits of UART1DIV [3:0] mask */

#define UART1_CR1_R8      ((UC_8)0x80) /*!< Receive Data bit 8 */
#define UART1_CR1_T8      ((UC_8)0x40) /*!< Transmit data bit 8 */
#define UART1_CR1_UARTD   ((UC_8)0x20) /*!< UART1 Disable (for low power consumption) */
#define UART1_CR1_M       ((UC_8)0x10) /*!< Word length mask */
#define UART1_CR1_WAKE    ((UC_8)0x08) /*!< Wake-up method mask */
#define UART1_CR1_PCEN    ((UC_8)0x04) /*!< Parity Control Enable mask */
#define UART1_CR1_PS      ((UC_8)0x02) /*!< UART1 Parity Selection */
#define UART1_CR1_PIEN    ((UC_8)0x01) /*!< UART1 Parity Interrupt Enable mask */

#define UART1_CR2_TIEN    ((UC_8)0x80) /*!< Transmitter Interrupt Enable mask */
#define UART1_CR2_TCIEN   ((UC_8)0x40) /*!< TransmissionComplete Interrupt Enable mask */
#define UART1_CR2_RIEN    ((UC_8)0x20) /*!< Receiver Interrupt Enable mask */
#define UART1_CR2_ILIEN   ((UC_8)0x10) /*!< IDLE Line Interrupt Enable mask */
#define UART1_CR2_TEN     ((UC_8)0x08) /*!< Transmitter Enable mask */
#define UART1_CR2_REN     ((UC_8)0x04) /*!< Receiver Enable mask */
#define UART1_CR2_RWU     ((UC_8)0x02) /*!< Receiver Wake-Up mask */
#define UART1_CR2_SBK     ((UC_8)0x01) /*!< Send Break mask */

#define UART1_CR3_LINEN   ((UC_8)0x40) /*!< Alternate Function outpu mask */
#define UART1_CR3_STOP    ((UC_8)0x30) /*!< STOP bits [1:0] mask */
#define UART1_CR3_CKEN    ((UC_8)0x08) /*!< Clock Enable mask */
#define UART1_CR3_CPOL    ((UC_8)0x04) /*!< Clock Polarity mask */
#define UART1_CR3_CPHA    ((UC_8)0x02) /*!< Clock Phase mask */
#define UART1_CR3_LBCL    ((UC_8)0x01) /*!< Last Bit Clock pulse mask */

#define UART1_CR4_LBDIEN  ((UC_8)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define UART1_CR4_LBDL    ((UC_8)0x20) /*!< LIN Break Detection Length mask */
#define UART1_CR4_LBDF    ((UC_8)0x10) /*!< LIN Break Detection Flag mask */
#define UART1_CR4_ADD     ((UC_8)0x0F) /*!< Address of the UART1 node mask */

#define UART1_CR5_SCEN    ((UC_8)0x20) /*!< Smart Card Enable mask */
#define UART1_CR5_NACK    ((UC_8)0x10) /*!< Smart Card Nack Enable mask */
#define UART1_CR5_HDSEL   ((UC_8)0x08) /*!< Half-Duplex Selection mask */
#define UART1_CR5_IRLP    ((UC_8)0x04) /*!< Irda Low Power Selection mask */
#define UART1_CR5_IREN    ((UC_8)0x02) /*!< Irda Enable mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Universal Synchronous Asynchronous Receiver Transmitter (UART2)
  */

typedef struct UART2_struct
{
  VUC_8 SR;   /*!< UART1 status register */
  VUC_8 DR;   /*!< UART1 data register */
  VUC_8 BRR1; /*!< UART1 baud rate register */
  VUC_8 BRR2; /*!< UART1 DIV mantissa[11:8] SCIDIV fraction */
  VUC_8 CR1;  /*!< UART1 control register 1 */
  VUC_8 CR2;  /*!< UART1 control register 2 */
  VUC_8 CR3;  /*!< UART1 control register 3 */
  VUC_8 CR4;  /*!< UART1 control register 4 */
  VUC_8 CR5;  /*!< UART1 control register 5 */
  VUC_8 CR6;  /*!< UART1 control register 6 */
  VUC_8 GTR;  /*!< UART1 guard time register */
  VUC_8 PSCR; /*!< UART1 prescaler register */
}
UART2_TypeDef;


/** @addtogroup UART2_Registers_Reset_Value
  * @{
  */

#define UART2_SR_RESET_VALUE   ((UC_8)0xC0)
#define UART2_BRR1_RESET_VALUE ((UC_8)0x00)
#define UART2_BRR2_RESET_VALUE ((UC_8)0x00)
#define UART2_CR1_RESET_VALUE  ((UC_8)0x00)
#define UART2_CR2_RESET_VALUE  ((UC_8)0x00)
#define UART2_CR3_RESET_VALUE  ((UC_8)0x00)
#define UART2_CR4_RESET_VALUE  ((UC_8)0x00)
#define UART2_CR5_RESET_VALUE  ((UC_8)0x00)
#define UART2_CR6_RESET_VALUE  ((UC_8)0x00)
#define UART2_GTR_RESET_VALUE  ((UC_8)0x00)
#define UART2_PSCR_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup UART2_Registers_Bits_Definition
  * @{
  */

#define UART2_SR_TXE   ((UC_8)0x80) /*!< Transmit Data Register Empty mask */
#define UART2_SR_TC    ((UC_8)0x40) /*!< Transmission Complete mask */
#define UART2_SR_RXNE  ((UC_8)0x20) /*!< Read Data Register Not Empty mask */
#define UART2_SR_IDLE  ((UC_8)0x10) /*!< IDLE line detected mask */
#define UART2_SR_OR   ((UC_8)0x08) /*!< OverRun error mask */
#define UART2_SR_NF    ((UC_8)0x04) /*!< Noise Flag mask */
#define UART2_SR_FE    ((UC_8)0x02) /*!< Framing Error mask */
#define UART2_SR_PE    ((UC_8)0x01) /*!< Parity Error mask */

#define UART2_BRR1_DIVM  ((UC_8)0xFF) /*!< LSB mantissa of UART2DIV [7:0] mask */

#define UART2_BRR2_DIVM  ((UC_8)0xF0) /*!< MSB mantissa of UART2DIV [11:8] mask */
#define UART2_BRR2_DIVF  ((UC_8)0x0F) /*!< Fraction bits of UART2DIV [3:0] mask */

#define UART2_CR1_R8      ((UC_8)0x80) /*!< Receive Data bit 8 */
#define UART2_CR1_T8      ((UC_8)0x40) /*!< Transmit data bit 8 */
#define UART2_CR1_UARTD   ((UC_8)0x20) /*!< UART2 Disable (for low power consumption) */
#define UART2_CR1_M       ((UC_8)0x10) /*!< Word length mask */
#define UART2_CR1_WAKE    ((UC_8)0x08) /*!< Wake-up method mask */
#define UART2_CR1_PCEN    ((UC_8)0x04) /*!< Parity Control Enable mask */
#define UART2_CR1_PS      ((UC_8)0x02) /*!< UART2 Parity Selection */
#define UART2_CR1_PIEN    ((UC_8)0x01) /*!< UART2 Parity Interrupt Enable mask */

#define UART2_CR2_TIEN    ((UC_8)0x80) /*!< Transmitter Interrupt Enable mask */
#define UART2_CR2_TCIEN   ((UC_8)0x40) /*!< TransmissionComplete Interrupt Enable mask */
#define UART2_CR2_RIEN    ((UC_8)0x20) /*!< Receiver Interrupt Enable mask */
#define UART2_CR2_ILIEN   ((UC_8)0x10) /*!< IDLE Line Interrupt Enable mask */
#define UART2_CR2_TEN     ((UC_8)0x08) /*!< Transmitter Enable mask */
#define UART2_CR2_REN     ((UC_8)0x04) /*!< Receiver Enable mask */
#define UART2_CR2_RWU     ((UC_8)0x02) /*!< Receiver Wake-Up mask */
#define UART2_CR2_SBK     ((UC_8)0x01) /*!< Send Break mask */

#define UART2_CR3_LINEN   ((UC_8)0x40) /*!< Alternate Function outpu mask */
#define UART2_CR3_STOP    ((UC_8)0x30) /*!< STOP bits [1:0] mask */
#define UART2_CR3_CKEN    ((UC_8)0x08) /*!< Clock Enable mask */
#define UART2_CR3_CPOL    ((UC_8)0x04) /*!< Clock Polarity mask */
#define UART2_CR3_CPHA    ((UC_8)0x02) /*!< Clock Phase mask */
#define UART2_CR3_LBCL    ((UC_8)0x01) /*!< Last Bit Clock pulse mask */

#define UART2_CR4_LBDIEN  ((UC_8)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define UART2_CR4_LBDL    ((UC_8)0x20) /*!< LIN Break Detection Length mask */
#define UART2_CR4_LBDF    ((UC_8)0x10) /*!< LIN Break Detection Flag mask */
#define UART2_CR4_ADD     ((UC_8)0x0F) /*!< Address of the UART2 node mask */

#define UART2_CR5_SCEN    ((UC_8)0x20) /*!< Smart Card Enable mask */
#define UART2_CR5_NACK    ((UC_8)0x10) /*!< Smart Card Nack Enable mask */
#define UART2_CR5_HDSEL   ((UC_8)0x08) /*!< Half-Duplex Selection mask */
#define UART2_CR5_IRLP    ((UC_8)0x04) /*!< Irda Low Power Selection mask */
#define UART2_CR5_IREN    ((UC_8)0x02) /*!< Irda Enable mask */

#define UART2_CR6_LDUM    ((UC_8)0x80) /*!< LIN Divider Update Method */
#define UART2_CR6_LSLV    ((UC_8)0x20) /*!< LIN Slave Enable */
#define UART2_CR6_LASE    ((UC_8)0x10) /*!< LIN Autosynchronization Enable */
#define UART2_CR6_LHDIEN  ((UC_8)0x04) /*!< LIN Header Detection Interrupt Enable */
#define UART2_CR6_LHDF    ((UC_8)0x02) /*!< LIN Header Detection Flag */
#define UART2_CR6_LSF     ((UC_8)0x01) /*!< LIN Synch Field */

/**
  * @}
  */


/*----------------------------------------------------------------------------*/
/**
  * @brief LIN Universal Asynchronous Receiver Transmitter (UART3)
  */

typedef struct UART3_struct
{
  VUC_8 SR;       /*!< status register */
  VUC_8 DR;       /*!< data register */
  VUC_8 BRR1;     /*!< baud rate register */
  VUC_8 BRR2;     /*!< DIV mantissa[11:8] SCIDIV fraction */
  VUC_8 CR1;      /*!< control register 1 */
  VUC_8 CR2;      /*!< control register 2 */
  VUC_8 CR3;      /*!< control register 3 */
  VUC_8 CR4;      /*!< control register 4 */
  VUC_8 RESERVED; /*!< Reserved byte */
  VUC_8 CR6;      /*!< control register 5 */
}
UART3_TypeDef;

/** @addtogroup UART3_Registers_Reset_Value
  * @{
  */

#define UART3_SR_RESET_VALUE   ((UC_8)0xC0)
#define UART3_BRR1_RESET_VALUE ((UC_8)0x00)
#define UART3_BRR2_RESET_VALUE ((UC_8)0x00)
#define UART3_CR1_RESET_VALUE  ((UC_8)0x00)
#define UART3_CR2_RESET_VALUE  ((UC_8)0x00)
#define UART3_CR3_RESET_VALUE  ((UC_8)0x00)
#define UART3_CR4_RESET_VALUE  ((UC_8)0x00)
#define UART3_CR6_RESET_VALUE  ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup UART3_Registers_Bits_Definition
  * @{
  */

#define UART3_SR_TXE      ((UC_8)0x80) /*!< Transmit Data Register Empty mask */
#define UART3_SR_TC       ((UC_8)0x40) /*!< Transmission Complete mask */
#define UART3_SR_RXNE     ((UC_8)0x20) /*!< Read Data Register Not Empty mask */
#define UART3_SR_IDLE     ((UC_8)0x10) /*!< IDLE line detected mask */
#define UART3_SR_OR       ((UC_8)0x08) /*!< OverRun error mask */
#define UART3_SR_NF       ((UC_8)0x04) /*!< Noise Flag mask */
#define UART3_SR_FE       ((UC_8)0x02) /*!< Framing Error mask */
#define UART3_SR_PE       ((UC_8)0x01) /*!< Parity Error mask */

#define UART3_BRR1_DIVM   ((UC_8)0xFF) /*!< LSB mantissa of UARTDIV [7:0] mask */

#define UART3_BRR2_DIVM   ((UC_8)0xF0) /*!< MSB mantissa of UARTDIV [11:8] mask */
#define UART3_BRR2_DIVF   ((UC_8)0x0F) /*!< Fraction bits of UARTDIV [3:0] mask */

#define UART3_CR1_R8      ((UC_8)0x80) /*!< Receive Data bit 8 */
#define UART3_CR1_T8      ((UC_8)0x40) /*!< Transmit data bit 8 */
#define UART3_CR1_UARTD   ((UC_8)0x20) /*!< UART Disable (for low power consumption) */
#define UART3_CR1_M       ((UC_8)0x10) /*!< Word length mask */
#define UART3_CR1_WAKE    ((UC_8)0x08) /*!< Wake-up method mask */
#define UART3_CR1_PCEN    ((UC_8)0x04) /*!< Parity control enable mask */
#define UART3_CR1_PS      ((UC_8)0x02) /*!< Parity selection bit mask */
#define UART3_CR1_PIEN    ((UC_8)0x01) /*!< Parity interrupt enable bit mask */

#define UART3_CR2_TIEN    ((UC_8)0x80) /*!< Transmitter Interrupt Enable mask */
#define UART3_CR2_TCIEN   ((UC_8)0x40) /*!< TransmissionComplete Interrupt Enable mask */
#define UART3_CR2_RIEN    ((UC_8)0x20) /*!< Receiver Interrupt Enable mask */
#define UART3_CR2_ILIEN   ((UC_8)0x10) /*!< IDLE Line Interrupt Enable mask */
#define UART3_CR2_TEN     ((UC_8)0x08) /*!< Transmitter Enable mask */
#define UART3_CR2_REN     ((UC_8)0x04) /*!< Receiver Enable mask */
#define UART3_CR2_RWU     ((UC_8)0x02) /*!< Receiver Wake-Up mask */
#define UART3_CR2_SBK     ((UC_8)0x01) /*!< Send Break mask */

#define UART3_CR3_LINEN   ((UC_8)0x40) /*!< Alternate Function outpu mask */
#define UART3_CR3_STOP    ((UC_8)0x30) /*!< STOP bits [1:0] mask */

#define UART3_CR4_LBDIEN  ((UC_8)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define UART3_CR4_LBDL    ((UC_8)0x20) /*!< LIN Break Detection Length mask */
#define UART3_CR4_LBDF    ((UC_8)0x10) /*!< LIN Break Detection Flag mask */
#define UART3_CR4_ADD     ((UC_8)0x0F) /*!< Address of the UART3 node mask */

#define UART3_CR6_LDUM    ((UC_8)0x80) /*!< LIN Divider Update Method */
#define UART3_CR6_LSLV    ((UC_8)0x20) /*!< LIN Slave Enable */
#define UART3_CR6_LASE    ((UC_8)0x10) /*!< LIN Autosynchronization Enable */
#define UART3_CR6_LHDIEN  ((UC_8)0x04) /*!< LIN Header Detection Interrupt Enable */
#define UART3_CR6_LHDF    ((UC_8)0x02) /*!< LIN Header Detection Flag */
#define UART3_CR6_LSF     ((UC_8)0x01) /*!< LIN Synch Field */

/**
  * @}
  */


/*----------------------------------------------------------------------------*/
/**
  * @brief Controller Area Network  (CAN)
  */

typedef struct
{
  VUC_8 MCR;    /*!< CAN master control register */
  VUC_8 MSR;    /*!< CAN master status register */
  VUC_8 TSR;    /*!< CAN transmit status register */
  VUC_8 TPR;    /*!< CAN transmit priority register */
  VUC_8 RFR;    /*!< CAN receive FIFO register */
  VUC_8 IER;    /*!< CAN interrupt enable register */
  VUC_8 DGR;    /*!< CAN diagnosis register */
  VUC_8 PSR;    /*!< CAN page selection register */

  union
  {
    volatile struct
    {
      UC_8 MCSR;
      UC_8 MDLCR;
      UC_8 MIDR1;
      UC_8 MIDR2;
      UC_8 MIDR3;
      UC_8 MIDR4;
      UC_8 MDAR[8];
      UC_8 MTSLR;
      UC_8 MTSHR;
    }
    TxMailbox;

  volatile struct
    {
      UC_8 FR[16];
    }
  Filter;


    volatile struct
    {
      UC_8 F0R1;
      UC_8 F0R2;
      UC_8 F0R3;
      UC_8 F0R4;
      UC_8 F0R5;
      UC_8 F0R6;
      UC_8 F0R7;
      UC_8 F0R8;

      UC_8 F1R1;
      UC_8 F1R2;
      UC_8 F1R3;
      UC_8 F1R4;
      UC_8 F1R5;
      UC_8 F1R6;
      UC_8 F1R7;
      UC_8 F1R8;
    }
    Filter01;

    volatile struct
    {
      UC_8 F2R1;
      UC_8 F2R2;
      UC_8 F2R3;
      UC_8 F2R4;
      UC_8 F2R5;
      UC_8 F2R6;
      UC_8 F2R7;
      UC_8 F2R8;

      UC_8 F3R1;
      UC_8 F3R2;
      UC_8 F3R3;
      UC_8 F3R4;
      UC_8 F3R5;
      UC_8 F3R6;
      UC_8 F3R7;
      UC_8 F3R8;
    }
    Filter23;

    volatile struct
    {
      UC_8 F4R1;
      UC_8 F4R2;
      UC_8 F4R3;
      UC_8 F4R4;
      UC_8 F4R5;
      UC_8 F4R6;
      UC_8 F4R7;
      UC_8 F4R8;

      UC_8 F5R1;
      UC_8 F5R2;
      UC_8 F5R3;
      UC_8 F5R4;
      UC_8 F5R5;
      UC_8 F5R6;
      UC_8 F5R7;
      UC_8 F5R8;
    }
    Filter45;

    volatile struct
    {
      UC_8 ESR;
      UC_8 EIER;
      UC_8 TECR;
      UC_8 RECR;
      UC_8 BTR1;
      UC_8 BTR2;
      UC_8 Reserved1[2];
      UC_8 FMR1;
      UC_8 FMR2;
      UC_8 FCR1;
      UC_8 FCR2;
      UC_8 FCR3;
      UC_8 Reserved2[3];
    }
    Config;

    volatile struct
    {
      UC_8 MFMI;
      UC_8 MDLC;
      UC_8 MIDR1;
      UC_8 MIDR2;
      UC_8 MIDR3;
      UC_8 MIDR4;
      UC_8 MDAR[8];
      UC_8 MTSLR;
      UC_8 MTSHR;
    }
    RxFIFO;
  }Page;
} CAN_TypeDef;
/** @addtogroup CAN_Registers_Bits_Definition
  * @{
  */
/*******************************Commun****************************************/
/* CAN Master Control Register bits */
#define CAN_MCR_INRQ     ((UC_8)0x01)
#define CAN_MCR_SLEEP    ((UC_8)0x02)
#define CAN_MCR_TXFP     ((UC_8)0x04)
#define CAN_MCR_RFLM     ((UC_8)0x08)
#define CAN_MCR_NART     ((UC_8)0x10)
#define CAN_MCR_AWUM     ((UC_8)0x20)
#define CAN_MCR_ABOM     ((UC_8)0x40)
#define CAN_MCR_TTCM     ((UC_8)0x80)

/* CAN Master Status Register bits */
#define CAN_MSR_INAK     ((UC_8)0x01)
#define CAN_MSR_SLAK     ((UC_8)0x02)
#define CAN_MSR_ERRI     ((UC_8)0x04)
#define CAN_MSR_WKUI     ((UC_8)0x08)
#define CAN_MSR_TX       ((UC_8)0x10)
#define CAN_MSR_RX       ((UC_8)0x20)

/* CAN Transmit Status Register bits */
#define CAN_TSR_RQCP0    ((UC_8)0x01)
#define CAN_TSR_RQCP1    ((UC_8)0x02)
#define CAN_TSR_RQCP2    ((UC_8)0x04)
#define CAN_TSR_TXOK0    ((UC_8)0x10)
#define CAN_TSR_TXOK1    ((UC_8)0x20)
#define CAN_TSR_TXOK2    ((UC_8)0x40)

#define CAN_TPR_CODE0    ((UC_8)0x01)
#define CAN_TPR_TME0     ((UC_8)0x04)
#define CAN_TPR_TME1     ((UC_8)0x08)
#define CAN_TPR_TME2     ((UC_8)0x10)
#define CAN_TPR_LOW0     ((UC_8)0x20)
#define CAN_TPR_LOW1     ((UC_8)0x40)
#define CAN_TPR_LOW2     ((UC_8)0x80)
/* CAN Receive FIFO Register bits */
#define CAN_RFR_FMP01  ((UC_8)0x03)
#define CAN_RFR_FULL   ((UC_8)0x08)
#define CAN_RFR_FOVR   ((UC_8)0x10)
#define CAN_RFR_RFOM   ((UC_8)0x20)

/* CAN Interrupt Register bits */
#define CAN_IER_TMEIE  ((UC_8)0x01)
#define CAN_IER_FMPIE0 ((UC_8)0x02)
#define CAN_IER_FFIE0  ((UC_8)0x04)
#define CAN_IER_FOVIE0 ((UC_8)0x08)
#define CAN_IER_WKUIE  ((UC_8)0x80)


/* CAN diagnostic Register bits */
#define CAN_DGR_LBKM  ((UC_8)0x01)
#define CAN_DGR_SLIM  ((UC_8)0x02)
#define CAN_DGR_SAMP  ((UC_8)0x03)
#define CAN_DGR_RX    ((UC_8)0x04)
#define CAN_DGR_3TX   ((UC_8)0x08)


/* CAN page select Register bits */
#define CAN_PSR_PS0  ((UC_8)0x01)
#define CAN_PSR_PS1  ((UC_8)0x02)
#define CAN_PSR_PS2  ((UC_8)0x04)

/**************************Tx MailBox Page*****************************************/

#define CAN_MCSR_ABRQ    ((UC_8)0x02)
/*************************Filter Page**********************************************/

/* CAN Error Status Register bits */
#define CAN_ESR_EWGF     ((UC_8)0x01)
#define CAN_ESR_EPVF     ((UC_8)0x02)
#define CAN_ESR_BOFF     ((UC_8)0x04)
#define CAN_ESR_LEC      ((UC_8)0x70)

/* CAN Error Status Register bits */
#define CAN_EIER_EWGIE    ((UC_8)0x01)
#define CAN_EIER_EPVIE    ((UC_8)0x02)
#define CAN_EIER_BOFIE    ((UC_8)0x04)
#define CAN_EIER_LECIE    ((UC_8)0x10)
#define CAN_EIER_ERRIE    ((UC_8)0x80)

/* CAN transmit error counter Register bits(CAN_TECR) */
#define CAN_TECR_TEC0     ((UC_8)0x01)
#define CAN_TECR_TEC1     ((UC_8)0x02)
#define CAN_TECR_TEC2     ((UC_8)0x04)
#define CAN_TECR_TEC3     ((UC_8)0x08)
#define CAN_TECR_TEC4     ((UC_8)0x10)
#define CAN_TECR_TEC5     ((UC_8)0x20)
#define CAN_TECR_TEC6     ((UC_8)0x40)
#define CAN_TECR_TEC7     ((UC_8)0x80)

/* CAN RECEIVE error counter Register bits(CAN_TECR) */
#define CAN_RECR_REC0     ((UC_8)0x01)
#define CAN_RECR_REC1     ((UC_8)0x02)
#define CAN_RECR_REC2     ((UC_8)0x04)
#define CAN_RECR_REC3     ((UC_8)0x08)
#define CAN_RECR_REC4     ((UC_8)0x10)
#define CAN_RECR_REC5     ((UC_8)0x20)
#define CAN_RECR_REC6     ((UC_8)0x40)
#define CAN_RECR_REC7     ((UC_8)0x80)

/* CAN Bit Timing Register 2 bits(CAN_BTR2) */
#define CAN_BTR2_CLK8     ((UC_8)0x80)

/* CAN filter mode register bits (CAN_FMR) */
#define CAN_FMR1_FML0     ((UC_8)0x01)
#define CAN_FMR1_FMH0     ((UC_8)0x02)
#define CAN_FMR1_FML1     ((UC_8)0x04)
#define CAN_FMR1_FMH1     ((UC_8)0x08)
#define CAN_FMR1_FML2     ((UC_8)0x10)
#define CAN_FMR1_FMH2     ((UC_8)0x20)
#define CAN_FMR1_FML3     ((UC_8)0x40)
#define CAN_FMR1_FMH3     ((UC_8)0x80)

#define CAN_FMR2_FML4     ((UC_8)0x01)
#define CAN_FMR2_FMH4     ((UC_8)0x02)
#define CAN_FMR2_FML5     ((UC_8)0x04)
#define CAN_FMR2_FMH5     ((UC_8)0x08)

/* CAN filter Config register bits (CAN_FCR) */
#define CAN_FCR1_FACT0     ((UC_8)0x01)
#define CAN_FCR1_FACT1     ((UC_8)0x10)
#define CAN_FCR2_FACT2     ((UC_8)0x01)
#define CAN_FCR2_FACT3     ((UC_8)0x10)
#define CAN_FCR3_FACT4     ((UC_8)0x01)
#define CAN_FCR3_FACT5     ((UC_8)0x10)

#define CAN_FCR1_FSC00    ((UC_8)0x02)
#define CAN_FCR1_FSC01    ((UC_8)0x04)
#define CAN_FCR1_FSC10    ((UC_8)0x20)
#define CAN_FCR1_FSC11    ((UC_8)0x40)
#define CAN_FCR2_FSC20    ((UC_8)0x02)
#define CAN_FCR2_FSC21    ((UC_8)0x04)
#define CAN_FCR2_FSC30    ((UC_8)0x20)
#define CAN_FCR2_FSC31    ((UC_8)0x40)
#define CAN_FCR3_FSC40    ((UC_8)0x02)
#define CAN_FCR3_FSC41    ((UC_8)0x04)
#define CAN_FCR3_FSC50    ((UC_8)0x20)
#define CAN_FCR3_FSC51    ((UC_8)0x40)

/* CAN Mailbox Transmit Request */
#define CAN_TMIDxR_TXRQ    ((UC_8)0x01) /* Transmit mailbox request */

/**
  * @}
  */

/** @addtogroup CAN_Registers_Reset_Value
  * @{
  */

#define    CAN_MCR_RESET_VALUE      ((UC_8)0x02)
#define    CAN_MSR_RESET_VALUE      ((UC_8)0x02)
#define    CAN_TSR_RESET_VALUE      ((UC_8)0x00)
#define    CAN_TPR_RESET_VALUE      ((UC_8)0x1C)
#define    CAN_RFR_RESET_VALUE      ((UC_8)0x00)
#define    CAN_IER_RESET_VALUE      ((UC_8)0x00)
#define    CAN_DGR_RESET_VALUE      ((UC_8)0x0C)
#define    CAN_PSR_RESET_VALUE      ((UC_8)0x00)

#define    CAN_ESR_RESET_VALUE      ((UC_8)0x00)
#define    CAN_EIER_RESET_VALUE    ((UC_8)0x00)
#define    CAN_TECR_RESET_VALUE    ((UC_8)0x00)
#define    CAN_RECR_RESET_VALUE    ((UC_8)0x00)
#define    CAN_BTR1_RESET_VALUE    ((UC_8)0x40)
#define    CAN_BTR2_RESET_VALUE    ((UC_8)0x23)
#define    CAN_FMR1_RESET_VALUE    ((UC_8)0x00)
#define    CAN_FMR2_RESET_VALUE    ((UC_8)0x00)
#define    CAN_FCR_RESET_VALUE      ((UC_8)0x00)

#define    CAN_MFMI_RESET_VALUE      ((UC_8)0x00)
#define    CAN_MDLC_RESET_VALUE      ((UC_8)0x00)
#define    CAN_MCSR_RESET_VALUE      ((UC_8)0x00)

/**
  * @}
  */

/**
  * @brief Configuration Registers (CFG)
  */

typedef struct CFG_struct
{
  VUC_8 GCR; /*!< Global Configuration register */
}
CFG_TypeDef;

/** @addtogroup CFG_Registers_Reset_Value
  * @{
  */

#define CFG_GCR_RESET_VALUE ((UC_8)0x00)

/**
  * @}
  */

/** @addtogroup CFG_Registers_Bits_Definition
  * @{
  */

#define CFG_GCR_SWD ((UC_8)0x01) /*!< Swim disable bit mask */
#define CFG_GCR_AL  ((UC_8)0x02) /*!< Activation Level bit mask */

/**
  * @}
  */

/**
  * @}
  */

/******************************************************************************/
/*                          Peripherals Base Address                          */
/******************************************************************************/

/** @addtogroup MAP_FILE_Base_Addresses
  * @{
  */

#define GPIOA_BaseAddress       0x5000
#define GPIOB_BaseAddress       0x5005
#define GPIOC_BaseAddress       0x500A
#define GPIOD_BaseAddress       0x500F
#define GPIOE_BaseAddress       0x5014
#define GPIOF_BaseAddress       0x5019
#define GPIOG_BaseAddress       0x501E
#define GPIOH_BaseAddress       0x5023
#define GPIOI_BaseAddress       0x5028

#define FLASH_BaseAddress       0x505A
#define OPT_BaseAddress         0x5067
#define EXTI_BaseAddress        0x50A0
#define RST_BaseAddress         0x50B3
#define CLK_BaseAddress         0x50C0
#define WWDG_BaseAddress        0x50D1
#define IWDG_BaseAddress        0x50E0
#define AWU_BaseAddress         0x50F0
#define BEEP_BaseAddress        0x50F3
#define SPI_BaseAddress         0x5200
#define I2C_BaseAddress         0x5210
#define UART1_BaseAddress       0x5230
#define UART2_BaseAddress       0x5240
#define UART3_BaseAddress       0x5240
#define TIM1_BaseAddress        0x5250
#define TIM2_BaseAddress        0x5300
#define TIM3_BaseAddress        0x5320
#define TIM4_BaseAddress        0x5340
#define ADC1_BaseAddress        0x53E0
#define ADC2_BaseAddress        0x5400
#define CAN_BaseAddress         0x5420

#define CFG_BaseAddress         0x7F60
#define ITC_BaseAddress         0x7F70
#define SWIM_BaseAddress        0x7F80
#define DM_BaseAddress          0x7F90

/**
  * @}
  */

/******************************************************************************/
/*                          Peripherals declarations                          */
/******************************************************************************/

#ifdef _CAN
#define CAN ((CAN_TypeDef *) CAN_BaseAddress)
#endif

#ifdef _GPIOA
#define GPIOA ((GPIO_TypeDef *) GPIOA_BaseAddress)
#endif

#ifdef _GPIOB
#define GPIOB ((GPIO_TypeDef *) GPIOB_BaseAddress)
#endif

#ifdef _GPIOC
#define GPIOC ((GPIO_TypeDef *) GPIOC_BaseAddress)
#endif

#ifdef _GPIOD
#define GPIOD ((GPIO_TypeDef *) GPIOD_BaseAddress)
#endif

#ifdef _GPIOE
#define GPIOE ((GPIO_TypeDef *) GPIOE_BaseAddress)
#endif

#ifdef _GPIOF
#define GPIOF ((GPIO_TypeDef *) GPIOF_BaseAddress)
#endif

#ifdef _GPIOG
#define GPIOG ((GPIO_TypeDef *) GPIOG_BaseAddress)
#endif

#ifdef _GPIOH
#define GPIOH ((GPIO_TypeDef *) GPIOH_BaseAddress)
#endif

#ifdef _GPIOI
#define GPIOI ((GPIO_TypeDef *) GPIOI_BaseAddress)
#endif

#ifdef _FLASH
#define FLASH ((FLASH_TypeDef *) FLASH_BaseAddress)
#endif

#ifdef _OPT
#define OPT ((OPT_TypeDef *) OPT_BaseAddress)
#endif

#ifdef _EXTI
#define EXTI ((EXTI_TypeDef *) EXTI_BaseAddress)
#endif

#ifdef _RST
#define RST ((RST_TypeDef *) RST_BaseAddress)
#endif

#ifdef _CLK
#define CLK ((CLK_TypeDef *) CLK_BaseAddress)
#endif

#ifdef _WWDG
#define WWDG ((WWDG_TypeDef *) WWDG_BaseAddress)
#endif

#ifdef _IWDG
#define IWDG ((IWDG_TypeDef *) IWDG_BaseAddress)
#endif

#ifdef _AWU
#define AWU ((AWU_TypeDef *) AWU_BaseAddress)
#endif

#ifdef _BEEP
#define BEEP ((BEEP_TypeDef *) BEEP_BaseAddress)
#endif

#ifdef _SPI
#define SPI ((SPI_TypeDef *) SPI_BaseAddress)
#endif

#ifdef _I2C
#define I2C ((I2C_TypeDef *) I2C_BaseAddress)
#endif

#ifdef _UART1
#define UART1 ((UART1_TypeDef *) UART1_BaseAddress)
#endif

#ifdef _UART2
#define UART2 ((UART2_TypeDef *) UART2_BaseAddress)
#endif

#ifdef _UART3
#define UART3 ((UART3_TypeDef *) UART3_BaseAddress)
#endif

#ifdef _TIM1
#define TIM1 ((TIM1_TypeDef *) TIM1_BaseAddress)
#endif

#ifdef _TIM2
#define TIM2 ((TIM2_TypeDef *) TIM2_BaseAddress)
#endif

#ifdef _TIM3
#define TIM3 ((TIM3_TypeDef *) TIM3_BaseAddress)
#endif

#ifdef _TIM4
#define TIM4 ((TIM4_TypeDef *) TIM4_BaseAddress)
#endif

#ifdef _ADC1
#define ADC1 ((ADC1_TypeDef *) ADC1_BaseAddress)
#endif

#ifdef _ADC2
#define ADC2 ((ADC2_TypeDef *) ADC2_BaseAddress)
#endif

#ifdef _ITC
#define ITC ((ITC_TypeDef *) ITC_BaseAddress)
#endif

#ifdef _CFG
#define CFG ((CFG_TypeDef *) CFG_BaseAddress)
#endif

#ifdef _SWIM
#define SWIM ((SWIM_TypeDef *) SWIM_BaseAddress)
#endif

#ifdef _DM
#define DM ((DM_TypeDef *) DM_BaseAddress)
#endif

#endif /* __STM8S_MAP_H */

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
