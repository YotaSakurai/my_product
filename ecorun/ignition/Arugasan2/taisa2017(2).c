/*********************************************************************
*�_�Ύ�������v���O����
*********************************************************************
//View -> Watch -> �ϐ��̒l���m�F�ł���
//Debugger -> Select Tool -> MPLAB SIM -> �v���O�����̗��ꂪ�m�F�ł���
//Debugger -> StopWatch -> ���Ԃ̊m�F���ł���
/** I N C L U D E S (�w�b�_�t�@�C��)************************************************/
#include <p18f2550.h>
#include "io_cfg.h"                          // Required
#include "delays.h"
#include "lcd_lib.h"
#include <stdio.h>
/*** Configuration *******/
#pragma config FOSC = HSPLL_HS
#pragma config WDT = OFF
#pragma config PLLDIV = 5
#pragma config CPUDIV = OSC1_PLL2
#pragma config PWRT = ON
#pragma config BOR = ON
#pragma config BORV = 2
#pragma config LVP = OFF
#pragma config VREGEN = ON
#pragma config MCLRE = OFF
#pragma config PBADEN = OFF

/** V A R I A B L E S **********************************************/
#pragma udata
unsigned int A=0;			//A���p���X��
unsigned int ZcountL=0;		//Z���p���X�Ԍv���@����8�r�b�g
unsigned int ZcountH=0;		//Z���p���X�Ԍv���@���8�r�b�g
unsigned int Zcount=0;		//Z���p���X�ԁ@16�r�b�g
unsigned char NoRev;		//��]���\���t���O
unsigned int Rev=0;			//��]��1
unsigned int Rev1=0;	
unsigned int revav0=0;		//��]��2 
unsigned int revav1=0;		//��]��3
unsigned int Ave=0;			//�R�_���ω�]��
unsigned int timer1;		//CCPR1�m�F�p
unsigned int timing;		//�_�Ύ����v�Z
unsigned int i =0;
unsigned int ignition =0;
unsigned int injection =0;
char Msg1[] = "        ";	//�J���p�x�\���p
//char Msg1[] = "        ";	//
char Msg2[] = "        ";	//��]���\���p
char Msg3[] = "        ";	//�_�Ή񐔕\���p
char Msg4[] = "        ";	//���ˉ񐔕\���p
unsigned int doel=615;		//�ǃG���p�@�i615�\��90�x�j
unsigned int doel2=615;		//�ǃG���p2�@�i615�\��90�x�j

/** P R I V A T E  P R O T O T Y P E S ******************************/
void Display(void);
void ltostring(char digit, unsigned long data, char *buffer);
unsigned int AD_input(char chanl);
void high_isr (void);
void low_isr (void);

