//////////////////////////////////
//  EUSART �� LCDprogram		    //
//   TEST�p�t�@�C��                 //
//////////////////////////////////
#include <p18cxxx.h>
#include "io_cfg.h"
#include "lcd_lib.h"
#include <delays.h>
#include <usart.h>
#include <stdio.h>
#include <math.h>

/** Configuration  ****************************/
#pragma config CPUDIV=NOCLKDIV	//CPU System Clock Selection bit
#pragma config USBDIV = OFF		//USB Clock Selection bit
#pragma config FOSC =  HS		//Oscillator Selection bits
#pragma config PLLEN = ON		//X PLL Enable bit
#pragma config PCLKEN = OFF		//Primary Clock Enable Bit
#pragma config FCMEN = OFF
#pragma config IESO = OFF      //Internal/External Oscillator Switchover bit
#pragma config PWRTEN = ON,BOREN = ON,BORV = 27
#pragma config WDTEN = OFF,WDTPS = 1
#pragma config MCLRE = OFF     //MCLR Pin Enable bit
#pragma config HFOFST = OFF,STVREN = OFF,LVP = OFF,BBSIZ = OFF,XINST = OFF
#pragma config CP0 = OFF,CP1 = OFF,CPB = OFF,CPD = OFF
#pragma config WRT0 = OFF,WRT1 = OFF,WRTB = OFF,WRTC = OFF,WRTD = OFF
#pragma config EBTR0 = OFF,EBTR1 = OFF,EBTRB = OFF

/*�@Global�@function�@*/
unsigned char input_buffer[24];			// ��M�o�b�t�@
unsigned int input_num = 0;					// ��M�ԍ�
unsigned int P_flag = 2;					// �\���t���O
unsigned int cls = 0;						// �t�������t���O

unsigned long int distance=0;	//�ߐڃZ���T�[�M����
unsigned int Sec=0;				//���s����
unsigned int Sec1=0;			//���b�v�^�C��1
unsigned int Sec2=0;			//���b�v�^�C��2
unsigned int Sec3=0;			//���b�v�^�C��3
unsigned char R1=0;				//���b�v��1
unsigned char R2=0;				//���b�v��2
unsigned char R3=0;				//���b�v��3
unsigned int Voltage=0;			//�d�����ϒl
unsigned int Voltage2=0;
unsigned int Voltage3=0;
unsigned int Temperature=0;		//���x���ϒl
unsigned int Box1=0;			//�����������i�[
unsigned int Box2=0;			//�����������i�[
unsigned int InjectionTime=0;	//���ˎ���
unsigned int Rev;				//��]��
unsigned int AF=0;				//A/F�l
unsigned int AveSpeed=0; 		//���ϑ��x

/* ���b�Z�[�W�̒�` */
char Msg1[] = "                    ";		//���x,�����s����
char Msg2[] = "                    ";		//���ϑ��x,���b�v��1,���b�v�^�C��1
char Msg3[] = "                    ";		//���x,���b�v��2,���b�v�^�C��2
char Msg4[] = "                    ";		//�d��,���b�v��3,���b�v�^�C��3
char Msg5[] = "         ";					//�啶���@���x��A/F�l
char Msg6[] = "          ";					//�啶���@���x��A/F�l
char Msg7[] = "      ";						//�G���W���n�����@���^�C��

/* �֐��v���g�^�C�s���O */
void itostring(char digit, unsigned int data, char *buffer);
void isr (void);
void Display(void);
void Send_Data(void);
void pic_set(void);


/*****************************************/
/* �ʏ튄�荞�ݏ���
/****************************************/
//��������
#pragma code compatible_vector=0x8
void compatible_interrupt (void) {
	_asm
		GOTO isr
	_endasm
}
#pragma code

#pragma interruptlow isr
void isr (void) 
{
	unsigned int i = 0;

	if(INTCONbits.TMR0IF == 1){
		INTCONbits.TMR0IF = 0;
		// 32Mhz 0.1s
		TMR0H = 0x6D;
		TMR0L = 0x84;
		P_flag++;
	}
	else if(PIR1bits.RCIF == 1){
		if(RCSTAbits.FERR==1 || RCSTAbits.OERR==1){				//�t���[�~���O�G���[���̓I�[�o�[�����G���[�̏ꍇ
			unsigned char i;
			RCSTAbits.CREN = 0;				//��M��~
			RCSTAbits.OERR = 0;				//�G���[�r�b�g���N���A
			RCSTAbits.FERR = 0 ;			//�G���[�r�b�g���N���A
			input_buffer[input_num] = ReadUSART();	//�G���[�f�[�^��ǂݏo��(�g��Ȃ�)
			input_buffer[input_num] = ReadUSART();	//�G���[�f�[�^��ǂݏo��(�g��Ȃ�)
			input_buffer[input_num] = 0;	//�G���[�f�[�^��ǂݏo��(�g��Ȃ�)
			input_num = 0;
			for(i=0; i<24; i++){
				input_buffer[i] = 0;				//�o�b�t�@�N���A
			}
			RCSTAbits.CREN = 1;				//��M�J�n
		}else{
			input_buffer[input_num++] = ReadUSART();
			
		}
	}
}


