;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Tue Apr 01 20:36:22 2014
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
	public _Fake_run
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
	public _reverse
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
	public _Wait_X_Time
	public _Wait_1ms
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
_reverse:
	ds 1
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:34: unsigned int dist_table[4] = {350, 150, 75, 30};
	mov	_dist_table,#0x5E
	mov	(_dist_table + 1),#0x01
	mov	(_dist_table + 0x0002),#0x96
	mov	((_dist_table + 0x0002) + 1),#0x00
	mov	(_dist_table + 0x0004),#0x4B
	mov	((_dist_table + 0x0004) + 1),#0x00
	mov	(_dist_table + 0x0006),#0x1E
	mov	((_dist_table + 0x0006) + 1),#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:76: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:79: P0M0=0;	P0M1=0;
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:80: P1M0=0;	P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:81: P2M0=0;	P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:82: P3M0=0;	P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:83: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:84: P4M0=0;	P4M1=0;
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:87: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:88: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:89: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:90: BRL=BRG_VAL;
	mov	_BRL,#0xFA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:91: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:94: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:95: TMOD=0x01; // 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:100: TH0=RH0=TIMER0_RELOAD_VALUE/0x100;
	mov	_RH0,#0xFF
	mov	_TH0,#0xFF
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:101: TL0=RL0=TIMER0_RELOAD_VALUE%0x100;
	mov	_RL0,#0x48
	mov	_TL0,#0x48
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:102: TR0=1; // Start timer 0 (bit 4 in TCON)
	setb	_TR0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:103: ET0=1; // Enable timer 0 interrupt
	setb	_ET0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:104: EA=1;  // Enable global interrupts
	setb	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:106: left_motor_pwmcount1 = 0;    
	mov	_left_motor_pwmcount1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:107: left_motor_pwmcount2 = 0;
	mov	_left_motor_pwmcount2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:108: right_motor_pwmcount1 = 0;
	mov	_right_motor_pwmcount1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:109: right_motor_pwmcount2 = 0;
	mov	_right_motor_pwmcount2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:111: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pwmcounter'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:116: void pwmcounter (void) interrupt 1
;	-----------------------------------------
;	 function pwmcounter
;	-----------------------------------------
_pwmcounter:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:118: if(++left_motor_pwmcount1>99) left_motor_pwmcount1=0;
	inc	_left_motor_pwmcount1
	mov	a,_left_motor_pwmcount1
	add	a,#0xff - 0x63
	jnc	L003002?
	mov	_left_motor_pwmcount1,#0x00
L003002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:119: P1_2=(left_motor_pwm1>left_motor_pwmcount1)?1:0;
	clr	c
	mov	a,_left_motor_pwmcount1
	subb	a,_left_motor_pwm1
	mov	_P1_2,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:121: if(++left_motor_pwmcount2>99) left_motor_pwmcount2=0;
	inc	_left_motor_pwmcount2
	mov	a,_left_motor_pwmcount2
	add	a,#0xff - 0x63
	jnc	L003004?
	mov	_left_motor_pwmcount2,#0x00
L003004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:122: P1_4=(left_motor_pwm2>left_motor_pwmcount2)?1:0;
	clr	c
	mov	a,_left_motor_pwmcount2
	subb	a,_left_motor_pwm2
	mov	_P1_4,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:124: if(++right_motor_pwmcount1>99) right_motor_pwmcount1=0;
	inc	_right_motor_pwmcount1
	mov	a,_right_motor_pwmcount1
	add	a,#0xff - 0x63
	jnc	L003006?
	mov	_right_motor_pwmcount1,#0x00
L003006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:125: P1_0=(right_motor_pwm1>right_motor_pwmcount1)?1:0;
	clr	c
	mov	a,_right_motor_pwmcount1
	subb	a,_right_motor_pwm1
	mov	_P1_0,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:127: if(++right_motor_pwmcount2>99) right_motor_pwmcount2=0;
	inc	_right_motor_pwmcount2
	mov	a,_right_motor_pwmcount2
	add	a,#0xff - 0x63
	jnc	L003008?
	mov	_right_motor_pwmcount2,#0x00