///�D�抄���ݏ���
#pragma code high_vector=0x8
void high_interrupt(void)
{
	_asm
		GOTO high_isr
	_endasm
}
#pragma code
//��������
#pragma interrupt high_isr
void high_isr (void)
{
	if(INTCON3bits.INT2IF == 1){		//���荞�݃t���O(Z��)
		INTCON3bits.INT2IF = 0;			//���荞�݃t���O�N���A
		A = 0;							//A���̃J�E���g�N���A�i�㎀�_���Z�b�g�j
	  	if(T0CONbits.TMR0ON ==0 ){		//TMR0�@����m�F		
				TMR0H=0;				//0�ݒ�
				TMR0L=0;				//0�ݒ�
			T0CONbits.TMR0ON = 1;		//TMR0�@���삳����
		}
		else
		{
			ZcountL = TMR0L;			//����8�r�b�g
			ZcountH = TMR0H;			//���8�r�b�g	
			TMR0H=0;					//���8�r�b�g0�ݒ�
			TMR0L=0;					//����8�r�b�g0�ݒ�
			NoRev = 0;		
		}
			TMR1H = 0;					//���8�r�b�g0�ݒ�
			TMR1L = 0;					//����8�r�b�g0�ݒ�
	}

	if(PIR1bits.CCP1IF == 1){			//CCPR1���荞�݃t���O
		PIR1bits.CCP1IF = 0;			//CCPR1���荞�݃t���O�N���A
		if(PORTCbits.RC1 == 1){			//�G���W���X�^�[�g
			LATAbits.LATA2 = 1;			//�R�C���ʓd
		ignition++;
		}
	}
	
	if(PIR2bits.CCP2IF == 1){			//CCPR2���荞�݃t���O
		CCPR1=doel2;
		PIR2bits.CCP2IF = 0;			//CCPR2���荞�݃t���O�N���A
		LATAbits.LATA2 = 0;				//�R�C���ʓdOFF(�_��)
		
	}
}
///�ʏ튄�荞�ݏ���
#pragma code low_vector=0x18
void low_interrupt(void)
{
	_asm
		GOTO low_isr
	_endasm
}
#pragma code
//��������
#pragma interruptlow low_isr
void low_isr (void)
{	
	if(INTCON3bits.INT1IF == 1){		//INT1(B��)���荞�� 
		INTCON3bits.INT1IF = 0;			//INT1���荞�݃N���A
		if(PORTBbits.RB0 == 1){			//A���o�͏�Ԋm�F
			A--;						//�J�E���g�l�|�i�t�]�j
		}
		else{
			A++;						//�J�E���g�l+(���])
		}
		if(A>719){						//A����719�J�E���g�ȏ�Ȃ�
			A=719;						//A����719
		}
	}
   	else if(INTCONbits.TMR0IF == 1){	//TMR0�I�[�o�[�t���[
		INTCONbits.TMR0IF = 0;			//TMR0�I�[�o�[�t���[�N���A
		T0CONbits.TMR0ON = 0;			//TMR0�����~
		TMR0H=0;						//0�ݒ�
		TMR0L=0;						//0�ݒ�
		NoRev = 1;						//�G���W����~��
		Rev = 0;						//��]��0
		Ave = 0;						//���ω�]��0
	}	
}
///�e��ݒ�
void main(void)
{
//	ADCON0 = 0x01;			//AD On	
//	ADCON1 = 0x0A;      	//RA0,RA1,RA2,RA3,RA4�A�i���O�ɐݒ�
//	ADCON2 = 0x97;			//Right,4Tad,Tcy/64 0x96
	CMCON = 0x07;			//�R���p���[�^�I�t
 	LATA = 0;				//�����o��
   	LATB = 0;				//�t���\���|�[�g���Z�b�g
  	LATC = 0;				//LED Off
 	TRISA = 0x00;			//A�|�[�g����U�� 0x30
	TRISB = 0x07;			//B�|�[�g����U��i�t���\���j
 	TRISC = 0x03;			//C�|�[�g����U��iLED, USART�j0x33
	RCONbits.IPEN = 1;		//���荞�ݗD��̗L����
	INTCON=0xE0;			//INTCON�ݒ�
	INTCON2=0x80;			//INTCO2N�ݒ�
	INTCON3=0x98;			//INTCON3�ݒ�
	T0CON=0x06;				//TIMER0�ݒ�	(Zcount)
	TMR0H=0;				//
	TMR0L=0;				//
	T1CON=0x83;				//T1CON�ݒ�(BA) 16bit 1:1 �O���@�g��
	IPR1bits.CCP1IP = 1;	//
	IPR2bits.CCP2IP = 1;	//
	PIE1bits.CCP1IE = 1;	//
	PIE2bits.CCP2IE = 1;	//
	CCP1CON=0x0A;			//�R���y�A���[�h�i��v�Ŋ��荞�݁j
	CCP2CON=0x0A;			//�V
//	CCPR1=0x134;
//	CCPR2=0x161;
//	CCPR2=705;				//719 - �_�΂��������p�x(BTDC)�@����BTDC14��
	CCPR2=705;
  	T3CON=0x00;				//T3CON�ݒ�i��CCP�Ƃ��^�C�}1�j
	lcd_init();				//LCD������
	lcd_clear();			//�t������
//	opening();				//�I�[�v�j���O
/// ���C�����[�v
    while(1)
    {
//	    if(PORTAbits.RA3 == 0){
					/*�J����720�p���X0.5���̂Ƃ��N�����N����1���̐��x
					ABDC = (CCPR1 / 2) - 180
					BTDC = (720 - CCPR2) / 2
	   				*/

/**********************************�i�p*************************************/
		   	if((Rev1 >= 250) && (Rev1 < 2250)){
												
				CCPR2=711;							//BTDC8.0��		//2000rpm
			}else if((Rev1 >= 2250) && (Rev1 < 2750)){
												
				CCPR2=710;							//BTDC9.0��		//2500rpm
			}else if((Rev1 >= 2750) && (Rev1 < 3250)){
												
				CCPR2=709;							//BTDC10.0��		//3000rpm
			}else if((Rev1 >= 3250) && (Rev1 < 4000)){
												
				CCPR2=706;							//BTDC14.0��		//3500rpm
			}else if((Rev1 >= 4000) && (Rev1 < 5750)){
												
				CCPR2=705;							//BTDC14.0��		//4000rpm
			}else{									////Rev < 250 �܂���5750 < Rev�@�̂Ƃ�
				LATAbits.LATA2 = 0;					//�R�C���M��OFF
			}

//			CCPR1=0x134;
//			CCPR2=0x161;

		LATAbits.LATA0 = !PORTBbits.RB2;		//�㎀�_�����p		////Z��
//		if(timer1 > 0x15B || timer1 < 0x5A ){							//�J���ł̊p�x��347.4��(�M��������)								
		if(timer1 > 670 || timer1 <180 ){	
			LATAbits.LATA1 = 1;					//BTDC20�� �R������
		}
		else{
			LATAbits.LATA1 = 0;
			injection++;
		}	
			Zcount = ZcountL;					//����8�r�b�g
			Zcount += (unsigned int)ZcountH<<8;	//8�r�b�g�V�t�g������
		if(NoRev == 0){							//NoRev =0�Ȃ�i�G���W�����쒆�j
			Rev = 11250000/Zcount;				//��]���v�Z
			Rev = Rev/10;						//10�Ŋ��邱�Ƃňꌅ�ڂ�؂�̂Ă�
			Rev = Rev*10;						//10�{���Č����J��グ��
			Rev1 = Rev;							//1��O�̉�]��
			doel=(unsigned int)704-(337500/Zcount);
			doel2=doel;

//			revav1 = revav0;					//�Q��ډ�]���l�ۑ�
//			revav0 = Rev;						//�P��ډ�]���l�ۑ�
//			Ave = (Rev + revav0 + revav1) / 3;	//�R�_���ς��v�Z
		}
		if(NoRev ==1){							//NoRev =0�Ȃ�(�G���W����~��)
			LATAbits.LATA2 = 0;					//�R�C���ʓdOFF
			Rev = 0;
			doel=704;
			doel2=doel;
		}
			timer1 = TMR1L;						//
			timer1 += TMR1H*256; 				//
				i++;
				if(i == 800){ 
				Display();
				i = 0;
			}
												//�X�V	  
	}
}
///A/D�ϊ��ǂݍ��݊֐�
unsigned int AD_input(char chanl)
{
    	unsigned int adData;        	// 10�r�b�g���[�h
    	
	ADCON0 = 0x01 + (chanl * 4);
    	ADCON0bits.GO = 1;             	// Start AD conversion
    	while(ADCON0bits.NOT_DONE);    	// Wait for conversion
 	adData = ADRESH * 256 + ADRESL;
	return(adData);                   	// �f�[�^�Ԃ�
}

