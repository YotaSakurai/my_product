/*********************************************
*　　液晶表示器用ヘッダ　(lcdlib18.h)
*  ポートの定義
*  プロトタイピング
*********************************************/

//// LCDポート設定
#define LCD_   DATA    LATB    // 4ビットデータの出力ポート
#define LCD_RS LATBbits.LATB2  // RS信号
#define LCD_E  LATBbits.LATB3  //E(STB)信号

//// LCD関数プロトタイピング
void lcd_out(char code, char frag);
void lcd_data(char asci);
void lcd_cmd(char cmd);
void lcd_clear(void);
void lcd_init(void);
void lcd_str(char *str);