   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
  43                     ; 32 void Init_I2C (void)
  43                     ; 33 {
  45                     	switch	.text
  46  0000               _Init_I2C:
  50                     ; 36 	I2C->FREQR = 16;				// 16MHz (?)
  52  0000 35105212      	mov	21010,#16
  53                     ; 37 	I2C->ITR = 0x00;				// disable all interrupts, we will do a polling!
  55  0004 725f521a      	clr	21018
  56                     ; 38   I2C->CR1 = 0x01;  			// Enable I2C peripheral
  58  0008 35015210      	mov	21008,#1
  59                     ; 39 	I2C->CR2 = 0x04;  
  61  000c 35045211      	mov	21009,#4
  62                     ; 40 	I2C->OARL   = 0xa2;		// slave address
  64  0010 35a25213      	mov	21011,#162
  65                     ; 41   I2C->OARH   = 0x40;		// ADDCONF = 1 => 7 bit add
  67  0014 35405214      	mov	21012,#64
  68                     ; 42 }
  71  0018 81            	ret
 129                     ; 52 void I2C_Slave_check_event(void)
 129                     ; 53 {
 130                     	switch	.text
 131  0019               _I2C_Slave_check_event:
 133  0019 5203          	subw	sp,#3
 134       00000003      OFST:	set	3
 137                     ; 58   sr1 = I2C->SR1;					// save the I2C registers configuration
 139  001b c65217        	ld	a,21015
 140  001e 6b03          	ld	(OFST+0,sp),a
 141                     ; 59   sr2 = I2C->SR2;
 143  0020 c65218        	ld	a,21016
 144  0023 6b02          	ld	(OFST-1,sp),a
 145                     ; 60   sr3 = I2C->SR3;
 147  0025 7b01          	ld	a,(OFST-2,sp)
 148  0027 c65219        	ld	a,21017
 149                     ; 64   if (sr2 & 0x2F/*WUFH, OVR, AF, ARLO, BERR*/) 
 151  002a 7b02          	ld	a,(OFST-1,sp)
 152  002c a52f          	bcp	a,#47
 153  002e 2708          	jreq	L74
 154                     ; 66     SetBit(I2C->CR2,1/*STOP*/);											// stop slave communication and release the lines
 156  0030 72125211      	bset	21009,#1
 157                     ; 67     I2C->SR2 = 0;					// clear all error flags
 159  0034 725f5218      	clr	21016
 160  0038               L74:
 161                     ; 71   if (sr1 & 0x02/*ADDR*/) 
 163  0038 7b03          	ld	a,(OFST+0,sp)
 164  003a a502          	bcp	a,#2
 165  003c 2702          	jreq	L15
 166                     ; 73 	  I2C_ByteCounter = 0;				// clear ByteCounter
 168  003e 3f02          	clr	_I2C_ByteCounter
 169  0040               L15:
 170                     ; 77   if (sr1 & 0x10/*STOPF*/) 
 172  0040 7b03          	ld	a,(OFST+0,sp)
 173  0042 a510          	bcp	a,#16
 174  0044 2704          	jreq	L35
 175                     ; 79     I2C->CR2 = 0x04;							// CR2 write to clear STOPF
 177  0046 35045211      	mov	21009,#4
 178  004a               L35:
 179                     ; 83   if (sr1 & 0x40 /*RxNE*/) 
 181  004a 7b03          	ld	a,(OFST+0,sp)
 182  004c a540          	bcp	a,#64
 183  004e 2711          	jreq	L55
 184                     ; 85 		RX_MODE = 1;
 186  0050 35010001      	mov	_RX_MODE,#1
 187                     ; 86 		byte_received(I2C->DR,I2C_ByteCounter);
 189  0054 b602          	ld	a,_I2C_ByteCounter
 190  0056 97            	ld	xl,a
 191  0057 c65216        	ld	a,21014
 192  005a 95            	ld	xh,a
 193  005b ad16          	call	_byte_received
 195                     ; 87 		I2C_ByteCounter = 1;
 197  005d 35010002      	mov	_I2C_ByteCounter,#1
 198  0061               L55:
 199                     ; 91   if (sr1 & 0x80 /*TxE*/) 
 201  0061 7b03          	ld	a,(OFST+0,sp)
 202  0063 a580          	bcp	a,#128
 203  0065 2709          	jreq	L75
 204                     ; 93 		TX_MODE = 1;
 206  0067 35010000      	mov	_TX_MODE,#1
 207                     ; 94 		I2C->DR = byte_write();
 209  006b ad2b          	call	_byte_write
 211  006d c75216        	ld	21014,a
 212  0070               L75:
 213                     ; 96 }
 216  0070 5b03          	addw	sp,#3
 217  0072 81            	ret
 262                     ; 98 	u8 byte_received(u8 u8_RxData, u8 I2C_ByteCounter)
 262                     ; 99 	{
 263                     	switch	.text
 264  0073               _byte_received:
 266  0073 89            	pushw	x
 267       00000000      OFST:	set	0
 270                     ; 100 		if (I2C_ByteCounter == 0) {
 272  0074 9f            	ld	a,xl
 273  0075 4d            	tnz	a
 274  0076 2611          	jrne	L301
 275                     ; 101 			u8_MyBuffp= &u8_My_Buffer[u8_RxData];
 277  0078 a600          	ld	a,#high(_u8_My_Buffer)
 278  007a 97            	ld	xl,a
 279  007b a600          	ld	a,#low(_u8_My_Buffer)
 280  007d 1b01          	add	a,(OFST+1,sp)
 281  007f 2401          	jrnc	L21
 282  0081 5c            	incw	x
 283  0082               L21:
 284  0082 b704          	ld	_u8_MyBuffp+1,a
 285  0084 9f            	ld	a,xl
 286  0085 b703          	ld	_u8_MyBuffp,a
 288  0087 200d          	jra	L501
 289  0089               L301:
 290                     ; 104 		*(u8_MyBuffp++) = u8_RxData;
 292  0089 7b01          	ld	a,(OFST+1,sp)
 293  008b be03          	ldw	x,_u8_MyBuffp
 294  008d 1c0001        	addw	x,#1
 295  0090 bf03          	ldw	_u8_MyBuffp,x
 296  0092 1d0001        	subw	x,#1
 297  0095 f7            	ld	(x),a
 298  0096               L501:
 299                     ; 106 	}
 302  0096 85            	popw	x
 303  0097 81            	ret
 327                     ; 108 	u8 byte_write(void)
 327                     ; 109 	{
 328                     	switch	.text
 329  0098               _byte_write:
 333                     ; 110 		return *(u8_MyBuffp++);
 335  0098 be03          	ldw	x,_u8_MyBuffp
 336  009a 1c0001        	addw	x,#1
 337  009d bf03          	ldw	_u8_MyBuffp,x
 338  009f 1d0001        	subw	x,#1
 339  00a2 f6            	ld	a,(x)
 342  00a3 81            	ret
 404                     	switch	.ubsct
 405  0000               _TX_MODE:
 406  0000 00            	ds.b	1
 407                     	xdef	_TX_MODE
 408  0001               _RX_MODE:
 409  0001 00            	ds.b	1
 410                     	xdef	_RX_MODE
 411  0002               _I2C_ByteCounter:
 412  0002 00            	ds.b	1
 413                     	xdef	_I2C_ByteCounter
 414  0003               _u8_MyBuffp:
 415  0003 0000          	ds.b	2
 416                     	xdef	_u8_MyBuffp
 417                     	switch	.bss
 418  0000               _u8_My_Buffer:
 419  0000 000000000000  	ds.b	20
 420                     	xdef	_u8_My_Buffer
 421                     	xdef	_byte_write
 422                     	xdef	_byte_received
 423                     	xdef	_I2C_Slave_check_event
 424                     	xdef	_Init_I2C
 444                     	end
