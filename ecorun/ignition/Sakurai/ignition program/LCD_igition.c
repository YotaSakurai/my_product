//////////////////////////////////
//  �G���W���ԑ̃V���A��LCD 			 //
//  2013/03/26                  //
//////////////////////////////////

/** Includes ***********************************/
#include <p18cxxx.h>
#include <delays.h>
#include <usart.h>
#include <stdio.h>
#include <math.h>

/** Configuration  ****************************/
#pragma config CPUDIV=NOCLKDIV //CPU System Clock Selection bit
#pragma config USBDIV = OFF    //USB Clock Selection bit
#pragma config FOSC =  IRC  //Oscillator Selection bits
#pragma config PLLEN = ON      //X PLL Enable bit
#pragma config PCLKEN = OFF    //Primary Clock Enable Bit
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
unsigned long int distance=0;	//�ߐڃZ���T�[�M����
unsigned int Sec=0;				//���s����
unsigned int Sec1=0;			//���b�v�^�C��1
unsigned int Sec2=0;			//���b�v�^�C��2
unsigned int Sec3=0;			//���b�v�^�C��3
unsigned char R1=0;				//���b�v��1
unsigned char R2=0;				//���b�v��2
unsigned char R3=0;				//���b�v��3
unsigned int Box=0;				//�O���ԋL���̈�(sec)
unsigned int count=0;			//0.1s�i�[�p			
unsigned int VoltC=0;			//�d��AD�ϊ���
unsigned int Voltage=0;			//�d��AD�l�i�[
unsigned int Voltage2=0;		//�d�����ϒl
unsigned int TempC=0;			//���xAD�ϊ���
unsigned int Temperature=0;		//���xAD�l�i�[
unsigned int CorrectionTemp=0;	//���x�덷�C���p
unsigned int Temperature2=0;	//���x���ϒl
unsigned int AF=0;				//A/F�l
unsigned int speed=0;			//����[km/h]
unsigned int BoxH=0;			//�����������i�[
unsigned int BoxL=0;			//�����������i�[
unsigned int BoxSum=0;			//�����v�Z��
unsigned int Box1=0;			//�O�X�����i�[
int Box2=0;						//�O�����i�[
int Box3=0;						//�����i�[
unsigned int AveSpeed=0; 		//���ϑ��x
unsigned int InjectionTime=0;	//���ˎ���
unsigned int Rev;				//��]��
unsigned int NoRev= 1;			//��]���\���t���O 0:��]���v�Z 1:�v�Z���Ȃ�
unsigned int TMRON=0;			//�ԑ��M���t���O�@1:TMR3�X�^�[�g
unsigned int swlong=30;		//�\��Reset�듮��h�~�J�E���g(3s)
unsigned int output_buffer[26];		// ���M�o�b�t�@
unsigned int output_num = 0;				// ���M�ԍ�
unsigned int Send_flag = 0;					// �\���t���O
unsigned int Main_flag =0;					// ���C���X�C�b�`�t���O

