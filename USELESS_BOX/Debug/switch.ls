   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.10 - 25 Sep 2019
  44                     ; 43 void SwitchStatusReadAll(void)
  44                     ; 44 {
  46                     	switch	.text
  47  0000               _SwitchStatusReadAll:
  51                     ; 46   if (_PD_PORT_B0_CHECK()) 
  53  0000 c65006        	ld	a,20486
  54  0003 a501          	bcp	a,#1
  55  0005 270e          	jreq	L12
  56                     ; 48     SwitchStatus.asBit.boSwitch1 = OFF;
  58  0007 72110000      	bres	_SwitchStatus,#0
  59                     ; 49     _TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  61  000b 3503532d      	mov	21293,#3
  64  000f 35e8532e      	mov	21294,#232
  66  0013 200c          	jra	L32
  67  0015               L12:
  68                     ; 53     SwitchStatus.asBit.boSwitch1 = ON;
  70  0015 72100000      	bset	_SwitchStatus,#0
  71                     ; 54     _TIMER_3_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
  73  0019 3511532d      	mov	21293,#17
  76  001d 3594532e      	mov	21294,#148
  77  0021               L32:
  78                     ; 58   if (_PD_PORT_E6_CHECK())
  80  0021 c65015        	ld	a,20501
  81  0024 a540          	bcp	a,#64
  82  0026 270e          	jreq	L52
  83                     ; 61     SwitchStatus.asBit.boSwitch2 = OFF;
  85  0028 72130000      	bres	_SwitchStatus,#1
  86                     ; 62     _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  88  002c 3503532f      	mov	21295,#3
  91  0030 35e85330      	mov	21296,#232
  93  0034 200c          	jra	L72
  94  0036               L52:
  95                     ; 66     SwitchStatus.asBit.boSwitch2 = ON;
  97  0036 72120000      	bset	_SwitchStatus,#1
  98                     ; 67     _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
 100  003a 3511532f      	mov	21295,#17
 103  003e 35945330      	mov	21296,#148
 104  0042               L72:
 105                     ; 72   if (_PD_PORT_B4_CHECK())
 107  0042 c65006        	ld	a,20486
 108  0045 a510          	bcp	a,#16
 109  0047 2706          	jreq	L13
 110                     ; 74     SwitchStatus.asBit.boSwitch3 = OFF;
 112  0049 72150000      	bres	_SwitchStatus,#2
 114  004d 2004          	jra	L33
 115  004f               L13:
 116                     ; 78     SwitchStatus.asBit.boSwitch3 = ON;
 118  004f 72140000      	bset	_SwitchStatus,#2
 119  0053               L33:
 120                     ; 82   if (_PD_PORT_B2_CHECK())
 122  0053 c65006        	ld	a,20486
 123  0056 a504          	bcp	a,#4
 124  0058 2706          	jreq	L53
 125                     ; 84     SwitchStatus.asBit.boSwitch4 = OFF;
 127  005a 72170000      	bres	_SwitchStatus,#3
 129  005e 2004          	jra	L73
 130  0060               L53:
 131                     ; 88     SwitchStatus.asBit.boSwitch4 = ON;
 133  0060 72160000      	bset	_SwitchStatus,#3
 134  0064               L73:
 135                     ; 92   if (_PD_PORT_B3_CHECK())
 137  0064 c65006        	ld	a,20486
 138  0067 a508          	bcp	a,#8
 139  0069 2706          	jreq	L14
 140                     ; 94     SwitchStatus.asBit.boSwitch5 = OFF;
 142  006b 72190000      	bres	_SwitchStatus,#4
 144  006f 2004          	jra	L34
 145  0071               L14:
 146                     ; 98     SwitchStatus.asBit.boSwitch5 = ON;
 148  0071 72180000      	bset	_SwitchStatus,#4
 149  0075               L34:
 150                     ; 102   if (_PD_PORT_E7_CHECK())
 152  0075 c65015        	ld	a,20501
 153  0078 a580          	bcp	a,#128
 154  007a 2706          	jreq	L54
 155                     ; 104     SwitchStatus.asBit.boSwitch6 = OFF;
 157  007c 721b0000      	bres	_SwitchStatus,#5
 159  0080 2004          	jra	L74
 160  0082               L54:
 161                     ; 108     SwitchStatus.asBit.boSwitch6 = ON;
 163  0082 721a0000      	bset	_SwitchStatus,#5
 164  0086               L74:
 165                     ; 112   if (_PD_PORT_B6_CHECK())
 167  0086 c65006        	ld	a,20486
 168  0089 a540          	bcp	a,#64
 169  008b 2706          	jreq	L15
 170                     ; 114     SwitchStatus.asBit.boSwitch7= OFF;
 172  008d 721d0000      	bres	_SwitchStatus,#6
 174  0091 2004          	jra	L35
 175  0093               L15:
 176                     ; 118     SwitchStatus.asBit.boSwitch7 = ON;
 178  0093 721c0000      	bset	_SwitchStatus,#6
 179  0097               L35:
 180                     ; 122   if (_PD_PORT_B1_CHECK())
 182  0097 c65006        	ld	a,20486
 183  009a a502          	bcp	a,#2
 184  009c 2706          	jreq	L55
 185                     ; 124     SwitchStatus.asBit.boSwitch8 = OFF;
 187  009e 721f0000      	bres	_SwitchStatus,#7
 189  00a2 2004          	jra	L75
 190  00a4               L55:
 191                     ; 128     SwitchStatus.asBit.boSwitch8 = ON;
 193  00a4 721e0000      	bset	_SwitchStatus,#7
 194  00a8               L75:
 195                     ; 132   if (_PD_PORT_B5_CHECK())
 197  00a8 c65006        	ld	a,20486
 198  00ab a520          	bcp	a,#32
 199  00ad 2706          	jreq	L16
 200                     ; 134     SwitchStatus.asBit.boSwitch9 = OFF;
 202  00af 72110001      	bres	_SwitchStatus+1,#0
 204  00b3 2004          	jra	L36
 205  00b5               L16:
 206                     ; 138     SwitchStatus.asBit.boSwitch9 = ON;
 208  00b5 72100001      	bset	_SwitchStatus+1,#0
 209  00b9               L36:
 210                     ; 140 }
 213  00b9 81            	ret
 402                     	xdef	_SwitchStatusReadAll
 403                     	switch	.ubsct
 404  0000               _SwitchStatus:
 405  0000 0000          	ds.b	2
 406                     	xdef	_SwitchStatus
 407  0002               _gucSwitchState:
 408  0002 00            	ds.b	1
 409                     	xdef	_gucSwitchState
 429                     	end
