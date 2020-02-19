//////////////////////////////////
//  EUSART → LCDprogram		    //
//   TEST用ファイル                 //
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

/*　Global　function　*/
unsigned char input_buffer[24];			// 受信バッファ
unsigned int input_num = 0;					// 受信番号
unsigned int P_flag = 2;					// 表示フラグ
unsigned int cls = 0;						// 液晶消去フラグ

unsigned long int distance=0;	//近接センサー信号数
unsigned int Sec=0;				//走行時間
unsigned int Sec1=0;			//ラップタイム1
unsigned int Sec2=0;			//ラップタイム2
unsigned int Sec3=0;			//ラップタイム3
unsigned char R1=0;				//ラップ数1
unsigned char R2=0;				//ラップ数2
unsigned char R3=0;				//ラップ数3
unsigned int Voltage=0;			//電圧平均値
unsigned int Voltage2=0;
unsigned int Voltage3=0;
unsigned int Temperature=0;		//温度平均値
unsigned int Box1=0;			//時速整数部格納
unsigned int Box2=0;			//時速小数部格納
unsigned int InjectionTime=0;	//噴射時間
unsigned int Rev;				//回転数
unsigned int AF=0;				//A/F値
unsigned int AveSpeed=0; 		//平均速度

/* メッセージの定義 */
char Msg1[] = "                    ";		//速度,総走行時間
char Msg2[] = "                    ";		//平均速度,ラップ数1,ラップタイム1
char Msg3[] = "                    ";		//温度,ラップ数2,ラップタイム2
char Msg4[] = "                    ";		//電圧,ラップ数3,ラップタイム3
char Msg5[] = "         ";					//大文字　速度とA/F値
char Msg6[] = "          ";					//大文字　速度とA/F値
char Msg7[] = "      ";						//エンジン始動時　総タイム

/* 関数プロトタイピング */
void itostring(char digit, unsigned int data, char *buffer);
void isr (void);
void Display(void);
void Send_Data(void);
void pic_set(void);


/*****************************************/
/* 通常割り込み処理
/****************************************/
//ここから
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
		if(RCSTAbits.FERR==1 || RCSTAbits.OERR==1){				//フレーミングエラー又はオーバーランエラーの場合
			unsigned char i;
			RCSTAbits.CREN = 0;				//受信停止
			RCSTAbits.OERR = 0;				//エラービットをクリア
			RCSTAbits.FERR = 0 ;			//エラービットをクリア
			input_buffer[input_num] = ReadUSART();	//エラーデータを読み出す(使わない)
			input_buffer[input_num] = ReadUSART();	//エラーデータを読み出す(使わない)
			input_buffer[input_num] = 0;	//エラーデータを読み出す(使わない)
			input_num = 0;
			for(i=0; i<24; i++){
				input_buffer[i] = 0;				//バッファクリア
			}
			RCSTAbits.CREN = 1;				//受信開始
		}else{
			input_buffer[input_num++] = ReadUSART();
			
		}
	}
}


/* メイン関数 */
void main(void){

	pic_set();
	
	PIR1bits.RCIF = 0;					// 受信割込みフラグクリア
	INTCONbits.TMR0IF = 0;				// Timer0割込みフラグクリア
	T0CONbits.TMR0ON = 1;				// Timer0スタート

	lcd_init();							//LCD初期化
	lcd_clear();						//LCD消去
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

/* 液晶表示関数 */
void Display(void)
{

	if(input_buffer[1] == 0x31){
		if(cls == 0){
			lcd_clear();
			cls=1;
		}
		lcd_cmd(0x8E);	//4行目へ	
		sprintf(Msg7,"%02d:%02d'",Sec/60,Sec%60);
		lcd_str((char *)Msg7);					//表示

		lcd_cmd(0x80);					//１行目へ
		sprintf(Msg5,"%2d.%01dkm/h",Box1,Box2);	
		lcd_big_str((char *)Msg5,0x80);					//表示
	
		lcd_cmd(0xC0);									//2行目へ
		sprintf(Msg6,"%2d.%01dA/F %4d",(74 + (150*AF)/255)/10,(74 + (150*AF)/255)%10,Rev);		//A/F電圧＝5.42V	
		lcd_big_str((char *)Msg6,0x94);					//表示

	}else{
		cls=0;
		lcd_cmd(0x80);					//１行目へ
		sprintf(Msg1,"%3d.%01dkm/h     %02d:%02d'",Box1,Box2,Sec/60,Sec%60);
		lcd_str((char *)Msg1);					//表示

		lcd_cmd(0xC0);					//2行目へ
		sprintf(Msg2,"%3d.%1dkm/h  %2d>%02d:%02d'",AveSpeed/10,AveSpeed%10,R1,Sec1/60,Sec1%60);			
		lcd_str((char *)Msg2);						//表示
 
		lcd_cmd(0x94);					//3行目へ
		sprintf(Msg3," %3d%c%c     %2d>%02d:%02d'",Temperature/80,'\xDF','\x43',R2,Sec2/60,Sec2%60);
		lcd_str((char *)Msg3);					//表示
	 			
		//	Voltage2 = (26*Voltage)/1624;
		//	Voltage3 = (26*Voltage%1629)*10;
			//Voltage3 = Voltage3/1624;

		lcd_cmd(0xD4);	//4行目へ
		sprintf(Msg4," %2d.%01dV     %2d>%02d:%02d'",(26*Voltage)/1629,(26*Voltage%1629)*10/1629,R3,Sec3/60,Sec3%60);
		lcd_str((char *)Msg4);					//表示
	}
}

/* PIC設定 */
void pic_set(void)
{
	OSCCON = 0x00;		//	clock in CLKIN、FOSC依存

	/* 入出力設定 */
	TRISA = 0x00;						// PORTA全出力設定
	TRISB = 0x00;						// PORTB全出力設定
	TRISC = 0x00;						// PORTC全出力設定
	LATA = 0x00;
	LATB = 0x00;
	LATC = 0x00;
	ANSEL = 0x00;						//
	ANSELH = 0x00;						//
	
	//割込み設定
	INTCONbits.GIE = 1;			//　グローバル割込み許可
	INTCONbits.PEIE = 1;		// 周辺割込み許可
	INTCONbits.TMR0IE = 1;		// TMR0割込み許可
	PIE1bits.RCIE = 1;			// 受信割込み許可

	//Timer0設定
	T0CON = 0x04;    			// 16bitモード,PS1:32
	TMR0H = 0x6D;
	TMR0L = 0x84;				// SIMで修正	

	//usart設定
	TXSTA	= 0x24;				// 送信有効,非同期,8ビット,高速
	RCSTA	= 0x90;				// シリアルポート有効,8ビット,連続受信可
	SPBRG	= 155;				// 外部12MhzPLL 19200bps
}