/* �֐��v���g�^�C�s���O */
void isr (void);
void pic_set(void);
void Send_Data_Set(void);
void Send_Data(void);
unsigned int AD_input(char chanl);

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
	if(INTCONbits.INT0IF == 1){
		INTCONbits.INT0IF = 0;
			swlong=30;
 	  if(Sec-Box >0){					//�{�^���̉����~�X��h��
			Sec3=Sec2;						//�l�s�ڂ�Sec
			Sec2=Sec1;						//�O�s�ڂ�Sec
			Sec1=Sec-Box;					//��s�ڂ�Sec
			Box=Sec;						//Box�ɑO��Sec��ۊ�
			R3=R2;							//���b�v3
			R1++;							//���b�v1
			R2=R1-1;						//���b�v2
		}
	}
	else if(INTCON3bits.INT1IF == 1){				//The INT1 external interrupt occurred 
	 		INTCON3bits.INT1IF = 0;					//The INT1 external interrupt occurred �N���A
			TMRON=1;					
		if(T1CONbits.TMR1ON==0){					//TMR0 Overflow Interrupt Flag 0�Ȃ�
				TMR1H=0;							//0�ݒ�
				TMR1L=0;
			T1CONbits.TMR1ON=1;						//TMR0 Overflow Interrupt Flag =1
			
		}
		else
		{
			speed = TMR1L;		�@	///����8�r�b�g
			speed += TMR1H*256;�@	///���8�r�b�g	256��2��8��@���v16�r�b�g���[�h
		} 
		TMR1H=0;							//0�ݒ�
		TMR1L=0;
		distance++;
	}
	else if(PIR1bits.TMR1IF ==1){					//TMR Overflow Interrupt Flag 
		PIR1bits.TMR1IF = 0;					//TMR Overflow Interrupt Flag �N���A
		T1CONbits.TMR1ON=0;						//�^�C�}�[�g�p���Ȃ�
		TMR1H=0;								//0�ݒ�
		TMR1L=0;								//0�ݒ�
		speed=0;
		Box1=0;
		Box2=0;
		Box3=0;
		InjectionTime=0;
	}
	else if(INTCON3bits.INT2IF == 1){				//The INT2 external interrupt occurred
		INTCON3bits.INT2IF = 0;						//The INT2 external interrupt occurred �N���A

		if(T0CONbits.TMR0ON==0){					//TMR0 Overflow Interrupt Flag 0�Ȃ�
		TMR0H=0;							//0�ݒ�
		TMR0L=0;							//0�ݒ�
			T0CONbits.TMR0ON=1;						//TMR0 Overflow Interrupt Flag =1
		}
		else
		{
			InjectionTime = TMR0L;		�@	///����8�r�b�g
			InjectionTime += TMR0H*256;�@	///���8�r�b�g	256��2��8��@���v16�r�b�g���[�h
		}
		TMR0H=0;							//0�ݒ�
		TMR0L=0;							//0�ݒ�
		NoRev = 0;							//��]���\��
	}		

	else if(INTCONbits.TMR0IF ==1){				//TMR0 Overflow Interrupt Flag 
		INTCONbits.TMR0IF = 0;					//TMR0 Overflow Interrupt Flag �N���A
		T0CONbits.TMR0ON=0;						//�^�C�}�[0�g�p���Ȃ�
		TMR0H=0;								//0�ݒ�
		TMR0L=0;								//0�ݒ�
		NoRev = 1;							//��]���\�����Ȃ�
		InjectionTime=0;
		Rev = 0;								//0�ݒ�
	}

	else if(PIR2bits.TMR3IF == 1){		//�I�[�o�[�t���[(0.1�b) 		
//     �i�g�p���Ă���Hz�i�����1.308MHz�j�~�ړI�̎���(�����0.1�b)�j���v���X�P�[���̒l�@65536(2^16-1)-65400(�v�Z�l)=135(10)�@->�@TMR3L=0x88
		PIR2bits.TMR3IF = 0;			//�I�[�o�[�t���[�N���A
		count++;				//+0.1�b
		Send_flag++;
		if(swlong > 0){
			swlong--;
		}
		else{
	
			if(PORTCbits.RC0 == 1){
				TMRON=0;
				Box=0;
				Sec=0;
				Sec1=0;
				Sec2=0;
				Sec3=0;	
				R1=0;							
				R2=0;							
				R3=0;
				Temperature2=0;						
				Voltage2=0;
				speed=0;
				Rev=0;
				InjectionTime=0;
				AveSpeed = 0;
				distance = 0;
				
			}	
		}
		TMR3H=0x00;
		TMR3L=0x88;
	}
}

/* ���C���֐� */
void main(void){

	pic_set();

	PIR2bits.TMR3IF = 0;				// Timer3�����݃t���O�N���A
	T3CONbits.TMR3ON = 1;				// Timer3�X�^�[�g
    while(1)
    {
		if(TMRON == 1){
       		if(count > 9){				//
				Sec++;					//+1�b�J�E���g
				count=0;	
			}
		}

		while( VoltC < 10){
			 VoltC++;
			 Voltage += AD_input(3);		//0.1�b�ɍX�V�����AD�̓��͒l��Voltage�ɑ���
		}

		VoltC = 0;
		Voltage2 = Voltage  /10;			//1�b�Ԃ̕��ς����߂�
		Voltage  =0;
		
		while(TempC < 10){
			TempC++;
			Temperature += AD_input(7);
		}
		
		TempC = 0;
		Temperature2 = Temperature/10;
		Temperature2 = Temperature2*10;
		Temperature =0;
			
		AF = AD_input(10);		//0.1�b�ɍX�V�����A/F�̓��͒l�𑫂�
		AF = AF>>2;

		if(speed > 800){
			//20�C���`�̃^�C���@10��]�A���]1.548���[�g��
			Box1 = Box2;
			Box2 = Box3;
			Box3 = (455580/speed);
			if((fabs(Box3 - Box2)> 15)& (BoxH > 10) & (Rev != 0))
				Box3 = (Box3 + Box2 + Box1)/3;
			if((Rev == 0) & (fabs(Box3 - Box2)> 10))
				Box3 = (Box3 + Box2 + Box1)/3;
		}
		else{
			Box1=0;
			Box2=0;
			Box3=0;
		}	

		if(NoRev == 0){							//NoRev =0�Ȃ�
			//Rev = 30000000/InjectionTime;		//��]���v�Z
			Rev = 7500000/InjectionTime;		//��]���v�Z


			Rev = Rev/10;						//10�{���Č����J��グ��
			Rev = Rev*10;						//10�Ŋ��邱�Ƃňꌅ�ڂ�؂�̂Ă�
		}
		else{
			Rev = 0;			//��]����0�\��
		}
			
		if(Temperature2%2 == 0){				//�]�肪0�Ȃ�Temperature2/2���v�Z�@�\�������₷�����邽��
			Temperature = Temperature/10;
		}
		if(distance != 0){
			AveSpeed = (distance * 1548 /20)/Sec;		//���ϑ��x�imm/s)
			AveSpeed =(unsigned long)AveSpeed * 36 /1000;
		}else{
			AveSpeed = 0;
		}


		Main_flag = PORTCbits.RC4;
	
		if(Main_flag == 1){
			output_buffer[1] = '1';
		}else{
			output_buffer[1] = '0';
		}
		if(Send_flag >= 2){
			Send_Data_Set();
			output_num = 24;
			Send_Data();
			Send_flag = 0;
		}
	}
}

