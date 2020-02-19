///////////////////////////////////////////////
//  �t���\���퐧�䃉�C�u�����@for PIC18Fxxxx
//  �����֐��͈ȉ�
//    lcd_init()    ----- ������
//    lcd_cmd(cmd)  ----- �R�}���h�o��
//    lcd_data(chr) ----- �P�����\���o��
//    lcd_clear()   ----- �S����
//////////////////////////////////////////////
#include <p18cxxx.h>
#include "io_cfg.h"
#include	"delays.h"
#include "lcd_lib.h"

//////// �f�[�^�o�̓T�u�֐�
void lcd_out(char code, char flag)
{
	lcd_port = code & 0xF0;
	if (flag == 0)
		lcd_rs = 1;			//�\���f�[�^�̏ꍇ
	else
		lcd_rs = 0;			//�R�}���h�f�[�^�̏ꍇ
	Delay1TCY();				//NOP		
	lcd_stb = 1;				//strobe out
	Delay10TCYx(1);			//10NOP
	lcd_stb = 0;				//reset strobe
}
//////// �P�����\���֐�
void lcd_data(char asci)
{
	lcd_out(asci, 0);			//��ʂS�r�b�g�o��
	lcd_out(asci<<4, 0);		//���ʂS�r�b�g�o��
	Delay10TCYx(50);			//50��sec�҂�
}
/////// �R�}���h�o�͊֐�
void lcd_cmd(unsigned char cmd)
{
	lcd_out(cmd, 1);			//��ʂS�r�b�g�o��
	lcd_out(cmd<<4, 1);		//���ʂS�r�b�g�o��
	if((cmd & 0x03) != 0)
		Delay10KTCYx(2);		//2msec�҂�
	else
		Delay10TCYx(50);		//50usec�҂�
}
/////// �S�����֐�
void lcd_clear(void)
{
	lcd_cmd(0x01);			//�������R�}���h�o��
}

/////// ������o�͊֐�
void lcd_str(char *str)
{
	while(*str != 0x00)			//������̏I��蔻��
	{
		lcd_data(*str);			//������P�����o��
		str++;					//�|�C���^�{�P
	}
}

/////// �������֐�
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
	lcd_clear();				// �t������
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
	lcd_clear();				// �t������
}

void lcd_cgram(void)
{							//CGRAM�������݁i�啶���j
	char i;
//�t�H���g
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

void big_num(char num,unsigned char pos,unsigned char line)	//�啶���\��
{
	switch(num){
		case '0':							//0
			lcd_cmd(line+pos);
			lcd_data(0x05);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x06);
			lcd_data(0x00);
			break;
		case '1':							//1
			lcd_cmd(line+pos);
			lcd_data(0x20);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case '2':							//2
			lcd_cmd(line+pos);
			lcd_data(0x03);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x06);
			lcd_data(0x02);
			break;
		case '3':							//3
			lcd_cmd(line+pos);
			lcd_data(0x03);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x07);
			lcd_data(0x00);
			break;
		case '4':							//4
			lcd_cmd(line+pos);
			lcd_data(0x06);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case '5':							//5
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x01);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x07);
			lcd_data(0x00);
			break;
		case '6':							//6
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x01);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x6);
			lcd_data(0x00);
			break;
		case '7':							//7
			lcd_cmd(line+pos);
			lcd_data(0x05);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case '8':							//8
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x06);
			lcd_data(0x00);
			break;
		case '9':							//9
			lcd_cmd(line+pos);
			lcd_data(0x04);
			lcd_data(0x00);
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(0x20);
			lcd_data(0x00);
			break;
		case ' ':							//9
			lcd_cmd(line+pos);
			lcd_data(' ');
			lcd_data(' ');
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(' ');
			lcd_data(' ');
			break;
		default:
			lcd_cmd(line+64+pos);		//2�s�ڂ�
			lcd_data(num);
			break;
	}
}

void lcd_big_str(char *str,unsigned char line)		//�啶��������֕ϊ�
{
	unsigned char position=0;
	while(*str != 0x00)			//������̏I��蔻��
	{

		big_num(*str,position,line);			//������P�����o��
		if((*str<0x30 || *str>0x39) && *str!=0x20)	//�����ȊO�H
			position++;					//�����������i1�����������ށj
		else
			position+=2;
		str++;					//�|�C���^�{�P
	}
}