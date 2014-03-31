;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Sun Mar 30 17:46:57 2014
;--------------------------------------------------------
$name Car_Project_2
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _Move_Car_Further
	public _Move_Car_Closer
	public _Parallel_Park_Wait_6
	public _Parallel_Park_Wait_5
	public _Parallel_Park_Wait_4
	public _Parallel_Park_Wait_3
	public _Parallel_Park_Wait_2
	public _Parallel_Park_Wait_1
	public _pwmcounter
	public __c51_external_startup
	public _dist_index
	public _dist_table
	public _right_motor_pwm2
	public _right_motor_pwm1
	public _right_motor_pwmcount2
	public _right_motor_pwmcount1
	public _left_motor_pwm2
	public _left_motor_pwm1
	public _left_motor_pwmcount2
	public _left_motor_pwmcount1
	public _Move_Right_Motor_Backwards
	public _Move_Right_Motor_Forwards
	public _Move_Left_Motor_Backwards
	public _Move_Left_Motor_Forwards
	public _Stop_Right_Motor
	public _Stop_Left_Motor
	public _wait50ms
	public _wait1s
	public _Get_Right_Distance
	public _Get_Left_Distance
	public _Stop_Car
	public _Face_Transmitter
	public _Move_Forwards
	public _Parallel_Park
	public _Undo_Parallel_Park
	public _Turn_Car_Left
	public _Turn_Car_Right
	public _Move_Backwards
	public _Rotate_Car_180_CW
	public _Rotate_Car_180_CCW
	public _rx_byte
	public _wait_bit_time
	public _wait_one_and_half_bit_time
	public _SPIWrite
	public _GetADC
	public _voltage
	public _Testing_Code
	public _run
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_B              DATA 0xf0
_PSW            DATA 0xd0
_SP             DATA 0x81
_SPX            DATA 0xef
_DPL            DATA 0x82
_DPH            DATA 0x83
_DPLB           DATA 0xd4
_DPHB           DATA 0xd5
_PAGE           DATA 0xf6
_AX             DATA 0xe1
_BX             DATA 0xf7
_DSPR           DATA 0xe2
_FIRD           DATA 0xe3
_MACL           DATA 0xe4
_MACH           DATA 0xe5
_PCON           DATA 0x87
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa1
_CKRL           DATA 0x97
_CKCKON0        DATA 0x8f
_CKCKON1        DATA 0xaf
_CKSEL          DATA 0x85
_CLKREG         DATA 0xae
_OSCCON         DATA 0x85
_IE             DATA 0xa8
_IEN0           DATA 0xa8
_IEN1           DATA 0xb1
_IPH0           DATA 0xb7
_IP             DATA 0xb8
_IPL0           DATA 0xb8
_IPH1           DATA 0xb3
_IPL1           DATA 0xb2
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P4             DATA 0xc0
_P0M0           DATA 0xe6
_P0M1           DATA 0xe7
_P1M0           DATA 0xd6
_P1M1           DATA 0xd7
_P2M0           DATA 0xce
_P2M1           DATA 0xcf
_P3M0           DATA 0xc6
_P3M1           DATA 0xc7
_P4M0           DATA 0xbe
_P4M1           DATA 0xbf
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_BDRCON         DATA 0x9b
_BRL            DATA 0x9a
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TCONB          DATA 0x91
_TL0            DATA 0x8a
_TH0            DATA 0x8c
_TL1            DATA 0x8b
_TH1            DATA 0x8d
_RL0            DATA 0xf2
_RH0            DATA 0xf4
_RL1            DATA 0xf3
_RH1            DATA 0xf5
_WDTRST         DATA 0xa6
_WDTPRG         DATA 0xa7
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_RCAP2H         DATA 0xcb
_RCAP2L         DATA 0xca
_TH2            DATA 0xcd
_TL2            DATA 0xcc
_SPCON          DATA 0xc3
_SPSTA          DATA 0xc4
_SPDAT          DATA 0xc5
_SSCON          DATA 0x93
_SSCS           DATA 0x94
_SSDAT          DATA 0x95
_SSADR          DATA 0x96
_KBLS           DATA 0x9c
_KBE            DATA 0x9d
_KBF            DATA 0x9e
_KBMOD          DATA 0x9f
_BMSEL          DATA 0x92
_FCON           DATA 0xd2
_EECON          DATA 0xd2
_ACSRA          DATA 0xa3
_ACSRB          DATA 0xab
_AREF           DATA 0xbd
_DADC           DATA 0xa4
_DADI           DATA 0xa5
_DADL           DATA 0xac
_DADH           DATA 0xad
_CCON           DATA 0xd8
_CMOD           DATA 0xd9
_CL             DATA 0xe9
_CH             DATA 0xf9
_CCAPM0         DATA 0xda
_CCAPM1         DATA 0xdb
_CCAPM2         DATA 0xdc
_CCAPM3         DATA 0xdd
_CCAPM4         DATA 0xde
_CCAP0H         DATA 0xfa
_CCAP1H         DATA 0xfb
_CCAP2H         DATA 0xfc
_CCAP3H         DATA 0xfd
_CCAP4H         DATA 0xfe
_CCAP0L         DATA 0xea
_CCAP1L         DATA 0xeb
_CCAP2L         DATA 0xec
_CCAP3L         DATA 0xed
_CCAP4L         DATA 0xee
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_P              BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES             BIT 0xac
_ET2            BIT 0xad
_EC             BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS             BIT 0xbc
_PT2            BIT 0xbd
_IP0D           BIT 0xbf
_PPCL           BIT 0xbe
_PT2L           BIT 0xbd
_PLS            BIT 0xbc
_PT1L           BIT 0xbb
_PX1L           BIT 0xba
_PT0L           BIT 0xb9
_PX0L           BIT 0xb8
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_RXD            BIT 0xb0
_TXD            BIT 0xb1
_INT0           BIT 0xb2
_INT1           BIT 0xb3
_T0             BIT 0xb4
_T1             BIT 0xb5
_WR             BIT 0xb6
_RD             BIT 0xb7
_P4_0           BIT 0xc0
_P4_1           BIT 0xc1
_P4_2           BIT 0xc2
_P4_3           BIT 0xc3
_P4_4           BIT 0xc4
_P4_5           BIT 0xc5
_P4_6           BIT 0xc6
_P4_7           BIT 0xc7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_SM2            BIT 0x9d
_SM1            BIT 0x9e
_SM0            BIT 0x9f
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_CP_RL2         BIT 0xc8
_C_T2           BIT 0xc9
_TR2            BIT 0xca
_EXEN2          BIT 0xcb
_TCLK           BIT 0xcc
_RCLK           BIT 0xcd
_EXF2           BIT 0xce
_TF2            BIT 0xcf
_CF             BIT 0xdf
_CR             BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_left_motor_pwmcount1:
	ds 1
