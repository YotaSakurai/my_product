///////////////////////////////////////////////
//  液晶表示器制御ライブラリ　for PIC18Fxxxx
//  内蔵関数は以下
//    lcd_init()    ----- 初期化
//    lcd_cmd(cmd)  ----- コマンド出力
//    lcd_data(chr) ----- １文字表示出力
//    lcd_clear()   ----- 全消去
//////////////////////////////////////////////
#include <p18cxxx.h>
#include "io_cfg.h"
#include	"delays.h"
#include "lcd_lib.h"

//////// データ出力サブ関数
void lcd_out(char code, char flag)
{
	lcd_port = code & 0xF0;
	if (flag == 0)
		lcd_rs = 1;			//表示データの場合
	else
		lcd_rs = 0;			//コマンドデータの場合
	Delay1TCY();				//NOP		
	lcd_stb = 1;				//strobe out
	Delay10TCYx(1);			//10NOP
	lcd_stb = 0;				//reset strobe
}
//////// １文字表示関数
void lcd_data(char asci)
{
	lcd_out(asci, 0);			//上位４ビット出力
	lcd_out(asci<<4, 0);		//下位４ビット出力
	Delay10TCYx(50);			//50μsec待ち
}
/////// コマンド出力関数
void lcd_cmd(unsigned char cmd)
{
	lcd_out(cmd, 1);			//上位４ビット出力
	lcd_out(cmd<<4, 1);		//下位４ビット出力
	if((cmd & 0x03) != 0)
		Delay10KTCYx(2);		//2msec待ち
	else
		Delay10TCYx(50);		//50usec待ち
}
/////// 全消去関数
void lcd_clear(void)
{
	lcd_cmd(0x01);			//初期化コマンド出力
}

/////// 文字列出力関数
void lcd_str(char *str)
{
	while(*str != 0x00)			//文字列の終わり判定
	{
		lcd_data(*str);			//文字列１文字出力
		str++;					//ポインタ＋１
	}
}

/////// 初期化関数
void lcd_init(void)
{
	Delay10KTCYx(20);
	lcd_out(0x30, 1);			//8bit mode set
	Delay10KTCYx(5);
	lcd_out(0x30, 1);			//8bit mode set
	Delay10KTCYx(1);
	lcd_out(0x30, 1);			//8bit mode set
	Delay10KTCYx(1);
	lcd_out(0x20, 1);			//4bit mode set
	Delay10KTCYx(1);
	lcd_cmd(0x2E);			//DL=0 4bit mode
	lcd_cmd(0x08);			//display off C=D=B=0
	lcd_cmd(0x0C);			//display on C=D=1 B=0 0X0D
	lcd_cmd(0x06);			//entry I/D=1 S=0
	lcd_cmd(0x01);			//all clear
	lcd_cgram();
}

void opening(void)
{
	char i,j;
	lcd_clear();				// 液晶消去
		lcd_cmd(195);
		lcd_data('W');
		Delay10KTCYx(120);
		lcd_data('e');
		Delay10KTCYx(120);
		lcd_data('l');
		Delay10KTCYx(120);
		lcd_data('c');
		Delay10KTCYx(120);
		lcd_data('o');
		Delay10KTCYx(120);
		lcd_data('m');
		Delay10KTCYx(120);
		lcd_data('e');
		Delay10KTCYx(120);
		lcd_data(' ');
		lcd_data('T');
		Delay10KTCYx(120);
		lcd_data('o');
		Delay10KTCYx(120);
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_cmd(156);
		lcd_data('s');
		Delay10KTCYx(120);
		lcd_data('t');
		Delay10KTCYx(120);
		lcd_data('r');
		Delay10KTCYx(120);
		lcd_data('a');
		Delay10KTCYx(120);
		lcd_data('d');
		Delay10KTCYx(120);
		lcd_data('a');
		Delay10KTCYx(120);
		lcd_data('l');
		Delay10KTCYx(120);
		lcd_data('e');
		Delay10KTCYx(120);
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
		lcd_data(' ');
	for(i=0;i<18;i++){
		Delay10KTCYx(200);
	}
	lcd_clear();				// 液晶消去
}

void lcd_cgram(void)
{							//CGRAM書き込み（大文字）
	char i;
//フォント
	const char character1[] = {0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18};
	const char character2[] = {0x18,0x18,0,0,0,0,0x18,0x18};
	const char character3[] = {0,0,0,0,0,0,0x18,0x18};
	const char character4[] = {0x1F,0x1F,0,0,0,0,0x1F,0x1F};
	const char character5[] = {0x1F,0x1F,0x18,0x18,0x18,0x18,0x1F,0x1F};
	const char character6[] = {0x1F,0x1F,0x18,0x18,0x18,0x18,0x18,0x18};
	const char character7[] = {0x18,0x18,0x18,0x18,0x18,0x18,0x1F,0x1F};
	const char character8[] = {0,0,0,0,0,0,0x1F,0x1F};
	lcd_cmd(64);//64
	for (i = 0; i<=7; i++) {
		lcd_data(character1[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character2[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character3[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character4[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character5[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character6[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character7[i]);
	}
	for (i = 0; i<=7; i++) {
		lcd_data(character8[i]);
	}
}

void big_num(char num,unsigned char pos,unsigned char line)	//大文字表示
{
	switch(num){
		case '0':							//0
			lcd_cmd(line+pos);
			lcd_data(0x05);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x06);
			lcd_data(0x00);
			break;
		case '1':							//1
			lcd_cmd(line+pos);
			lcd_data(0x20);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case '2':							//2
			lcd_cmd(line+pos);
			lcd_data(0x03);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x06);
			lcd_data(0x02);
			break;
		case '3':							//3
			lcd_cmd(line+pos);
			lcd_data(0x03);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x07);
			lcd_data(0x00);
			break;
		case '4':							//4
			lcd_cmd(line+pos);
			lcd_data(0x06);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case '5':							//5
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x01);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x07);
			lcd_data(0x00);
			break;
		case '6':							//6
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x01);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x6);
			lcd_data(0x00);
			break;
		case '7':							//7
			lcd_cmd(line+pos);
			lcd_data(0x05);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case '8':							//8
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x06);
			lcd_data(0x00);
			break;
		case '9':							//9
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case ' ':							//9
			lcd_cmd(line+pos);
			lcd_data(' ');
			lcd_data(' ');
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(' ');
			lcd_data(' ');
			break;
		default:
			lcd_cmd(line+64+pos);		//2行目へ
			lcd_data(num);
			break;
	}
}

void lcd_big_str(char *str,unsigned char line)		//大文字文字列へ変換
{
	unsigned char position=0;
	while(*str != 0x00)			//文字列の終わり判定
	{

		big_num(*str,position,line);			//文字列１文字出力
		if((*str<0x30 || *str>0x39) && *str!=0x20)	//数字以外？
			position++;					//小さい文字（1文字文すすむ）
		else
			position+=2;
		str++;					//ポインタ＋１
	}
}