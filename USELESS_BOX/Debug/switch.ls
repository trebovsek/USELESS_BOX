   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator V4.3.13 - 22 Oct 2014
  45                     ; 43 void SwitchStatusReadAll(void)
  45                     ; 44 {
  47                     	switch	.text
  48  0000               _SwitchStatusReadAll:
  52                     ; 46   if (_PD_PORT_B0_CHECK()) 
  54  0000 c65006        	ld	a,20486
  55  0003 a501          	bcp	a,#1
  56  0005 270e          	jreq	L12
  57                     ; 48     SwitchStatus.asBit.boSwitch1 = OFF;
  59  0007 72110000      	bres	_SwitchStatus,#0
  60                     ; 49     _TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  62  000b 3503532d      	mov	21293,#3
  65  000f 35e8532e      	mov	21294,#232
  67  0013 200c          	jra	L32
  68  0015               L12:
  69                     ; 53     SwitchStatus.asBit.boSwitch1 = ON;
  71  0015 72100000      	bset	_SwitchStatus,#0
  72                     ; 54     _TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
  74  0019 3511532d      	mov	21293,#17
  77  001d 3594532e      	mov	21294,#148
  78  0021               L32:
  79                     ; 58   if (_PD_PORT_E6_CHECK())
  81  0021 c65015        	ld	a,20501
  82  0024 a540          	bcp	a,#64
  83  0026 2706          	jreq	L52
  84                     ; 60     SwitchStatus.asBit.boSwitch2 = OFF;
  86  0028 72130000      	bres	_SwitchStatus,#1
  88  002c 2004          	jra	L72
  89  002e               L52:
  90                     ; 64     SwitchStatus.asBit.boSwitch2 = ON;
  92  002e 72120000      	bset	_SwitchStatus,#1
  93  0032               L72:
  94                     ; 68   if (_PD_PORT_B4_CHECK())
  96  0032 c65006        	ld	a,20486
  97  0035 a510          	bcp	a,#16
  98  0037 2706          	jreq	L13
  99                     ; 70     SwitchStatus.asBit.boSwitch3 = OFF;
 101  0039 72150000      	bres	_SwitchStatus,#2
 103  003d 2004          	jra	L33
 104  003f               L13:
 105                     ; 74     SwitchStatus.asBit.boSwitch3 = ON;
 107  003f 72140000      	bset	_SwitchStatus,#2
 108  0043               L33:
 109                     ; 78   if (_PD_PORT_B2_CHECK())
 111  0043 c65006        	ld	a,20486
 112  0046 a504          	bcp	a,#4
 113  0048 2706          	jreq	L53
 114                     ; 80     SwitchStatus.asBit.boSwitch4 = OFF;
 116  004a 72170000      	bres	_SwitchStatus,#3
 118  004e 2004          	jra	L73
 119  0050               L53:
 120                     ; 84     SwitchStatus.asBit.boSwitch4 = ON;
 122  0050 72160000      	bset	_SwitchStatus,#3
 123  0054               L73:
 124                     ; 88   if (_PD_PORT_B3_CHECK())
 126  0054 c65006        	ld	a,20486
 127  0057 a508          	bcp	a,#8
 128  0059 2706          	jreq	L14
 129                     ; 90     SwitchStatus.asBit.boSwitch5 = OFF;
 131  005b 72190000      	bres	_SwitchStatus,#4
 133  005f 2004          	jra	L34
 134  0061               L14:
 135                     ; 94     SwitchStatus.asBit.boSwitch5 = ON;
 137  0061 72180000      	bset	_SwitchStatus,#4
 138  0065               L34:
 139                     ; 98   if (_PD_PORT_E7_CHECK())
 141  0065 c65015        	ld	a,20501
 142  0068 a580          	bcp	a,#128
 143  006a 2706          	jreq	L54
 144                     ; 100     SwitchStatus.asBit.boSwitch6 = OFF;
 146  006c 721b0000      	bres	_SwitchStatus,#5
 148  0070 2004          	jra	L74
 149  0072               L54:
 150                     ; 104     SwitchStatus.asBit.boSwitch6 = ON;
 152  0072 721a0000      	bset	_SwitchStatus,#5
 153  0076               L74:
 154                     ; 108   if (_PD_PORT_B6_CHECK())
 156  0076 c65006        	ld	a,20486
 157  0079 a540          	bcp	a,#64
 158  007b 2706          	jreq	L15
 159                     ; 110     SwitchStatus.asBit.boSwitch7= OFF;
 161  007d 721d0000      	bres	_SwitchStatus,#6
 163  0081 2004          	jra	L35
 164  0083               L15:
 165                     ; 114     SwitchStatus.asBit.boSwitch7 = ON;
 167  0083 721c0000      	bset	_SwitchStatus,#6
 168  0087               L35:
 169                     ; 118   if (_PD_PORT_B1_CHECK())
 171  0087 c65006        	ld	a,20486
 172  008a a502          	bcp	a,#2
 173  008c 2706          	jreq	L55
 174                     ; 120     SwitchStatus.asBit.boSwitch8 = OFF;
 176  008e 721f0000      	bres	_SwitchStatus,#7
 178  0092 2004          	jra	L75
 179  0094               L55:
 180                     ; 124     SwitchStatus.asBit.boSwitch8 = ON;
 182  0094 721e0000      	bset	_SwitchStatus,#7
 183  0098               L75:
 184                     ; 128   if (_PD_PORT_B5_CHECK())
 186  0098 c65006        	ld	a,20486
 187  009b a520          	bcp	a,#32
 188  009d 2706          	jreq	L16
 189                     ; 130     SwitchStatus.asBit.boSwitch9 = OFF;
 191  009f 72110001      	bres	_SwitchStatus+1,#0
 193  00a3 2004          	jra	L36
 194  00a5               L16:
 195                     ; 134     SwitchStatus.asBit.boSwitch9 = ON;
 197  00a5 72100001      	bset	_SwitchStatus+1,#0
 198  00a9               L36:
 199                     ; 136 }
 202  00a9 81            	ret
 391                     	xdef	_SwitchStatusReadAll
 392                     	switch	.ubsct
 393  0000               _SwitchStatus:
 394  0000 0000          	ds.b	2
 395                     	xdef	_SwitchStatus
 396  0002               _gucSwitchState:
 397  0002 00            	ds.b	1
 398                     	xdef	_gucSwitchState
 418                     	end