_left_motor_pwmcount2:
	ds 1
_left_motor_pwm1:
	ds 1
_left_motor_pwm2:
	ds 1
_right_motor_pwmcount1:
	ds 1
_right_motor_pwmcount2:
	ds 1
_right_motor_pwm1:
	ds 1
_right_motor_pwm2:
	ds 1
_dist_table:
	ds 8
_dist_index:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x000b
	ljmp	_pwmcounter
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:73: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:76: P0M0=0;	P0M1=0;
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:77: P1M0=0;	P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:78: P2M0=0;	P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:79: P3M0=0;	P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:80: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:81: P4M0=0;	P4M1=0;
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:84: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:85: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:86: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:87: BRL=BRG_VAL;
	mov	_BRL,#0xFA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:88: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:91: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:92: TMOD=0x01; // 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:97: TH0=RH0=TIMER0_RELOAD_VALUE/0x100;
	mov	_RH0,#0xFF
	mov	_TH0,#0xFF
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:98: TL0=RL0=TIMER0_RELOAD_VALUE%0x100;
	mov	_RL0,#0x48
	mov	_TL0,#0x48
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:99: TR0=1; // Start timer 0 (bit 4 in TCON)
	setb	_TR0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:100: ET0=1; // Enable timer 0 interrupt
	setb	_ET0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:101: EA=1;  // Enable global interrupts
	setb	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:103: left_motor_pwmcount1 = 0;    
	mov	_left_motor_pwmcount1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:104: left_motor_pwmcount2 = 0;
	mov	_left_motor_pwmcount2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:105: right_motor_pwmcount1 = 0;
	mov	_right_motor_pwmcount1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:106: right_motor_pwmcount2 = 0;
	mov	_right_motor_pwmcount2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:108: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pwmcounter'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:113: void pwmcounter (void) interrupt 1