/* PIC�ݒ� */
void pic_set(void)
{
	OSCCON = 0x62;	//  �����N���b�N8Mhz

	/* ���o�͐ݒ� */
	TRISA = 0x10;						// PORTA�o�͐ݒ� RA4input
	TRISB = 0x10;						// PORTB�o�͐ݒ� RB4input
	TRISC = 0x1F;						// PORTC�o�͐ݒ� RC0~4input
	LATA = 0x00;
	LATB = 0x00;
	LATC = 0x00;
	ANSEL = 0x88;						// AN3,7 ANALOG
	ANSELH = 0x04;						// AN10 ANALOG
	
	//�����ݐݒ�
	INTCON = 0xD0;			//�@�O���[�o�������݋��E���ӊ����݋��EINT0�����݋���
	INTCON2 = 0xC0;			// �|�[�gB�v���A�b�v�����EINT0�����オ��EINT1,2��������
	INTCON3 = 0x18;			// INT1�E3�����݋���
	PIE1bits.TMR1IE = 1;	// Timer1�����݋���
	PIE2bits.TMR3IE = 1;	// Timer3�����݋���
	
	//Timer0�ݒ�
	T0CON = 0x04;    // 16bit���[�h,�v���X�P�[��1:32,�������U
	TMR0H = 0x00;
	TMR0L = 0x00;
	
	//Timer1�ݒ�
	T1CON=0xBA;							//16bit���[�h,PS1:4,�O�����U
	TMR1H=0x00;							//
	TMR1L=0x00;							//

	//Timer3�ݒ�
	T3CON=0x9E;							//TIMER3�ݒ�(0.1�b�쐬)
	TMR3H=0x00;							//
	TMR3L=0x88;							//

	//usart�ݒ�
	TXSTA	= 0x24;					//���M�L��,�񓯊�,8�r�b�g,����
	RCSTA	= 0x90;					//�V���A���|�[�g�L��,8�r�b�g,�A����M��
	SPBRG	= 25;					//19200bps

	//ADConverter�ݒ�
	ADCON0 = 0x01;						// ADCON
	ADCON1 = 0x00;						// ADC�����d��
	ADCON2 = 0xAA;						// Right Shift,12TAD,FOSC/16
	
}

void Send_Data_Set(void)
{
	BoxSum = (Box1 + Box2 + Box3)/3;
	BoxH = BoxSum/10;		//20�C���`�̃^�C���@10��]�A���]1.548���[�g��
	BoxL = BoxSum%10;
	

	output_buffer[0] = 'S';		//0x53
	output_buffer[2] = Sec>>8;
	output_buffer[3] = Sec;
	output_buffer[4] = Sec1>>8;
	output_buffer[5] = Sec1;
	output_buffer[6] = Sec2>>8;
	output_buffer[7] = Sec2;
	output_buffer[8] = Sec3>>8;
	output_buffer[9] = Sec3;
	output_buffer[10] =	R1;
	output_buffer[11] = R2;
	output_buffer[12] = R3; 
	output_buffer[13] = Voltage2>>8;
	output_buffer[14] = Voltage2;
	output_buffer[15] = Temperature2>>8;
	output_buffer[16] = Temperature2;
	output_buffer[17] = AF;
	output_buffer[18] = BoxH;
	output_buffer[19] = BoxL;
	output_buffer[20] = AveSpeed>>8;
	output_buffer[21] = AveSpeed;
	output_buffer[22] = Rev>>8;
	output_buffer[23] = Rev;
}

void Send_Data(void)
{
	int i;
	
	for(i=0;i<output_num;i++){
		if(BusyUSART()==0){
			WriteUSART(output_buffer[i]);
			Delay100TCYx(80);
		}
	}
	for(i=0;i<output_num;i++){
		output_buffer[i] = 0;
	}
}

//////// A/D�ϊ��ǂݍ��݊֐�
unsigned int AD_input(char chanl)
{
    	unsigned int adData;        		// 10�r�b�g���[�h
    	
	ADCON0 = 0x01 + (chanl * 4);
    	ADCON0bits.GO = 1;              	// Start AD conversion
    	while(ADCON0bits.NOT_DONE);     	// Wait for conversion
 	adData = ADRESH*256 + ADRESL;
	return(adData);                    	// �f�[�^�Ԃ�
}
