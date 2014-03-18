#include <stdio.h>
#include <at89lp51rd2.h>

// ~C51~ 
 
#define CLK 22118400L
#define BAUD 115200L
#define BRG_VAL (0x100-(CLK/(32L*BAUD)))

//We want timer 0 to interrupt every 100 microseconds ((1/10000Hz)=100 us)
#define FREQ 10000L
#define TIMER0_RELOAD_VALUE (65536L-(CLK/(12L*FREQ)))

//These variables are used in the ISR
volatile unsigned char pwmcount;
volatile unsigned char pwm1;
volatile unsigned char pwm2;

unsigned char _c51_external_startup(void)
{
	// Configure ports as a bidirectional with internal pull-ups.
	P0M0=0;	P0M1=0;
	P1M0=0;	P1M1=0;
	P2M0=0;	P2M1=0;
	P3M0=0;	P3M1=0;
	AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	P4M0=0;	P4M1=0;
    
    // Initialize the serial port and baud rate generator
    PCON|=0x80;
	SCON = 0x52;
    BDRCON=0;
    BRL=BRG_VAL;
    BDRCON=BRR|TBCK|RBCK|SPD;
	
	// Initialize timer 0 for ISR 'pwmcounter()' below
	TR0=0; // Stop timer 0
	TMOD=0x01; // 16-bit timer
	// Use the autoreload feature available in the AT89LP51RB2
	// WARNING: There was an error in at89lp51rd2.h that prevents the
	// autoreload feature to work.  Please download a newer at89lp51rd2.h
	// file and copy it to the crosside\call51\include folder.
	TH0=RH0=TIMER0_RELOAD_VALUE/0x100;
	TL0=RL0=TIMER0_RELOAD_VALUE%0x100;
	TR0=1; // Start timer 0 (bit 4 in TCON)
	ET0=1; // Enable timer 0 interrupt
	EA=1;  // Enable global interrupts
	
	pwmcount=0;
    
    return 0;
}

// Interrupt 1 is for timer 0.  This function is executed every time
// timer 0 overflows: 100 us.
void pwmcounter (void) interrupt 1
{
	if(++pwmcount>99) pwmcount=0;
	P1_0=(pwm1>pwmcount)?1:0;
	P1_1=(pwm2>pwmcount)?1:0;
}

void wait50ms(){
	_asm	
		;For a 22.1184MHz crystal one machine cycle 
		;takes 12/22.1184MHz=0.5425347us
	    mov R2, #1
	La3:	mov R1, #248
	La2:	mov R0, #184
	La1:	djnz R0, La1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    djnz R1, La2 ; 200us*250=0.05s
	    djnz R2, La3 ; 0.05s*20=50ms
	    ret
    _endasm;
}

void wait1s(){
	int i;
	for (i = 0; i < 20; ++i){
		wait50ms();
	}
}

void main (void)
{	
	while(1){
		pwm1=10; //50% duty cycle wave at 100Hz
		wait1s();
		pwm1=20;
		wait1s();
		pwm1=30;
		wait1s();
		pwm1=40;
		wait1s();
		pwm1=50;
		wait1s();
		pwm1=60;
		wait1s();
		pwm1=70;
		wait1s();
		pwm1=80;
		wait1s();
	}
}