;	-----------------------------------------
;	 function pwmcounter
;	-----------------------------------------
_pwmcounter:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:115: if(++left_motor_pwmcount1>99) left_motor_pwmcount1=0;
	inc	_left_motor_pwmcount1
	mov	a,_left_motor_pwmcount1
	add	a,#0xff - 0x63
	jnc	L003002?
	mov	_left_motor_pwmcount1,#0x00
L003002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:116: P1_2=(left_motor_pwm1>left_motor_pwmcount1)?1:0;
	clr	c
	mov	a,_left_motor_pwmcount1
	subb	a,_left_motor_pwm1
	mov	_P1_2,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:118: if(++left_motor_pwmcount2>99) left_motor_pwmcount2=0;
	inc	_left_motor_pwmcount2
	mov	a,_left_motor_pwmcount2
	add	a,#0xff - 0x63
	jnc	L003004?
	mov	_left_motor_pwmcount2,#0x00
L003004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:119: P1_4=(left_motor_pwm2>left_motor_pwmcount2)?1:0;
	clr	c
	mov	a,_left_motor_pwmcount2
	subb	a,_left_motor_pwm2
	mov	_P1_4,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:121: if(++right_motor_pwmcount1>99) right_motor_pwmcount1=0;
	inc	_right_motor_pwmcount1
	mov	a,_right_motor_pwmcount1
	add	a,#0xff - 0x63
	jnc	L003006?
	mov	_right_motor_pwmcount1,#0x00
L003006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:122: P1_0=(right_motor_pwm1>right_motor_pwmcount1)?1:0;
	clr	c
	mov	a,_right_motor_pwmcount1
	subb	a,_right_motor_pwm1
	mov	_P1_0,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:124: if(++right_motor_pwmcount2>99) right_motor_pwmcount2=0;
	inc	_right_motor_pwmcount2
	mov	a,_right_motor_pwmcount2
	add	a,#0xff - 0x63
	jnc	L003008?
	mov	_right_motor_pwmcount2,#0x00
