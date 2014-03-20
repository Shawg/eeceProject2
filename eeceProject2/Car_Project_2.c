#include <stdio.h>
#include <at89lp51rd2.h>
// test test 
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

//SKELETON CODE FOR STATE MACHINE

//This causes the care to stop moving
void Stop_Car (void){
	Stop_Right_Motor();
	Stop_Left_Motor();
}

//This causes the car to turn so that it is facing the transmitter
void Face_Transmitter(void){
	
}

//This causes the car to parallel park in a length that is 1.5*(length of car)
void parallel_park(void){

}

//This causes the care to turn to the left
void Turn_Car_Left(void){
	Move_Right_Motor_Forwards();
	Move_Left_Motor_Backwards();
}

void Turn_Car_Right(void){
	Move_Right_Motor_Backwards();
	Move_Left_Motor_Forwards();
}

// This causes the car to move forwards in a straight line
void move_forward(void){
	Move_Right_Motor_Forwards();
	Move_Left_Motor_Forwards();
}

// This causes the car to move backards in a straight line
void move_backwards(void){
	Move_Right_Motor_Backwards();
	Move_Left_Motor_Backwards();

}

//This causes the predetermined distance between the car and the 
//transmitter to decrease, making the car move closer to the transmitter
void move_car_closer(void){

}


//This causes the predetermined distance between the car and the 
//transmitter to increase, making the car move further from the transmitter
void move_car_further(void){

}

//This causes the care to rotate 180 degrees
void rotate_car_180(void){

}

// This causes the motor on the right side of the
// car to move forwards
void Move_Right_Motor_Forwards (void){

}

// This causes the motor on the right side of the
// car to move backwards
void Move_Right_Motor_Backwards (void){

}

// This causes the motor on the left side of the
// car to move forwards
void Move_Left_Motor_Forwards (void){

}

// This causes the motor on the left side of the
// car to move backwards
void Move_Left_Motor_Backwards (void){

}

//This stops the right motor
void Stop_Right_Motor (void){

}

//This stops the left motor
void Stop_Left_Motor (void){

}

// The purpose of this function is to contain the code you
// wish to test, then to put the Testing_Code() function in
// a while(1) loop in the main function. This insures that
// the code you're testing doesn't interfere with correct code
// in the main body of the program 
void Testing_Code(){

}

void main (void)
{	
	while (1){
		Testing_Code();
	}
}
