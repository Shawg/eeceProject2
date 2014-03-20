#include <stdio.h>
#include <at89lp51rd2.h>

unsigned char _c51_external_startup(void)
{
	// Configure ports as a bidirectional with internal pull-ups.
	P0M0=0;	P0M1=0;
	P1M0=0;	P1M1=0;
	P2M0=0;	P2M1=0;
	P3M0=0;	P3M1=0;
	AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	P4M0=0;	P4M1=0;

    return 0;
}
//This currently waits 500ms 
void wait_bit_time(void)
{
	_asm	
		;For a 22.1184MHz crystal one machine cycle 
		;takes 12/22.1184MHz=0.5425347us
	    mov R2, #10
	L3:	mov R1, #248
	L2:	mov R0, #184
	L1:	djnz R0, L1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    djnz R1, L2 ; 200us*250=0.05s
	    djnz R2, L3 ; 0.05s*10=500ms
	    ret
    _endasm;
}

void tx_byte(unsigned char val)
{
	unsigned char j;
	//Send the start bit
	//txon=0; make the circuit turn off
	wait_bit_time();
	for (j=0; j<8; j++)
	{
		//txon=val&(0x01<<j)?1:0; make tx control the circuit
		wait_bit_time();
	}
	//txon=1; make the ciruit turn on
	//Send the stop bits
	wait_bit_time();
	wait_bit_time();
}

void moveCloser(void) 
{
	tx_byte(0xfd); // move closer is 11111101
}

void moveFarther(void)
{
	tx_byte(0xf5); // move farther is 11110101
}

void rotate180(void)
{
	tx_byte(0xd5); // rotate is 11010101
}

void prlPark(void)
{
	tx_byte(0x55); // parallel park is 01010101
}

void main (void)
{
	while(1) {
		// if button 1, moveCloser
		if(P2_2 != 0) moveCloser();
		// if button 2, moveFarther
		if(P2_3 != 0) moveFarther();
		// if button 3, rotate 180
		if(P4_3 != 0) rotate180();
		// if button 4, parallel park
		if(P3_7 != 1) prlPark();
	}
}