/// ���l���當����ɕϊ�
void ltostring(char digit, unsigned long data, char *buffer)
{
	char i;
	buffer += digit;					// ������̍Ō�
	for(i=digit; i>0; i--) {			// �ŉ��ʌ������ʂ�
		buffer--;						// �|�C���^�[�P
			*buffer = (data % 10) + '0';// ���̌����l�𕶎��ɂ��Ċi�[
			data = data / 10;			// ��-1

	}
				
}
/// �f�[�^�\���֐�
void Display(void) 
{
	lcd_cmd(0x80);							//�P�s�ڂ�
	sprintf(Msg1,"%3d.%2d",(5*A)/10,(5*A)%10);		////�����񏑎����o�͊֐�
	lcd_str((char *)Msg1);					//1�s�ڕ\��

	lcd_cmd(0x88);							//�P�s�ڂ�
	sprintf(Msg3,"%d",ignition);		////�����񏑎����o�͊֐�
	lcd_str((char *)Msg3);					//1�s�ڕ\��
 
 	lcd_cmd(0xC0);							//2�s�ڂ�					359.5
	sprintf(Msg2,"%4drpm",Rev);
   	lcd_str((char *)Msg2);					//�Q�s�ڕ\��

 	/*lcd_cmd(0xC8);							//2�s�ڂ�					359.5
	sprintf(Msg4,"%d",injection);
   	lcd_str((char *)Msg4);*/
}
