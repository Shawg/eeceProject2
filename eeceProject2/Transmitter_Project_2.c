#include <stdio.h>
#include <at89lp51rd2.h>

#define MOVE_FURTHER 0xfd
#define MOVE_CLOSER 0xf5
#define ROTATE_180 0xd5
#define PRL_PARK 0x80

#define BAUD 115200L
#define BRG_VAL (0x100-(CLK/(32L*BAUD)))
#define CLK 22118400L
#define FREQ (15105.6463263*2.0)
#define TIMER0_RELOAD_VALUE (long int) (65536.0-(CLK/(12.0*FREQ)))

unsigned char _c51_external_startup(void)
{
	// Configure ports as a bidirectional with internal pull-ups.
	P0M0=0;	P0M1=0;
	P1M0=0;	P1M1=0x03; //ports 0 and 1 are push-pull 00000011 = 0x03
	P2M0=0x7E;	P2M1=0; //ports 2.1-2.6 input  01111110 = 0x7E
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
	
	P1_0=0;
	P1_1=1;

    return 0;
}

void pwmcounter (void) interrupt 1
{
	P1_0=!P1_0;
	P1_1=!P1_1;
}
// This currently waits 100ms. If you change this function, change it in
// reciever program as well. Also change the 1.5 bit time function
void wait_bit_time(void)
{
	_asm	
		;For a 22.1184MHz crystal one machine cycle 
		;takes 12/22.1184MHz=0.5425347us
	    mov R2, #2
	L3:	mov R1, #120
	L2:	mov R0, #150
	L1:	djnz R0, L1
	    djnz R1, L2 
	    djnz R2, L3 
	    ret
    _endasm;
}

void tx_byte(unsigned char val)
{
	unsigned char j;
	//Send the start bit
	EA=0;
	wait_bit_time();
	for (j=0; j<8; j++)
	{
		EA=val&(0x01<<j)?1:0; 
		wait_bit_time();
	}
	EA=1;
	//Send the stop bits
	wait_bit_time();
	wait_bit_time();
}

void moveCloser(void) 
{
	tx_byte(MOVE_CLOSER); // move closer is 11111101
}

void moveFurther(void)
{
	tx_byte(MOVE_FURTHER); // move farther is 11110101
}

void rotate180(void)
{
	tx_byte(ROTATE_180); // rotate is 11010101
}

void prlPark(void)
{
	tx_byte(PRL_PARK); // parallel park is 10000000
}

void main (void)
{
	while(1) {
		//if button 1, moveCloser
		if(P2_1 == 1) moveCloser();
		//if button 2, moveFarther
		if(P2_2 == 1) moveFurther();
		//if button 3, rotate 180
		if(P2_3 == 1) rotate180();
		//if button 4, parallel park
		if(P2_4 == 1) prlPark();
	}
}