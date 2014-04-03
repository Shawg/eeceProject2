;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Thu Apr 03 13:47:48 2014
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
	public _dist_error
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
	public _Short_Buzzer
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
_dist_error:
	ds 8
_dist_index:
	ds 2
_reverse:
	ds 1
_run_right_distance_1_182:
	ds 2
_run_left_distance_1_182:
	ds 2
_run_sloc0_1_0:
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:33: unsigned int dist_table[4] = {260, 150, 90, 27};
	mov	_dist_table,#0x04
	mov	(_dist_table + 1),#0x01
	mov	(_dist_table + 0x0002),#0x96
	mov	((_dist_table + 0x0002) + 1),#0x00
	mov	(_dist_table + 0x0004),#0x5A
	mov	((_dist_table + 0x0004) + 1),#0x00
	mov	(_dist_table + 0x0006),#0x1B
	mov	((_dist_table + 0x0006) + 1),#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:34: unsigned int dist_error[4] = {32, 19, 13, 8};
	mov	_dist_error,#0x20
	mov	(_dist_error + 1),#0x00
	mov	(_dist_error + 0x0002),#0x13
	mov	((_dist_error + 0x0002) + 1),#0x00
	mov	(_dist_error + 0x0004),#0x0D
	mov	((_dist_error + 0x0004) + 1),#0x00
	mov	(_dist_error + 0x0006),#0x08
	mov	((_dist_error + 0x0006) + 1),#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:77: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:80: P0M0=0;	P0M1=0x01; // configure port 0.0 for buzzer
	mov	_P0M0,#0x00
	mov	_P0M1,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:81: P1M0=0;	P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:82: P2M0=0;	P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:83: P3M0=0;	P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:84: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:85: P4M0=0;	P4M1=0;
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:88: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:89: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:90: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:91: BRL=BRG_VAL;
	mov	_BRL,#0xFA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:92: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:95: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:96: TMOD=0x01; // 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:101: TH0=RH0=TIMER0_RELOAD_VALUE/0x100;
	mov	_RH0,#0xFF
	mov	_TH0,#0xFF
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:102: TL0=RL0=TIMER0_RELOAD_VALUE%0x100;
	mov	_RL0,#0x48
	mov	_TL0,#0x48
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:103: TR0=1; // Start timer 0 (bit 4 in TCON)
	setb	_TR0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:104: ET0=1; // Enable timer 0 interrupt
	setb	_ET0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:105: EA=1;  // Enable global interrupts
	setb	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:107: left_motor_pwmcount1 = 0;    
	mov	_left_motor_pwmcount1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:108: left_motor_pwmcount2 = 0;
	mov	_left_motor_pwmcount2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:109: right_motor_pwmcount1 = 0;
	mov	_right_motor_pwmcount1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:110: right_motor_pwmcount2 = 0;
	mov	_right_motor_pwmcount2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:112: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pwmcounter'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:117: void pwmcounter (void) interrupt 1
;	-----------------------------------------
;	 function pwmcounter
;	-----------------------------------------
_pwmcounter:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:119: if(++left_motor_pwmcount1>99) left_motor_pwmcount1=0;
	inc	_left_motor_pwmcount1
	mov	a,_left_motor_pwmcount1
	add	a,#0xff - 0x63
	jnc	L003002?
	mov	_left_motor_pwmcount1,#0x00
L003002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:120: P1_2=(left_motor_pwm1>left_motor_pwmcount1)?1:0;
	clr	c
	mov	a,_left_motor_pwmcount1
	subb	a,_left_motor_pwm1
	mov	_P1_2,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:122: if(++left_motor_pwmcount2>99) left_motor_pwmcount2=0;
	inc	_left_motor_pwmcount2
	mov	a,_left_motor_pwmcount2
	add	a,#0xff - 0x63
	jnc	L003004?
	mov	_left_motor_pwmcount2,#0x00