/* ���C���֐� */
void main(void){

	pic_set();
	
	PIR1bits.RCIF = 0;					// ��M�����݃t���O�N���A
	INTCONbits.TMR0IF = 0;				// Timer0�����݃t���O�N���A
	T0CONbits.TMR0ON = 1;				// Timer0�X�^�[�g

	lcd_init();							//LCD������
	lcd_clear();						//LCD����
	opening();

	while(1){
		if(input_buffer[0] == 0x53){
			Sec = input_buffer[2]*256 + input_buffer[3];
			Sec1 = input_buffer[4]*256 + input_buffer[5];
			Sec2 = input_buffer[6]*256 + input_buffer[7];
			Sec3 = input_buffer[8]*256 + input_buffer[9];
			R1 = input_buffer[10];
			R2 = input_buffer[11];
			R3 = input_buffer[12];
			Voltage = input_buffer[13]*256 + input_buffer[14];
			Temperature = input_buffer[15]*256 + input_buffer[16];
			AF = input_buffer[17];
			Box1 = input_buffer[18];
			Box2 = input_buffer[19];
			AveSpeed = input_buffer[20]*256 + input_buffer[21];
			Rev = input_buffer[22]*256 + input_buffer[23];

			if(P_flag >= 2){
				Display();
				P_flag = 0;
			}
			
			if(input_num >= 24){
				input_num = 0;
			}
		}else{
			while(!(input_buffer[0] == 0x53)){
				input_num = 0;
			}
		}
	}
}

/* �t���\���֐� */
void Display(void)
{

	if(input_buffer[1] == 0x31){
		if(cls == 0){
			lcd_clear();
			cls=1;
		}
		lcd_cmd(0x8E);	//4�s�ڂ�	
		sprintf(Msg7,"%02d:%02d'",Sec/60,Sec%60);
		lcd_str((char *)Msg7);					//�\��

		lcd_cmd(0x80);					//�P�s�ڂ�
		sprintf(Msg5,"%2d.%01dkm/h",Box1,Box2);	
		lcd_big_str((char *)Msg5,0x80);					//�\��
	
		lcd_cmd(0xC0);									//2�s�ڂ�
		sprintf(Msg6,"%2d.%01dA/F %4d",(74 + (150*AF)/255)/10,(74 + (150*AF)/255)%10,Rev);		//A/F�d����5.42V	
		lcd_big_str((char *)Msg6,0x94);					//�\��

	}else{
		cls=0;
		lcd_cmd(0x80);					//�P�s�ڂ�
		sprintf(Msg1,"%3d.%01dkm/h     %02d:%02d'",Box1,Box2,Sec/60,Sec%60);
		lcd_str((char *)Msg1);					//�\��

		lcd_cmd(0xC0);					//2�s�ڂ�
		sprintf(Msg2,"%3d.%1dkm/h  %2d>%02d:%02d'",AveSpeed/10,AveSpeed%10,R1,Sec1/60,Sec1%60);			
		lcd_str((char *)Msg2);						//�\��
 
		lcd_cmd(0x94);					//3�s�ڂ�
		sprintf(Msg3," %3d%c%c     %2d>%02d:%02d'",Temperature/80,'\xDF','\x43',R2,Sec2/60,Sec2%60);
		lcd_str((char *)Msg3);					//�\��
	 			
		//	Voltage2 = (26*Voltage)/1624;
		//	Voltage3 = (26*Voltage%1629)*10;
			//Voltage3 = Voltage3/1624;

		lcd_cmd(0xD4);	//4�s�ڂ�
		sprintf(Msg4," %2d.%01dV     %2d>%02d:%02d'",(26*Voltage)/1629,(26*Voltage%1629)*10/1629,R3,Sec3/60,Sec3%60);
		lcd_str((char *)Msg4);					//�\��
	}
}

/* PIC�ݒ� */
void pic_set(void)
{
	OSCCON = 0x00;		//	clock in CLKIN�AFOSC�ˑ�

	/* ���o�͐ݒ� */
	TRISA = 0x00;						// PORTA�S�o�͐ݒ�
	TRISB = 0x00;						// PORTB�S�o�͐ݒ�
	TRISC = 0x00;						// PORTC�S�o�͐ݒ�
	LATA = 0x00;
	LATB = 0x00;
	LATC = 0x00;
	ANSEL = 0x00;						//
	ANSELH = 0x00;						//
	
	//�����ݐݒ�
	INTCONbits.GIE = 1;			//�@�O���[�o�������݋���
	INTCONbits.PEIE = 1;		// ���ӊ����݋���
	INTCONbits.TMR0IE = 1;		// TMR0�����݋���
	PIE1bits.RCIE = 1;			// ��M�����݋���

	//Timer0�ݒ�
	T0CON = 0x04;    			// 16bit���[�h,PS1:32
	TMR0H = 0x6D;
	TMR0L = 0x84;				// SIM�ŏC��	

	//usart�ݒ�
	TXSTA	= 0x24;				// ���M�L��,�񓯊�,8�r�b�g,����
	RCSTA	= 0x90;				// �V���A���|�[�g�L��,8�r�b�g,�A����M��
	SPBRG	= 155;				// �O��12MhzPLL 19200bps
}
