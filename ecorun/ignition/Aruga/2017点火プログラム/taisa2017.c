/*********************************************************************
*点火時期制御プログラム
*********************************************************************
//View -> Watch -> 変数の値が確認できる
//Debugger -> Select Tool -> MPLAB SIM -> プログラムの流れが確認できる
//Debugger -> StopWatch -> 時間の確認ができる
/** I N C L U D E S (ヘッダファイル)************************************************/
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
unsigned int A=0;			//A相パルス数
unsigned int ZcountL=0;		//Z相パルス間計測　下位8ビット
unsigned int ZcountH=0;		//Z相パルス間計測　上位8ビット
unsigned int Zcount=0;		//Z相パルス間　16ビット
unsigned char NoRev;		//回転数表示フラグ
unsigned int Rev=0;			//回転数1
unsigned int Rev1=0;	
unsigned int revav0=0;		//回転数2 
unsigned int revav1=0;		//回転数3
unsigned int Ave=0;			//３点平均回転数
unsigned int timer1;		//CCPR1確認用
unsigned int timing;		//点火時期計算
unsigned int i =0;
unsigned int ignition =0;
unsigned int injection =0;
char Msg1[] = "        ";	//カム角度表示用
//char Msg1[] = "        ";	//
char Msg2[] = "        ";	//回転数表示用
char Msg3[] = "        ";	//点火回数表示用
char Msg4[] = "        ";	//噴射回数表示用
unsigned int doel=615;		//どエロ角　（615―＞90度）
unsigned int doel2=615;		//どエロ角2　（615―＞90度）

/** P R I V A T E  P R O T O T Y P E S ******************************/
void Display(void);
void ltostring(char digit, unsigned long data, char *buffer);
unsigned int AD_input(char chanl);
void high_isr (void);
void low_isr (void);

