#include <stdio.h>
#include <stdlib.h>
#include <at89lp51rd2.h>
#include <math.h>
// ~C51~ 
 
#define CLK 22118400L
#define BAUD 115200L
#define BRG_VAL (0x100-(CLK/(32L*BAUD)))

//We want timer 0 to interrupt every 100 microseconds ((1/10000Hz)=100 us)
#define FREQ 10000L
#define TIMER0_RELOAD_VALUE (65536L-(CLK/(12L*FREQ)))

//Reciever commands
#define MOVE_FURTHER 0xfd
#define MOVE_CLOSER 0xf5
#define ROTATE_180 0xd5
#define PRL_PARK 0x86

//These variables are used in the ISR
volatile unsigned char left_motor_pwmcount1;
volatile unsigned char left_motor_pwmcount2;
volatile unsigned char left_motor_pwm1;
volatile unsigned char left_motor_pwm2;

volatile unsigned char right_motor_pwmcount1;
volatile unsigned char right_motor_pwmcount2;
volatile unsigned char right_motor_pwm1;
volatile unsigned char right_motor_pwm2;

//Global Variables
unsigned int dist_table[4] = {260, 150, 90, 27};
unsigned int dist_error[4] = {32, 19, 13, 8};
int dist_index; //number from 0-3 that determines distance
unsigned char reverse;

	//Motor Control
void Move_Left_Motor_Backwards(void);
void Move_Left_Motor_Forwards(void);
void Move_Right_Motor_Backwards(void);
void Move_Right_Motor_Forwards(void);
void Stop_Right_Motor(void);
void Stop_Left_Motor(void);
	//Basic Car Control
void Rotate_Car_180_CW(void);
void Rotate_Car_180_CCW(void);
void Turn_Car_Right(void);
void Turn_Car_Left(void);
void Stop_Car(void);
void Move_Backwards(void);
void Move_Forwards(void);
	//Advanced Car Control
void Parallel_Park(void);
void Undo_Parallel_Park(void);
void Face_Transmitter(void);

unsigned int Get_Right_Distance(void);
unsigned int Get_Left_Distance(void);

	//Reciever Functions
unsigned char rx_byte (int min);
void wait_bit_time(void);
void wait_one_and_half_bit_time(void);
void SPIWrite(unsigned char value);
unsigned int GetADC(unsigned char channel);

	//Misc Functions
void Testing_Code(void);
void wait50ms(void);
void wait1s(void);
void run (void);
void Wait_1ms (void);
void Wait_X_Time (int time);

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
	
	left_motor_pwmcount1 = 0;    
	left_motor_pwmcount2 = 0;
	right_motor_pwmcount1 = 0;
	right_motor_pwmcount2 = 0;

    return 0;
}

// Interrupt 1 is for timer 0.  This function is executed every time
// timer 0 overflows: 100 us.
void pwmcounter (void) interrupt 1
{
	if(++left_motor_pwmcount1>99) left_motor_pwmcount1=0;
	P1_2=(left_motor_pwm1>left_motor_pwmcount1)?1:0;
	
	if(++left_motor_pwmcount2>99) left_motor_pwmcount2=0;
	P1_4=(left_motor_pwm2>left_motor_pwmcount2)?1:0;

	if(++right_motor_pwmcount1>99) right_motor_pwmcount1=0;
	P1_0=(right_motor_pwm1>right_motor_pwmcount1)?1:0;
	
	if(++right_motor_pwmcount2>99) right_motor_pwmcount2=0;
	P1_1=(right_motor_pwm2>right_motor_pwmcount2)?1:0;
}

// This causes the motor on the right side of the
// car to move Backwards emmett
void Move_Right_Motor_Backwards(){
	right_motor_pwm1 = 51;
	right_motor_pwm2 = 0;
	
}

// This causes the motor on the right side of the
// car to move Forwards
void Move_Right_Motor_Forwards (void){
	right_motor_pwm1 = 0;
	right_motor_pwm2 = 51;

}

// This causes the motor on the left side of the
// car to move Backwards
void Move_Left_Motor_Backwards (void){
	left_motor_pwm1 = 47;
	left_motor_pwm2 = 0;
}

// This causes the motor on the left side of the
// car to move Forwards
void Move_Left_Motor_Forwards (void){
	left_motor_pwm1 = 0;
	left_motor_pwm2 = 47;
}

//This stops the right motor
void Stop_Right_Motor (void){
	right_motor_pwm1 = 0;
	right_motor_pwm2 = 0;
}

//This stops the left motor
void Stop_Left_Motor (void){
	left_motor_pwm1 = 0;
	left_motor_pwm2 = 0;
}

