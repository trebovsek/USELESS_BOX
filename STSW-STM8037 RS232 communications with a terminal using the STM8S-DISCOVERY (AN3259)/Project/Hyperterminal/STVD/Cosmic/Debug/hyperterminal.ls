   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.16 - 01 Jul 2009
   3                     ; Generator V4.3.1 - 02 Jul 2009
 100                     ; 37 void Int2Str(char *str, u32 intnum)
 100                     ; 38 {
 102                     	switch	.text
 103  0000               _Int2Str:
 105  0000 89            	pushw	x
 106  0001 520c          	subw	sp,#12
 107       0000000c      OFST:	set	12
 110                     ; 39     int i, Div = 1000000000, j = 0, Status = 0;
 112  0003 aeca00        	ldw	x,#51712
 113  0006 1f09          	ldw	(OFST-3,sp),x
 116  0008 5f            	clrw	x
 117  0009 1f0b          	ldw	(OFST-1,sp),x
 120  000b 5f            	clrw	x
 121  000c 1f05          	ldw	(OFST-7,sp),x
 122                     ; 40     for (i = 0; i < 10; i++)
 124  000e 5f            	clrw	x
 125  000f 1f07          	ldw	(OFST-5,sp),x
 126  0011               L35:
 127                     ; 42         str[j++] = (intnum / Div) + 48;
 129  0011 1e09          	ldw	x,(OFST-3,sp)
 130  0013 cd0000        	call	c_itolx
 132  0016 96            	ldw	x,sp
 133  0017 1c0001        	addw	x,#OFST-11
 134  001a cd0000        	call	c_rtol
 136  001d 96            	ldw	x,sp
 137  001e 1c0011        	addw	x,#OFST+5
 138  0021 cd0000        	call	c_ltor
 140  0024 96            	ldw	x,sp
 141  0025 1c0001        	addw	x,#OFST-11
 142  0028 cd0000        	call	c_ludv
 144  002b a630          	ld	a,#48
 145  002d cd0000        	call	c_ladc
 147  0030 1e0b          	ldw	x,(OFST-1,sp)
 148  0032 1c0001        	addw	x,#1
 149  0035 1f0b          	ldw	(OFST-1,sp),x
 150  0037 1d0001        	subw	x,#1
 151  003a 72fb0d        	addw	x,(OFST+1,sp)
 152  003d b603          	ld	a,c_lreg+3
 153  003f f7            	ld	(x),a
 154                     ; 43         intnum = intnum % Div;
 156  0040 1e09          	ldw	x,(OFST-3,sp)
 157  0042 cd0000        	call	c_itolx
 159  0045 96            	ldw	x,sp
 160  0046 1c0001        	addw	x,#OFST-11
 161  0049 cd0000        	call	c_rtol
 163  004c 96            	ldw	x,sp
 164  004d 1c0011        	addw	x,#OFST+5
 165  0050 cd0000        	call	c_ltor
 167  0053 96            	ldw	x,sp
 168  0054 1c0001        	addw	x,#OFST-11
 169  0057 cd0000        	call	c_lumd
 171  005a 96            	ldw	x,sp
 172  005b 1c0011        	addw	x,#OFST+5
 173  005e cd0000        	call	c_rtol
 175                     ; 44         Div /= 10;
 177  0061 1e09          	ldw	x,(OFST-3,sp)
 178  0063 a60a          	ld	a,#10
 179  0065 cd0000        	call	c_sdivx
 181  0068 1f09          	ldw	(OFST-3,sp),x
 182                     ; 45         if ((str[j-1] == '0') & (Status == 0))
 184  006a 1e05          	ldw	x,(OFST-7,sp)
 185  006c 2605          	jrne	L6
 186  006e ae0001        	ldw	x,#1
 187  0071 2001          	jra	L01
 188  0073               L6:
 189  0073 5f            	clrw	x
 190  0074               L01:
 191  0074 1f03          	ldw	(OFST-9,sp),x
 192  0076 1e0b          	ldw	x,(OFST-1,sp)
 193  0078 5a            	decw	x
 194  0079 72fb0d        	addw	x,(OFST+1,sp)
 195  007c f6            	ld	a,(x)
 196  007d a130          	cp	a,#48
 197  007f 2605          	jrne	L21
 198  0081 ae0001        	ldw	x,#1
 199  0084 2001          	jra	L41
 200  0086               L21:
 201  0086 5f            	clrw	x
 202  0087               L41:
 203  0087 01            	rrwa	x,a
 204  0088 1404          	and	a,(OFST-8,sp)
 205  008a 01            	rrwa	x,a
 206  008b 1403          	and	a,(OFST-9,sp)
 207  008d 01            	rrwa	x,a
 208  008e a30000        	cpw	x,#0
 209  0091 2705          	jreq	L16
 210                     ; 47             j = 0;
 212  0093 5f            	clrw	x
 213  0094 1f0b          	ldw	(OFST-1,sp),x
 215  0096 2007          	jra	L36
 216  0098               L16:
 217                     ; 51             Status++;
 219  0098 1e05          	ldw	x,(OFST-7,sp)
 220  009a 1c0001        	addw	x,#1
 221  009d 1f05          	ldw	(OFST-7,sp),x
 222  009f               L36:
 223                     ; 40     for (i = 0; i < 10; i++)
 225  009f 1e07          	ldw	x,(OFST-5,sp)
 226  00a1 1c0001        	addw	x,#1
 227  00a4 1f07          	ldw	(OFST-5,sp),x
 230  00a6 9c            	rvf
 231  00a7 1e07          	ldw	x,(OFST-5,sp)
 232  00a9 a3000a        	cpw	x,#10
 233  00ac 2e03          	jrsge	L61
 234  00ae cc0011        	jp	L35
 235  00b1               L61:
 236                     ; 54 }
 239  00b1 5b0e          	addw	sp,#14
 240  00b3 81            	ret
 312                     ; 65 u8 Str2Int(char *inputstr, u32 *intnum)
 312                     ; 66 {
 313                     	switch	.text
 314  00b4               _Str2Int:
 316  00b4 89            	pushw	x
 317  00b5 520a          	subw	sp,#10
 318       0000000a      OFST:	set	10
 321                     ; 67     u8 i = 0, res = 0;
 323  00b7 7b0a          	ld	a,(OFST+0,sp)
 326  00b9 0f05          	clr	(OFST-5,sp)
 327                     ; 68     u32 val = 0;
 329  00bb ae0000        	ldw	x,#0
 330  00be 1f08          	ldw	(OFST-2,sp),x
 331  00c0 ae0000        	ldw	x,#0
 332  00c3 1f06          	ldw	(OFST-4,sp),x
 333                     ; 69     if (inputstr[0] == '0' && (inputstr[1] == 'x' || inputstr[1] == 'X'))
 335  00c5 1e0b          	ldw	x,(OFST+1,sp)
 336  00c7 f6            	ld	a,(x)
 337  00c8 a130          	cp	a,#48
 338  00ca 2703          	jreq	L011
 339  00cc cc0237        	jp	L321
 340  00cf               L011:
 342  00cf 1e0b          	ldw	x,(OFST+1,sp)
 343  00d1 e601          	ld	a,(1,x)
 344  00d3 a178          	cp	a,#120
 345  00d5 270b          	jreq	L521
 347  00d7 1e0b          	ldw	x,(OFST+1,sp)
 348  00d9 e601          	ld	a,(1,x)
 349  00db a158          	cp	a,#88
 350  00dd 2703          	jreq	L211
 351  00df cc0237        	jp	L321
 352  00e2               L211:
 353  00e2               L521:
 354                     ; 71         if (inputstr[2] == '\0')
 356  00e2 1e0b          	ldw	x,(OFST+1,sp)
 357  00e4 6d02          	tnz	(2,x)
 358  00e6 2605          	jrne	L721
 359                     ; 73             return 0;
 361  00e8 4f            	clr	a
 363  00e9 ac580358      	jpf	L601
 364  00ed               L721:
 365                     ; 75         for (i = 2; i < 11; i++)
 367  00ed a602          	ld	a,#2
 368  00ef 6b0a          	ld	(OFST+0,sp),a
 369  00f1               L131:
 370                     ; 77             if (inputstr[i] == '\0')
 372  00f1 7b0b          	ld	a,(OFST+1,sp)
 373  00f3 97            	ld	xl,a
 374  00f4 7b0c          	ld	a,(OFST+2,sp)
 375  00f6 1b0a          	add	a,(OFST+0,sp)
 376  00f8 2401          	jrnc	L22
 377  00fa 5c            	incw	x
 378  00fb               L22:
 379  00fb 02            	rlwa	x,a
 380  00fc 7d            	tnz	(x)
 381  00fd 2619          	jrne	L731
 382                     ; 79                 *intnum = val;
 384  00ff 1e0f          	ldw	x,(OFST+5,sp)
 385  0101 7b09          	ld	a,(OFST-1,sp)
 386  0103 e703          	ld	(3,x),a
 387  0105 7b08          	ld	a,(OFST-2,sp)
 388  0107 e702          	ld	(2,x),a
 389  0109 7b07          	ld	a,(OFST-3,sp)
 390  010b e701          	ld	(1,x),a
 391  010d 7b06          	ld	a,(OFST-4,sp)
 392  010f f7            	ld	(x),a
 393                     ; 80                 res = 1; /* return 1; */
 395  0110 a601          	ld	a,#1
 396  0112 6b05          	ld	(OFST-5,sp),a
 397                     ; 81                 break;
 399  0114 ac280228      	jpf	L531
 400  0118               L731:
 401                     ; 83             if (ISVALIDHEX(inputstr[i]))
 403  0118 7b0b          	ld	a,(OFST+1,sp)
 404  011a 97            	ld	xl,a
 405  011b 7b0c          	ld	a,(OFST+2,sp)
 406  011d 1b0a          	add	a,(OFST+0,sp)
 407  011f 2401          	jrnc	L42
 408  0121 5c            	incw	x
 409  0122               L42:
 410  0122 02            	rlwa	x,a
 411  0123 f6            	ld	a,(x)
 412  0124 a141          	cp	a,#65
 413  0126 2510          	jrult	L541
 415  0128 7b0b          	ld	a,(OFST+1,sp)
 416  012a 97            	ld	xl,a
 417  012b 7b0c          	ld	a,(OFST+2,sp)
 418  012d 1b0a          	add	a,(OFST+0,sp)
 419  012f 2401          	jrnc	L62
 420  0131 5c            	incw	x
 421  0132               L62:
 422  0132 02            	rlwa	x,a
 423  0133 f6            	ld	a,(x)
 424  0134 a147          	cp	a,#71
 425  0136 2546          	jrult	L341
 426  0138               L541:
 428  0138 7b0b          	ld	a,(OFST+1,sp)
 429  013a 97            	ld	xl,a
 430  013b 7b0c          	ld	a,(OFST+2,sp)
 431  013d 1b0a          	add	a,(OFST+0,sp)
 432  013f 2401          	jrnc	L03
 433  0141 5c            	incw	x
 434  0142               L03:
 435  0142 02            	rlwa	x,a
 436  0143 f6            	ld	a,(x)
 437  0144 a161          	cp	a,#97
 438  0146 2510          	jrult	L151
 440  0148 7b0b          	ld	a,(OFST+1,sp)
 441  014a 97            	ld	xl,a
 442  014b 7b0c          	ld	a,(OFST+2,sp)
 443  014d 1b0a          	add	a,(OFST+0,sp)
 444  014f 2401          	jrnc	L23
 445  0151 5c            	incw	x
 446  0152               L23:
 447  0152 02            	rlwa	x,a
 448  0153 f6            	ld	a,(x)
 449  0154 a167          	cp	a,#103
 450  0156 2526          	jrult	L341
 451  0158               L151:
 453  0158 7b0b          	ld	a,(OFST+1,sp)
 454  015a 97            	ld	xl,a
 455  015b 7b0c          	ld	a,(OFST+2,sp)
 456  015d 1b0a          	add	a,(OFST+0,sp)
 457  015f 2401          	jrnc	L43
 458  0161 5c            	incw	x
 459  0162               L43:
 460  0162 02            	rlwa	x,a
 461  0163 f6            	ld	a,(x)
 462  0164 a130          	cp	a,#48
 463  0166 2403          	jruge	L411
 464  0168 cc0226        	jp	L141
 465  016b               L411:
 467  016b 7b0b          	ld	a,(OFST+1,sp)
 468  016d 97            	ld	xl,a
 469  016e 7b0c          	ld	a,(OFST+2,sp)
 470  0170 1b0a          	add	a,(OFST+0,sp)
 471  0172 2401          	jrnc	L63
 472  0174 5c            	incw	x
 473  0175               L63:
 474  0175 02            	rlwa	x,a
 475  0176 f6            	ld	a,(x)
 476  0177 a13a          	cp	a,#58
 477  0179 2503          	jrult	L611
 478  017b cc0226        	jp	L141
 479  017e               L611:
 480  017e               L341:
 481                     ; 85                 val = (val << 4) + CONVERTHEX(inputstr[i]);
 483  017e 7b0b          	ld	a,(OFST+1,sp)
 484  0180 97            	ld	xl,a
 485  0181 7b0c          	ld	a,(OFST+2,sp)
 486  0183 1b0a          	add	a,(OFST+0,sp)
 487  0185 2401          	jrnc	L24
 488  0187 5c            	incw	x
 489  0188               L24:
 490  0188 02            	rlwa	x,a
 491  0189 f6            	ld	a,(x)
 492  018a a130          	cp	a,#48
 493  018c 2523          	jrult	L04
 494  018e 7b0b          	ld	a,(OFST+1,sp)
 495  0190 97            	ld	xl,a
 496  0191 7b0c          	ld	a,(OFST+2,sp)
 497  0193 1b0a          	add	a,(OFST+0,sp)
 498  0195 2401          	jrnc	L44
 499  0197 5c            	incw	x
 500  0198               L44:
 501  0198 02            	rlwa	x,a
 502  0199 f6            	ld	a,(x)
 503  019a a13a          	cp	a,#58
 504  019c 2413          	jruge	L04
 505  019e 7b0b          	ld	a,(OFST+1,sp)
 506  01a0 97            	ld	xl,a
 507  01a1 7b0c          	ld	a,(OFST+2,sp)
 508  01a3 1b0a          	add	a,(OFST+0,sp)
 509  01a5 2401          	jrnc	L64
 510  01a7 5c            	incw	x
 511  01a8               L64:
 512  01a8 02            	rlwa	x,a
 513  01a9 f6            	ld	a,(x)
 514  01aa 5f            	clrw	x
 515  01ab 97            	ld	xl,a
 516  01ac 1d0030        	subw	x,#48
 517  01af 2044          	jra	L05
 518  01b1               L04:
 519  01b1 7b0b          	ld	a,(OFST+1,sp)
 520  01b3 97            	ld	xl,a
 521  01b4 7b0c          	ld	a,(OFST+2,sp)
 522  01b6 1b0a          	add	a,(OFST+0,sp)
 523  01b8 2401          	jrnc	L45
 524  01ba 5c            	incw	x
 525  01bb               L45:
 526  01bb 02            	rlwa	x,a
 527  01bc f6            	ld	a,(x)
 528  01bd a141          	cp	a,#65
 529  01bf 2523          	jrult	L25
 530  01c1 7b0b          	ld	a,(OFST+1,sp)
 531  01c3 97            	ld	xl,a
 532  01c4 7b0c          	ld	a,(OFST+2,sp)
 533  01c6 1b0a          	add	a,(OFST+0,sp)
 534  01c8 2401          	jrnc	L65
 535  01ca 5c            	incw	x
 536  01cb               L65:
 537  01cb 02            	rlwa	x,a
 538  01cc f6            	ld	a,(x)
 539  01cd a147          	cp	a,#71
 540  01cf 2413          	jruge	L25
 541  01d1 7b0b          	ld	a,(OFST+1,sp)
 542  01d3 97            	ld	xl,a
 543  01d4 7b0c          	ld	a,(OFST+2,sp)
 544  01d6 1b0a          	add	a,(OFST+0,sp)
 545  01d8 2401          	jrnc	L06
 546  01da 5c            	incw	x
 547  01db               L06:
 548  01db 02            	rlwa	x,a
 549  01dc f6            	ld	a,(x)
 550  01dd 5f            	clrw	x
 551  01de 97            	ld	xl,a
 552  01df 1d0037        	subw	x,#55
 553  01e2 2011          	jra	L26
 554  01e4               L25:
 555  01e4 7b0b          	ld	a,(OFST+1,sp)
 556  01e6 97            	ld	xl,a
 557  01e7 7b0c          	ld	a,(OFST+2,sp)
 558  01e9 1b0a          	add	a,(OFST+0,sp)
 559  01eb 2401          	jrnc	L46
 560  01ed 5c            	incw	x
 561  01ee               L46:
 562  01ee 02            	rlwa	x,a
 563  01ef f6            	ld	a,(x)
 564  01f0 5f            	clrw	x
 565  01f1 97            	ld	xl,a
 566  01f2 1d0057        	subw	x,#87
 567  01f5               L26:
 568  01f5               L05:
 569  01f5 cd0000        	call	c_itolx
 571  01f8 96            	ldw	x,sp
 572  01f9 1c0001        	addw	x,#OFST-9
 573  01fc cd0000        	call	c_rtol
 575  01ff 96            	ldw	x,sp
 576  0200 1c0006        	addw	x,#OFST-4
 577  0203 cd0000        	call	c_ltor
 579  0206 a604          	ld	a,#4
 580  0208 cd0000        	call	c_llsh
 582  020b 96            	ldw	x,sp
 583  020c 1c0001        	addw	x,#OFST-9
 584  020f cd0000        	call	c_ladd
 586  0212 96            	ldw	x,sp
 587  0213 1c0006        	addw	x,#OFST-4
 588  0216 cd0000        	call	c_rtol
 591                     ; 75         for (i = 2; i < 11; i++)
 593  0219 0c0a          	inc	(OFST+0,sp)
 596  021b 7b0a          	ld	a,(OFST+0,sp)
 597  021d a10b          	cp	a,#11
 598  021f 2403          	jruge	L021
 599  0221 cc00f1        	jp	L131
 600  0224               L021:
 601  0224 2002          	jra	L531
 602  0226               L141:
 603                     ; 90                 res = 0;
 605  0226 0f05          	clr	(OFST-5,sp)
 606                     ; 91                 break;
 607  0228               L531:
 608                     ; 94         if (i >= 11) res = 0; /* over 8 digit hex --invalid */
 610  0228 7b0a          	ld	a,(OFST+0,sp)
 611  022a a10b          	cp	a,#11
 612  022c 2403          	jruge	L221
 613  022e cc0356        	jp	L751
 614  0231               L221:
 617  0231 0f05          	clr	(OFST-5,sp)
 618  0233 ac560356      	jpf	L751
 619  0237               L321:
 620                     ; 98         for (i = 0;i < 11;i++)
 622  0237 0f0a          	clr	(OFST+0,sp)
 623  0239               L161:
 624                     ; 100             if (inputstr[i] == '\0')
 626  0239 7b0b          	ld	a,(OFST+1,sp)
 627  023b 97            	ld	xl,a
 628  023c 7b0c          	ld	a,(OFST+2,sp)
 629  023e 1b0a          	add	a,(OFST+0,sp)
 630  0240 2401          	jrnc	L66
 631  0242 5c            	incw	x
 632  0243               L66:
 633  0243 02            	rlwa	x,a
 634  0244 7d            	tnz	(x)
 635  0245 2619          	jrne	L761
 636                     ; 102                 *intnum = val;
 638  0247 1e0f          	ldw	x,(OFST+5,sp)
 639  0249 7b09          	ld	a,(OFST-1,sp)
 640  024b e703          	ld	(3,x),a
 641  024d 7b08          	ld	a,(OFST-2,sp)
 642  024f e702          	ld	(2,x),a
 643  0251 7b07          	ld	a,(OFST-3,sp)
 644  0253 e701          	ld	(1,x),a
 645  0255 7b06          	ld	a,(OFST-4,sp)
 646  0257 f7            	ld	(x),a
 647                     ; 104                 res = 1;
 649  0258 a601          	ld	a,#1
 650  025a 6b05          	ld	(OFST-5,sp),a
 651                     ; 105                 break;
 653  025c ac4e034e      	jpf	L561
 654  0260               L761:
 655                     ; 107             else if ((inputstr[i] == 'k' || inputstr[i] == 'K') && (i > 0))
 657  0260 7b0b          	ld	a,(OFST+1,sp)
 658  0262 97            	ld	xl,a
 659  0263 7b0c          	ld	a,(OFST+2,sp)
 660  0265 1b0a          	add	a,(OFST+0,sp)
 661  0267 2401          	jrnc	L07
 662  0269 5c            	incw	x
 663  026a               L07:
 664  026a 02            	rlwa	x,a
 665  026b f6            	ld	a,(x)
 666  026c a16b          	cp	a,#107
 667  026e 2710          	jreq	L571
 669  0270 7b0b          	ld	a,(OFST+1,sp)
 670  0272 97            	ld	xl,a
 671  0273 7b0c          	ld	a,(OFST+2,sp)
 672  0275 1b0a          	add	a,(OFST+0,sp)
 673  0277 2401          	jrnc	L27
 674  0279 5c            	incw	x
 675  027a               L27:
 676  027a 02            	rlwa	x,a
 677  027b f6            	ld	a,(x)
 678  027c a14b          	cp	a,#75
 679  027e 2626          	jrne	L371
 680  0280               L571:
 682  0280 0d0a          	tnz	(OFST+0,sp)
 683  0282 2722          	jreq	L371
 684                     ; 109                 val = val << 10;
 686  0284 96            	ldw	x,sp
 687  0285 1c0006        	addw	x,#OFST-4
 688  0288 a60a          	ld	a,#10
 689  028a cd0000        	call	c_lglsh
 691                     ; 110                 *intnum = val;
 693  028d 1e0f          	ldw	x,(OFST+5,sp)
 694  028f 7b09          	ld	a,(OFST-1,sp)
 695  0291 e703          	ld	(3,x),a
 696  0293 7b08          	ld	a,(OFST-2,sp)
 697  0295 e702          	ld	(2,x),a
 698  0297 7b07          	ld	a,(OFST-3,sp)
 699  0299 e701          	ld	(1,x),a
 700  029b 7b06          	ld	a,(OFST-4,sp)
 701  029d f7            	ld	(x),a
 702                     ; 111                 res = 1;
 704  029e a601          	ld	a,#1
 705  02a0 6b05          	ld	(OFST-5,sp),a
 706                     ; 112                 break;
 708  02a2 ac4e034e      	jpf	L561
 709  02a6               L371:
 710                     ; 114             else if ((inputstr[i] == 'm' || inputstr[i] == 'M') && (i > 0))
 712  02a6 7b0b          	ld	a,(OFST+1,sp)
 713  02a8 97            	ld	xl,a
 714  02a9 7b0c          	ld	a,(OFST+2,sp)
 715  02ab 1b0a          	add	a,(OFST+0,sp)
 716  02ad 2401          	jrnc	L47
 717  02af 5c            	incw	x
 718  02b0               L47:
 719  02b0 02            	rlwa	x,a
 720  02b1 f6            	ld	a,(x)
 721  02b2 a16d          	cp	a,#109
 722  02b4 2710          	jreq	L302
 724  02b6 7b0b          	ld	a,(OFST+1,sp)
 725  02b8 97            	ld	xl,a
 726  02b9 7b0c          	ld	a,(OFST+2,sp)
 727  02bb 1b0a          	add	a,(OFST+0,sp)
 728  02bd 2401          	jrnc	L67
 729  02bf 5c            	incw	x
 730  02c0               L67:
 731  02c0 02            	rlwa	x,a
 732  02c1 f6            	ld	a,(x)
 733  02c2 a14d          	cp	a,#77
 734  02c4 2624          	jrne	L102
 735  02c6               L302:
 737  02c6 0d0a          	tnz	(OFST+0,sp)
 738  02c8 2720          	jreq	L102
 739                     ; 116                 val = val << 20;
 741  02ca 96            	ldw	x,sp
 742  02cb 1c0006        	addw	x,#OFST-4
 743  02ce a614          	ld	a,#20
 744  02d0 cd0000        	call	c_lglsh
 746                     ; 117                 *intnum = val;
 748  02d3 1e0f          	ldw	x,(OFST+5,sp)
 749  02d5 7b09          	ld	a,(OFST-1,sp)
 750  02d7 e703          	ld	(3,x),a
 751  02d9 7b08          	ld	a,(OFST-2,sp)
 752  02db e702          	ld	(2,x),a
 753  02dd 7b07          	ld	a,(OFST-3,sp)
 754  02df e701          	ld	(1,x),a
 755  02e1 7b06          	ld	a,(OFST-4,sp)
 756  02e3 f7            	ld	(x),a
 757                     ; 118                 res = 1;
 759  02e4 a601          	ld	a,#1
 760  02e6 6b05          	ld	(OFST-5,sp),a
 761                     ; 119                 break;
 763  02e8 2064          	jra	L561
 764  02ea               L102:
 765                     ; 121             else if (ISVALIDDEC(inputstr[i]))
 767  02ea 7b0b          	ld	a,(OFST+1,sp)
 768  02ec 97            	ld	xl,a
 769  02ed 7b0c          	ld	a,(OFST+2,sp)
 770  02ef 1b0a          	add	a,(OFST+0,sp)
 771  02f1 2401          	jrnc	L001
 772  02f3 5c            	incw	x
 773  02f4               L001:
 774  02f4 02            	rlwa	x,a
 775  02f5 f6            	ld	a,(x)
 776  02f6 a130          	cp	a,#48
 777  02f8 2552          	jrult	L702
 779  02fa 7b0b          	ld	a,(OFST+1,sp)
 780  02fc 97            	ld	xl,a
 781  02fd 7b0c          	ld	a,(OFST+2,sp)
 782  02ff 1b0a          	add	a,(OFST+0,sp)
 783  0301 2401          	jrnc	L201
 784  0303 5c            	incw	x
 785  0304               L201:
 786  0304 02            	rlwa	x,a
 787  0305 f6            	ld	a,(x)
 788  0306 a13a          	cp	a,#58
 789  0308 2442          	jruge	L702
 790                     ; 122                 val = val * 10 + CONVERTDEC(inputstr[i]);
 792  030a 7b0b          	ld	a,(OFST+1,sp)
 793  030c 97            	ld	xl,a
 794  030d 7b0c          	ld	a,(OFST+2,sp)
 795  030f 1b0a          	add	a,(OFST+0,sp)
 796  0311 2401          	jrnc	L401
 797  0313 5c            	incw	x
 798  0314               L401:
 799  0314 02            	rlwa	x,a
 800  0315 f6            	ld	a,(x)
 801  0316 5f            	clrw	x
 802  0317 97            	ld	xl,a
 803  0318 1d0030        	subw	x,#48
 804  031b cd0000        	call	c_itolx
 806  031e 96            	ldw	x,sp
 807  031f 1c0001        	addw	x,#OFST-9
 808  0322 cd0000        	call	c_rtol
 810  0325 96            	ldw	x,sp
 811  0326 1c0006        	addw	x,#OFST-4
 812  0329 cd0000        	call	c_ltor
 814  032c a60a          	ld	a,#10
 815  032e cd0000        	call	c_smul
 817  0331 96            	ldw	x,sp
 818  0332 1c0001        	addw	x,#OFST-9
 819  0335 cd0000        	call	c_ladd
 821  0338 96            	ldw	x,sp
 822  0339 1c0006        	addw	x,#OFST-4
 823  033c cd0000        	call	c_rtol
 826  033f               L171:
 827                     ; 98         for (i = 0;i < 11;i++)
 829  033f 0c0a          	inc	(OFST+0,sp)
 832  0341 7b0a          	ld	a,(OFST+0,sp)
 833  0343 a10b          	cp	a,#11
 834  0345 2403          	jruge	L421
 835  0347 cc0239        	jp	L161
 836  034a               L421:
 837  034a 2002          	jra	L561
 838  034c               L702:
 839                     ; 126                 res = 0;
 841  034c 0f05          	clr	(OFST-5,sp)
 842                     ; 127                 break;
 843  034e               L561:
 844                     ; 130         if (i >= 11) res = 0; /* Over 10 digit decimal --invalid */
 846  034e 7b0a          	ld	a,(OFST+0,sp)
 847  0350 a10b          	cp	a,#11
 848  0352 2502          	jrult	L751
 851  0354 0f05          	clr	(OFST-5,sp)
 852  0356               L751:
 853                     ; 132     return res;
 855  0356 7b05          	ld	a,(OFST-5,sp)
 857  0358               L601:
 859  0358 5b0c          	addw	sp,#12
 860  035a 81            	ret
 908                     ; 143 u8 GetIntegerInput(u32 *num)
 908                     ; 144 {
 909                     	switch	.text
 910  035b               _GetIntegerInput:
 912  035b 89            	pushw	x
 913  035c 5210          	subw	sp,#16
 914       00000010      OFST:	set	16
 917  035e               L732:
 918                     ; 148         GetInputString(inputstr);
 920  035e 96            	ldw	x,sp
 921  035f 1c0001        	addw	x,#OFST-15
 922  0362 cd03ed        	call	_GetInputString
 924                     ; 149         if (inputstr[0] == '\0') continue;
 926  0365 0d01          	tnz	(OFST-15,sp)
 927  0367 27f5          	jreq	L732
 930                     ; 150         if ((inputstr[0] == 'a' || inputstr[0] == 'A') && inputstr[1] == '\0')
 932  0369 7b01          	ld	a,(OFST-15,sp)
 933  036b a161          	cp	a,#97
 934  036d 2706          	jreq	L742
 936  036f 7b01          	ld	a,(OFST-15,sp)
 937  0371 a141          	cp	a,#65
 938  0373 260c          	jrne	L542
 939  0375               L742:
 941  0375 0d02          	tnz	(OFST-14,sp)
 942  0377 2608          	jrne	L542
 943                     ; 152             SerialPutString("User Cancelled \r\n");
 945  0379 ae0290        	ldw	x,#L152
 946  037c ad59          	call	_SerialPutString
 948                     ; 153             return 0;
 950  037e 4f            	clr	a
 952  037f 2017          	jra	L031
 953  0381               L542:
 954                     ; 155         if (Str2Int(inputstr, num) == 0)
 956  0381 1e11          	ldw	x,(OFST+1,sp)
 957  0383 89            	pushw	x
 958  0384 96            	ldw	x,sp
 959  0385 1c0003        	addw	x,#OFST-13
 960  0388 cd00b4        	call	_Str2Int
 962  038b 85            	popw	x
 963  038c 4d            	tnz	a
 964  038d 2607          	jrne	L352
 965                     ; 157             SerialPutString("Error, Input again: \r\n");
 967  038f ae0279        	ldw	x,#L552
 968  0392 ad43          	call	_SerialPutString
 971  0394 20c8          	jra	L732
 972  0396               L352:
 973                     ; 161             return 1;
 975  0396 a601          	ld	a,#1
 977  0398               L031:
 979  0398 5b12          	addw	sp,#18
 980  039a 81            	ret
1046                     ; 174 u8 SerialKeyPressed(char *key)
1046                     ; 175 {
1047                     	switch	.text
1048  039b               _SerialKeyPressed:
1050  039b 89            	pushw	x
1051  039c 88            	push	a
1052       00000001      OFST:	set	1
1055                     ; 178 	flag = UART2_GetFlagStatus(UART2_FLAG_RXNE);
1057  039d ae0020        	ldw	x,#32
1058  03a0 cd0000        	call	_UART2_GetFlagStatus
1060  03a3 6b01          	ld	(OFST+0,sp),a
1061                     ; 179 	if ( flag == SET)
1063  03a5 7b01          	ld	a,(OFST+0,sp)
1064  03a7 a101          	cp	a,#1
1065  03a9 260a          	jrne	L313
1066                     ; 181 		*key = (char)UART2->DR;
1068  03ab 1e02          	ldw	x,(OFST+1,sp)
1069  03ad c65241        	ld	a,21057
1070  03b0 f7            	ld	(x),a
1071                     ; 182 		return 1;
1073  03b1 a601          	ld	a,#1
1075  03b3 2001          	jra	L431
1076  03b5               L313:
1077                     ; 186 		return 0;
1079  03b5 4f            	clr	a
1081  03b6               L431:
1083  03b6 5b03          	addw	sp,#3
1084  03b8 81            	ret
1119                     ; 197 char GetKey(void)
1119                     ; 198 {
1120                     	switch	.text
1121  03b9               _GetKey:
1123  03b9 88            	push	a
1124       00000001      OFST:	set	1
1127                     ; 199 	char key = 0;
1129  03ba 0f01          	clr	(OFST+0,sp)
1130  03bc               L533:
1131                     ; 203 		if (SerialKeyPressed((char*)&key)) break;
1133  03bc 96            	ldw	x,sp
1134  03bd 1c0001        	addw	x,#OFST+0
1135  03c0 add9          	call	_SerialKeyPressed
1137  03c2 4d            	tnz	a
1138  03c3 27f7          	jreq	L533
1140                     ; 205 	return key;
1142  03c5 7b01          	ld	a,(OFST+0,sp)
1145  03c7 5b01          	addw	sp,#1
1146  03c9 81            	ret
1181                     ; 215 void SerialPutChar(char c)
1181                     ; 216 {
1182                     	switch	.text
1183  03ca               _SerialPutChar:
1187                     ; 217     UART2_SendData8(c);
1189  03ca cd0000        	call	_UART2_SendData8
1192  03cd               L363:
1193                     ; 218     while ((UART2->SR & UART2_SR_TXE ) != UART2_SR_TXE );
1195  03cd c65240        	ld	a,21056
1196  03d0 a480          	and	a,#128
1197  03d2 a180          	cp	a,#128
1198  03d4 26f7          	jrne	L363
1199                     ; 219 }
1202  03d6 81            	ret
1238                     ; 228 void SerialPutString(char *s)
1238                     ; 229 {
1239                     	switch	.text
1240  03d7               _SerialPutString:
1242  03d7 89            	pushw	x
1243       00000000      OFST:	set	0
1246  03d8 200c          	jra	L704
1247  03da               L504:
1248                     ; 232 		SerialPutChar(*s);
1250  03da 1e01          	ldw	x,(OFST+1,sp)
1251  03dc f6            	ld	a,(x)
1252  03dd adeb          	call	_SerialPutChar
1254                     ; 233 		s ++;
1256  03df 1e01          	ldw	x,(OFST+1,sp)
1257  03e1 1c0001        	addw	x,#1
1258  03e4 1f01          	ldw	(OFST+1,sp),x
1259  03e6               L704:
1260                     ; 230 	while (*s != '\0')
1262  03e6 1e01          	ldw	x,(OFST+1,sp)
1263  03e8 7d            	tnz	(x)
1264  03e9 26ef          	jrne	L504
1265                     ; 235 }
1268  03eb 85            	popw	x
1269  03ec 81            	ret
1325                     ; 244 void GetInputString (char *buffP)
1325                     ; 245 {
1326                     	switch	.text
1327  03ed               _GetInputString:
1329  03ed 89            	pushw	x
1330  03ee 5203          	subw	sp,#3
1331       00000003      OFST:	set	3
1334                     ; 246 	int bytes_read = 0;
1336  03f0 5f            	clrw	x
1337  03f1 1f01          	ldw	(OFST-2,sp),x
1338                     ; 247 	char c = 0;
1340  03f3 7b03          	ld	a,(OFST+0,sp)
1341  03f5               L144:
1342                     ; 250 		c = GetKey();
1344  03f5 adc2          	call	_GetKey
1346  03f7 6b03          	ld	(OFST+0,sp),a
1347                     ; 251 		if (c == '\r')
1349  03f9 7b03          	ld	a,(OFST+0,sp)
1350  03fb a10d          	cp	a,#13
1351  03fd 260e          	jrne	L544
1352                     ; 252       break;
1353                     ; 275   SerialPutString("\n\r");
1355  03ff ae0253        	ldw	x,#L364
1356  0402 add3          	call	_SerialPutString
1358                     ; 276   buffP[bytes_read] = '\0';
1360  0404 1e01          	ldw	x,(OFST-2,sp)
1361  0406 72fb04        	addw	x,(OFST+1,sp)
1362  0409 7f            	clr	(x)
1363                     ; 277 }
1366  040a 5b05          	addw	sp,#5
1367  040c 81            	ret
1368  040d               L544:
1369                     ; 253     if (c == '\b') /* Backspace */
1371  040d 7b03          	ld	a,(OFST+0,sp)
1372  040f a108          	cp	a,#8
1373  0411 2613          	jrne	L744
1374                     ; 255       if (bytes_read > 0)
1376  0413 9c            	rvf
1377  0414 1e01          	ldw	x,(OFST-2,sp)
1378  0416 2ddd          	jrsle	L144
1379                     ; 257         SerialPutString("\b \b");
1381  0418 ae0275        	ldw	x,#L354
1382  041b adba          	call	_SerialPutString
1384                     ; 258         bytes_read --;
1386  041d 1e01          	ldw	x,(OFST-2,sp)
1387  041f 1d0001        	subw	x,#1
1388  0422 1f01          	ldw	(OFST-2,sp),x
1389  0424 20cf          	jra	L144
1390  0426               L744:
1391                     ; 262     if (bytes_read >= CMD_STRING_SIZE )
1393  0426 9c            	rvf
1394  0427 1e01          	ldw	x,(OFST-2,sp)
1395  0429 a30080        	cpw	x,#128
1396  042c 2f0a          	jrslt	L554
1397                     ; 264       SerialPutString("Command string size overflow\r\n");
1399  042e ae0256        	ldw	x,#L754
1400  0431 ada4          	call	_SerialPutString
1402                     ; 265       bytes_read = 0;
1404  0433 5f            	clrw	x
1405  0434 1f01          	ldw	(OFST-2,sp),x
1406                     ; 266       continue;
1408  0436 20bd          	jra	L144
1409  0438               L554:
1410                     ; 268     if (c >= 0x20 && c <= 0x7E)
1412  0438 7b03          	ld	a,(OFST+0,sp)
1413  043a a120          	cp	a,#32
1414  043c 25b7          	jrult	L144
1416  043e 7b03          	ld	a,(OFST+0,sp)
1417  0440 a17f          	cp	a,#127
1418  0442 24b1          	jruge	L144
1419                     ; 270       buffP[bytes_read++] = c;
1421  0444 7b03          	ld	a,(OFST+0,sp)
1422  0446 1e01          	ldw	x,(OFST-2,sp)
1423  0448 1c0001        	addw	x,#1
1424  044b 1f01          	ldw	(OFST-2,sp),x
1425  044d 1d0001        	subw	x,#1
1426  0450 72fb04        	addw	x,(OFST+1,sp)
1427  0453 f7            	ld	(x),a
1428                     ; 271       SerialPutChar(c);
1430  0454 7b03          	ld	a,(OFST+0,sp)
1431  0456 cd03ca        	call	_SerialPutChar
1433  0459 209a          	jra	L144
1535                     .const:	section	.text
1536  0000               L136:
1537  0000 0003          	dc.w	3
1538  0002 00000001      	dc.l	1
1539  0006 055b          	dc.w	L564
1540  0008 00000002      	dc.l	2
1541  000c 055f          	dc.w	L764
1542  000e 00000003      	dc.l	3
1543  0012 0565          	dc.w	L174
1544  0014 056b          	dc.w	L374
1545                     ; 287 void Main_Menu(void)
1545                     ; 288 {
1546                     	switch	.text
1547  045b               _Main_Menu:
1549  045b 524d          	subw	sp,#77
1550       0000004d      OFST:	set	77
1553                     ; 292 	bool freq_error = RESET;
1555  045d 7b05          	ld	a,(OFST-72,sp)
1556  045f               L345:
1557                     ; 298 		bTreat = RESET ;
1559  045f 0f4d          	clr	(OFST+0,sp)
1560                     ; 299     SerialPutString("\r\n====================== STM8S-Discovery ===================\r\n");
1562  0461 ae0214        	ldw	x,#L745
1563  0464 cd03d7        	call	_SerialPutString
1565                     ; 300 		SerialPutString("This Application is basic example of UART interface with\r\n");
1567  0467 ae01d9        	ldw	x,#L155
1568  046a cd03d7        	call	_SerialPutString
1570                     ; 301 		SerialPutString("Windows Hyper Terminal. \r\n");
1572  046d ae01be        	ldw	x,#L355
1573  0470 cd03d7        	call	_SerialPutString
1575                     ; 302 		SerialPutString("\r\n==========================================================\r\n");
1577  0473 ae017f        	ldw	x,#L555
1578  0476 cd03d7        	call	_SerialPutString
1580                     ; 303 		SerialPutString("                          APPLICATION MENU :\r\n");
1582  0479 ae0150        	ldw	x,#L755
1583  047c cd03d7        	call	_SerialPutString
1585                     ; 304 		SerialPutString("\r\n==========================================================\r\n\n");
1587  047f ae0110        	ldw	x,#L165
1588  0482 cd03d7        	call	_SerialPutString
1590                     ; 305 		SerialPutString(" 1 - Set LD1 on \r\n");
1592  0485 ae00fd        	ldw	x,#L365
1593  0488 cd03d7        	call	_SerialPutString
1595                     ; 306 		SerialPutString(" 2 - Set LD1 off \r\n");
1597  048b ae00e9        	ldw	x,#L565
1598  048e cd03d7        	call	_SerialPutString
1600                     ; 307 		SerialPutString(" 3 - Set LD1 blink \r\n");
1602  0491 ae00d3        	ldw	x,#L765
1603  0494 cd03d7        	call	_SerialPutString
1605                     ; 308 		SerialPutString(" 4 - BEEPER ON \r\n");
1607  0497 ae00c1        	ldw	x,#L175
1608  049a cd03d7        	call	_SerialPutString
1610                     ; 309 		SerialPutString(" 5 - BEEPER OFF \r\n\n");
1612  049d ae00ad        	ldw	x,#L375
1613  04a0 cd03d7        	call	_SerialPutString
1615                     ; 310 		SerialPutString("Enter your choice : ");
1617  04a3 ae0098        	ldw	x,#L575
1618  04a6 cd03d7        	call	_SerialPutString
1620                     ; 311 		GetInputString(choice);
1622  04a9 96            	ldw	x,sp
1623  04aa 1c0007        	addw	x,#OFST-70
1624  04ad cd03ed        	call	_GetInputString
1626                     ; 313 		if (strcmp(choice,"1")== 0)
1628  04b0 ae0096        	ldw	x,#L106
1629  04b3 89            	pushw	x
1630  04b4 96            	ldw	x,sp
1631  04b5 1c0009        	addw	x,#OFST-68
1632  04b8 cd0000        	call	_strcmp
1634  04bb 5b02          	addw	sp,#2
1635  04bd a30000        	cpw	x,#0
1636  04c0 2611          	jrne	L775
1637                     ; 315 		  bTreat = SET;
1639  04c2 a601          	ld	a,#1
1640  04c4 6b4d          	ld	(OFST+0,sp),a
1641                     ; 317 			TIM3_Cmd(DISABLE);
1643  04c6 4f            	clr	a
1644  04c7 cd0000        	call	_TIM3_Cmd
1646                     ; 318 			GPIO_WriteLow(GPIOD, 0x01 );
1648  04ca 4b01          	push	#1
1649  04cc ae500f        	ldw	x,#20495
1650  04cf cd0000        	call	_GPIO_WriteLow
1652  04d2 84            	pop	a
1653  04d3               L775:
1654                     ; 321 		if ((strcmp(choice,"2") == 0))
1656  04d3 ae0094        	ldw	x,#L506
1657  04d6 89            	pushw	x
1658  04d7 96            	ldw	x,sp
1659  04d8 1c0009        	addw	x,#OFST-68
1660  04db cd0000        	call	_strcmp
1662  04de 5b02          	addw	sp,#2
1663  04e0 a30000        	cpw	x,#0
1664  04e3 2611          	jrne	L306
1665                     ; 323 		  bTreat = SET;
1667  04e5 a601          	ld	a,#1
1668  04e7 6b4d          	ld	(OFST+0,sp),a
1669                     ; 325 			TIM3_Cmd(DISABLE);
1671  04e9 4f            	clr	a
1672  04ea cd0000        	call	_TIM3_Cmd
1674                     ; 326 			GPIO_WriteHigh(GPIOD, 0x01 );
1676  04ed 4b01          	push	#1
1677  04ef ae500f        	ldw	x,#20495
1678  04f2 cd0000        	call	_GPIO_WriteHigh
1680  04f5 84            	pop	a
1681  04f6               L306:
1682                     ; 329 		if (strcmp(choice,"3") == 0)
1684  04f6 ae0092        	ldw	x,#L116
1685  04f9 89            	pushw	x
1686  04fa 96            	ldw	x,sp
1687  04fb 1c0009        	addw	x,#OFST-68
1688  04fe cd0000        	call	_strcmp
1690  0501 5b02          	addw	sp,#2
1691  0503 a30000        	cpw	x,#0
1692  0506 2609          	jrne	L706
1693                     ; 331 		  bTreat = SET;
1695  0508 a601          	ld	a,#1
1696  050a 6b4d          	ld	(OFST+0,sp),a
1697                     ; 333 			TIM3_Cmd(ENABLE);
1699  050c a601          	ld	a,#1
1700  050e cd0000        	call	_TIM3_Cmd
1702  0511               L706:
1703                     ; 336 		if (strcmp(choice,"4") == 0)
1705  0511 ae0090        	ldw	x,#L516
1706  0514 89            	pushw	x
1707  0515 96            	ldw	x,sp
1708  0516 1c0009        	addw	x,#OFST-68
1709  0519 cd0000        	call	_strcmp
1711  051c 5b02          	addw	sp,#2
1712  051e a30000        	cpw	x,#0
1713  0521 2664          	jrne	L316
1714                     ; 338 		  bTreat = SET;
1716  0523 a601          	ld	a,#1
1717  0525 6b4d          	ld	(OFST+0,sp),a
1718                     ; 339 			freq_error = RESET ;
1720  0527 0f05          	clr	(OFST-72,sp)
1721                     ; 340 			SerialPutString("\r\nPlease select a BEEP frequency :\r\n");
1723  0529 ae006b        	ldw	x,#L716
1724  052c cd03d7        	call	_SerialPutString
1726                     ; 341 			SerialPutString("1 -  1KHz\r\n");
1728  052f ae005f        	ldw	x,#L126
1729  0532 cd03d7        	call	_SerialPutString
1731                     ; 342 			SerialPutString("2 -  2KHz\r\n");
1733  0535 ae0053        	ldw	x,#L326
1734  0538 cd03d7        	call	_SerialPutString
1736                     ; 343 			SerialPutString("3 -  4KHz\r\n");
1738  053b ae0047        	ldw	x,#L526
1739  053e cd03d7        	call	_SerialPutString
1741                     ; 344 			SerialPutString("Choice : ");
1743  0541 ae003d        	ldw	x,#L726
1744  0544 cd03d7        	call	_SerialPutString
1746                     ; 345 			GetIntegerInput(&freq_choice);
1748  0547 96            	ldw	x,sp
1749  0548 1c0001        	addw	x,#OFST-76
1750  054b cd035b        	call	_GetIntegerInput
1752                     ; 346 			switch(freq_choice)
1754  054e 96            	ldw	x,sp
1755  054f 1c0001        	addw	x,#OFST-76
1756  0552 cd0000        	call	c_ltor
1759  0555 ae0000        	ldw	x,#L136
1760  0558 cd0000        	call	c_jltab
1761  055b               L564:
1762                     ; 348 				case 1 : freq = 0; break;
1764  055b 0f06          	clr	(OFST-71,sp)
1767  055d 2016          	jra	L336
1768  055f               L764:
1769                     ; 349 				case 2 : freq = 64; break;
1771  055f a640          	ld	a,#64
1772  0561 6b06          	ld	(OFST-71,sp),a
1775  0563 2010          	jra	L336
1776  0565               L174:
1777                     ; 350 				case 3 : freq = 128; break;
1779  0565 a680          	ld	a,#128
1780  0567 6b06          	ld	(OFST-71,sp),a
1783  0569 200a          	jra	L336
1784  056b               L374:
1785                     ; 351 				default : SerialPutString("\n Selection ERROR "); freq_error = SET; break;
1787  056b ae002a        	ldw	x,#L536
1788  056e cd03d7        	call	_SerialPutString
1792  0571 a601          	ld	a,#1
1793  0573 6b05          	ld	(OFST-72,sp),a
1796  0575               L336:
1797                     ; 353 			if (!freq_error)
1799  0575 0d05          	tnz	(OFST-72,sp)
1800  0577 260e          	jrne	L316
1801                     ; 355 				BEEP_Cmd(DISABLE);
1803  0579 4f            	clr	a
1804  057a cd0000        	call	_BEEP_Cmd
1806                     ; 356 				BEEP_Init(freq);
1808  057d 7b06          	ld	a,(OFST-71,sp)
1809  057f cd0000        	call	_BEEP_Init
1811                     ; 357 				BEEP_Cmd(ENABLE);
1813  0582 a601          	ld	a,#1
1814  0584 cd0000        	call	_BEEP_Cmd
1816  0587               L316:
1817                     ; 361 		if (strcmp(choice,"5") == 0)
1819  0587 ae0028        	ldw	x,#L346
1820  058a 89            	pushw	x
1821  058b 96            	ldw	x,sp
1822  058c 1c0009        	addw	x,#OFST-68
1823  058f cd0000        	call	_strcmp
1825  0592 5b02          	addw	sp,#2
1826  0594 a30000        	cpw	x,#0
1827  0597 2608          	jrne	L146
1828                     ; 363 		  bTreat = SET;
1830  0599 a601          	ld	a,#1
1831  059b 6b4d          	ld	(OFST+0,sp),a
1832                     ; 364 			BEEP_Cmd(DISABLE);
1834  059d 4f            	clr	a
1835  059e cd0000        	call	_BEEP_Cmd
1837  05a1               L146:
1838                     ; 367 		if (bTreat == RESET)
1840  05a1 0d4d          	tnz	(OFST+0,sp)
1841  05a3 2703          	jreq	L051
1842  05a5 cc045f        	jp	L345
1843  05a8               L051:
1844                     ; 369 			SerialPutString(" wrong choice  \r\n");
1846  05a8 ae0016        	ldw	x,#L746
1847  05ab cd03d7        	call	_SerialPutString
1849  05ae ac5f045f      	jpf	L345
1862                     	xdef	_Main_Menu
1863                     	xdef	_GetInputString
1864                     	xdef	_SerialPutString
1865                     	xdef	_SerialPutChar
1866                     	xdef	_GetKey
1867                     	xdef	_SerialKeyPressed
1868                     	xdef	_GetIntegerInput
1869                     	xdef	_Str2Int
1870                     	xdef	_Int2Str
1871                     	xref	_UART2_GetFlagStatus
1872                     	xref	_UART2_SendData8
1873                     	xref	_TIM3_Cmd
1874                     	xref	_GPIO_WriteLow
1875                     	xref	_GPIO_WriteHigh
1876                     	xref	_BEEP_Cmd
1877                     	xref	_BEEP_Init
1878                     	xref	_strcmp
1879                     	switch	.const
1880  0016               L746:
1881  0016 2077726f6e67  	dc.b	" wrong choice  ",13
1882  0026 0a00          	dc.b	10,0
1883  0028               L346:
1884  0028 3500          	dc.b	"5",0
1885  002a               L536:
1886  002a 0a2053656c65  	dc.b	10,32,83,101,108,101
1887  0030 6374696f6e20  	dc.b	"ction ERROR ",0
1888  003d               L726:
1889  003d 43686f696365  	dc.b	"Choice : ",0
1890  0047               L526:
1891  0047 33202d202034  	dc.b	"3 -  4KHz",13
1892  0051 0a00          	dc.b	10,0
1893  0053               L326:
1894  0053 32202d202032  	dc.b	"2 -  2KHz",13
1895  005d 0a00          	dc.b	10,0
1896  005f               L126:
1897  005f 31202d202031  	dc.b	"1 -  1KHz",13
1898  0069 0a00          	dc.b	10,0
1899  006b               L716:
1900  006b 0d0a506c6561  	dc.b	13,10,80,108,101,97
1901  0071 73652073656c  	dc.b	"se select a BEEP f"
1902  0083 72657175656e  	dc.b	"requency :",13
1903  008e 0a00          	dc.b	10,0
1904  0090               L516:
1905  0090 3400          	dc.b	"4",0
1906  0092               L116:
1907  0092 3300          	dc.b	"3",0
1908  0094               L506:
1909  0094 3200          	dc.b	"2",0
1910  0096               L106:
1911  0096 3100          	dc.b	"1",0
1912  0098               L575:
1913  0098 456e74657220  	dc.b	"Enter your choice "
1914  00aa 3a2000        	dc.b	": ",0
1915  00ad               L375:
1916  00ad 2035202d2042  	dc.b	" 5 - BEEPER OFF ",13
1917  00be 0a0a00        	dc.b	10,10,0
1918  00c1               L175:
1919  00c1 2034202d2042  	dc.b	" 4 - BEEPER ON ",13
1920  00d1 0a00          	dc.b	10,0
1921  00d3               L765:
1922  00d3 2033202d2053  	dc.b	" 3 - Set LD1 blink"
1923  00e5 200d          	dc.b	" ",13
1924  00e7 0a00          	dc.b	10,0
1925  00e9               L565:
1926  00e9 2032202d2053  	dc.b	" 2 - Set LD1 off ",13
1927  00fb 0a00          	dc.b	10,0
1928  00fd               L365:
1929  00fd 2031202d2053  	dc.b	" 1 - Set LD1 on ",13
1930  010e 0a00          	dc.b	10,0
1931  0110               L165:
1932  0110 0d0a3d3d3d3d  	dc.b	13,10,61,61,61,61
1933  0116 3d3d3d3d3d3d  	dc.b	"=================="
1934  0128 3d3d3d3d3d3d  	dc.b	"=================="
1935  013a 3d3d3d3d3d3d  	dc.b	"=================="
1936  014c 0d0a0a00      	dc.b	13,10,10,0
1937  0150               L755:
1938  0150 202020202020  	dc.b	"                  "
1939  0162 202020202020  	dc.b	"        APPLICATIO"
1940  0174 4e204d454e55  	dc.b	"N MENU :",13
1941  017d 0a00          	dc.b	10,0
1942  017f               L555:
1943  017f 0d0a3d3d3d3d  	dc.b	13,10,61,61,61,61
1944  0185 3d3d3d3d3d3d  	dc.b	"=================="
1945  0197 3d3d3d3d3d3d  	dc.b	"=================="
1946  01a9 3d3d3d3d3d3d  	dc.b	"=================="
1947  01bb 0d0a00        	dc.b	13,10,0
1948  01be               L355:
1949  01be 57696e646f77  	dc.b	"Windows Hyper Term"
1950  01d0 696e616c2e20  	dc.b	"inal. ",13
1951  01d7 0a00          	dc.b	10,0
1952  01d9               L155:
1953  01d9 546869732041  	dc.b	"This Application i"
1954  01eb 732062617369  	dc.b	"s basic example of"
1955  01fd 205541525420  	dc.b	" UART interface wi"
1956  020f 74680d        	dc.b	"th",13
1957  0212 0a00          	dc.b	10,0
1958  0214               L745:
1959  0214 0d0a3d3d3d3d  	dc.b	13,10,61,61,61,61
1960  021a 3d3d3d3d3d3d  	dc.b	"=================="
1961  022c 2053544d3853  	dc.b	" STM8S-Discovery ="
1962  023e 3d3d3d3d3d3d  	dc.b	"=================="
1963  0250 0d0a00        	dc.b	13,10,0
1964  0253               L364:
1965  0253 0a0d00        	dc.b	10,13,0
1966  0256               L754:
1967  0256 436f6d6d616e  	dc.b	"Command string siz"
1968  0268 65206f766572  	dc.b	"e overflow",13
1969  0273 0a00          	dc.b	10,0
1970  0275               L354:
1971  0275 08200800      	dc.b	8,32,8,0
1972  0279               L552:
1973  0279 4572726f722c  	dc.b	"Error, Input again"
1974  028b 3a200d        	dc.b	": ",13
1975  028e 0a00          	dc.b	10,0
1976  0290               L152:
1977  0290 557365722043  	dc.b	"User Cancelled ",13
1978  02a0 0a00          	dc.b	10,0
1979                     	xref.b	c_lreg
1980                     	xref.b	c_x
2000                     	xref	c_jltab
2001                     	xref	c_smul
2002                     	xref	c_lglsh
2003                     	xref	c_ladd
2004                     	xref	c_llsh
2005                     	xref	c_sdivx
2006                     	xref	c_lumd
2007                     	xref	c_ladc
2008                     	xref	c_ludv
2009                     	xref	c_rtol
2010                     	xref	c_itolx
2011                     	xref	c_ltor
2012                     	end
