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
  83  0026 270e          	jreq	L52
  84                     ; 61     SwitchStatus.asBit.boSwitch2 = OFF;
  86  0028 72130000      	bres	_SwitchStatus,#1
  87                     ; 62     _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_CLOSE); //1ms [OK]
  89  002c 3503532f      	mov	21295,#3
  92  0030 35e85330      	mov	21296,#232
  94  0034 200c          	jra	L72
  95  0036               L52:
  96                     ; 66     SwitchStatus.asBit.boSwitch2 = ON;
  98  0036 72120000      	bset	_SwitchStatus,#1
  99                     ; 67     _TIMER_32_PWM_DUTY_SET(_TIMER_3_DUTY_OPEN); //1ms [OK]
 101  003a 3511532f      	mov	21295,#17
 104  003e 35945330      	mov	21296,#148
 105  0042               L72:
 106                     ; 72   if (_PD_PORT_B4_CHECK())
 108  0042 c65006        	ld	a,20486
 109  0045 a510          	bcp	a,#16
 110  0047 2706          	jreq	L13
 111                     ; 74     SwitchStatus.asBit.boSwitch3 = OFF;
 113  0049 72150000      	bres	_SwitchStatus,#2
 115  004d 2004          	jra	L33
 116  004f               L13:
 117                     ; 78     SwitchStatus.asBit.boSwitch3 = ON;
 119  004f 72140000      	bset	_SwitchStatus,#2
 120  0053               L33:
 121                     ; 82   if (_PD_PORT_B2_CHECK())
 123  0053 c65006        	ld	a,20486
 124  0056 a504          	bcp	a,#4
 125  0058 2706          	jreq	L53
 126                     ; 84     SwitchStatus.asBit.boSwitch4 = OFF;
 128  005a 72170000      	bres	_SwitchStatus,#3
 130  005e 2004          	jra	L73
 131  0060               L53:
 132                     ; 88     SwitchStatus.asBit.boSwitch4 = ON;
 134  0060 72160000      	bset	_SwitchStatus,#3
 135  0064               L73:
 136                     ; 92   if (_PD_PORT_B3_CHECK())
 138  0064 c65006        	ld	a,20486
 139  0067 a508          	bcp	a,#8
 140  0069 2706          	jreq	L14
 141                     ; 94     SwitchStatus.asBit.boSwitch5 = OFF;
 143  006b 72190000      	bres	_SwitchStatus,#4
 145  006f 2004          	jra	L34
 146  0071               L14:
 147                     ; 98     SwitchStatus.asBit.boSwitch5 = ON;
 149  0071 72180000      	bset	_SwitchStatus,#4
 150  0075               L34:
 151                     ; 102   if (_PD_PORT_E7_CHECK())
 153  0075 c65015        	ld	a,20501
 154  0078 a580          	bcp	a,#128
 155  007a 2706          	jreq	L54
 156                     ; 104     SwitchStatus.asBit.boSwitch6 = OFF;
 158  007c 721b0000      	bres	_SwitchStatus,#5
 160  0080 2004          	jra	L74
 161  0082               L54:
 162                     ; 108     SwitchStatus.asBit.boSwitch6 = ON;
 164  0082 721a0000      	bset	_SwitchStatus,#5
 165  0086               L74:
 166                     ; 112   if (_PD_PORT_B6_CHECK())
 168  0086 c65006        	ld	a,20486
 169  0089 a540          	bcp	a,#64
 170  008b 2706          	jreq	L15
 171                     ; 114     SwitchStatus.asBit.boSwitch7= OFF;
 173  008d 721d0000      	bres	_SwitchStatus,#6
 175  0091 2004          	jra	L35
 176  0093               L15:
 177                     ; 118     SwitchStatus.asBit.boSwitch7 = ON;
 179  0093 721c0000      	bset	_SwitchStatus,#6
 180  0097               L35:
 181                     ; 122   if (_PD_PORT_B1_CHECK())
 183  0097 c65006        	ld	a,20486
 184  009a a502          	bcp	a,#2
 185  009c 2706          	jreq	L55
 186                     ; 124     SwitchStatus.asBit.boSwitch8 = OFF;
 188  009e 721f0000      	bres	_SwitchStatus,#7
 190  00a2 2004          	jra	L75
 191  00a4               L55:
 192                     ; 128     SwitchStatus.asBit.boSwitch8 = ON;
 194  00a4 721e0000      	bset	_SwitchStatus,#7
 195  00a8               L75:
 196                     ; 132   if (_PD_PORT_B5_CHECK())
 198  00a8 c65006        	ld	a,20486
 199  00ab a520          	bcp	a,#32
 200  00ad 2706          	jreq	L16
 201                     ; 134     SwitchStatus.asBit.boSwitch9 = OFF;
 203  00af 72110001      	bres	_SwitchStatus+1,#0
 205  00b3 2004          	jra	L36
 206  00b5               L16:
 207                     ; 138     SwitchStatus.asBit.boSwitch9 = ON;
 209  00b5 72100001      	bset	_SwitchStatus+1,#0
 210  00b9               L36:
 211                     ; 140 }
 214  00b9 81            	ret
 403                     	xdef	_SwitchStatusReadAll
 404                     	switch	.ubsct
 405  0000               _SwitchStatus:
 406  0000 0000          	ds.b	2
 407                     	xdef	_SwitchStatus
 408  0002               _gucSwitchState:
 409  0002 00            	ds.b	1
 410                     	xdef	_gucSwitchState
 430                     	end