///優先割込み処理
#pragma code high_vector=0x8
void high_interrupt(void)
{
	_asm
		GOTO high_isr
	_endasm
}
#pragma code
//ここから
#pragma interrupt high_isr
void high_isr (void)
{
	if(INTCON3bits.INT2IF == 1){		//割り込みフラグ(Z相)
		INTCON3bits.INT2IF = 0;			//割り込みフラグクリア
		A = 0;							//A相のカウントクリア（上死点リセット）
	  	if(T0CONbits.TMR0ON ==0 ){		//TMR0　動作確認		
				TMR0H=0;				//0設定
				TMR0L=0;				//0設定
			T0CONbits.TMR0ON = 1;		//TMR0　動作させる
		}
		else
		{
			ZcountL = TMR0L;			//下位8ビット
			ZcountH = TMR0H;			//上位8ビット	
			TMR0H=0;					//上位8ビット0設定
			TMR0L=0;					//下位8ビット0設定
			NoRev = 0;		
		}
			TMR1H = 0;					//上位8ビット0設定
			TMR1L = 0;					//下位8ビット0設定
	}

	if(PIR1bits.CCP1IF == 1){			//CCPR1割り込みフラグ
		PIR1bits.CCP1IF = 0;			//CCPR1割り込みフラグクリア
		if(PORTCbits.RC1 == 1){			//エンジンスタート
			LATAbits.LATA2 = 1;			//コイル通電
		ignition++;
		}
	}
	
	if(PIR2bits.CCP2IF == 1){			//CCPR2割り込みフラグ
		CCPR1=doel2;
		PIR2bits.CCP2IF = 0;			//CCPR2割り込みフラグクリア
		LATAbits.LATA2 = 0;				//コイル通電OFF(点火)
		
	}
}
///通常割り込み処理
#pragma code low_vector=0x18
void low_interrupt(void)
{
	_asm
		GOTO low_isr
	_endasm
}
#pragma code
//ここから
#pragma interruptlow low_isr
void low_isr (void)
{	
	if(INTCON3bits.INT1IF == 1){		//INT1(B相)割り込み 
		INTCON3bits.INT1IF = 0;			//INT1割り込みクリア
		if(PORTBbits.RB0 == 1){			//A相出力状態確認
			A--;						//カウント値－（逆転）
		}
		else{
			A++;						//カウント値+(正転)
		}
		if(A>719){						//A相が719カウント以上なら
			A=719;						//A相は719
		}
	}
   	else if(INTCONbits.TMR0IF == 1){	//TMR0オーバーフロー
		INTCONbits.TMR0IF = 0;			//TMR0オーバーフロークリア
		T0CONbits.TMR0ON = 0;			//TMR0動作停止
		TMR0H=0;						//0設定
		TMR0L=0;						//0設定
		NoRev = 1;						//エンジン停止中
		Rev = 0;						//回転数0
		Ave = 0;						//平均回転数0
	}	
}
///各種設定
void main(void)
{
//	ADCON0 = 0x01;			//AD On	
//	ADCON1 = 0x0A;      	//RA0,RA1,RA2,RA3,RA4アナログに設定
//	ADCON2 = 0x97;			//Right,4Tad,Tcy/64 0x96
	CMCON = 0x07;			//コンパレータオフ
 	LATA = 0;				//初期出力
   	LATB = 0;				//液晶表示ポートリセット
  	LATC = 0;				//LED Off
 	TRISA = 0x00;			//Aポート割り振り 0x30
	TRISB = 0x07;			//Bポート割り振り（液晶表示）
 	TRISC = 0x03;			//Cポート割り振り（LED, USART）0x33
	RCONbits.IPEN = 1;		//割り込み優先の有効化
	INTCON=0xE0;			//INTCON設定
	INTCON2=0x80;			//INTCO2N設定
	INTCON3=0x98;			//INTCON3設定
	T0CON=0x06;				//TIMER0設定	(Zcount)
	TMR0H=0;				//
	TMR0L=0;				//
	T1CON=0x83;				//T1CON設定(BA) 16bit 1:1 外部　使う
	IPR1bits.CCP1IP = 1;	//
	IPR2bits.CCP2IP = 1;	//
	PIE1bits.CCP1IE = 1;	//
	PIE2bits.CCP2IE = 1;	//
	CCP1CON=0x0A;			//コンペアモード（一致で割り込み）
	CCP2CON=0x0A;			//〃
//	CCPR1=0x134;
//	CCPR2=0x161;
//	CCPR2=705;				//719 - 点火させたい角度(BTDC)　今はBTDC14°
	CCPR2=705;
  	T3CON=0x00;				//T3CON設定（両CCPともタイマ1）
	lcd_init();				//LCD初期化
	lcd_clear();			//液晶消去
//	opening();				//オープニング
/// メインループ
    while(1)
    {
//	    if(PORTAbits.RA3 == 0){
					/*カム側720パルス0.5°のときクランク側が1°の精度
					ABDC = (CCPR1 / 2) - 180
					BTDC = (720 - CCPR2) / 2
	   				*/

/**********************************進角*************************************/
		   	if((Rev1 >= 250) && (Rev1 < 2250)){
												
				CCPR2=711;							//BTDC8.0°		//2000rpm
			}else if((Rev1 >= 2250) && (Rev1 < 2750)){
												
				CCPR2=710;							//BTDC9.0°		//2500rpm
			}else if((Rev1 >= 2750) && (Rev1 < 3250)){
												
				CCPR2=709;							//BTDC10.0°		//3000rpm
			}else if((Rev1 >= 3250) && (Rev1 < 4000)){
												
				CCPR2=706;							//BTDC14.0°		//3500rpm
			}else if((Rev1 >= 4000) && (Rev1 < 5750)){
												
				CCPR2=705;							//BTDC14.0°		//4000rpm
			}else{									////Rev < 250 または5750 < Rev　のとき
				LATAbits.LATA2 = 0;					//コイル信号OFF
			}

//			CCPR1=0x134;
//			CCPR2=0x161;

		LATAbits.LATA0 = !PORTBbits.RB2;		//上死点調整用		////Z相
//		if(timer1 > 0x15B || timer1 < 0x5A ){							//カムでの角度が347.4°(信号立下り)								
		if(timer1 > 670 || timer1 <180 ){	
			LATAbits.LATA1 = 1;					//BTDC20° 燃料噴射
		}
		else{
			LATAbits.LATA1 = 0;
			injection++;
		}	
			Zcount = ZcountL;					//下位8ビット
			Zcount += (unsigned int)ZcountH<<8;	//8ビットシフトさせて
		if(NoRev == 0){							//NoRev =0なら（エンジン動作中）
			Rev = 11250000/Zcount;				//回転数計算
			Rev = Rev/10;						//10で割ることで一桁目を切り捨てる
			Rev = Rev*10;						//10倍して桁を繰り上げる
			Rev1 = Rev;							//1回前の回転数
			doel=(unsigned int)704-(337500/Zcount);
			doel2=doel;

//			revav1 = revav0;					//２回目回転数値保存
//			revav0 = Rev;						//１回目回転数値保存
//			Ave = (Rev + revav0 + revav1) / 3;	//３点平均を計算
		}
		if(NoRev ==1){							//NoRev =0なら(エンジン停止中)
			LATAbits.LATA2 = 0;					//コイル通電OFF
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
												//更新	  
	}
}
///A/D変換読み込み関数
unsigned int AD_input(char chanl)
{
    	unsigned int adData;        	// 10ビットモード
    	
	ADCON0 = 0x01 + (chanl * 4);
    	ADCON0bits.GO = 1;             	// Start AD conversion
    	while(ADCON0bits.NOT_DONE);    	// Wait for conversion
 	adData = ADRESH * 256 + ADRESL;
	return(adData);                   	// データ返し
}

/// 数値から文字列に変換
void ltostring(char digit, unsigned long data, char *buffer)
{
	char i;
	buffer += digit;					// 文字列の最後
	for(i=digit; i>0; i--) {			// 最下位桁から上位へ
		buffer--;						// ポインター１
			*buffer = (data % 10) + '0';// その桁数値を文字にして格納
			data = data / 10;			// 桁-1

	}
				
}
/// データ表示関数
void Display(void) 
{
	lcd_cmd(0x80);							//１行目へ
	sprintf(Msg1,"%3d.%2d",(5*A)/10,(5*A)%10);		////文字列書式入出力関数
	lcd_str((char *)Msg1);					//1行目表示

	lcd_cmd(0x88);							//１行目へ
	sprintf(Msg3,"%d",ignition);		////文字列書式入出力関数
	lcd_str((char *)Msg3);					//1行目表示
 
 	lcd_cmd(0xC0);							//2行目へ					359.5
	sprintf(Msg2,"%4drpm",Rev);
   	lcd_str((char *)Msg2);					//２行目表示

 	/*lcd_cmd(0xC8);							//2行目へ					359.5
	sprintf(Msg4,"%d",injection);
   	lcd_str((char *)Msg4);*/
}
