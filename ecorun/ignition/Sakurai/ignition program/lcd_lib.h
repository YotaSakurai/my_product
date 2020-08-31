/** PUBLIC  P R O T O T Y P E S ******************/
void lcd_data(char asci);
void lcd_cmd(unsigned char cmd);
void lcd_clear(void);
void lcd_cgram(void);
void lcd_init(void);
void opening(void);
void big_num(char num,unsigned char pos,unsigned char line);
void lcd_str(char *str);
void lcd_big_str(char *str,unsigned char line);
