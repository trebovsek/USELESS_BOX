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
  56  0005 2706          	jreq	L12
  57                     ; 48     SwitchStatus.asBit.boSwitch1 = OFF;
  59  0007 72110000      	bres	_SwitchStatus,#0
  61  000b 2004          	jra	L32
  62  000d               L12:
  63                     ; 52     SwitchStatus.asBit.boSwitch1 = ON;
  65  000d 72100000      	bset	_SwitchStatus,#0
  66  0011               L32:
  67                     ; 56   if (_PD_PORT_E6_CHECK())
  69  0011 c65015        	ld	a,20501
  70  0014 a540          	bcp	a,#64
  71  0016 2706          	jreq	L52
  72                     ; 58     SwitchStatus.asBit.boSwitch2 = OFF;
  74  0018 72130000      	bres	_SwitchStatus,#1
  76  001c 2004          	jra	L72
  77  001e               L52:
  78                     ; 62     SwitchStatus.asBit.boSwitch2 = ON;
  80  001e 72120000      	bset	_SwitchStatus,#1
  81  0022               L72:
  82                     ; 66   if (_PD_PORT_B4_CHECK())
  84  0022 c65006        	ld	a,20486
  85  0025 a510          	bcp	a,#16
  86  0027 2706          	jreq	L13
  87                     ; 68     SwitchStatus.asBit.boSwitch3 = OFF;
  89  0029 72150000      	bres	_SwitchStatus,#2
  91  002d 2004          	jra	L33
  92  002f               L13:
  93                     ; 72     SwitchStatus.asBit.boSwitch3 = ON;
  95  002f 72140000      	bset	_SwitchStatus,#2
  96  0033               L33:
  97                     ; 76   if (_PD_PORT_B2_CHECK())
  99  0033 c65006        	ld	a,20486
 100  0036 a504          	bcp	a,#4
 101  0038 2706          	jreq	L53
 102                     ; 78     SwitchStatus.asBit.boSwitch4 = OFF;
 104  003a 72170000      	bres	_SwitchStatus,#3
 106  003e 2004          	jra	L73
 107  0040               L53:
 108                     ; 82     SwitchStatus.asBit.boSwitch4 = ON;
 110  0040 72160000      	bset	_SwitchStatus,#3
 111  0044               L73:
 112                     ; 86   if (_PD_PORT_B3_CHECK())
 114  0044 c65006        	ld	a,20486
 115  0047 a508          	bcp	a,#8
 116  0049 2706          	jreq	L14
 117                     ; 88     SwitchStatus.asBit.boSwitch5 = OFF;
 119  004b 72190000      	bres	_SwitchStatus,#4
 121  004f 2004          	jra	L34
 122  0051               L14:
 123                     ; 92     SwitchStatus.asBit.boSwitch5 = ON;
 125  0051 72180000      	bset	_SwitchStatus,#4
 126  0055               L34:
 127                     ; 96   if (_PD_PORT_E7_CHECK())
 129  0055 c65015        	ld	a,20501
 130  0058 a580          	bcp	a,#128
 131  005a 2706          	jreq	L54
 132                     ; 98     SwitchStatus.asBit.boSwitch6 = OFF;
 134  005c 721b0000      	bres	_SwitchStatus,#5
 136  0060 2004          	jra	L74
 137  0062               L54:
 138                     ; 102     SwitchStatus.asBit.boSwitch6 = ON;
 140  0062 721a0000      	bset	_SwitchStatus,#5
 141  0066               L74:
 142                     ; 106   if (_PD_PORT_B6_CHECK())
 144  0066 c65006        	ld	a,20486
 145  0069 a540          	bcp	a,#64
 146  006b 2706          	jreq	L15
 147                     ; 108     SwitchStatus.asBit.boSwitch7= OFF;
 149  006d 721d0000      	bres	_SwitchStatus,#6
 151  0071 2004          	jra	L35
 152  0073               L15:
 153                     ; 112     SwitchStatus.asBit.boSwitch7 = ON;
 155  0073 721c0000      	bset	_SwitchStatus,#6
 156  0077               L35:
 157                     ; 116   if (_PD_PORT_B1_CHECK())
 159  0077 c65006        	ld	a,20486
 160  007a a502          	bcp	a,#2
 161  007c 2706          	jreq	L55
 162                     ; 118     SwitchStatus.asBit.boSwitch8 = OFF;
 164  007e 721f0000      	bres	_SwitchStatus,#7
 166  0082 2004          	jra	L75
 167  0084               L55:
 168                     ; 122     SwitchStatus.asBit.boSwitch8 = ON;
 170  0084 721e0000      	bset	_SwitchStatus,#7
 171  0088               L75:
 172                     ; 126   if (_PD_PORT_B5_CHECK())
 174  0088 c65006        	ld	a,20486
 175  008b a520          	bcp	a,#32
 176  008d 2706          	jreq	L16
 177                     ; 128     SwitchStatus.asBit.boSwitch9 = OFF;
 179  008f 72110001      	bres	_SwitchStatus+1,#0
 181  0093 2004          	jra	L36
 182  0095               L16:
 183                     ; 132     SwitchStatus.asBit.boSwitch9 = ON;
 185  0095 72100001      	bset	_SwitchStatus+1,#0
 186  0099               L36:
 187                     ; 137   if (SwitchStatus.asBit.boSwitch1)
 189  0099 b600          	ld	a,_SwitchStatus
 190  009b a501          	bcp	a,#1
 191  009d 270a          	jreq	L56
 192                     ; 139     _TIMER_3_PWM_DUTY_SET(1000); //1ms [OK]
 194  009f 3503532d      	mov	21293,#3
 197  00a3 35e8532e      	mov	21294,#232
 199  00a7 2008          	jra	L76
 200  00a9               L56:
 201                     ; 143     _TIMER_3_PWM_DUTY_SET(4500);
 203  00a9 3511532d      	mov	21293,#17
 206  00ad 3594532e      	mov	21294,#148
 207  00b1               L76:
 208                     ; 145 }
 211  00b1 81            	ret
 400                     	xdef	_SwitchStatusReadAll
 401                     	switch	.ubsct
 402  0000               _SwitchStatus:
 403  0000 0000          	ds.b	2
 404                     	xdef	_SwitchStatus
 405  0002               _gucSwitchState:
 406  0002 00            	ds.b	1
 407                     	xdef	_gucSwitchState
 427                     	end
