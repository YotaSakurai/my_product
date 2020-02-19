//////////////////////////////////
//  エンジン車体シリアルLCD 			 //
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

/*　Global　function　*/
unsigned long int distance=0;	//近接センサー信号数
unsigned int Sec=0;				//走行時間
unsigned int Sec1=0;			//ラップタイム1
unsigned int Sec2=0;			//ラップタイム2
unsigned int Sec3=0;			//ラップタイム3
unsigned char R1=0;				//ラップ数1
unsigned char R2=0;				//ラップ数2
unsigned char R3=0;				//ラップ数3
unsigned int Box=0;				//前時間記憶領域(sec)
unsigned int count=0;			//0.1s格納用			
unsigned int VoltC=0;			//電圧AD変換回数
unsigned int Voltage=0;			//電圧AD値格納
unsigned int Voltage2=0;		//電圧平均値
unsigned int TempC=0;			//温度AD変換回数
unsigned int Temperature=0;		//温度AD値格納
unsigned int CorrectionTemp=0;	//温度誤差修正用
unsigned int Temperature2=0;	//温度平均値
unsigned int AF=0;				//A/F値
unsigned int speed=0;			//時速[km/h]
unsigned int BoxH=0;			//時速整数部格納
unsigned int BoxL=0;			//時速小数部格納
unsigned int BoxSum=0;			//時速計算部
unsigned int Box1=0;			//前々時速格納
int Box2=0;						//前時速格納
int Box3=0;						//時速格納
unsigned int AveSpeed=0; 		//平均速度
unsigned int InjectionTime=0;	//噴射時間
unsigned int Rev;				//回転数
unsigned int NoRev= 1;			//回転数表示フラグ 0:回転数計算 1:計算しない
unsigned int TMRON=0;			//車速信号フラグ　1:TMR3スタート
unsigned int swlong=30;		//表示Reset誤動作防止カウント(3s)
unsigned int output_buffer[26];		// 送信バッファ
unsigned int output_num = 0;				// 送信番号
unsigned int Send_flag = 0;					// 表示フラグ
unsigned int Main_flag =0;					// メインスイッチフラグ