L003008?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:128: P1_1=(right_motor_pwm2>right_motor_pwmcount2)?1:0;
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:133: void Move_Right_Motor_Backwards(){
;	-----------------------------------------
;	 function Move_Right_Motor_Backwards
;	-----------------------------------------
_Move_Right_Motor_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:134: right_motor_pwm1 = 37;
	mov	_right_motor_pwm1,#0x25
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:135: right_motor_pwm2 = 0;
	mov	_right_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Right_Motor_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:141: void Move_Right_Motor_Forwards (void){
;	-----------------------------------------
;	 function Move_Right_Motor_Forwards
;	-----------------------------------------
_Move_Right_Motor_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:142: right_motor_pwm1 = 0;
	mov	_right_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:143: right_motor_pwm2 = 45;
	mov	_right_motor_pwm2,#0x2D
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Left_Motor_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:149: void Move_Left_Motor_Backwards (void){
;	-----------------------------------------
;	 function Move_Left_Motor_Backwards
;	-----------------------------------------
_Move_Left_Motor_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:150: left_motor_pwm1 = 41;
	mov	_left_motor_pwm1,#0x29
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:151: left_motor_pwm2 = 0;
	mov	_left_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Left_Motor_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:156: void Move_Left_Motor_Forwards (void){
;	-----------------------------------------
;	 function Move_Left_Motor_Forwards
;	-----------------------------------------
_Move_Left_Motor_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:157: left_motor_pwm1 = 0;
	mov	_left_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:158: left_motor_pwm2 = 47;
	mov	_left_motor_pwm2,#0x2F
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Right_Motor'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:162: void Stop_Right_Motor (void){
;	-----------------------------------------
;	 function Stop_Right_Motor
;	-----------------------------------------
_Stop_Right_Motor:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:163: right_motor_pwm1 = 0;
	mov	_right_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:164: right_motor_pwm2 = 0;
	mov	_right_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Left_Motor'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:168: void Stop_Left_Motor (void){
;	-----------------------------------------
;	 function Stop_Left_Motor
;	-----------------------------------------
_Stop_Left_Motor:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:169: left_motor_pwm1 = 0;
	mov	_left_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:170: left_motor_pwm2 = 0;
	mov	_left_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait50ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:173: void wait50ms(){
;	-----------------------------------------
;	 function wait50ms
;	-----------------------------------------
_wait50ms:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:184: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:187: void wait1s(){
;	-----------------------------------------
;	 function wait1s
;	-----------------------------------------
_wait1s:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:189: for (i = 0; i < 20; ++i){
	mov	r2,#0x14
	mov	r3,#0x00
L011003?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:190: wait50ms();
	push	ar2
	push	ar3
	lcall	_wait50ms
	pop	ar3
	pop	ar2
	dec	r2
	cjne	r2,#0xff,L011009?
	dec	r3
L011009?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:189: for (i = 0; i < 20; ++i){
	mov	a,r2
	orl	a,r3
	jnz	L011003?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Right_Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:198: unsigned int Get_Right_Distance(void){
;	-----------------------------------------
;	 function Get_Right_Distance
;	-----------------------------------------
_Get_Right_Distance:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:201: return GetADC(2); //for now channel 1 is right motor
	mov	dpl,#0x02
	ljmp	_GetADC
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Left_Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:206: unsigned int Get_Left_Distance(void){
;	-----------------------------------------
;	 function Get_Left_Distance
;	-----------------------------------------
_Get_Left_Distance:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:208: return GetADC(3); //for now channel 0 is left motor
	mov	dpl,#0x03
	ljmp	_GetADC
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Car'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:212: void Stop_Car (void){
;	-----------------------------------------
;	 function Stop_Car
;	-----------------------------------------
_Stop_Car:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:213: Stop_Right_Motor();
	lcall	_Stop_Right_Motor
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:214: Stop_Left_Motor();
	ljmp	_Stop_Left_Motor
;------------------------------------------------------------
;Allocation info for local variables in function 'Face_Transmitter'
;------------------------------------------------------------
;right_distance            Allocated to registers r2 r3 
;left_distance             Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:218: void Face_Transmitter(void){
;	-----------------------------------------
;	 function Face_Transmitter
;	-----------------------------------------
_Face_Transmitter:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:222: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:223: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:228: printf(" \n Before Turning!!!!!!!!! Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
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
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:229: if (right_distance - left_distance > 50){
	mov	a,r2
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r3
	subb	a,r5
	mov	r7,a
	clr	c
	mov	a,#0x32
	subb	a,r6
	clr	a
	subb	a,r7
	jnc	L015010?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:231: while(right_distance > left_distance ){
L015001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L015003?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:232: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:233: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:234: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:235: printf(" \n First Loop Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:236: printf("\r");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	sjmp	L015001?
L015003?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:238: Stop_Car();
	lcall	_Stop_Car
	sjmp	L015011?
L015010?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:240: else if (left_distance - right_distance > 30){
	mov	a,r4
	clr	c
	subb	a,r2
	mov	r6,a
	mov	a,r5
	subb	a,r3
	mov	r7,a
	clr	c
	mov	a,#0x1E
	subb	a,r6
	clr	a
	subb	a,r7
	jnc	L015011?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:242: while(left_distance > right_distance ){
L015004?:
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	L015006?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:243: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:244: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:245: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:246: printf(" \n Second Loop Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:247: printf("\r");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	sjmp	L015004?
L015006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:249: Stop_Car();
	lcall	_Stop_Car
L015011?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:251: printf("made through both loops");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:253: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait_X_Time'
;------------------------------------------------------------
;time                      Allocated to registers r2 r3 
;i                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:257: void Wait_X_Time(int time){
;	-----------------------------------------
;	 function Wait_X_Time
;	-----------------------------------------
_Wait_X_Time:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:259: for (i = 0; i < time; ++i){
	mov	r4,#0x00
	mov	r5,#0x00
L016001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L016005?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:260: Wait_1ms();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Wait_1ms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:259: for (i = 0; i < time; ++i){
	inc	r4
	cjne	r4,#0x00,L016001?
	inc	r5
	sjmp	L016001?
L016005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait_1ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:264: void Wait_1ms(void){
;	-----------------------------------------
;	 function Wait_1ms
;	-----------------------------------------
_Wait_1ms:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:275: _endasm;
	
   ;For a 22.1184MHz crystal one machine cycle
   ;takes 12/22.1184MHz=0.5425347us
	      mov R2, #2
	 Lz3:
	mov R1, #5
	 Lz2:
	mov R0, #92
	 Lz1:
	djnz R0, Lz1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	      djnz R1, Lz2 ; 200us*250=0.05s
	      djnz R2, Lz3 ; 0.05s*20=50ms
	      ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park_Wait_1'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:279: void Parallel_Park_Wait_1(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_1
;	-----------------------------------------
_Parallel_Park_Wait_1:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:290: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:294: void Parallel_Park_Wait_2(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_2
;	-----------------------------------------
_Parallel_Park_Wait_2:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:305: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:309: void Parallel_Park_Wait_3(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_3
;	-----------------------------------------
_Parallel_Park_Wait_3:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:320: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:324: void Parallel_Park_Wait_4(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_4
;	-----------------------------------------
_Parallel_Park_Wait_4:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:335: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:339: void Parallel_Park_Wait_5(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_5
;	-----------------------------------------
_Parallel_Park_Wait_5:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:350: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:354: void Parallel_Park_Wait_6(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_6
;	-----------------------------------------
_Parallel_Park_Wait_6:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:365: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:370: void Move_Forwards(void){
;	-----------------------------------------
;	 function Move_Forwards
;	-----------------------------------------
_Move_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:371: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:372: Move_Left_Motor_Forwards();
	ljmp	_Move_Left_Motor_Forwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:376: void Parallel_Park(void){
;	-----------------------------------------
;	 function Parallel_Park
;	-----------------------------------------
_Parallel_Park:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:377: Move_Forwards();
	lcall	_Move_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:378: Parallel_Park_Wait_1();
	lcall	_Parallel_Park_Wait_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:380: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:381: Parallel_Park_Wait_2();
	lcall	_Parallel_Park_Wait_2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:383: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:384: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:386: Move_Forwards();
	lcall	_Move_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:387: Parallel_Park_Wait_4();
	lcall	_Parallel_Park_Wait_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:389: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:390: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:391: Parallel_Park_Wait_5();
	lcall	_Parallel_Park_Wait_5
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:393: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:394: Parallel_Park_Wait_6();
	ljmp	_Parallel_Park_Wait_6
;------------------------------------------------------------
;Allocation info for local variables in function 'Undo_Parallel_Park'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:398: void Undo_Parallel_Park (void){
;	-----------------------------------------
;	 function Undo_Parallel_Park
;	-----------------------------------------
_Undo_Parallel_Park:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:399: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:400: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:402: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:403: Parallel_Park_Wait_4();
	lcall	_Parallel_Park_Wait_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:405: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:406: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:407: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:409: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:410: Parallel_Park_Wait_1();
	lcall	_Parallel_Park_Wait_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:412: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:413: Parallel_Park_Wait_5();
	lcall	_Parallel_Park_Wait_5
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:415: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:416: Parallel_Park_Wait_6();
	ljmp	_Parallel_Park_Wait_6
;------------------------------------------------------------
;Allocation info for local variables in function 'Turn_Car_Left'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:422: void Turn_Car_Left(void){
;	-----------------------------------------
;	 function Turn_Car_Left
;	-----------------------------------------
_Turn_Car_Left:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:423: Move_Right_Motor_Backwards();
	ljmp	_Move_Right_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Turn_Car_Right'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:429: void Turn_Car_Right(void){
;	-----------------------------------------
;	 function Turn_Car_Right
;	-----------------------------------------
_Turn_Car_Right:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:430: Move_Left_Motor_Backwards(); //Same thoughts as above, (in Turn_Car_Left)
	ljmp	_Move_Left_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:435: void Move_Backwards(void){
;	-----------------------------------------
;	 function Move_Backwards
;	-----------------------------------------
_Move_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:436: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:437: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Car_Closer'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:443: void Move_Car_Closer(void){
;	-----------------------------------------
;	 function Move_Car_Closer
;	-----------------------------------------
_Move_Car_Closer:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:446: if(dist_index > 0) dist_index--;
	clr	c
	clr	a
	subb	a,_dist_index
	clr	a
	xrl	a,#0x80
	mov	b,(_dist_index + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L030003?
	dec	_dist_index
	mov	a,#0xff
	cjne	a,_dist_index,L030007?
	dec	(_dist_index + 1)
L030007?:
L030003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Car_Further'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:452: void Move_Car_Further(void){
;	-----------------------------------------
;	 function Move_Car_Further
;	-----------------------------------------
_Move_Car_Further:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:455: if(dist_index < 3) dist_index++;
	clr	c
	mov	a,_dist_index
	subb	a,#0x03
	mov	a,(_dist_index + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L031003?
	inc	_dist_index
	clr	a
	cjne	a,_dist_index,L031007?
	inc	(_dist_index + 1)
L031007?:
L031003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate_Car_180_CW'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:459: void Rotate_Car_180_CW(void){
;	-----------------------------------------
;	 function Rotate_Car_180_CW
;	-----------------------------------------
_Rotate_Car_180_CW:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:460: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:461: Wait_X_Time(2000); //wait 2000 ms
	mov	dptr,#0x07D0
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:462: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:464: if(reverse == 0){
	mov	a,_reverse
	jnz	L032002?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:465: reverse = 1;
	mov	_reverse,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:467: reverse = 0;
	ret
L032002?:
	mov	_reverse,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate_Car_180_CCW'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:474: void Rotate_Car_180_CCW(void){
;	-----------------------------------------
;	 function Rotate_Car_180_CCW
;	-----------------------------------------
_Rotate_Car_180_CCW:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:475: Turn_Car_Left(); // changed turn left logic make rotate car easily reverseable
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:476: Wait_X_Time(2000); //wait 2000 ms
	mov	dptr,#0x07D0
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:477: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:479: if(reverse == 0){
	mov	a,_reverse
	jnz	L033002?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:480: reverse = 1;
	mov	_reverse,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:482: reverse = 0;
	ret
L033002?:
	mov	_reverse,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rx_byte'
;------------------------------------------------------------
;min                       Allocated to registers r2 r3 
;j                         Allocated to registers r5 
;val                       Allocated to registers r4 
;v                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:490: unsigned char rx_byte (int min){
;	-----------------------------------------
;	 function rx_byte
;	-----------------------------------------
_rx_byte:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:495: EA = 0;
	clr	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:496: P1_0 = 0;
	clr	_P1_0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:497: P1_1 = 0;
	clr	_P1_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:498: P1_2 = 0;
	clr	_P1_2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:499: P1_4 = 0;
	clr	_P1_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:502: val=0;
	mov	r4,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:503: wait_one_and_half_bit_time();
	push	ar2
	push	ar3
	push	ar4
	lcall	_wait_one_and_half_bit_time
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:504: for(j=0; j<8; j++)
	mov	r5,#0x00
L034001?:
	cjne	r5,#0x08,L034013?
L034013?:
	jnc	L034004?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:506: v=GetADC(2);
	mov	dpl,#0x02
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:507: val|=(v>min)?(0x01<<j):0x00; // min is threshold voltage but in our case it is 1023
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	L034007?
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	L034018?
L034016?:
	add	a,acc
L034018?:
	djnz	b,L034016?
	mov	r6,a
	sjmp	L034008?
L034007?:
	mov	r6,#0x00
L034008?:
	mov	a,r6
	orl	ar4,a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:508: wait_bit_time();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_wait_bit_time
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:504: for(j=0; j<8; j++)
	inc	r5
	sjmp	L034001?
L034004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:511: wait_one_and_half_bit_time();
	push	ar4
	lcall	_wait_one_and_half_bit_time
	pop	ar4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:512: EA = 1;
	setb	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:513: return val;
	mov	dpl,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:518: void wait_bit_time(void){
;	-----------------------------------------
;	 function wait_bit_time
;	-----------------------------------------
_wait_bit_time:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:529: _endasm;
	
  ;For a 22.1184MHz crystal one machine cycle
  ;takes 12/22.1184MHz=0.5425347us
	     mov R2, #2
	 L3:
	mov R1, #120
	 L2:
	mov R0, #150
	 L1:
	djnz R0, L1
	     djnz R1, L2
	     djnz R2, L3
	     ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_one_and_half_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:533: void wait_one_and_half_bit_time(void){
;	-----------------------------------------
;	 function wait_one_and_half_bit_time
;	-----------------------------------------
_wait_one_and_half_bit_time:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:544: _endasm;
	
  ;For a 22.1184MHz crystal one machine cycle
  ;takes 12/22.1184MHz=0.5425347us
	     mov R2, #3
	 L6:
	mov R1, #120
	 L5:
	mov R0, #150
	 L4:
	djnz R0, L4
	     djnz R1, L5
	     djnz R2, L6
	     ret
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:548: void SPIWrite(unsigned char value){
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:549: SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	anl	_SPSTA,#0x7F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:550: SPDAT=value;
	mov	_SPDAT,r2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:551: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
L037001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L037001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:555: unsigned int GetADC(unsigned char channel){
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:559: SPCON&=(~SPEN); // Disable SPI
	anl	_SPCON,#0xBF
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:560: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	mov	_SPCON,#0x3F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:561: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:563: P4_1=0; // Activate the MCP3004 ADC.
	clr	_P4_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:564: SPIWrite(channel|0x18);	// Send start bit, single/diff* bit, D2, D1, and D0 bits.
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:565: for(adc=0; adc<10; adc++); // Wait for S/H to setup
	mov	r2,#0x0A
	mov	r3,#0x00
L038003?:
	dec	r2
	cjne	r2,#0xff,L038009?
	dec	r3
L038009?:
	mov	a,r2
	orl	a,r3
	jnz	L038003?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:566: SPIWrite(0x55); // Read bits 9 down to 4
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:567: adc=((SPDAT&0x3f)*0x100);
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:568: SPIWrite(0x55);// Read bits 3 down to 0
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:569: P4_1=1; // Deactivate the MCP3004 ADC.
	setb	_P4_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:570: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:571: adc>>=4;
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:573: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Testing_Code'
;------------------------------------------------------------
;right                     Allocated to registers r3 r4 
;left                      Allocated to registers r5 r6 
;cmd                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:594: void Testing_Code(void){
;	-----------------------------------------
;	 function Testing_Code
;	-----------------------------------------
_Testing_Code:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:597: unsigned char cmd = 0;
	mov	r2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:599: while(1){
L039012?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:613: run();
	push	ar2
	lcall	_run
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:614: right = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r3,dpl
	mov	r4,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:615: left = Get_Left_Distance();
	push	ar3
	push	ar4
	lcall	_Get_Left_Distance
	mov	r5,dpl
	mov	r6,dph
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:617: if(left < 20){
	clr	c
	mov	a,r5
	subb	a,#0x14
	mov	a,r6
	subb	a,#0x00
	jc	L039022?
	ljmp	L039010?
L039022?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:618: cmd = rx_byte (20);     	
	mov	dptr,#0x0014
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_rx_byte
	mov	r2,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:619: if(cmd == MOVE_FURTHER) Move_Car_Further();
	cjne	r2,#0xFD,L039002?
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Move_Car_Further
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L039002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:620: if(cmd == MOVE_CLOSER) Move_Car_Closer();
	cjne	r2,#0xF5,L039004?
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Move_Car_Closer
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L039004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:621: if(cmd == ROTATE_180) Rotate_Car_180_CW();
	cjne	r2,#0xD5,L039006?
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Rotate_Car_180_CW
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L039006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:622: if(cmd == PRL_PARK) Parallel_Park();
	cjne	r2,#0x80,L039010?
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Parallel_Park
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L039010?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:625: printf("right = %u, left = %u, cmd = %u \n", right, left, cmd);	
	mov	ar7,r2
	mov	r0,#0x00
	push	ar2
	push	ar7
	push	ar0
	push	ar5
	push	ar6
	push	ar3
	push	ar4
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	pop	ar2
	ljmp	L039012?
;------------------------------------------------------------
;Allocation info for local variables in function 'run'
;------------------------------------------------------------
;right_distance            Allocated to registers r2 r3 
;left_distance             Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:629: void run(void){
;	-----------------------------------------
;	 function run
;	-----------------------------------------
_run:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:630: unsigned int right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:631: unsigned int left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:633: if(!reverse) {
	mov	a,_reverse
	jz	L040047?
	ljmp	L040030?
L040047?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:634: if (abs(right_distance - dist_table[dist_index]) >= ERROR_BOUND){
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
	mov	a,r2
	clr	c
	subb	a,r6
	mov	dpl,a
	mov	a,r3
	subb	a,r7
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_abs
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	clr	c
	mov	a,r6
	subb	a,#0x14
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	L040006?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:635: if (right_distance > dist_table[dist_index]){
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
	clr	c
	mov	a,r6
	subb	a,r2
	mov	a,r7
	subb	a,r3
	jnc	L040002?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:636: Move_Right_Motor_Forwards();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Move_Right_Motor_Forwards
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L040002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:638: if (right_distance < dist_table[dist_index]){
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
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	subb	a,r7
	jnc	L040007?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:639: Move_Right_Motor_Backwards();
	push	ar4
	push	ar5
	lcall	_Move_Right_Motor_Backwards
	pop	ar5
	pop	ar4
	sjmp	L040007?
L040006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:643: Stop_Car();
	push	ar4
	push	ar5
	lcall	_Stop_Car
	pop	ar5
	pop	ar4
L040007?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:645: if (abs(left_distance - dist_table[dist_index]) >= ERROR_BOUND){
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
	mov	a,r4
	clr	c
	subb	a,r6
	mov	dpl,a
	mov	a,r5
	subb	a,r7
	mov	dph,a
	push	ar4
	push	ar5
	lcall	_abs
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	clr	c
	mov	a,r6
	subb	a,#0x14
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	L040013?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:646: if (left_distance > dist_table[dist_index]){
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
	clr	c
	mov	a,r6
	subb	a,r4
	mov	a,r7
	subb	a,r5
	jnc	L040009?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:647: Move_Left_Motor_Forwards();
	push	ar4
	push	ar5
	lcall	_Move_Left_Motor_Forwards
	pop	ar5
	pop	ar4
L040009?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:649: if (left_distance < dist_table[dist_index]){
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
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jc	L040053?
	ret
L040053?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:650: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
L040013?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:654: Stop_Car();
	ljmp	_Stop_Car
L040030?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:657: if (abs(right_distance - dist_table[dist_index]) >= ERROR_BOUND){
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
	mov	a,r2
	clr	c
	subb	a,r6
	mov	dpl,a
	mov	a,r3
	subb	a,r7
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_abs
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	clr	c
	mov	a,r6
	subb	a,#0x14
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	L040020?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:658: if (right_distance < dist_table[dist_index]){
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
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	subb	a,r7
	jnc	L040016?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:659: Move_Right_Motor_Forwards();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Move_Right_Motor_Forwards
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L040016?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:661: if (right_distance > dist_table[dist_index]){
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
	clr	c
	mov	a,r6
	subb	a,r2
	mov	a,r7
	subb	a,r3
	jnc	L040021?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:662: Move_Right_Motor_Backwards();
	push	ar4
	push	ar5
	lcall	_Move_Right_Motor_Backwards
	pop	ar5
	pop	ar4
	sjmp	L040021?
L040020?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:666: Stop_Car();
	push	ar4
	push	ar5
	lcall	_Stop_Car
	pop	ar5
	pop	ar4
L040021?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:668: if (abs(left_distance - dist_table[dist_index]) >= ERROR_BOUND){
	mov	a,_dist_index
	add	a,_dist_index
	mov	r2,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r2
	add	a,#_dist_table
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	mov	a,r4
	clr	c
	subb	a,r2
	mov	dpl,a
	mov	a,r5
	subb	a,r3
	mov	dph,a
	push	ar4
	push	ar5
	lcall	_abs
	mov	r2,dpl
	mov	r3,dph
	pop	ar5
	pop	ar4
	clr	c
	mov	a,r2
	subb	a,#0x14
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jc	L040027?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:669: if (left_distance < dist_table[dist_index]){
	mov	a,_dist_index
	add	a,_dist_index
	mov	r2,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r2
	add	a,#_dist_table
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L040023?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:670: Move_Left_Motor_Forwards();
	push	ar4
	push	ar5
	lcall	_Move_Left_Motor_Forwards
	pop	ar5
	pop	ar4
L040023?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:672: if (left_distance > dist_table[dist_index]){
	mov	a,_dist_index
	add	a,_dist_index
	mov	r2,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	a,r2
	add	a,#_dist_table
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	L040032?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:673: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
L040027?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:677: Stop_Car();
	ljmp	_Stop_Car
L040032?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Fake_run'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:681: void Fake_run(void) {
;	-----------------------------------------
;	 function Fake_run
;	-----------------------------------------
_Fake_run:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:682: Rotate_Car_180_CW();
	lcall	_Rotate_Car_180_CW
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:683: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:684: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:685: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:686: Rotate_Car_180_CCW();
	lcall	_Rotate_Car_180_CCW
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:687: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:688: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:689: wait1s();
	ljmp	_wait1s
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;logic_0_thresh            Allocated to registers 
;cmd                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:692: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:696: dist_index = 1;
	mov	_dist_index,#0x01
	clr	a
	mov	(_dist_index + 1),a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:697: reverse = 0;	
	mov	_reverse,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:699: printf("\n");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:700: Testing_Code();
	lcall	_Testing_Code
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:701: while(1){
L042012?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:703: run();
	lcall	_run
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:706: if(Get_Right_Distance() < logic_0_thresh){
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x0A
	mov	a,r3
	subb	a,#0x00
	jnc	L042012?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:707: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:708: cmd = rx_byte (logic_0_thresh);     	
	mov	dptr,#0x000A
	lcall	_rx_byte
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:709: if(cmd == MOVE_FURTHER) Move_Car_Further();
	cjne	r2,#0xFD,L042002?
	push	ar2
	lcall	_Move_Car_Further
	pop	ar2
L042002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:710: if(cmd == MOVE_CLOSER) Move_Car_Closer();
	cjne	r2,#0xF5,L042004?
	push	ar2
	lcall	_Move_Car_Closer
	pop	ar2
L042004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:711: if(cmd == ROTATE_180) Rotate_Car_180_CW();
	cjne	r2,#0xD5,L042006?
	push	ar2
	lcall	_Rotate_Car_180_CW
	pop	ar2
L042006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:712: if(cmd == PRL_PARK) Parallel_Park();
	cjne	r2,#0x80,L042012?
	lcall	_Parallel_Park
	sjmp	L042012?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db ' '
	db 0x0A
	db ' Before Turning!!!!!!!!! Right Voltage Reading: %u, Left V'
	db 'oltage Reading: %u'
	db 0x00
__str_1:
	db ' '
	db 0x0A
	db ' First Loop Right Voltage Reading: %u, Left Voltage Readin'
	db 'g: %u'
	db 0x00
__str_2:
	db 0x0D
	db 0x00
__str_3:
	db ' '
	db 0x0A
	db ' Second Loop Right Voltage Reading: %u, Left Voltage Readi'
	db 'ng: %u'
	db 0x00
__str_4:
	db 'made through both loops'
	db 0x00
__str_5:
	db 'right = %u, left = %u, cmd = %u '
	db 0x0A
	db 0x00
__str_6:
	db 0x0A
	db 0x00

	CSEG

end