L003004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:123: P1_4=(left_motor_pwm2>left_motor_pwmcount2)?1:0;
	clr	c
	mov	a,_left_motor_pwmcount2
	subb	a,_left_motor_pwm2
	mov	_P1_4,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:125: if(++right_motor_pwmcount1>99) right_motor_pwmcount1=0;
	inc	_right_motor_pwmcount1
	mov	a,_right_motor_pwmcount1
	add	a,#0xff - 0x63
	jnc	L003006?
	mov	_right_motor_pwmcount1,#0x00
L003006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:126: P1_0=(right_motor_pwm1>right_motor_pwmcount1)?1:0;
	clr	c
	mov	a,_right_motor_pwmcount1
	subb	a,_right_motor_pwm1
	mov	_P1_0,c
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:128: if(++right_motor_pwmcount2>99) right_motor_pwmcount2=0;
	inc	_right_motor_pwmcount2
	mov	a,_right_motor_pwmcount2
	add	a,#0xff - 0x63
	jnc	L003008?
	mov	_right_motor_pwmcount2,#0x00
L003008?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:129: P1_1=(right_motor_pwm2>right_motor_pwmcount2)?1:0;
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:134: void Move_Right_Motor_Backwards(){
;	-----------------------------------------
;	 function Move_Right_Motor_Backwards
;	-----------------------------------------
_Move_Right_Motor_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:135: right_motor_pwm1 = 51;
	mov	_right_motor_pwm1,#0x33
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:136: right_motor_pwm2 = 0;
	mov	_right_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Right_Motor_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:142: void Move_Right_Motor_Forwards (void){
;	-----------------------------------------
;	 function Move_Right_Motor_Forwards
;	-----------------------------------------
_Move_Right_Motor_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:143: right_motor_pwm1 = 0;
	mov	_right_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:144: right_motor_pwm2 = 51;
	mov	_right_motor_pwm2,#0x33
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Left_Motor_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:150: void Move_Left_Motor_Backwards (void){
;	-----------------------------------------
;	 function Move_Left_Motor_Backwards
;	-----------------------------------------
_Move_Left_Motor_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:151: left_motor_pwm1 = 47;
	mov	_left_motor_pwm1,#0x2F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:152: left_motor_pwm2 = 0;
	mov	_left_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Left_Motor_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:157: void Move_Left_Motor_Forwards (void){
;	-----------------------------------------
;	 function Move_Left_Motor_Forwards
;	-----------------------------------------
_Move_Left_Motor_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:158: left_motor_pwm1 = 0;
	mov	_left_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:159: left_motor_pwm2 = 47;
	mov	_left_motor_pwm2,#0x2F
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Right_Motor'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:163: void Stop_Right_Motor (void){
;	-----------------------------------------
;	 function Stop_Right_Motor
;	-----------------------------------------
_Stop_Right_Motor:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:164: right_motor_pwm1 = 0;
	mov	_right_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:165: right_motor_pwm2 = 0;
	mov	_right_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Left_Motor'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:169: void Stop_Left_Motor (void){
;	-----------------------------------------
;	 function Stop_Left_Motor
;	-----------------------------------------
_Stop_Left_Motor:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:170: left_motor_pwm1 = 0;
	mov	_left_motor_pwm1,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:171: left_motor_pwm2 = 0;
	mov	_left_motor_pwm2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait50ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:174: void wait50ms(){
;	-----------------------------------------
;	 function wait50ms
;	-----------------------------------------
_wait50ms:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:185: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:188: void wait1s(){
;	-----------------------------------------
;	 function wait1s
;	-----------------------------------------
_wait1s:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:190: for (i = 0; i < 20; ++i){
	mov	r2,#0x14
	mov	r3,#0x00
L011003?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:191: wait50ms();
	push	ar2
	push	ar3
	lcall	_wait50ms
	pop	ar3
	pop	ar2
	dec	r2
	cjne	r2,#0xff,L011009?
	dec	r3
L011009?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:190: for (i = 0; i < 20; ++i){
	mov	a,r2
	orl	a,r3
	jnz	L011003?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Right_Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:199: unsigned int Get_Right_Distance(void){
;	-----------------------------------------
;	 function Get_Right_Distance
;	-----------------------------------------
_Get_Right_Distance:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:202: return GetADC(2); //for now channel 1 is right motor
	mov	dpl,#0x02
	ljmp	_GetADC
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Left_Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:207: unsigned int Get_Left_Distance(void){
;	-----------------------------------------
;	 function Get_Left_Distance
;	-----------------------------------------
_Get_Left_Distance:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:209: return GetADC(3); //for now channel 0 is left motor
	mov	dpl,#0x03
	ljmp	_GetADC
;------------------------------------------------------------
;Allocation info for local variables in function 'Stop_Car'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:213: void Stop_Car (void){
;	-----------------------------------------
;	 function Stop_Car
;	-----------------------------------------
_Stop_Car:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:214: Stop_Right_Motor();
	lcall	_Stop_Right_Motor
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:215: Stop_Left_Motor();
	ljmp	_Stop_Left_Motor
;------------------------------------------------------------
;Allocation info for local variables in function 'Face_Transmitter'
;------------------------------------------------------------
;right_distance            Allocated to registers r2 r3 
;left_distance             Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:219: void Face_Transmitter(void){
;	-----------------------------------------
;	 function Face_Transmitter
;	-----------------------------------------
_Face_Transmitter:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:223: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:224: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:229: printf(" \n Before Turning!!!!!!!!! Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:230: if (right_distance - left_distance > 50){
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:232: while(right_distance > left_distance ){
L015001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L015003?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:233: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:234: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:235: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:236: printf(" \n First Loop Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:237: printf("\r");
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:239: Stop_Car();
	lcall	_Stop_Car
	sjmp	L015011?
L015010?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:241: else if (left_distance - right_distance > 30){
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:243: while(left_distance > right_distance ){
L015004?:
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	L015006?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:244: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:245: right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:246: left_distance = Get_Left_Distance();
	push	ar2
	push	ar3
	lcall	_Get_Left_Distance
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:247: printf(" \n Second Loop Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:248: printf("\r");
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:250: Stop_Car();
	lcall	_Stop_Car
L015011?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:252: printf("made through both loops");
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:254: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait_X_Time'
;------------------------------------------------------------
;time                      Allocated to registers r2 r3 
;i                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:258: void Wait_X_Time(int time){
;	-----------------------------------------
;	 function Wait_X_Time
;	-----------------------------------------
_Wait_X_Time:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:260: for (i = 0; i < time; ++i){
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:261: Wait_1ms();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Wait_1ms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:260: for (i = 0; i < time; ++i){
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:265: void Wait_1ms(void){
;	-----------------------------------------
;	 function Wait_1ms
;	-----------------------------------------
_Wait_1ms:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:276: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:280: void Parallel_Park_Wait_1(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_1
;	-----------------------------------------
_Parallel_Park_Wait_1:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:291: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:295: void Parallel_Park_Wait_2(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_2
;	-----------------------------------------
_Parallel_Park_Wait_2:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:306: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:310: void Parallel_Park_Wait_3(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_3
;	-----------------------------------------
_Parallel_Park_Wait_3:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:321: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:325: void Parallel_Park_Wait_4(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_4
;	-----------------------------------------
_Parallel_Park_Wait_4:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:336: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:340: void Parallel_Park_Wait_5(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_5
;	-----------------------------------------
_Parallel_Park_Wait_5:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:351: _endasm;
	
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:355: void Parallel_Park_Wait_6(void){
;	-----------------------------------------
;	 function Parallel_Park_Wait_6
;	-----------------------------------------
_Parallel_Park_Wait_6:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:366: _endasm;
	
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
;Allocation info for local variables in function 'Short_Buzzer'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:371: void Short_Buzzer(void){
;	-----------------------------------------
;	 function Short_Buzzer
;	-----------------------------------------
_Short_Buzzer:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:383: _endasm;
	
	   mov R4, #10
	 J1:
	mov R3, #250
	 J0:
	mov R2, #80
	 J3:
	mov R1, #100
	   djnz R1, $
	   djnz R2, J3
	   cpl P0.0
	   djnz R3, J0
	   djnz R4, J1
	   ret
	 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Forwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:387: void Move_Forwards(void){
;	-----------------------------------------
;	 function Move_Forwards
;	-----------------------------------------
_Move_Forwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:388: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:389: Move_Left_Motor_Forwards();
	ljmp	_Move_Left_Motor_Forwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Parallel_Park'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:393: void Parallel_Park(void){
;	-----------------------------------------
;	 function Parallel_Park
;	-----------------------------------------
_Parallel_Park:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:394: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:395: Wait_X_Time(1300);
	mov	dptr,#0x0514
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:397: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:398: Move_Left_Motor_Backwards();
	lcall	_Move_Left_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:399: Wait_X_Time(1000);
	mov	dptr,#0x03E8
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:400: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:401: Wait_X_Time(500);
	mov	dptr,#0x01F4
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:402: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:403: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:404: Wait_X_Time(985);
	mov	dptr,#0x03D9
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:405: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:406: Short_Buzzer();
	lcall	_Short_Buzzer
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:408: wait1s(); //replace with while(1) loop to tell the robot to unParallel park
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:409: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:410: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:411: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:413: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:414: Wait_X_Time(985);
	mov	dptr,#0x03D9
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:415: Move_Left_Motor_Forwards();
	lcall	_Move_Left_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:416: Wait_X_Time(600);
	mov	dptr,#0x0258
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:417: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:418: Move_Left_Motor_Forwards();
	lcall	_Move_Left_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:419: Wait_X_Time(1000);
	mov	dptr,#0x03E8
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:420: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:421: Wait_X_Time(1300);
	mov	dptr,#0x0514
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:422: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:423: Short_Buzzer();
	ljmp	_Short_Buzzer
;------------------------------------------------------------
;Allocation info for local variables in function 'Undo_Parallel_Park'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:426: void Undo_Parallel_Park (void){
;	-----------------------------------------
;	 function Undo_Parallel_Park
;	-----------------------------------------
_Undo_Parallel_Park:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:427: Turn_Car_Left();
	lcall	_Turn_Car_Left
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:428: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:430: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:431: Parallel_Park_Wait_4();
	lcall	_Parallel_Park_Wait_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:433: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:434: Turn_Car_Right();
	lcall	_Turn_Car_Right
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:435: Parallel_Park_Wait_3();
	lcall	_Parallel_Park_Wait_3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:437: Move_Backwards();
	lcall	_Move_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:438: Parallel_Park_Wait_1();
	lcall	_Parallel_Park_Wait_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:440: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:441: Parallel_Park_Wait_5();
	lcall	_Parallel_Park_Wait_5
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:443: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:444: Parallel_Park_Wait_6();
	ljmp	_Parallel_Park_Wait_6
;------------------------------------------------------------
;Allocation info for local variables in function 'Turn_Car_Left'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:450: void Turn_Car_Left(void){
;	-----------------------------------------
;	 function Turn_Car_Left
;	-----------------------------------------
_Turn_Car_Left:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:451: Move_Right_Motor_Backwards();
	ljmp	_Move_Right_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Turn_Car_Right'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:457: void Turn_Car_Right(void){
;	-----------------------------------------
;	 function Turn_Car_Right
;	-----------------------------------------
_Turn_Car_Right:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:458: Move_Left_Motor_Backwards(); //Same thoughts as above, (in Turn_Car_Left)
	ljmp	_Move_Left_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:463: void Move_Backwards(void){
;	-----------------------------------------
;	 function Move_Backwards
;	-----------------------------------------
_Move_Backwards:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:464: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:465: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Car_Closer'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:471: void Move_Car_Closer(void){
;	-----------------------------------------
;	 function Move_Car_Closer
;	-----------------------------------------
_Move_Car_Closer:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:474: if(dist_index > 0) dist_index--;
	clr	c
	clr	a
	subb	a,_dist_index
	clr	a
	xrl	a,#0x80
	mov	b,(_dist_index + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L031003?
	dec	_dist_index
	mov	a,#0xff
	cjne	a,_dist_index,L031007?
	dec	(_dist_index + 1)
L031007?:
L031003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Move_Car_Further'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:480: void Move_Car_Further(void){
;	-----------------------------------------
;	 function Move_Car_Further
;	-----------------------------------------
_Move_Car_Further:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:483: if(dist_index < 3) dist_index++;
	clr	c
	mov	a,_dist_index
	subb	a,#0x03
	mov	a,(_dist_index + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L032003?
	inc	_dist_index
	clr	a
	cjne	a,_dist_index,L032007?
	inc	(_dist_index + 1)
L032007?:
L032003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate_Car_180_CW'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:487: void Rotate_Car_180_CW(void){
;	-----------------------------------------
;	 function Rotate_Car_180_CW
;	-----------------------------------------
_Rotate_Car_180_CW:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:488: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:489: Move_Left_Motor_Forwards();
	lcall	_Move_Left_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:490: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:491: Wait_X_Time(1277);
	mov	dptr,#0x04FD
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:492: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:494: if(reverse == 0){
	mov	a,_reverse
	jnz	L033002?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:495: reverse = 1;
	mov	_reverse,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:497: reverse = 0;
	ret
L033002?:
	mov	_reverse,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate_Car_180_CCW'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:504: void Rotate_Car_180_CCW(void){
;	-----------------------------------------
;	 function Rotate_Car_180_CCW
;	-----------------------------------------
_Rotate_Car_180_CCW:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:505: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:506: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:507: Move_Left_Motor_Backwards();
	lcall	_Move_Left_Motor_Backwards
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:508: Wait_X_Time(1277); //wait 2000 ms
	mov	dptr,#0x04FD
	lcall	_Wait_X_Time
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:509: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:511: if(reverse == 0){
	mov	a,_reverse
	jnz	L034002?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:512: reverse = 1;
	mov	_reverse,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:514: reverse = 0;
	ret
L034002?:
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:522: unsigned char rx_byte (int min){
;	-----------------------------------------
;	 function rx_byte
;	-----------------------------------------
_rx_byte:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:527: EA = 0;
	clr	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:528: P1_0 = 0;
	clr	_P1_0
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:529: P1_1 = 0;
	clr	_P1_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:530: P1_2 = 0;
	clr	_P1_2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:531: P1_4 = 0;
	clr	_P1_4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:534: val=0;
	mov	r4,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:535: wait_one_and_half_bit_time();
	push	ar2
	push	ar3
	push	ar4
	lcall	_wait_one_and_half_bit_time
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:536: for(j=0; j<8; j++)
	mov	r5,#0x00
L035001?:
	cjne	r5,#0x08,L035013?
L035013?:
	jnc	L035004?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:538: v=GetADC(2);
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:539: val|=(v>min)?(0x01<<j):0x00; // min is threshold voltage but in our case it is 1023
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	L035007?
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	L035018?
L035016?:
	add	a,acc
L035018?:
	djnz	b,L035016?
	mov	r6,a
	sjmp	L035008?
L035007?:
	mov	r6,#0x00
L035008?:
	mov	a,r6
	orl	ar4,a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:540: wait_bit_time();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_wait_bit_time
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:536: for(j=0; j<8; j++)
	inc	r5
	sjmp	L035001?
L035004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:543: wait_one_and_half_bit_time();
	push	ar4
	lcall	_wait_one_and_half_bit_time
	pop	ar4
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:544: EA = 1;
	setb	_EA
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:545: return val;
	mov	dpl,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:550: void wait_bit_time(void){
;	-----------------------------------------
;	 function wait_bit_time
;	-----------------------------------------
_wait_bit_time:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:561: _endasm;
	
  ;For a 22.1184MHz crystal one machine cycle
  ;takes 12/22.1184MHz=0.5425347us
	     mov R2, #2
	 L3:
	mov R1, #200
	 L2:
	mov R0, #200
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:565: void wait_one_and_half_bit_time(void){
;	-----------------------------------------
;	 function wait_one_and_half_bit_time
;	-----------------------------------------
_wait_one_and_half_bit_time:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:576: _endasm;
	
  ;For a 22.1184MHz crystal one machine cycle
  ;takes 12/22.1184MHz=0.5425347us
	     mov R2, #3
	 L6:
	mov R1, #200
	 L5:
	mov R0, #200
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:580: void SPIWrite(unsigned char value){
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:581: SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	anl	_SPSTA,#0x7F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:582: SPDAT=value;
	mov	_SPDAT,r2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:583: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
L038001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L038001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:587: unsigned int GetADC(unsigned char channel){
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:591: SPCON&=(~SPEN); // Disable SPI
	anl	_SPCON,#0xBF
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:592: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	mov	_SPCON,#0x3F
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:593: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:595: P4_1=0; // Activate the MCP3004 ADC.
	clr	_P4_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:596: SPIWrite(channel|0x18);	// Send start bit, single/diff* bit, D2, D1, and D0 bits.
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:597: for(adc=0; adc<10; adc++); // Wait for S/H to setup
	mov	r2,#0x0A
	mov	r3,#0x00
L039003?:
	dec	r2
	cjne	r2,#0xff,L039009?
	dec	r3
L039009?:
	mov	a,r2
	orl	a,r3
	jnz	L039003?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:598: SPIWrite(0x55); // Read bits 9 down to 4
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:599: adc=((SPDAT&0x3f)*0x100);
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:600: SPIWrite(0x55);// Read bits 3 down to 0
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:601: P4_1=1; // Deactivate the MCP3004 ADC.
	setb	_P4_1
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:602: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:603: adc>>=4;
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
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:605: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Testing_Code'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:626: void Testing_Code(void){
;	-----------------------------------------
;	 function Testing_Code
;	-----------------------------------------
_Testing_Code:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:627: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:628: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:631: while(1){
L040002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:632: Parallel_Park();
	lcall	_Parallel_Park
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:633: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:634: wait1s();
	lcall	_wait1s
	sjmp	L040002?
;------------------------------------------------------------
;Allocation info for local variables in function 'run'
;------------------------------------------------------------
;right_distance            Allocated with name '_run_right_distance_1_182'
;left_distance             Allocated with name '_run_left_distance_1_182'
;sloc0                     Allocated with name '_run_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:638: void run(void){
;	-----------------------------------------
;	 function run
;	-----------------------------------------
_run:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:639: unsigned int right_distance = Get_Right_Distance();
	lcall	_Get_Right_Distance
	mov	_run_right_distance_1_182,dpl
	mov	(_run_right_distance_1_182 + 1),dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:640: unsigned int left_distance = Get_Left_Distance();
	lcall	_Get_Left_Distance
	mov	_run_left_distance_1_182,dpl
	mov	(_run_left_distance_1_182 + 1),dph
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:642: if(!reverse) {
	mov	a,_reverse
	jz	L041047?
	ljmp	L041030?
L041047?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:643: if (abs(right_distance - dist_table[dist_index]) >= dist_error[dist_index]){
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
	mov	a,_run_right_distance_1_182
	clr	c
	subb	a,r6
	mov	dpl,a
	mov	a,(_run_right_distance_1_182 + 1)
	subb	a,r7
	mov	dph,a
	lcall	_abs
	mov	r6,dpl
	mov	r7,dph
	mov	_run_sloc0_1_0,_dist_index
	mov	a,(_dist_index + 1)
	xch	a,_run_sloc0_1_0
	add	a,acc
	xch	a,_run_sloc0_1_0
	rlc	a
	mov	(_run_sloc0_1_0 + 1),a
	mov	a,_run_sloc0_1_0
	add	a,#_dist_error
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	clr	c
	mov	a,r6
	subb	a,r4
	mov	a,r7
	subb	a,r5
	jc	L041006?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:644: if (right_distance > dist_table[dist_index]){
	mov	a,_run_sloc0_1_0
	add	a,#_dist_table
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	clr	c
	mov	a,r4
	subb	a,_run_right_distance_1_182
	mov	a,r5
	subb	a,(_run_right_distance_1_182 + 1)
	jnc	L041002?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:645: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
L041002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:647: if (right_distance < dist_table[dist_index]){
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
	mov	a,_run_right_distance_1_182
	subb	a,r4
	mov	a,(_run_right_distance_1_182 + 1)
	subb	a,r5
	jnc	L041007?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:648: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
	sjmp	L041007?
L041006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:652: Stop_Car();
	lcall	_Stop_Car
L041007?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:654: if (abs(left_distance - dist_table[dist_index]) >= dist_error[dist_index]){
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
	mov	a,_run_left_distance_1_182
	clr	c
	subb	a,r4
	mov	dpl,a
	mov	a,(_run_left_distance_1_182 + 1)
	subb	a,r5
	mov	dph,a
	lcall	_abs
	mov	_run_sloc0_1_0,dpl
	mov	(_run_sloc0_1_0 + 1),dph
	mov	a,_dist_index
	add	a,_dist_index
	mov	r6,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	r7,a
	mov	a,r6
	add	a,#_dist_error
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	clr	c
	mov	a,_run_sloc0_1_0
	subb	a,r4
	mov	a,(_run_sloc0_1_0 + 1)
	subb	a,r5
	jc	L041013?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:655: if (left_distance > dist_table[dist_index]){
	mov	a,r6
	add	a,#_dist_table
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	clr	c
	mov	a,r4
	subb	a,_run_left_distance_1_182
	mov	a,r5
	subb	a,(_run_left_distance_1_182 + 1)
	jnc	L041009?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:656: Move_Left_Motor_Forwards();
	lcall	_Move_Left_Motor_Forwards
L041009?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:658: if (left_distance < dist_table[dist_index]){
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
	mov	a,_run_left_distance_1_182
	subb	a,r4
	mov	a,(_run_left_distance_1_182 + 1)
	subb	a,r5
	jc	L041053?
	ret
L041053?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:659: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
L041013?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:663: Stop_Car();
	ljmp	_Stop_Car
L041030?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:666: if (abs(right_distance - dist_table[dist_index]) >= dist_error[dist_index]){
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
	mov	a,_run_right_distance_1_182
	clr	c
	subb	a,r4
	mov	dpl,a
	mov	a,(_run_right_distance_1_182 + 1)
	subb	a,r5
	mov	dph,a
	lcall	_abs
	mov	r4,dpl
	mov	r5,dph
	mov	a,_dist_index
	add	a,_dist_index
	mov	r6,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	r7,a
	mov	a,r6
	add	a,#_dist_error
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jc	L041020?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:667: if (right_distance < dist_table[dist_index]){
	mov	a,r6
	add	a,#_dist_table
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	clr	c
	mov	a,_run_right_distance_1_182
	subb	a,r2
	mov	a,(_run_right_distance_1_182 + 1)
	subb	a,r3
	jnc	L041016?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:668: Move_Right_Motor_Forwards();
	lcall	_Move_Right_Motor_Forwards
L041016?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:670: if (right_distance > dist_table[dist_index]){
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
	subb	a,_run_right_distance_1_182
	mov	a,r3
	subb	a,(_run_right_distance_1_182 + 1)
	jnc	L041021?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:671: Move_Right_Motor_Backwards();
	lcall	_Move_Right_Motor_Backwards
	sjmp	L041021?
L041020?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:675: Stop_Car();
	lcall	_Stop_Car
L041021?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:677: if (abs(left_distance - dist_table[dist_index]) >= dist_error[dist_index]){
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
	mov	a,_run_left_distance_1_182
	clr	c
	subb	a,r2
	mov	dpl,a
	mov	a,(_run_left_distance_1_182 + 1)
	subb	a,r3
	mov	dph,a
	lcall	_abs
	mov	r2,dpl
	mov	r3,dph
	mov	a,_dist_index
	add	a,_dist_index
	mov	r4,a
	mov	a,(_dist_index + 1)
	rlc	a
	mov	r5,a
	mov	a,r4
	add	a,#_dist_error
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	subb	a,r7
	jc	L041027?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:678: if (left_distance < dist_table[dist_index]){
	mov	a,r4
	add	a,#_dist_table
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	clr	c
	mov	a,_run_left_distance_1_182
	subb	a,r2
	mov	a,(_run_left_distance_1_182 + 1)
	subb	a,r3
	jnc	L041023?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:679: Move_Left_Motor_Forwards();
	lcall	_Move_Left_Motor_Forwards
L041023?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:681: if (left_distance > dist_table[dist_index]){
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
	subb	a,_run_left_distance_1_182
	mov	a,r3
	subb	a,(_run_left_distance_1_182 + 1)
	jnc	L041032?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:682: Move_Left_Motor_Backwards();
	ljmp	_Move_Left_Motor_Backwards
L041027?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:686: Stop_Car();
	ljmp	_Stop_Car
L041032?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Fake_run'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:690: void Fake_run(void) {
;	-----------------------------------------
;	 function Fake_run
;	-----------------------------------------
_Fake_run:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:691: Rotate_Car_180_CW();
	lcall	_Rotate_Car_180_CW
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:692: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:693: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:694: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:695: Rotate_Car_180_CCW();
	lcall	_Rotate_Car_180_CCW
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:696: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:697: wait1s();
	lcall	_wait1s
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:698: wait1s();
	ljmp	_wait1s
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;logic_0_thresh            Allocated to registers 
;cmd                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:701: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:704: unsigned char cmd = 0;
	mov	r2,#0x00
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:705: dist_index = 1;
	mov	_dist_index,#0x01
	clr	a
	mov	(_dist_index + 1),a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:706: reverse = 1;	
	mov	_reverse,#0x01
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:708: printf("\n");
	push	ar2
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:710: while(1){
L043013?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:712: printf("Right: %u  Left: %u Cmd: %u\n", Get_Right_Distance(), Get_Left_Distance(), cmd);
	mov	ar3,r2
	mov	r4,#0x00
	push	ar2
	push	ar3
	push	ar4
	lcall	_Get_Left_Distance
	mov	r5,dpl
	mov	r6,dph
	push	ar5
	push	ar6
	lcall	_Get_Right_Distance
	mov	r7,dpl
	mov	r0,dph
	push	ar7
	push	ar0
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:713: run();
	lcall	_run
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:716: if(Get_Right_Distance() < logic_0_thresh && Get_Left_Distance() < logic_0_thresh){
	lcall	_Get_Right_Distance
	mov	r3,dpl
	mov	r4,dph
	pop	ar2
	clr	c
	mov	a,r3
	subb	a,#0x0A
	mov	a,r4
	subb	a,#0x00
	jnc	L043013?
	push	ar2
	lcall	_Get_Left_Distance
	mov	r3,dpl
	mov	r4,dph
	pop	ar2
	clr	c
	mov	a,r3
	subb	a,#0x0A
	mov	a,r4
	subb	a,#0x00
	jnc	L043013?
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:717: Stop_Car();
	lcall	_Stop_Car
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:718: cmd = rx_byte (logic_0_thresh);     	
	mov	dptr,#0x000A
	lcall	_rx_byte
	mov	r2,dpl
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:719: if(cmd == MOVE_FURTHER) Move_Car_Further();
	cjne	r2,#0xFD,L043002?
	push	ar2
	lcall	_Move_Car_Further
	pop	ar2
L043002?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:720: if(cmd == MOVE_CLOSER) Move_Car_Closer();
	cjne	r2,#0xF5,L043004?
	push	ar2
	lcall	_Move_Car_Closer
	pop	ar2
L043004?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:721: if(cmd == ROTATE_180) Rotate_Car_180_CW();
	cjne	r2,#0xD5,L043006?
	push	ar2
	lcall	_Rotate_Car_180_CW
	pop	ar2
L043006?:
;	C:\Users\Travis\Documents\GitHub\eeceProject2\eeceProject2\Car_Project_2.c:722: if(cmd == PRL_PARK) Parallel_Park();
	cjne	r2,#0x86,L043032?
	sjmp	L043033?
L043032?:
	ljmp	L043013?
L043033?:
	push	ar2
	lcall	_Parallel_Park
	pop	ar2
	ljmp	L043013?
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
	db 0x0A
	db 0x00
__str_6:
	db 'Right: %u  Left: %u Cmd: %u'
	db 0x0A
	db 0x00

	CSEG

end