/* 関数プロトタイピング */
void isr (void);
void pic_set(void);
void Send_Data_Set(void);
void Send_Data(void);
unsigned int AD_input(char chanl);

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
	if(INTCONbits.INT0IF == 1){
		INTCONbits.INT0IF = 0;
			swlong=30;
 	  if(Sec-Box >0){					//ボタンの押しミスを防ぐ
			Sec3=Sec2;						//四行目のSec
			Sec2=Sec1;						//三行目のSec
			Sec1=Sec-Box;					//二行目のSec
			Box=Sec;						//Boxに前のSecを保管
			R3=R2;							//ラップ3
			R1++;							//ラップ1
			R2=R1-1;						//ラップ2
		}
	}
	else if(INTCON3bits.INT1IF == 1){				//The INT1 external interrupt occurred 
	 		INTCON3bits.INT1IF = 0;					//The INT1 external interrupt occurred クリア
			TMRON=1;					
		if(T1CONbits.TMR1ON==0){					//TMR0 Overflow Interrupt Flag 0なら
				TMR1H=0;							//0設定
				TMR1L=0;
			T1CONbits.TMR1ON=1;						//TMR0 Overflow Interrupt Flag =1
			
		}
		else
		{
			speed = TMR1L;		　	///下位8ビット
			speed += TMR1H*256;　	///上位8ビット	256は2の8乗　合計16ビットモード
		} 
		TMR1H=0;							//0設定
		TMR1L=0;
		distance++;
	}
	else if(PIR1bits.TMR1IF ==1){					//TMR Overflow Interrupt Flag 
		PIR1bits.TMR1IF = 0;					//TMR Overflow Interrupt Flag クリア
		T1CONbits.TMR1ON=0;						//タイマー使用しない
		TMR1H=0;								//0設定
		TMR1L=0;								//0設定
		speed=0;
		Box1=0;
		Box2=0;
		Box3=0;
		InjectionTime=0;
	}
	else if(INTCON3bits.INT2IF == 1){				//The INT2 external interrupt occurred
		INTCON3bits.INT2IF = 0;						//The INT2 external interrupt occurred クリア

		if(T0CONbits.TMR0ON==0){					//TMR0 Overflow Interrupt Flag 0なら
		TMR0H=0;							//0設定
		TMR0L=0;							//0設定
			T0CONbits.TMR0ON=1;						//TMR0 Overflow Interrupt Flag =1
		}
		else
		{
			InjectionTime = TMR0L;		　	///下位8ビット
			InjectionTime += TMR0H*256;　	///上位8ビット	256は2の8乗　合計16ビットモード
		}
		TMR0H=0;							//0設定
		TMR0L=0;							//0設定
		NoRev = 0;							//回転数表示
	}		

	else if(INTCONbits.TMR0IF ==1){				//TMR0 Overflow Interrupt Flag 
		INTCONbits.TMR0IF = 0;					//TMR0 Overflow Interrupt Flag クリア
		T0CONbits.TMR0ON=0;						//タイマー0使用しない
		TMR0H=0;								//0設定
		TMR0L=0;								//0設定
		NoRev = 1;							//回転数表示しない
		InjectionTime=0;
		Rev = 0;								//0設定
	}

	else if(PIR2bits.TMR3IF == 1){		//オーバーフロー(0.1秒) 		
//     （使用しているHz（今回は1.308MHz）×目的の時間(今回は0.1秒)）÷プリスケーラの値　65536(2^16-1)-65400(計算値)=135(10)　->　TMR3L=0x88
		PIR2bits.TMR3IF = 0;			//オーバーフロークリア
		count++;				//+0.1秒
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

/* メイン関数 */
void main(void){

	pic_set();

	PIR2bits.TMR3IF = 0;				// Timer3割込みフラグクリア
	T3CONbits.TMR3ON = 1;				// Timer3スタート
    while(1)
    {
		if(TMRON == 1){
       		if(count > 9){				//
				Sec++;					//+1秒カウント
				count=0;	
			}
		}

		while( VoltC < 10){
			 VoltC++;
			 Voltage += AD_input(3);		//0.1秒に更新されるADの入力値をVoltageに足す
		}

		VoltC = 0;
		Voltage2 = Voltage  /10;			//1秒間の平均を求める
		Voltage  =0;
		
		while(TempC < 10){
			TempC++;
			Temperature += AD_input(7);
		}
		
		TempC = 0;
		Temperature2 = Temperature/10;
		Temperature2 = Temperature2*10;
		Temperature =0;
			
		AF = AD_input(10);		//0.1秒に更新されるA/Fの入力値を足す
		AF = AF>>2;

		if(speed > 800){
			//20インチのタイヤ　10回転、一回転1.548メートル
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

		if(NoRev == 0){							//NoRev =0なら
			//Rev = 30000000/InjectionTime;		//回転数計算
			Rev = 7500000/InjectionTime;		//回転数計算


			Rev = Rev/10;						//10倍して桁を繰り上げる
			Rev = Rev*10;						//10で割ることで一桁目を切り捨てる
		}
		else{
			Rev = 0;			//回転数を0表示
		}
			
		if(Temperature2%2 == 0){				//余りが0ならTemperature2/2を計算　表示を見やすくするため
			Temperature = Temperature/10;
		}
		if(distance != 0){
			AveSpeed = (distance * 1548 /20)/Sec;		//平均速度（mm/s)
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

/* PIC設定 */
void pic_set(void)
{
	OSCCON = 0x62;	//  内部クロック8Mhz

	/* 入出力設定 */
	TRISA = 0x10;						// PORTA出力設定 RA4input
	TRISB = 0x10;						// PORTB出力設定 RB4input
	TRISC = 0x1F;						// PORTC出力設定 RC0~4input
	LATA = 0x00;
	LATB = 0x00;
	LATC = 0x00;
	ANSEL = 0x88;						// AN3,7 ANALOG
	ANSELH = 0x04;						// AN10 ANALOG
	
	//割込み設定
	INTCON = 0xD0;			//　グローバル割込み許可・周辺割込み許可・INT0割込み許可
	INTCON2 = 0xC0;			// ポートBプルアップ無効・INT0立ち上がり・INT1,2立ち下り
	INTCON3 = 0x18;			// INT1・3割込み許可
	PIE1bits.TMR1IE = 1;	// Timer1割込み許可
	PIE2bits.TMR3IE = 1;	// Timer3割込み許可
	
	//Timer0設定
	T0CON = 0x04;    // 16bitモード,プリスケーラ1:32,内部発振
	TMR0H = 0x00;
	TMR0L = 0x00;
	
	//Timer1設定
	T1CON=0xBA;							//16bitモード,PS1:4,外部発振
	TMR1H=0x00;							//
	TMR1L=0x00;							//

	//Timer3設定
	T3CON=0x9E;							//TIMER3設定(0.1秒作成)
	TMR3H=0x00;							//
	TMR3L=0x88;							//

	//usart設定
	TXSTA	= 0x24;					//送信有効,非同期,8ビット,高速
	RCSTA	= 0x90;					//シリアルポート有効,8ビット,連続受信可
	SPBRG	= 25;					//19200bps

	//ADConverter設定
	ADCON0 = 0x01;						// ADCON
	ADCON1 = 0x00;						// ADC内部電源
	ADCON2 = 0xAA;						// Right Shift,12TAD,FOSC/16
	
}

void Send_Data_Set(void)
{
	BoxSum = (Box1 + Box2 + Box3)/3;
	BoxH = BoxSum/10;		//20インチのタイヤ　10回転、一回転1.548メートル
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

//////// A/D変換読み込み関数
unsigned int AD_input(char chanl)
{
    	unsigned int adData;        		// 10ビットモード
    	
	ADCON0 = 0x01 + (chanl * 4);
    	ADCON0bits.GO = 1;              	// Start AD conversion
    	while(ADCON0bits.NOT_DONE);     	// Wait for conversion
 	adData = ADRESH*256 + ADRESL;
	return(adData);                    	// データ返し
}
