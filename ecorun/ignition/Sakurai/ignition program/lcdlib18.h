/*********************************************
*�@�@�t���\����p�w�b�_�@(lcdlib18.h)
*  �|�[�g�̒�`
*  �v���g�^�C�s���O
*********************************************/

//// LCD�|�[�g�ݒ�
#define LCD_   DATA    LATB    // 4�r�b�g�f�[�^�̏o�̓|�[�g
#define LCD_RS LATBbits.LATB2  // RS�M��
#define LCD_E  LATBbits.LATB3  //E(STB)�M��

//// LCD�֐��v���g�^�C�s���O
void lcd_out(char code, char frag);
void lcd_data(char asci);
void lcd_cmd(char cmd);
void lcd_clear(void);
void lcd_init(void);
void lcd_str(char *str);