L003008?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:125: P1_1=(right_motor_pwm2>right_motor_pwmcount2)?1:0;
	clr	c
	mov	a,_right_motor_pwmcount2
	subb	a,_right_motor_pwm2
	mov	_P1_1,c
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Right_Motor_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:130: void Move_Right_Motor_Backwards(){
;	-----------------------------------------
;	 function Move_Right_Motor_Backwards
;	-----------------------------------------
_Move_Right_Motor_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:131: right_motor_pwm1 = 75;
	mov	_right_motor_pwm1,#0x4B
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:132: right_motor_pwm2 = 0;
	mov	_right_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Right_Motor_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:138: void Move_Right_Motor_Forwards (void){
;	-----------------------------------------
;	 function Move_Right_Motor_Forwards
;	-----------------------------------------
_Move_Right_Motor_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:139: right_motor_pwm1 = 0;
	mov	_right_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:140: right_motor_pwm2 = 90;
	mov	_right_motor_pwm2,#0x5A
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Left_Motor_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:146: void Move_Left_Motor_Backwards (void){
;	-----------------------------------------
;	 function Move_Left_Motor_Backwards
;	-----------------------------------------
_Move_Left_Motor_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:147: left_motor_pwm1 = 82;
	mov	_left_motor_pwm1,#0x52
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:148: left_motor_pwm2 = 0;
	mov	_left_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Left_Motor_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:153: void Move_Left_Motor_Forwards (void){
;	-----------------------------------------
;	 function Move_Left_Motor_Forwards
;	-----------------------------------------
_Move_Left_Motor_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:154: left_motor_pwm1 = 0;
	mov	_left_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:155: left_motor_pwm2 = 95;
	mov	_left_motor_pwm2,#0x5F
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Right_Motor'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:159: void Stop_Right_Motor (void){
;	-----------------------------------------
;	 function Stop_Right_Motor
;	-----------------------------------------
_Stop_Right_Motor:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:160: right_motor_pwm1 = 0;
	mov	_right_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:161: right_motor_pwm2 = 0;
	mov	_right_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Left_Motor'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:165: void Stop_Left_Motor (void){
;	-----------------------------------------
;	 function Stop_Left_Motor
;	-----------------------------------------
_Stop_Left_Motor:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:166: left_motor_pwm1 = 0;
	mov	_left_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:167: left_motor_pwm2 = 0;
	mov	_left_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait50ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:170: void wait50ms(){
;	-----------------------------------------
;	 function wait50ms
;	-----------------------------------------
_wait50ms:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:181: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #1
	 Lg3:
	mov R1, #248
	 Lg2:
	mov R0, #184
	 Lg1:
	djnz R0, Lg1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Lg2 ; 200us*250=0.05s
	      djnz R2, Lg3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait1s'
;------------------------------------------------------------
;i                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:184: void wait1s(){
;	-----------------------------------------
;	 function wait1s
;	-----------------------------------------
_wait1s:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:186: for (i = 0; i < 20; ++i){
	mov	r2,#0x14
	mov	r3,#0x00
L011003?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:187: wait50ms();
	push	ar2
	push	ar3
	lcall	_wait50ms
	pop	ar3
	pop	ar2
	dec	r2
	cjne	r2,#0xff,L011009?
	dec	r3
L011009?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:186: for (i = 0; i < 20; ++i){
	mov	a,r2
	orl	a,r3
	jnz	L011003?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Right_Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:195: unsigned int Get_Right_Distance(void){
;	-----------------------------------------
;	 function Get_Right_Distance
;	-----------------------------------------
_Get_Right_Distance:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:198: return GetADC(1); //for now channel 1 is right motor
	mov	dpl,#0x01
	ljmp	_GetADC
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Left_Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:203: unsigned int Get_Left_Distance(void){
;	-----------------------------------------
;	 function Get_Left_Distance
;	-----------------------------------------
_Get_Left_Distance:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:205: return GetADC(0); //for now channel 0 is left motor
	mov	dpl,#0x00
	ljmp	_GetADC
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Car'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:209: void Stop_Car (void){
;	-----------------------------------------
;	 function Stop_Car
;	-----------------------------------------
_Stop_Car:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:210: Stop_Right_Motor();
	lcall	_Stop_Right_Motor
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:211: Stop_Left_Motor();
	ljmp	_Stop_Left_Motor
;------------------------------------------------------------
;Allocation info for local variables in function 'Face_Transmitter'
;------------------------------------------------------------
;right_distance            Allocated to registers r2 r3 
;left_distance             Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:215: void Face_Transmitter(void){
;	-----------------------------------------
;	 function Face_Transmitter
;	-----------------------------------------
_Face_Transmitter:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:219: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:220: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:222: if(left_distance - right_distance > ERROR_BOUND || left_distance - right_distance < ERROR_BOUND) return;//find a good error bound, we dont need to be pointing 
	mov	a,r4
	clr	c
	subb	a,r2
	mov	r6,a
	mov	a,r5
	subb	a,r3
	mov	r7,a
	clr	c
	mov	a,#0x50
	subb	a,r6
	clr	a
	subb	a,r7
	jc	L015001?
	mov	a,r4
	clr	c
	subb	a,r2
	mov	r6,a
	mov	a,r5
	subb	a,r3
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x50
	mov	a,r7
	subb	a,#0x00
	jnc	L015002?
L015001?:
	ret
L015002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:226: if (left_distance < right_distance){
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L015008?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:227: Turn_Car_Right();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Turn_Car_Right
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:228: while(left_distance > right_distance ){
L015004?:
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	L015006?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:229: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:230: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
	sjmp	L015004?
L015006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:232: Stop_Car();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Stop_Car
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L015008?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:234: if (left_distance > right_distance){
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	L015014?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:235: Turn_Car_Left();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Turn_Car_Left
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:236: while(left_distance < right_distance ){
L015009?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L015011?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:237: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:238: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
	sjmp	L015009?
L015011?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:240: Stop_Car();
	ljmp	_Stop_Car
L015014?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_1'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:244: void Parallel_Park_Wait_1(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_1
;	-----------------------------------------
_Parallel_Park_Wait_1:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:255: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #20 ;25
	 La3:
	mov R1, #248
	 La2:
	mov R0, #184
	 La1:
	djnz R0, La1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, La2 ; 200us*250=0.05s
	      djnz R2, La3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_2'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:259: void Parallel_Park_Wait_2(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_2
;	-----------------------------------------
_Parallel_Park_Wait_2:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:270: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #1
	 Lb3:
	mov R1, #248
	 Lb2:
	mov R0, #184
	 Lb1:
	djnz R0, Lb1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Lb2 ; 200us*250=0.05s
	      djnz R2, Lb3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_3'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:274: void Parallel_Park_Wait_3(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_3
;	-----------------------------------------
_Parallel_Park_Wait_3:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:285: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #12
	 Lc3:
	mov R1, #248
	 Lc2:
	mov R0, #184
	 Lc1:
	djnz R0, Lc1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Lc2 ; 200us*250=0.05s
	      djnz R2, Lc3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_4'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:289: void Parallel_Park_Wait_4(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_4
;	-----------------------------------------
_Parallel_Park_Wait_4:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:300: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #21
	 Ld3:
	mov R1, #248
	 Ld2:
	mov R0, #184
	 Ld1:
	djnz R0, Ld1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Ld2 ; 200us*250=0.05s
	      djnz R2, Ld3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_5'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:304: void Parallel_Park_Wait_5(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_5
;	-----------------------------------------
_Parallel_Park_Wait_5:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:315: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #13
	 Le3:
	mov R1, #248
	 Le2:
	mov R0, #184
	 Le1:
	djnz R0, Le1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Le2 ; 200us*250=0.05s
	      djnz R2, Le3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_6'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:319: void Parallel_Park_Wait_6(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_6
;	-----------------------------------------
_Parallel_Park_Wait_6:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:330: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #1
	 Lf3:
	mov R1, #248
	 Lf2:
	mov R0, #184
	 Lf1:
	djnz R0, Lf1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Lf2 ; 200us*250=0.05s
	      djnz R2, Lf3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:335: void Move_Forwards(void){
;	-----------------------------------------
;	 function Move_Forwards
;	-----------------------------------------
_Move_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:336: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:337: Move_Left_Motor_Forwards();
	ljmp	_Move_Left_Motor_Forwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:341: void Parallel_Park(void){
;	-----------------------------------------
;	 function Parallel_Park
;	-----------------------------------------
_Parallel_Park:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:342: Move_Forwards();
	lcall	_Move_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:343: Parallel_Park_Wait_1();
	lcall	_Parallel_Park_Wait_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:345: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:346: Parallel_Park_Wait_2();
	lcall	_Parallel_Park_Wait_2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:348: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:349: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:351: Move_Forwards();
	lcall	_Move_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:352: Parallel_Park_Wait_4();
	lcall	_Parallel_Park_Wait_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:354: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:355: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:356: Parallel_Park_Wait_5();
	lcall	_Parallel_Park_Wait_5
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:358: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:359: Parallel_Park_Wait_6();
	ljmp	_Parallel_Park_Wait_6
;------------------------------------------------------------
;Allocation info for local variables in function 'Undo_Parallel_Park'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:363: void Undo_Parallel_Park (void){
;	-----------------------------------------
;	 function Undo_Parallel_Park
;	-----------------------------------------
_Undo_Parallel_Park:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:364: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:365: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:367: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:368: Parallel_Park_Wait_4();
	lcall	_Parallel_Park_Wait_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:370: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:371: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:372: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:374: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:375: Parallel_Park_Wait_1();
	lcall	_Parallel_Park_Wait_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:377: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:378: Parallel_Park_Wait_5();
	lcall	_Parallel_Park_Wait_5
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:380: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:381: Parallel_Park_Wait_6();
	ljmp	_Parallel_Park_Wait_6
;------------------------------------------------------------
;Allocation info for local variables in function 'Turn_Car_Left'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:387: void Turn_Car_Left(void){
;	-----------------------------------------
;	 function Turn_Car_Left
;	-----------------------------------------
_Turn_Car_Left:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:388: Move_Right_Motor_Backwards();
	ljmp	_Move_Right_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Turn_Car_Right'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:394: void Turn_Car_Right(void){
;	-----------------------------------------
;	 function Turn_Car_Right
;	-----------------------------------------
_Turn_Car_Right:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:395: Move_Left_Motor_Backwards(); //Same thoughts as above, (in Turn_Car_Left)
	ljmp	_Move_Left_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:399: void Move_Backwards(void){
;	-----------------------------------------
;	 function Move_Backwards
;	-----------------------------------------
_Move_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:400: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:401: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Car_Closer'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:407: void Move_Car_Closer(void){
;	-----------------------------------------
;	 function Move_Car_Closer
;	-----------------------------------------
_Move_Car_Closer:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:410: if(dist_index > 0) dist_index--;
	clr	c
	clr	a
	subb	a,_dist_index
	clr	a
	xrl	a,#0x80
	mov	b,(_dist_index + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L028003?
	dec	_dist_index
	mov	a,#0xff
	cjne	a,_dist_index,L028007?
	dec	(_dist_index + 1)
L028007?:
L028003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Car_Further'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:416: void Move_Car_Further(void){
;	-----------------------------------------
;	 function Move_Car_Further
;	-----------------------------------------
_Move_Car_Further:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:419: if(dist_index < 3) dist_index++;
	clr	c
	mov	a,_dist_index
	subb	a,#0x03
	mov	a,(_dist_index + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L029003?
	inc	_dist_index
	clr	a
	cjne	a,_dist_index,L029007?
	inc	(_dist_index + 1)
L029007?:
L029003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate_Car_180_CW'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:423: void Rotate_Car_180_CW(void){
;	-----------------------------------------
;	 function Rotate_Car_180_CW
;	-----------------------------------------
_Rotate_Car_180_CW:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:424: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:425: wait1s();	//TO DO: change this to the correct time
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:426: Stop_Car();
	ljmp	_Stop_Car
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate_Car_180_CCW'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:431: void Rotate_Car_180_CCW(void){
;	-----------------------------------------
;	 function Rotate_Car_180_CCW
;	-----------------------------------------
_Rotate_Car_180_CCW:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:432: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:433: wait1s(); 	// TO DO: change this to the correct time
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:434: Stop_Car();
	ljmp	_Stop_Car
;------------------------------------------------------------
;Allocation info for local variables in function 'rx_byte'
;------------------------------------------------------------
;min                       Allocated to registers r2 r3 
;j                         Allocated to registers r5 
;val                       Allocated to registers r4 
;v                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:441: unsigned char rx_byte (int min){
;	-----------------------------------------
;	 function rx_byte
;	-----------------------------------------
_rx_byte:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:446: val=0;
	mov	r4,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:447: wait_one_and_half_bit_time();
	push	ar2
	push	ar3
	push	ar4
	lcall	_wait_one_and_half_bit_time
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:448: for(j=0; j<8; j++)
	mov	r5,#0x00
L032001?:
	cjne	r5,#0x08,L032013?
L032013?:
	jnc	L032004?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:450: v=GetADC(0);
	mov	dpl,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_GetADC
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:451: val|=(v>min)?(0x01<<j):0x00;
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	L032007?
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	L032018?
L032016?:
	add	a,acc
L032018?:
	djnz	b,L032016?
	mov	r6,a
	sjmp	L032008?
L032007?:
	mov	r6,#0x00
L032008?:
	mov	a,r6
	orl	ar4,a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:452: wait_bit_time();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_wait_bit_time
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:448: for(j=0; j<8; j++)
	inc	r5
	sjmp	L032001?
L032004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:455: wait_one_and_half_bit_time();
	push	ar4
	lcall	_wait_one_and_half_bit_time
	pop	ar4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:456: return val;
	mov	dpl,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:461: void wait_bit_time(void){
;	-----------------------------------------
;	 function wait_bit_time
;	-----------------------------------------
_wait_bit_time:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:472: _endasm;
	
  ;For a 22.1184MHz crystal one machine cycle
  ;takes 12/22.1184MHz=0.5425347us
	     mov R2, #2
	 L3:
	mov R1, #248
	 L2:
	mov R0, #184
	 L1:
	djnz R0, L1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	     djnz R1, L2 ; 200us*250=0.05s
	     djnz R2, L3 ; 0.05s*2=100ms
	     ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_one_and_half_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:476: void wait_one_and_half_bit_time(void){
;	-----------------------------------------
;	 function wait_one_and_half_bit_time
;	-----------------------------------------
_wait_one_and_half_bit_time:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:487: _endasm;
	
  ;For a 22.1184MHz crystal one machine cycle
  ;takes 12/22.1184MHz=0.5425347us
	     mov R2, #3
	 L6:
	mov R1, #248
	 L5:
	mov R0, #184
	 L4:
	djnz R0, L4 ; 2 machine cycles-> 2*0.5425347us*184=200us
	     djnz R1, L5 ; 200us*250=0.05s
	     djnz R2, L6 ; 0.05s*3=150ms
	     ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:491: void SPIWrite(unsigned char value){
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:492: SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	anl	_SPSTA,#0x7F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:493: SPDAT=value;
	mov	_SPDAT,r2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:494: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
L035001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L035001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:498: unsigned int GetADC(unsigned char channel){
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:502: SPCON&=(~SPEN); // Disable SPI
	anl	_SPCON,#0xBF
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:503: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	mov	_SPCON,#0x3F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:504: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:506: P4_1=0; // Activate the MCP3004 ADC.
	clr	_P4_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:507: SPIWrite(channel|0x18);	// Send start bit, single/diff* bit, D2, D1, and D0 bits.
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:508: for(adc=0; adc<10; adc++); // Wait for S/H to setup
	mov	r2,#0x0A
	mov	r3,#0x00
L036003?:
	dec	r2
	cjne	r2,#0xff,L036009?
	dec	r3
L036009?:
	mov	a,r2
	orl	a,r3
	jnz	L036003?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:509: SPIWrite(0x55); // Read bits 9 down to 4
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:510: adc=((SPDAT&0x3f)*0x100);
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:511: SPIWrite(0x55);// Read bits 3 down to 0
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:512: P4_1=1; // Deactivate the MCP3004 ADC.
	setb	_P4_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:513: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:514: adc>>=4;
	swap	a
	xch	a,r2
	swap	a
	anl	a,#0x0f
	xrl	a,r2
	xch	a,r2
	anl	a,#0x0f
	xch	a,r2
	xrl	a,r2
	xch	a,r2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:516: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'voltage'
;------------------------------------------------------------
;channel                   Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:533: float voltage (unsigned char channel){
;	-----------------------------------------
;	 function voltage
;	-----------------------------------------
_voltage:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:534: return ( (GetADC(channel)*5.02)/1023.0 ); // VCC=5.02V (measured)
	lcall	_GetADC
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xA3D7
	mov	b,#0xA0
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Testing_Code'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:542: void Testing_Code(void){
;	-----------------------------------------
;	 function Testing_Code
;	-----------------------------------------
_Testing_Code:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:543: while(1){
L038002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:544: Move_Left_Motor_Backwards(); //fwds and Forwards go opposite directions!
	lcall	_Move_Left_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:545: wait1s();	
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:546: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:547: wait1s();	
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:548: Move_Left_Motor_Forwards();
	lcall	_Move_Left_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:549: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:550: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:551: wait1s();	
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:552: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:553: wait1s();	
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:554: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:555: wait1s();	
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:556: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:557: wait1s();	
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:558: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:559: wait1s();	
	lcall	_wait1s
	sjmp	L038002?
;------------------------------------------------------------
;Allocation info for local variables in function 'run'
;------------------------------------------------------------
;dist                      Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:563: void run (void){
;	-----------------------------------------
;	 function run
;	-----------------------------------------
_run:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:567: Face_Transmitter();
	lcall	_Face_Transmitter
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:569: dist = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:570: if (dist - dist_table[dist_index] <= ERROR_BOUND || dist_table[dist_index] - dist <= ERROR_BOUND)
	mov	a,_dist_index
	add	a,_dist_index
	mov	r4,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r4
	add	a,#_dist_table
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	mov	a,r2
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r3
	subb	a,r5
	mov	r7,a
	clr	c
	mov	a,#0x50
	subb	a,r6
	clr	a
	subb	a,r7
	jnc	L039001?
	mov	a,r4
	clr	c
	subb	a,r2
	mov	r6,a
	mov	a,r5
	subb	a,r3
	mov	r7,a
	clr	c
	mov	a,#0x50
	subb	a,r6
	clr	a
	subb	a,r7
	jc	L039002?
L039001?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:571: return;
	ret
L039002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:572: printf("Right Distance: %u Set Dist: %u\r", dist, dist_table[dist_index]);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:573: if(dist < dist_table[dist_index]){
	mov	a,_dist_index
	add	a,_dist_index
	mov	r4,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r4
	add	a,#_dist_table
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	L039008?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:574: while(dist - dist_table[dist_index] >= ERROR_BOUND) {
L039004?:
	mov	a,_dist_index
	add	a,_dist_index
	mov	r6,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r6
	add	a,#_dist_table
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	dec	r0
	mov	a,r2
	clr	c
	subb	a,r6
	mov	r6,a
	mov	a,r3
	subb	a,r7
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x50
	mov	a,r7
	subb	a,#0x00
	jc	L039006?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:575: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:576: dist = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:577: printf("Right Distance: %u Set Dist: %u\r", dist, dist_table[dist_index]);
	mov	a,_dist_index
	add	a,_dist_index
	mov	r6,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r6
	add	a,#_dist_table
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	dec	r0
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar3
	pop	ar2
	sjmp	L039004?
L039006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:579: Stop_Car();
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:580: return;
	ljmp	_Stop_Car
L039008?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:582: if(dist > dist_table[dist_index]){
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L039014?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:583: while(dist_table[dist_index]-dist > ERROR_BOUND) {
L039009?:
	mov	a,_dist_index
	add	a,_dist_index
	mov	r4,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r4
	add	a,#_dist_table
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	dec	r0
	mov	a,r4
	clr	c
	subb	a,r2
	mov	r4,a
	mov	a,r5
	subb	a,r3
	mov	r5,a
	clr	c
	mov	a,#0x50
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	L039011?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:584: Move_Forwards();
	lcall	_Move_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:585: dist = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:586: printf("Right Distance: %u Set Dist: %u\r", dist, dist_table[dist_index]);
	mov	a,_dist_index
	add	a,_dist_index
	mov	r4,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r4
	add	a,#_dist_table
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	dec	r0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar3
	pop	ar2
	sjmp	L039009?
L039011?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:588: Stop_Car();
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:589: return;
	ljmp	_Stop_Car
L039014?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v_min                     Allocated to registers 
;cmd                       Allocated with name '_main_cmd_1_155'
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:592: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:600: dist_table[1] = 150;
	mov	(_dist_table + 0x0002),#0x96
	mov	((_dist_table + 0x0002) + 1),#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:601: dist_index = 1;
	mov	_dist_index,#0x01
	clr	a
	mov	(_dist_index + 1),a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:603: printf("\n");
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:606: while(1){
L040002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:608: run();
	lcall	_run
	sjmp	L040002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Right Distance: %u Set Dist: %u'
	db 0x0D
	db 0x00
__str_1:
	db 0x0A
	db 0x00

	CSEG

end