void wait50ms(){
	_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #1
	Lg3:	mov R1, #248
	Lg2:	mov R0, #184
	Lg1:	djnz R0, Lg1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Lg2 ; 200us*250=0.05s
	    	djnz R2, Lg3 ; 0.05s*20=50ms
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

// Finds and returns the distance between the right
// receiver and the transmitter  
unsigned int Get_Right_Distance(void){
	//In here use the ADC from lab...(capacitor one)
	//and have the value be the peak detector voltage over the right distance
	return GetADC(2); //for now channel 1 is right motor
}

// Finds and returns the distance between the left
// receiver and the transmitter  
unsigned int Get_Left_Distance(void){
	//same as Get_right_distance
	return GetADC(3); //for now channel 0 is left motor
}

//This causes the care to stop moving
void Stop_Car (void){
	Stop_Right_Motor();
	Stop_Left_Motor();
}

//This causes the car to turn so that it is facing the transmitter
void Face_Transmitter(void){
	unsigned int right_distance;
	unsigned int left_distance;

	right_distance = Get_Right_Distance();
	left_distance = Get_Left_Distance();

	//if(left_distance - right_distance > dist_error[dist_index] || left_distance - right_distance < dist_error[dist_index]) return;//find a good error bound, we dont need to be pointing 
	//																			//EXACTLY at the transmitter at all times while moving 
	//																			//to or from it 
	printf(" \n Before Turning!!!!!!!!! Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
	if (right_distance - left_distance > 50){
		
		while(right_distance > left_distance ){
			Turn_Car_Right();
			right_distance = Get_Right_Distance();
			left_distance = Get_Left_Distance();
			printf(" \n First Loop Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
			printf("\r");
		}
		Stop_Car();
	}
	else if (left_distance - right_distance > 30){

		while(left_distance > right_distance ){
			Turn_Car_Left();
			right_distance = Get_Right_Distance();
			left_distance = Get_Left_Distance();
			printf(" \n Second Loop Right Voltage Reading: %u, Left Voltage Reading: %u", right_distance, left_distance);
			printf("\r");
		}
		Stop_Car();
	}
	printf("made through both loops");

		return;

}

void Wait_X_Time(int time){
	int i;
	for (i = 0; i < time; ++i){
		Wait_1ms();
	}
}

void Wait_1ms(void){
			_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #2  
	Lz3:	mov R1, #5
	Lz2:	mov R0, #92
	Lz1:	djnz R0, Lz1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Lz2 ; 200us*250=0.05s
	    	djnz R2, Lz3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

void Parallel_Park_Wait_1(void){
			_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #20   ;25
	La3:	mov R1, #248
	La2:	mov R0, #184
	La1:	djnz R0, La1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, La2 ; 200us*250=0.05s
	    	djnz R2, La3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

void Parallel_Park_Wait_2(void){
	_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #1
	Lb3:	mov R1, #248
	Lb2:	mov R0, #184
	Lb1:	djnz R0, Lb1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Lb2 ; 200us*250=0.05s
	    	djnz R2, Lb3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

void Parallel_Park_Wait_3(void){
	_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #12
	Lc3:	mov R1, #248
	Lc2:	mov R0, #184
	Lc1:	djnz R0, Lc1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Lc2 ; 200us*250=0.05s
	    	djnz R2, Lc3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

void Parallel_Park_Wait_4(void){
	_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #21
	Ld3:	mov R1, #248
	Ld2:	mov R0, #184
	Ld1:	djnz R0, Ld1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Ld2 ; 200us*250=0.05s
	    	djnz R2, Ld3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

void Parallel_Park_Wait_5(void){
	_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #13
	Le3:	mov R1, #248
	Le2:	mov R0, #184
	Le1:	djnz R0, Le1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Le2 ; 200us*250=0.05s
	    	djnz R2, Le3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

void Parallel_Park_Wait_6(void){
	_asm	
			;For a 22.1184MHz crystal one machine cycle 
			;takes 12/22.1184MHz=0.5425347us
		    mov R2, #1
	Lf3:	mov R1, #248
	Lf2:	mov R0, #184
	Lf1:	djnz R0, Lf1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	    	djnz R1, Lf2 ; 200us*250=0.05s
	    	djnz R2, Lf3 ; 0.05s*20=50ms
	    	ret
    _endasm;

}

// This causes the car to move backards in a straight line
void Move_Forwards(void){
	Move_Right_Motor_Forwards();
	Move_Left_Motor_Forwards();

}
//This causes the car to parallel park in a length that is 1.5*(length of car)
void Parallel_Park(void){
	Move_Backwards();
	Wait_X_Time(1300);
	
	Stop_Car();
	Move_Left_Motor_Backwards();
	Wait_X_Time(1000);
	Move_Right_Motor_Backwards();
	Wait_X_Time(700);
	Stop_Car();
	Move_Right_Motor_Backwards();
	Wait_X_Time(1050);
	Stop_Car();
	
	wait1s(); //replace with while(1) loop to tell the robot to unParallel park
	wait1s();
	wait1s();
	wait1s();

	Move_Right_Motor_Forwards();
	Wait_X_Time(985);
	Move_Left_Motor_Forwards();
	Wait_X_Time(600);
	Stop_Car();
	Move_Left_Motor_Forwards();
	Wait_X_Time(900);
	Move_Right_Motor_Forwards();
	Wait_X_Time(1300);
	Stop_Car();
}

void Undo_Parallel_Park (void){
	Turn_Car_Left();
	Parallel_Park_Wait_3();
	
	Move_Backwards();
	Parallel_Park_Wait_4();
	
	Stop_Car();
	Turn_Car_Right();
	Parallel_Park_Wait_3();
	
	Move_Backwards();
	Parallel_Park_Wait_1();
	
	Stop_Car();
	Parallel_Park_Wait_5();
	
	Stop_Car();
	Parallel_Park_Wait_6();


}

//This causes the care to turn to the left
void Turn_Car_Left(void){
	Move_Right_Motor_Backwards();
	//We might want to get rid of this and just move one wheel
								 //We'll have a better idea when we do testing with
								 //the chassis
}

void Turn_Car_Right(void){
	Move_Left_Motor_Backwards(); //Same thoughts as above, (in Turn_Car_Left)
}

// This causes the car to move Backwards in a straight line

void Move_Backwards(void){
	Move_Right_Motor_Backwards();
	Move_Left_Motor_Backwards();
}


//This causes the predetermined distance between the car and the 
//transmitter to decrease, making the car move closer to the transmitter
void Move_Car_Closer(void){
	// unsigned int right_distance = Get_Right_Distance();
	// unsigned int left_distance = Get_Left_Distance();
	if(dist_index > 0) dist_index--;
}


//This causes the predetermined distance between the car and the 
//transmitter to increase, making the car move further from the transmitter
void Move_Car_Further(void){
	// unsigned int right_distance = Get_Right_Distance();
	// unsigned int left_distance = Get_Left_Distance();
	if(dist_index < 3) dist_index++;
}

//This causes the car to rotate 180 degrees clockwise
void Rotate_Car_180_CW(void){
	Stop_Car();
	Move_Left_Motor_Forwards();
	Move_Right_Motor_Backwards();
	Wait_X_Time(1600);
 	Stop_Car();
	
	if(reverse == 0){
		reverse = 1;
	}else{
		reverse = 0;
	}	

}


//This causes the car to rotate 180 degrees counter clockwise
void Rotate_Car_180_CCW(void){
 	Stop_Car();
	Move_Right_Motor_Forwards();
	Move_Left_Motor_Backwards();
	Wait_X_Time(1500); //wait 2000 ms
 	Stop_Car();

	if(reverse == 0){
		reverse = 1;
	}else{
		reverse = 0;
	}	
}

// Recieves a command byte from the transmitter, call this function
// when the transmitter senses the start bit of 0. Takes the voltage
// that is considered to be zero as an input and returns the recieved
// byte
unsigned char rx_byte (int min){

	unsigned char j, val;
	int v;
	
	EA = 0;
	P1_0 = 0;
	P1_1 = 0;
	P1_2 = 0;
	P1_4 = 0;

	//Skip the start bit
	val=0;
	wait_one_and_half_bit_time();
	for(j=0; j<8; j++)
	{
	v=GetADC(2);
	val|=(v>min)?(0x01<<j):0x00; // min is threshold voltage but in our case it is 1023
	wait_bit_time();
	}
	//Wait for stop bits
	wait_one_and_half_bit_time();
	EA = 1;
	return val;
}

// Currently set to 100ms. If you change this function, change it in the
// transmitter program as well.  Also change the 1.5 bit time function
void wait_bit_time(void){
		_asm	
		;For a 22.1184MHz crystal one machine cycle 
		;takes 12/22.1184MHz=0.5425347us
	    mov R2, #2
	L3:	mov R1, #200
	L2:	mov R0, #200
	L1:	djnz R0, L1 
	    djnz R1, L2
	    djnz R2, L3 
	    ret
    _endasm;
}

// Waits 1.5 bits.  Keep this scaled with wait_bit_time()
void wait_one_and_half_bit_time(void){
		_asm	
		;For a 22.1184MHz crystal one machine cycle 
		;takes 12/22.1184MHz=0.5425347us
	    mov R2, #3
	L6:	mov R1, #200
	L5:	mov R0, #200
	L4:	djnz R0, L4
	    djnz R1, L5
	    djnz R2, L6 
	    ret
    _endasm;
}

// Called by GetADC() to do SPI
void SPIWrite(unsigned char value){
	SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	SPDAT=value;
	while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
}

// Read 10 bits from the MCP3004 ADC converter
unsigned int GetADC(unsigned char channel){
	unsigned int adc;

	// initialize the SPI port to read the MCP3004 ADC attached to it.
	SPCON&=(~SPEN); // Disable SPI
	SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	SPCON|=SPEN; // Enable SPI
	
	P4_1=0; // Activate the MCP3004 ADC.
	SPIWrite(channel|0x18);	// Send start bit, single/diff* bit, D2, D1, and D0 bits.
	for(adc=0; adc<10; adc++); // Wait for S/H to setup
	SPIWrite(0x55); // Read bits 9 down to 4
	adc=((SPDAT&0x3f)*0x100);
	SPIWrite(0x55);// Read bits 3 down to 0
	P4_1=1; // Deactivate the MCP3004 ADC.
	adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	adc>>=4;
		
	return adc;
}

//         LP51B    MCP3004
//---------------------------
// MISO  -  P1.5  - pin 10
// SCK   -  P1.6  - pin 11
// MOSI  -  P1.7  - pin 9
// CE*   -  P4.1  - pin 8
// 4.8V  -  VCC   - pins 13, 14
// 0V    -  GND   - pins 7, 12
// CH0   -        - pin 1
// CH1   -        - pin 2
// CH2   -        - pin 3
// CH3   -        - pin 4

// The purpose of this function is to contain the code you
// wish to test, then to put the Testing_Code() function in
// a while(1) loop in the main function. This insures that
// the code you're testing doesn't interfere with correct code
// in the main body of the program 
void Testing_Code(void){
	wait1s();
	wait1s();
		
	
	while(1){
		Parallel_Park();
		wait1s();
		wait1s();
	}
}

void run(void){
	unsigned int right_distance = Get_Right_Distance();
	unsigned int left_distance = Get_Left_Distance();

	if(!reverse) {
		if (abs(right_distance - dist_table[dist_index]) >= dist_error[dist_index]){
			if (right_distance > dist_table[dist_index]){
				Move_Right_Motor_Forwards();
			}
			if (right_distance < dist_table[dist_index]){
				Move_Right_Motor_Backwards();
			}
		}
		else
			Stop_Car();
			
		if (abs(left_distance - dist_table[dist_index]) >= dist_error[dist_index]){
			if (left_distance > dist_table[dist_index]){
				Move_Left_Motor_Forwards();
			}
			if (left_distance < dist_table[dist_index]){
				Move_Left_Motor_Backwards();
			}
		}
		else
			Stop_Car();
	}
	else {
		if (abs(right_distance - dist_table[dist_index]) >= dist_error[dist_index]){
			if (right_distance < dist_table[dist_index]){
				Move_Right_Motor_Forwards();
			}
			if (right_distance > dist_table[dist_index]){
				Move_Right_Motor_Backwards();
			}
		}
		else
			Stop_Car();
			
		if (abs(left_distance - dist_table[dist_index]) >= dist_error[dist_index]){
			if (left_distance < dist_table[dist_index]){
				Move_Left_Motor_Forwards();
			}
			if (left_distance > dist_table[dist_index]){
				Move_Left_Motor_Backwards();
			}
		}
		else
			Stop_Car();
	}
}

void Fake_run(void) {
	Rotate_Car_180_CW();
	wait1s();
	wait1s();
	wait1s();
	Rotate_Car_180_CCW();
	wait1s();
	wait1s();
	wait1s();
}

void main (void)
{	
    const unsigned int logic_0_thresh = 10;
	unsigned char cmd = 0;
	dist_index = 1;
	reverse = 1;	
	
	printf("\n");
	//Testing_Code();
	while(1){
		
		printf("Right: %u  Left: %u Cmd: %u\n", Get_Right_Distance(), Get_Left_Distance(), cmd);
		run();

		//Check for start bit to indicate a command from transmitter
		if(Get_Right_Distance() < logic_0_thresh && Get_Left_Distance() < logic_0_thresh){
			Stop_Car();
        	cmd = rx_byte (logic_0_thresh);     	
        	if(cmd == MOVE_FURTHER) Move_Car_Further();
        	if(cmd == MOVE_CLOSER) Move_Car_Closer();
        	if(cmd == ROTATE_180) Rotate_Car_180_CW();
        	if(cmd == PRL_PARK) Parallel_Park();
        }
    }
}
