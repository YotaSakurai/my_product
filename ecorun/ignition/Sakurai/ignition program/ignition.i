#line 1 "ignition.c"
#line 1 "ignition.c"

#line 7 "ignition.c"
 
#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"

#line 5 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
 


#line 9 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"

extern volatile near unsigned            UFRM;
extern volatile near unsigned char       UFRML;
extern volatile near union {
  struct {
    unsigned FRM:8;
  };
  struct {
    unsigned FRM0:1;
    unsigned FRM1:1;
    unsigned FRM2:1;
    unsigned FRM3:1;
    unsigned FRM4:1;
    unsigned FRM5:1;
    unsigned FRM6:1;
    unsigned FRM7:1;
  };
} UFRMLbits;
extern volatile near unsigned char       UFRMH;
extern volatile near union {
  struct {
    unsigned FRM:3;
  };
  struct {
    unsigned FRM8:1;
    unsigned FRM9:1;
    unsigned FRM10:1;
  };
} UFRMHbits;
extern volatile near unsigned char       UIR;
extern volatile near struct {
  unsigned URSTIF:1;
  unsigned UERRIF:1;
  unsigned ACTVIF:1;
  unsigned TRNIF:1;
  unsigned IDLEIF:1;
  unsigned STALLIF:1;
  unsigned SOFIF:1;
} UIRbits;
extern volatile near unsigned char       UIE;
extern volatile near struct {
  unsigned URSTIE:1;
  unsigned UERRIE:1;
  unsigned ACTVIE:1;
  unsigned TRNIE:1;
  unsigned IDLEIE:1;
  unsigned STALLIE:1;
  unsigned SOFIE:1;
} UIEbits;
extern volatile near unsigned char       UEIR;
extern volatile near struct {
  unsigned PIDEF:1;
  unsigned CRC5EF:1;
  unsigned CRC16EF:1;
  unsigned DFN8EF:1;
  unsigned BTOEF:1;
  unsigned :2;
  unsigned BTSEF:1;
} UEIRbits;
extern volatile near unsigned char       UEIE;
extern volatile near struct {
  unsigned PIDEE:1;
  unsigned CRC5EE:1;
  unsigned CRC16EE:1;
  unsigned DFN8EE:1;
  unsigned BTOEE:1;
  unsigned :2;
  unsigned BTSEE:1;
} UEIEbits;
extern volatile near unsigned char       USTAT;
extern volatile near union {
  struct {
    unsigned :1;
    unsigned PPBI:1;
    unsigned DIR:1;
    unsigned ENDP:4;
  };
  struct {
    unsigned :3;
    unsigned ENDP0:1;
    unsigned ENDP1:1;
    unsigned ENDP2:1;
    unsigned ENDP3:1;
  };
} USTATbits;
extern volatile near unsigned char       UCON;
extern volatile near struct {
  unsigned :1;
  unsigned SUSPND:1;
  unsigned RESUME:1;
  unsigned USBEN:1;
  unsigned PKTDIS:1;
  unsigned SE0:1;
  unsigned PPBRST:1;
} UCONbits;
extern volatile near unsigned char       UADDR;
extern volatile near union {
  struct {
    unsigned ADDR:7;
  };
  struct {
    unsigned ADDR0:1;
    unsigned ADDR1:1;
    unsigned ADDR2:1;
    unsigned ADDR3:1;
    unsigned ADDR4:1;
    unsigned ADDR5:1;
    unsigned ADDR6:1;
  };
} UADDRbits;
extern volatile near unsigned char       UCFG;
extern volatile near union {
  struct {
    unsigned PPB:2;
    unsigned FSEN:1;
    unsigned UTRDIS:1;
    unsigned UPUEN:1;
    unsigned :1;
    unsigned UOEMON:1;
    unsigned UTEYE:1;
  };
  struct {
    unsigned PPB0:1;
    unsigned PPB1:1;
  };
} UCFGbits;
extern volatile near unsigned char       UEP0;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP0bits;
extern volatile near unsigned char       UEP1;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP1bits;
extern volatile near unsigned char       UEP2;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP2bits;
extern volatile near unsigned char       UEP3;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP3bits;
extern volatile near unsigned char       UEP4;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP4bits;
extern volatile near unsigned char       UEP5;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP5bits;
extern volatile near unsigned char       UEP6;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP6bits;
extern volatile near unsigned char       UEP7;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP7bits;
extern volatile near unsigned char       UEP8;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP8bits;
extern volatile near unsigned char       UEP9;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP9bits;
extern volatile near unsigned char       UEP10;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP10bits;
extern volatile near unsigned char       UEP11;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP11bits;
extern volatile near unsigned char       UEP12;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP12bits;
extern volatile near unsigned char       UEP13;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP13bits;
extern volatile near unsigned char       UEP14;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP14bits;
extern volatile near unsigned char       UEP15;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP15bits;
extern volatile near unsigned char       PORTA;
extern volatile near union {
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned RA2:1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
    unsigned RA6:1;
  };
  struct {
    unsigned AN0:1;
    unsigned AN1:1;
    unsigned AN2:1;
    unsigned AN3:1;
    unsigned T0CKI:1;
    unsigned AN4:1;
    unsigned OSC2:1;
  };
  struct {
    unsigned :2;
    unsigned VREFM:1;
    unsigned VREFP:1;
    unsigned :1;
    unsigned LVDIN:1;
  };
  struct {
    unsigned :5;
    unsigned HLVDIN:1;
  };
} PORTAbits;
extern volatile near unsigned char       PORTB;
extern volatile near union {
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
  struct {
    unsigned INT0:1;
    unsigned INT1:1;
    unsigned INT2:1;
    unsigned :2;
    unsigned PGM:1;
    unsigned PGC:1;
    unsigned PGD:1;
  };
} PORTBbits;
extern volatile near unsigned char       PORTC;
extern volatile near union {
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned :1;
    unsigned RC4:1;
    unsigned RC5:1;
    unsigned RC6:1;
    unsigned RC7:1;
  };
  struct {
    unsigned T1OSO:1;
    unsigned T1OSI:1;
    unsigned CCP1:1;
    unsigned :3;
    unsigned TX:1;
    unsigned RX:1;
  };
  struct {
    unsigned T13CKI:1;
    unsigned :1;
    unsigned P1A:1;
    unsigned :3;
    unsigned CK:1;
    unsigned DT:1;
  };
} PORTCbits;
extern volatile near unsigned char       PORTE;
extern volatile near struct {
  unsigned :3;
  unsigned RE3:1;
} PORTEbits;
extern volatile near unsigned char       LATA;
extern volatile near struct {
  unsigned LATA0:1;
  unsigned LATA1:1;
  unsigned LATA2:1;
  unsigned LATA3:1;
  unsigned LATA4:1;
  unsigned LATA5:1;
  unsigned LATA6:1;
} LATAbits;
extern volatile near unsigned char       LATB;
extern volatile near struct {
  unsigned LATB0:1;
  unsigned LATB1:1;
  unsigned LATB2:1;
  unsigned LATB3:1;
  unsigned LATB4:1;
  unsigned LATB5:1;
  unsigned LATB6:1;
  unsigned LATB7:1;
} LATBbits;
extern volatile near unsigned char       LATC;
extern volatile near struct {
  unsigned LATC0:1;
  unsigned LATC1:1;
  unsigned LATC2:1;
  unsigned :3;
  unsigned LATC6:1;
  unsigned LATC7:1;
} LATCbits;
extern volatile near unsigned char       DDRA;
extern volatile near union {
  struct {
    unsigned TRISA0:1;
    unsigned TRISA1:1;
    unsigned TRISA2:1;
    unsigned TRISA3:1;
    unsigned TRISA4:1;
    unsigned TRISA5:1;
    unsigned TRISA6:1;
  };
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned RA2:1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
    unsigned RA6:1;
  };
} DDRAbits;
extern volatile near unsigned char       TRISA;
extern volatile near union {
  struct {
    unsigned TRISA0:1;
    unsigned TRISA1:1;
    unsigned TRISA2:1;
    unsigned TRISA3:1;
    unsigned TRISA4:1;
    unsigned TRISA5:1;
    unsigned TRISA6:1;
  };
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned RA2:1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
    unsigned RA6:1;
  };
} TRISAbits;
extern volatile near unsigned char       DDRB;
extern volatile near union {
  struct {
    unsigned TRISB0:1;
    unsigned TRISB1:1;
    unsigned TRISB2:1;
    unsigned TRISB3:1;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
  };
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
} DDRBbits;
extern volatile near unsigned char       TRISB;
extern volatile near union {
  struct {
    unsigned TRISB0:1;
    unsigned TRISB1:1;
    unsigned TRISB2:1;
    unsigned TRISB3:1;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
  };
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
} TRISBbits;
extern volatile near unsigned char       DDRC;
extern volatile near union {
  struct {
    unsigned TRISC0:1;
    unsigned TRISC1:1;
    unsigned TRISC2:1;
    unsigned :3;
    unsigned TRISC6:1;
    unsigned TRISC7:1;
  };
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned :3;
    unsigned RC6:1;
    unsigned RC7:1;
  };
} DDRCbits;
extern volatile near unsigned char       TRISC;
extern volatile near union {
  struct {
    unsigned TRISC0:1;
    unsigned TRISC1:1;
    unsigned TRISC2:1;
    unsigned :3;
    unsigned TRISC6:1;
    unsigned TRISC7:1;
  };
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned :3;
    unsigned RC6:1;
    unsigned RC7:1;
  };
} TRISCbits;
extern volatile near unsigned char       OSCTUNE;
extern volatile near union {
  struct {
    unsigned TUN:5;
    unsigned :2;
    unsigned INTSRC:1;
  };
  struct {
    unsigned TUN0:1;
    unsigned TUN1:1;
    unsigned TUN2:1;
    unsigned TUN3:1;
    unsigned TUN4:1;
  };
} OSCTUNEbits;
extern volatile near unsigned char       PIE1;
extern volatile near struct {
  unsigned TMR1IE:1;
  unsigned TMR2IE:1;
  unsigned CCP1IE:1;
  unsigned SSPIE:1;
  unsigned TXIE:1;
  unsigned RCIE:1;
  unsigned ADIE:1;
} PIE1bits;
extern volatile near unsigned char       PIR1;
extern volatile near struct {
  unsigned TMR1IF:1;
  unsigned TMR2IF:1;
  unsigned CCP1IF:1;
  unsigned SSPIF:1;
  unsigned TXIF:1;
  unsigned RCIF:1;
  unsigned ADIF:1;
} PIR1bits;
extern volatile near unsigned char       IPR1;
extern volatile near struct {
  unsigned TMR1IP:1;
  unsigned TMR2IP:1;
  unsigned CCP1IP:1;
  unsigned SSPIP:1;
  unsigned TXIP:1;
  unsigned RCIP:1;
  unsigned ADIP:1;
} IPR1bits;
extern volatile near unsigned char       PIE2;
extern volatile near union {
  struct {
    unsigned CCP2IE:1;
    unsigned TMR3IE:1;
    unsigned HLVDIE:1;
    unsigned BCLIE:1;
    unsigned EEIE:1;
    unsigned USBIE:1;
    unsigned CMIE:1;
    unsigned OSCFIE:1;
  };
  struct {
    unsigned :2;
    unsigned LVDIE:1;
  };
} PIE2bits;
extern volatile near unsigned char       PIR2;
extern volatile near union {
  struct {
    unsigned CCP2IF:1;
    unsigned TMR3IF:1;
    unsigned HLVDIF:1;
    unsigned BCLIF:1;
    unsigned EEIF:1;
    unsigned USBIF:1;
    unsigned CMIF:1;
    unsigned OSCFIF:1;
  };
  struct {
    unsigned :2;
    unsigned LVDIF:1;
  };
} PIR2bits;
extern volatile near unsigned char       IPR2;
extern volatile near union {
  struct {
    unsigned CCP2IP:1;
    unsigned TMR3IP:1;
    unsigned HLVDIP:1;
    unsigned BCLIP:1;
    unsigned EEIP:1;
    unsigned USBIP:1;
    unsigned CMIP:1;
    unsigned OSCFIP:1;
  };
  struct {
    unsigned :2;
    unsigned LVDIP:1;
  };
} IPR2bits;
extern volatile near unsigned char       EECON1;
extern volatile near struct {
  unsigned RD:1;
  unsigned WR:1;
  unsigned WREN:1;
  unsigned WRERR:1;
  unsigned FREE:1;
  unsigned :1;
  unsigned CFGS:1;
  unsigned EEPGD:1;
} EECON1bits;
extern volatile near unsigned char       EECON2;
extern volatile near unsigned char       EEDATA;
extern volatile near unsigned char       EEADR;
extern volatile near unsigned char       RCSTA;
extern volatile near union {
  struct {
    unsigned RX9D:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned ADDEN:1;
    unsigned CREN:1;
    unsigned SREN:1;
    unsigned RX9:1;
    unsigned SPEN:1;
  };
  struct {
    unsigned :3;
    unsigned ADEN:1;
  };
} RCSTAbits;
extern volatile near unsigned char       TXSTA;
extern volatile near struct {
  unsigned TX9D:1;
  unsigned TRMT:1;
  unsigned BRGH:1;
  unsigned SENDB:1;
  unsigned SYNC:1;
  unsigned TXEN:1;
  unsigned TX9:1;
  unsigned CSRC:1;
} TXSTAbits;
extern volatile near unsigned char       TXREG;
extern volatile near unsigned char       RCREG;
extern volatile near unsigned char       SPBRG;
extern volatile near unsigned char       SPBRGH;
extern volatile near unsigned char       T3CON;
extern volatile near union {
  struct {
    unsigned TMR3ON:1;
    unsigned TMR3CS:1;
    unsigned NOT_T3SYNC:1;
    unsigned T3CCP1:1;
    unsigned T3CKPS:2;
    unsigned T3CCP2:1;
    unsigned RD16:1;
  };
  struct {
    unsigned :2;
    unsigned T3SYNC:1;
    unsigned :1;
    unsigned T3CKPS0:1;
    unsigned T3CKPS1:1;
  };
  struct {
    unsigned :2;
    unsigned T3NSYNC:1;
  };
} T3CONbits;
extern volatile near unsigned char       TMR3L;
extern volatile near unsigned char       TMR3H;
extern volatile near unsigned char       CMCON;
extern volatile near union {
  struct {
    unsigned CM:3;
    unsigned CIS:1;
    unsigned C1INV:1;
    unsigned C2INV:1;
    unsigned C1OUT:1;
    unsigned C2OUT:1;
  };
  struct {
    unsigned CM0:1;
    unsigned CM1:1;
    unsigned CM2:1;
  };
} CMCONbits;
extern volatile near unsigned char       CVRCON;
extern volatile near union {
  struct {
    unsigned CVR:4;
    unsigned CVRSS:1;
    unsigned CVRR:1;
    unsigned CVROE:1;
    unsigned CVREN:1;
  };
  struct {
    unsigned CVR0:1;
    unsigned CVR1:1;
    unsigned CVR2:1;
    unsigned CVR3:1;
    unsigned CVREF:1;
  };
} CVRCONbits;
extern volatile near unsigned char       CCP1AS;
extern volatile near union {
  struct {
    unsigned :2;
    unsigned PSSAC:2;
    unsigned ECCPAS:3;
    unsigned ECCPASE:1;
  };
  struct {
    unsigned :2;
    unsigned PSSAC0:1;
    unsigned PSSAC1:1;
    unsigned ECCPAS0:1;
    unsigned ECCPAS1:1;
    unsigned ECCPAS2:1;
  };
} CCP1ASbits;
extern volatile near unsigned char       ECCP1AS;
extern volatile near union {
  struct {
    unsigned :2;
    unsigned PSSAC:2;
    unsigned ECCPAS:3;
    unsigned ECCPASE:1;
  };
  struct {
    unsigned :2;
    unsigned PSSAC0:1;
    unsigned PSSAC1:1;
    unsigned ECCPAS0:1;
    unsigned ECCPAS1:1;
    unsigned ECCPAS2:1;
  };
} ECCP1ASbits;
extern volatile near unsigned char       CCP1DEL;
extern volatile near struct {
  unsigned :7;
  unsigned PRSEN:1;
} CCP1DELbits;
extern volatile near unsigned char       ECCP1DEL;
extern volatile near struct {
  unsigned :7;
  unsigned PRSEN:1;
} ECCP1DELbits;
extern volatile near unsigned char       BAUDCON;
extern volatile near union {
  struct {
    unsigned ABDEN:1;
    unsigned WUE:1;
    unsigned :1;
    unsigned BRG16:1;
    unsigned TXCKP:1;
    unsigned RXDTP:1;
    unsigned RCIDL:1;
    unsigned ABDOVF:1;
  };
  struct {
    unsigned :4;
    unsigned SCKP:1;
    unsigned :1;
    unsigned RCMT:1;
  };
} BAUDCONbits;
extern volatile near unsigned char       BAUDCTL;
extern volatile near union {
  struct {
    unsigned ABDEN:1;
    unsigned WUE:1;
    unsigned :1;
    unsigned BRG16:1;
    unsigned TXCKP:1;
    unsigned RXDTP:1;
    unsigned RCIDL:1;
    unsigned ABDOVF:1;
  };
  struct {
    unsigned :4;
    unsigned SCKP:1;
    unsigned :1;
    unsigned RCMT:1;
  };
} BAUDCTLbits;
extern volatile near unsigned char       CCP2CON;
extern volatile near union {
  struct {
    unsigned CCP2M:4;
    unsigned DC2B:2;
  };
  struct {
    unsigned CCP2M0:1;
    unsigned CCP2M1:1;
    unsigned CCP2M2:1;
    unsigned CCP2M3:1;
    unsigned DC2B0:1;
    unsigned DC2B1:1;
  };
} CCP2CONbits;
extern volatile near unsigned            CCPR2;
extern volatile near unsigned char       CCPR2L;
extern volatile near unsigned char       CCPR2H;
extern volatile near unsigned char       CCP1CON;
extern volatile near union {
  struct {
    unsigned CCP1M:4;
    unsigned DC1B:2;
  };
  struct {
    unsigned CCP1M0:1;
    unsigned CCP1M1:1;
    unsigned CCP1M2:1;
    unsigned CCP1M3:1;
    unsigned DC1B0:1;
    unsigned DC1B1:1;
  };
} CCP1CONbits;
extern volatile near unsigned            CCPR1;
extern volatile near unsigned char       CCPR1L;
extern volatile near unsigned char       CCPR1H;
extern volatile near unsigned char       ADCON2;
extern volatile near union {
  struct {
    unsigned ADCS:3;
    unsigned ACQT:3;
    unsigned :1;
    unsigned ADFM:1;
  };
  struct {
    unsigned ADCS0:1;
    unsigned ADCS1:1;
    unsigned ADCS2:1;
    unsigned ACQT0:1;
    unsigned ACQT1:1;
    unsigned ACQT2:1;
  };
} ADCON2bits;
extern volatile near unsigned char       ADCON1;
extern volatile near union {
  struct {
    unsigned PCFG:4;
    unsigned VCFG:2;
  };
  struct {
    unsigned PCFG0:1;
    unsigned PCFG1:1;
    unsigned PCFG2:1;
    unsigned PCFG3:1;
    unsigned VCFG0:1;
    unsigned VCFG1:1;
  };
} ADCON1bits;
extern volatile near unsigned char       ADCON0;
extern volatile near union {
  struct {
    unsigned ADON:1;
    unsigned GO_NOT_DONE:1;
    unsigned CHS:4;
  };
  struct {
    unsigned :1;
    unsigned GO_DONE:1;
    unsigned CHS0:1;
    unsigned CHS1:1;
    unsigned CHS2:1;
    unsigned CHS3:1;
  };
  struct {
    unsigned :1;
    unsigned DONE:1;
  };
  struct {
    unsigned :1;
    unsigned GO:1;
  };
  struct {
    unsigned :1;
    unsigned NOT_DONE:1;
  };
} ADCON0bits;
extern volatile near unsigned            ADRES;
extern volatile near unsigned char       ADRESL;
extern volatile near unsigned char       ADRESH;
extern volatile near unsigned char       SSPCON2;
extern volatile near struct {
  unsigned SEN:1;
  unsigned RSEN:1;
  unsigned PEN:1;
  unsigned RCEN:1;
  unsigned ACKEN:1;
  unsigned ACKDT:1;
  unsigned ACKSTAT:1;
  unsigned GCEN:1;
} SSPCON2bits;
extern volatile near unsigned char       SSPCON1;
extern volatile near union {
  struct {
    unsigned SSPM:4;
    unsigned CKP:1;
    unsigned SSPEN:1;
    unsigned SSPOV:1;
    unsigned WCOL:1;
  };
  struct {
    unsigned SSPM0:1;
    unsigned SSPM1:1;
    unsigned SSPM2:1;
    unsigned SSPM3:1;
  };
} SSPCON1bits;
extern volatile near unsigned char       SSPSTAT;
extern volatile near union {
  struct {
    unsigned BF:1;
    unsigned UA:1;
    unsigned R_NOT_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_NOT_A:1;
    unsigned CKE:1;
    unsigned SMP:1;
  };
  struct {
    unsigned :2;
    unsigned R_W:1;
    unsigned :2;
    unsigned D_A:1;
  };
  struct {
    unsigned :2;
    unsigned I2C_READ:1;
    unsigned I2C_START:1;
    unsigned I2C_STOP:1;
    unsigned I2C_DAT:1;
  };
  struct {
    unsigned :2;
    unsigned NOT_W:1;
    unsigned :2;
    unsigned NOT_A:1;
  };
  struct {
    unsigned :2;
    unsigned NOT_WRITE:1;
    unsigned :2;
    unsigned NOT_ADDRESS:1;
  };
  struct {
    unsigned :2;
    unsigned READ_WRITE:1;
    unsigned :2;
    unsigned DATA_ADDRESS:1;
  };
  struct {
    unsigned :2;
    unsigned R:1;
    unsigned :2;
    unsigned D:1;
  };
} SSPSTATbits;
extern volatile near unsigned char       SSPADD;
extern volatile near unsigned char       SSPBUF;
extern volatile near unsigned char       T2CON;
extern volatile near union {
  struct {
    unsigned T2CKPS:2;
    unsigned TMR2ON:1;
    unsigned TOUTPS:4;
  };
  struct {
    unsigned T2CKPS0:1;
    unsigned T2CKPS1:1;
    unsigned :1;
    unsigned T2OUTPS0:1;
    unsigned T2OUTPS1:1;
    unsigned T2OUTPS2:1;
    unsigned T2OUTPS3:1;
  };
  struct {
    unsigned :3;
    unsigned TOUTPS0:1;
    unsigned TOUTPS1:1;
    unsigned TOUTPS2:1;
    unsigned TOUTPS3:1;
  };
} T2CONbits;
extern volatile near unsigned char       PR2;
extern volatile near unsigned char       TMR2;
extern volatile near unsigned char       T1CON;
extern volatile near union {
  struct {
    unsigned TMR1ON:1;
    unsigned TMR1CS:1;
    unsigned NOT_T1SYNC:1;
    unsigned T1OSCEN:1;
    unsigned T1CKPS:2;
    unsigned T1RUN:1;
    unsigned RD16:1;
  };
  struct {
    unsigned :2;
    unsigned T1SYNC:1;
    unsigned :1;
    unsigned T1CKPS0:1;
    unsigned T1CKPS1:1;
  };
} T1CONbits;
extern volatile near unsigned char       TMR1L;
extern volatile near unsigned char       TMR1H;
extern volatile near unsigned char       RCON;
extern volatile near union {
  struct {
    unsigned NOT_BOR:1;
    unsigned NOT_POR:1;
    unsigned NOT_PD:1;
    unsigned NOT_TO:1;
    unsigned NOT_RI:1;
    unsigned :1;
    unsigned SBOREN:1;
    unsigned IPEN:1;
  };
  struct {
    unsigned BOR:1;
    unsigned POR:1;
    unsigned PD:1;
    unsigned TO:1;
    unsigned RI:1;
    unsigned :2;
    unsigned NOT_IPEN:1;
  };
} RCONbits;
extern volatile near unsigned char       WDTCON;
extern volatile near union {
  struct {
    unsigned SWDTEN:1;
  };
  struct {
    unsigned SWDTE:1;
  };
} WDTCONbits;
extern volatile near unsigned char       HLVDCON;
extern volatile near union {
  struct {
    unsigned HLVDL:4;
    unsigned HLVDEN:1;
    unsigned IRVST:1;
    unsigned :1;
    unsigned VDIRMAG:1;
  };
  struct {
    unsigned HLVDL0:1;
    unsigned HLVDL1:1;
    unsigned HLVDL2:1;
    unsigned HLVDL3:1;
  };
  struct {
    unsigned LVDL0:1;
    unsigned LVDL1:1;
    unsigned LVDL2:1;
    unsigned LVDL3:1;
    unsigned LVDEN:1;
    unsigned IVRST:1;
  };
  struct {
    unsigned LVV0:1;
    unsigned LVV1:1;
    unsigned LVV2:1;
    unsigned LVV3:1;
    unsigned :1;
    unsigned BGST:1;
  };
} HLVDCONbits;
extern volatile near unsigned char       LVDCON;
extern volatile near union {
  struct {
    unsigned HLVDL:4;
    unsigned HLVDEN:1;
    unsigned IRVST:1;
    unsigned :1;
    unsigned VDIRMAG:1;
  };
  struct {
    unsigned HLVDL0:1;
    unsigned HLVDL1:1;
    unsigned HLVDL2:1;
    unsigned HLVDL3:1;
  };
  struct {
    unsigned LVDL0:1;
    unsigned LVDL1:1;
    unsigned LVDL2:1;
    unsigned LVDL3:1;
    unsigned LVDEN:1;
    unsigned IVRST:1;
  };
  struct {
    unsigned LVV0:1;
    unsigned LVV1:1;
    unsigned LVV2:1;
    unsigned LVV3:1;
    unsigned :1;
    unsigned BGST:1;
  };
} LVDCONbits;
extern volatile near unsigned char       OSCCON;
extern volatile near union {
  struct {
    unsigned SCS:2;
    unsigned IOFS:1;
    unsigned OSTS:1;
    unsigned IRCF:3;
    unsigned IDLEN:1;
  };
  struct {
    unsigned SCS0:1;
    unsigned SCS1:1;
    unsigned FLTS:1;
    unsigned :1;
    unsigned IRCF0:1;
    unsigned IRCF1:1;
    unsigned IRCF2:1;
  };
} OSCCONbits;
extern volatile near unsigned char       T0CON;
extern volatile near union {
  struct {
    unsigned T0PS:3;
    unsigned PSA:1;
    unsigned T0SE:1;
    unsigned T0CS:1;
    unsigned T08BIT:1;
    unsigned TMR0ON:1;
  };
  struct {
    unsigned T0PS0:1;
    unsigned T0PS1:1;
    unsigned T0PS2:1;
  };
} T0CONbits;
extern volatile near unsigned char       TMR0L;
extern volatile near unsigned char       TMR0H;
extern          near unsigned char       STATUS;
extern          near struct {
  unsigned C:1;
  unsigned DC:1;
  unsigned Z:1;
  unsigned OV:1;
  unsigned N:1;
} STATUSbits;
extern          near unsigned            FSR2;
extern          near unsigned char       FSR2L;
extern          near unsigned char       FSR2H;
extern volatile near unsigned char       PLUSW2;
extern volatile near unsigned char       PREINC2;
extern volatile near unsigned char       POSTDEC2;
extern volatile near unsigned char       POSTINC2;
extern          near unsigned char       INDF2;
extern          near unsigned char       BSR;
extern          near unsigned            FSR1;
extern          near unsigned char       FSR1L;
extern          near unsigned char       FSR1H;
extern volatile near unsigned char       PLUSW1;
extern volatile near unsigned char       PREINC1;
extern volatile near unsigned char       POSTDEC1;
extern volatile near unsigned char       POSTINC1;
extern          near unsigned char       INDF1;
extern          near unsigned char       WREG;
extern          near unsigned            FSR0;
extern          near unsigned char       FSR0L;
extern          near unsigned char       FSR0H;
extern volatile near unsigned char       PLUSW0;
extern volatile near unsigned char       PREINC0;
extern volatile near unsigned char       POSTDEC0;
extern volatile near unsigned char       POSTINC0;
extern          near unsigned char       INDF0;
extern volatile near unsigned char       INTCON3;
extern volatile near union {
  struct {
    unsigned INT1IF:1;
    unsigned INT2IF:1;
    unsigned :1;
    unsigned INT1IE:1;
    unsigned INT2IE:1;
    unsigned :1;
    unsigned INT1IP:1;
    unsigned INT2IP:1;
  };
  struct {
    unsigned INT1F:1;
    unsigned INT2F:1;
    unsigned :1;
    unsigned INT1E:1;
    unsigned INT2E:1;
    unsigned :1;
    unsigned INT1P:1;
    unsigned INT2P:1;
  };
} INTCON3bits;
extern volatile near unsigned char       INTCON2;
extern volatile near union {
  struct {
    unsigned RBIP:1;
    unsigned :1;
    unsigned TMR0IP:1;
    unsigned :1;
    unsigned INTEDG2:1;
    unsigned INTEDG1:1;
    unsigned INTEDG0:1;
    unsigned NOT_RBPU:1;
  };
  struct {
    unsigned :2;
    unsigned T0IP:1;
    unsigned :4;
    unsigned RBPU:1;
  };
} INTCON2bits;
extern volatile near unsigned char       INTCON;
extern volatile near union {
  struct {
    unsigned RBIF:1;
    unsigned INT0IF:1;
    unsigned TMR0IF:1;
    unsigned RBIE:1;
    unsigned INT0IE:1;
    unsigned TMR0IE:1;
    unsigned PEIE_GIEL:1;
    unsigned GIE_GIEH:1;
  };
  struct {
    unsigned :1;
    unsigned INT0F:1;
    unsigned T0IF:1;
    unsigned :1;
    unsigned INT0E:1;
    unsigned T0IE:1;
    unsigned PEIE:1;
    unsigned GIE:1;
  };
  struct {
    unsigned :6;
    unsigned GIEL:1;
    unsigned GIEH:1;
  };
} INTCONbits;
extern          near unsigned            PROD;
extern          near unsigned char       PRODL;
extern          near unsigned char       PRODH;
extern volatile near unsigned char       TABLAT;
extern volatile near unsigned short long TBLPTR;
extern volatile near unsigned char       TBLPTRL;
extern volatile near unsigned char       TBLPTRH;
extern volatile near unsigned char       TBLPTRU;
extern volatile near unsigned short long PC;
extern volatile near unsigned char       PCL;
extern volatile near unsigned char       PCLATH;
extern volatile near unsigned char       PCLATU;
extern volatile near unsigned char       STKPTR;
extern volatile near union {
  struct {
    unsigned STKPTR:5;
    unsigned :1;
    unsigned STKUNF:1;
    unsigned STKFUL:1;
  };
  struct {
    unsigned STKPTR0:1;
    unsigned STKPTR1:1;
    unsigned STKPTR2:1;
    unsigned STKPTR3:1;
    unsigned STKPTR4:1;
  };
  struct {
    unsigned :7;
    unsigned STKOVF:1;
  };
} STKPTRbits;
extern          near unsigned short long TOS;
extern          near unsigned char       TOSL;
extern          near unsigned char       TOSH;
extern          near unsigned char       TOSU;



#line 1290 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
 
#line 1292 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1293 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"


#line 1296 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
 
#line 1298 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1299 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1300 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1301 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"

#line 1303 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1304 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1305 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1306 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 1307 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"


#line 1311 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
 
#line 1313 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"


#line 1316 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f2550.h"
#line 8 "ignition.c"

                          
#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"

#line 3 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"


#line 13 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"
 

 
#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"

#line 3 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"

#line 5 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 7 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 9 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 11 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 13 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 15 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 17 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 19 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 21 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 23 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 25 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 27 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 29 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 31 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 33 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 35 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"

#line 5 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
 


#line 9 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"

extern volatile far  unsigned char       UEP0;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP0bits;
extern volatile far  unsigned char       UEP1;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP1bits;
extern volatile far  unsigned char       UEP2;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP2bits;
extern volatile far  unsigned char       UEP3;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP3bits;
extern volatile far  unsigned char       UEP4;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP4bits;
extern volatile far  unsigned char       UEP5;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP5bits;
extern volatile far  unsigned char       UEP6;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP6bits;
extern volatile far  unsigned char       UEP7;
extern volatile far  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP7bits;
extern volatile far  unsigned char       UEIE;
extern volatile far  struct {
  unsigned PIDEE:1;
  unsigned CRC5EE:1;
  unsigned CRC16EE:1;
  unsigned DFN8EE:1;
  unsigned BTOEE:1;
  unsigned :2;
  unsigned BTSEE:1;
} UEIEbits;
extern volatile far  unsigned char       UADDR;
extern volatile far  union {
  struct {
    unsigned ADDR:7;
  };
  struct {
    unsigned ADDR0:1;
    unsigned ADDR1:1;
    unsigned ADDR2:1;
    unsigned ADDR3:1;
    unsigned ADDR4:1;
    unsigned ADDR5:1;
    unsigned ADDR6:1;
  };
} UADDRbits;
extern volatile far  unsigned char       UFRML;
extern volatile far  union {
  struct {
    unsigned FRML:8;
  };
  struct {
    unsigned FRM0:1;
    unsigned FRM1:1;
    unsigned FRM2:1;
    unsigned FRM3:1;
    unsigned FRM4:1;
    unsigned FRM5:1;
    unsigned FRM6:1;
    unsigned FRM7:1;
  };
} UFRMLbits;
extern volatile far  unsigned char       UFRMH;
extern volatile far  union {
  struct {
    unsigned FRMH:3;
  };
  struct {
    unsigned FRM8:1;
    unsigned FRM9:1;
    unsigned FRM10:1;
  };
} UFRMHbits;
extern volatile far  unsigned char       UEIR;
extern volatile far  struct {
  unsigned PIDEF:1;
  unsigned CRC5EF:1;
  unsigned CRC16EF:1;
  unsigned DFN8EF:1;
  unsigned BTOEF:1;
  unsigned :2;
  unsigned BTSEF:1;
} UEIRbits;
extern volatile near unsigned char       UIE;
extern volatile near struct {
  unsigned URSTIE:1;
  unsigned UERRIE:1;
  unsigned ACTVIE:1;
  unsigned TRNIE:1;
  unsigned IDLEIE:1;
  unsigned STALLIE:1;
  unsigned SOFIE:1;
} UIEbits;
extern volatile near unsigned char       UCFG;
extern volatile near struct {
  unsigned PPB0:1;
  unsigned PPB1:1;
  unsigned FSEN:1;
  unsigned :1;
  unsigned UPUEN:1;
  unsigned :2;
  unsigned UTEYE:1;
} UCFGbits;
extern volatile near unsigned char       UIR;
extern volatile near struct {
  unsigned URSTIF:1;
  unsigned UERRIF:1;
  unsigned ACTVIF:1;
  unsigned TRNIF:1;
  unsigned IDLEIF:1;
  unsigned STALLIF:1;
  unsigned SOFIF:1;
} UIRbits;
extern volatile near unsigned char       USTAT;
extern volatile near struct {
  unsigned :1;
  unsigned PPBI:1;
  unsigned DIR:1;
  unsigned ENDP0:1;
  unsigned ENDP1:1;
  unsigned ENDP2:1;
  unsigned ENDP3:1;
} USTATbits;
extern volatile near unsigned char       UCON;
extern volatile near struct {
  unsigned :1;
  unsigned SUSPND:1;
  unsigned RESUME:1;
  unsigned USBEN:1;
  unsigned PKTDIS:1;
  unsigned SE0:1;
  unsigned PPBRST:1;
} UCONbits;
extern volatile near unsigned char       SRCON0;
extern volatile near union {
  struct {
    unsigned SRPR:1;
    unsigned SRPS:1;
    unsigned SRNQEN:1;
    unsigned SRQEN:1;
    unsigned SRCLK:3;
    unsigned SRLEN:1;
  };
  struct {
    unsigned :4;
    unsigned SRCLK0:1;
    unsigned SRCLK1:1;
    unsigned SRCLK2:1;
  };
} SRCON0bits;
extern volatile near unsigned char       SRCON1;
extern volatile near struct {
  unsigned SRRC1E:1;
  unsigned SRRC2E:1;
  unsigned SRRCKE:1;
  unsigned SRRPE:1;
  unsigned SRSC1E:1;
  unsigned SRSC2E:1;
  unsigned SRSCKE:1;
  unsigned SRSPE:1;
} SRCON1bits;
extern volatile near unsigned char       CM2CON0;
extern volatile near union {
  struct {
    unsigned C2CH:2;
    unsigned C2R:1;
    unsigned C2SP:1;
    unsigned C2POL:1;
    unsigned C2OE:1;
    unsigned C2OUT:1;
    unsigned C2ON:1;
  };
  struct {
    unsigned C2CH0:1;
    unsigned C2CH1:1;
  };
} CM2CON0bits;
extern volatile near unsigned char       CM2CON1;
extern volatile near struct {
  unsigned C2SYNC:1;
  unsigned C1SYNC:1;
  unsigned C2HYS:1;
  unsigned C1HYS:1;
  unsigned C2RSEL:1;
  unsigned C1RSEL:1;
  unsigned MC2OUT:1;
  unsigned MC1OUT:1;
} CM2CON1bits;
extern volatile near unsigned char       CM1CON0;
extern volatile near union {
  struct {
    unsigned C1CH:2;
    unsigned C1R:1;
    unsigned C1SP:1;
    unsigned C1POL:1;
    unsigned C1OE:1;
    unsigned C1OUT:1;
    unsigned C1ON:1;
  };
  struct {
    unsigned C1CH0:1;
    unsigned C1CH1:1;
  };
} CM1CON0bits;
extern volatile near unsigned char       SSPMSK;
extern volatile near union {
  struct {
    unsigned MSK:8;
  };
  struct {
    unsigned MSK0:1;
    unsigned MSK1:1;
    unsigned MSK2:1;
    unsigned MSK3:1;
    unsigned MSK4:1;
    unsigned MSK5:1;
    unsigned MSK6:1;
    unsigned MSK7:1;
  };
} SSPMSKbits;
extern volatile near unsigned char       SLRCON;
extern volatile near struct {
  unsigned SLRA:1;
  unsigned SLRB:1;
  unsigned SLRC:1;
} SLRCONbits;
extern volatile near unsigned char       WPUA;
extern volatile near struct {
  unsigned :3;
  unsigned WPUA3:1;
  unsigned WPUA4:1;
  unsigned WPUA5:1;
} WPUAbits;
extern volatile near unsigned char       WPUB;
extern volatile near struct {
  unsigned :4;
  unsigned WPUB4:1;
  unsigned WPUB5:1;
  unsigned WPUB6:1;
  unsigned WPUB7:1;
} WPUBbits;
extern volatile near unsigned char       IOCA;
extern volatile near struct {
  unsigned IOCA0:1;
  unsigned IOCA1:1;
  unsigned :1;
  unsigned IOCA3:1;
  unsigned IOCA4:1;
  unsigned IOCA5:1;
} IOCAbits;
extern volatile near unsigned char       IOCB;
extern volatile near struct {
  unsigned :4;
  unsigned IOCB4:1;
  unsigned IOCB5:1;
  unsigned IOCB6:1;
  unsigned IOCB7:1;
} IOCBbits;
extern volatile near unsigned char       ANSEL;
extern volatile near struct {
  unsigned :3;
  unsigned ANS3:1;
  unsigned ANS4:1;
  unsigned ANS5:1;
  unsigned ANS6:1;
  unsigned ANS7:1;
} ANSELbits;
extern volatile near unsigned char       ANSELH;
extern volatile near struct {
  unsigned ANS8:1;
  unsigned ANS9:1;
  unsigned ANS10:1;
  unsigned ANS11:1;
} ANSELHbits;
extern volatile near unsigned char       PORTA;
extern volatile near union {
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned :1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
  };
  struct {
    unsigned :4;
    unsigned AN3:1;
  };
  struct {
    unsigned :4;
    unsigned OSC2:1;
    unsigned OSC1:1;
  };
  struct {
    unsigned :4;
    unsigned CLKOUT:1;
    unsigned CLKIN:1;
  };
} PORTAbits;
extern volatile near unsigned char       PORTB;
extern volatile near union {
  struct {
    unsigned :4;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
  struct {
    unsigned :4;
    unsigned SDI:1;
    unsigned RX:1;
    unsigned SCL:1;
    unsigned TX:1;
  };
  struct {
    unsigned :4;
    unsigned SDA:1;
    unsigned DT:1;
    unsigned SCK:1;
    unsigned CK:1;
  };
  struct {
    unsigned :4;
    unsigned AN10:1;
    unsigned AN11:1;
  };
} PORTBbits;
extern volatile near unsigned char       PORTC;
extern volatile near union {
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned RC3:1;
    unsigned RC4:1;
    unsigned RC5:1;
    unsigned RC6:1;
    unsigned RC7:1;
  };
  struct {
    unsigned AN4:1;
    unsigned AN5:1;
    unsigned AN6:1;
    unsigned AN7:1;
    unsigned :2;
    unsigned AN8:1;
    unsigned AN9:1;
  };
  struct {
    unsigned C12INP:1;
    unsigned C12IN1M:1;
    unsigned C12IN2M:1;
    unsigned C12IN3M:1;
    unsigned C12OUT:1;
    unsigned CCP1:1;
    unsigned NOT_SS:1;
  };
  struct {
    unsigned INT0:1;
    unsigned INT1:1;
    unsigned INT2:1;
    unsigned PGM:1;
    unsigned SRQ:1;
    unsigned T0CKI:1;
    unsigned T13CKI:1;
    unsigned T1OSCO:1;
  };
  struct {
    unsigned VREFP:1;
    unsigned VREFM:1;
    unsigned CVREF:1;
    unsigned :3;
    unsigned T1OSCI:1;
  };
  struct {
    unsigned :2;
    unsigned P1D:1;
    unsigned P1C:1;
    unsigned P1B:1;
    unsigned P1A:1;
    unsigned SS:1;
    unsigned SDO:1;
  };
} PORTCbits;
extern volatile near unsigned char       LATA;
extern volatile near struct {
  unsigned :4;
  unsigned LATA4:1;
  unsigned LATA5:1;
} LATAbits;
extern volatile near unsigned char       LATB;
extern volatile near struct {
  unsigned :4;
  unsigned LATB4:1;
  unsigned LATB5:1;
  unsigned LATB6:1;
  unsigned LATB7:1;
} LATBbits;
extern volatile near unsigned char       LATC;
extern volatile near struct {
  unsigned LATC0:1;
  unsigned LATC1:1;
  unsigned LATC2:1;
  unsigned LATC3:1;
  unsigned LATC4:1;
  unsigned LATC5:1;
  unsigned LATC6:1;
  unsigned LATC7:1;
} LATCbits;
extern volatile near unsigned char       DDRA;
extern volatile near union {
  struct {
    unsigned :4;
    unsigned TRISA4:1;
    unsigned TRISA5:1;
  };
  struct {
    unsigned :4;
    unsigned RA4:1;
    unsigned RA5:1;
  };
} DDRAbits;
extern volatile near unsigned char       TRISA;
extern volatile near union {
  struct {
    unsigned :4;
    unsigned TRISA4:1;
    unsigned TRISA5:1;
  };
  struct {
    unsigned :4;
    unsigned RA4:1;
    unsigned RA5:1;
  };
} TRISAbits;
extern volatile near unsigned char       DDRB;
extern volatile near union {
  struct {
    unsigned :4;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
  };
  struct {
    unsigned :4;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
} DDRBbits;
extern volatile near unsigned char       TRISB;
extern volatile near union {
  struct {
    unsigned :4;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
  };
  struct {
    unsigned :4;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
} TRISBbits;
extern volatile near unsigned char       DDRC;
extern volatile near union {
  struct {
    unsigned TRISC0:1;
    unsigned TRISC1:1;
    unsigned TRISC2:1;
    unsigned TRISC3:1;
    unsigned TRISC4:1;
    unsigned TRISC5:1;
    unsigned TRISC6:1;
    unsigned TRISC7:1;
  };
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned RC3:1;
    unsigned RC4:1;
    unsigned RC5:1;
    unsigned RC6:1;
    unsigned RC7:1;
  };
} DDRCbits;
extern volatile near unsigned char       TRISC;
extern volatile near union {
  struct {
    unsigned TRISC0:1;
    unsigned TRISC1:1;
    unsigned TRISC2:1;
    unsigned TRISC3:1;
    unsigned TRISC4:1;
    unsigned TRISC5:1;
    unsigned TRISC6:1;
    unsigned TRISC7:1;
  };
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned RC3:1;
    unsigned RC4:1;
    unsigned RC5:1;
    unsigned RC6:1;
    unsigned RC7:1;
  };
} TRISCbits;
extern volatile near unsigned char       OSCTUNE;
extern volatile near union {
  struct {
    unsigned TUN:6;
    unsigned SPLLEN:1;
    unsigned INTSRC:1;
  };
  struct {
    unsigned TUN0:1;
    unsigned TUN1:1;
    unsigned TUN2:1;
    unsigned TUN3:1;
    unsigned TUN4:1;
    unsigned TUN5:1;
  };
} OSCTUNEbits;
extern volatile near unsigned char       PIE1;
extern volatile near struct {
  unsigned TMR1IE:1;
  unsigned TMR2IE:1;
  unsigned CCP1IE:1;
  unsigned SSPIE:1;
  unsigned TXIE:1;
  unsigned RCIE:1;
  unsigned ADIE:1;
} PIE1bits;
extern volatile near unsigned char       PIR1;
extern volatile near struct {
  unsigned TMR1IF:1;
  unsigned TMR2IF:1;
  unsigned CCP1IF:1;
  unsigned SSPIF:1;
  unsigned TXIF:1;
  unsigned RCIF:1;
  unsigned ADIF:1;
} PIR1bits;
extern volatile near unsigned char       IPR1;
extern volatile near struct {
  unsigned TMR1IP:1;
  unsigned TMR2IP:1;
  unsigned CCP1IP:1;
  unsigned SSPIP:1;
  unsigned TXIP:1;
  unsigned RCIP:1;
  unsigned ADIP:1;
} IPR1bits;
extern volatile near unsigned char       PIE2;
extern volatile near struct {
  unsigned :1;
  unsigned TMR3IE:1;
  unsigned USBIE:1;
  unsigned BCLIE:1;
  unsigned EEIE:1;
  unsigned C2IE:1;
  unsigned C1IE:1;
  unsigned OSCFIE:1;
} PIE2bits;
extern volatile near unsigned char       PIR2;
extern volatile near struct {
  unsigned :1;
  unsigned TMR3IF:1;
  unsigned USBIF:1;
  unsigned BCLIF:1;
  unsigned EEIF:1;
  unsigned C2IF:1;
  unsigned C1IF:1;
  unsigned OSCFIF:1;
} PIR2bits;
extern volatile near unsigned char       IPR2;
extern volatile near struct {
  unsigned :1;
  unsigned TMR3IP:1;
  unsigned USBIP:1;
  unsigned BCLIP:1;
  unsigned EEIP:1;
  unsigned C2IP:1;
  unsigned C1IP:1;
  unsigned OSCFIP:1;
} IPR2bits;
extern volatile near unsigned char       EECON1;
extern volatile near struct {
  unsigned RD:1;
  unsigned WR:1;
  unsigned WREN:1;
  unsigned WRERR:1;
  unsigned FREE:1;
  unsigned :1;
  unsigned CFGS:1;
  unsigned EEPGD:1;
} EECON1bits;
extern volatile near unsigned char       EECON2;
extern volatile near unsigned char       EEDATA;
extern volatile near unsigned char       EEADR;
extern volatile near struct {
  unsigned EEADR0:1;
  unsigned EEADR1:1;
  unsigned EEADR2:1;
  unsigned EEADR3:1;
  unsigned EEADR4:1;
  unsigned EEADR5:1;
  unsigned EEADR6:1;
  unsigned EEADR7:1;
} EEADRbits;
extern volatile near unsigned char       RCSTA;
extern volatile near union {
  struct {
    unsigned RX9D:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned ADDEN:1;
    unsigned CREN:1;
    unsigned SREN:1;
    unsigned RX9:1;
    unsigned SPEN:1;
  };
  struct {
    unsigned :3;
    unsigned ADEN:1;
  };
} RCSTAbits;
extern volatile near unsigned char       TXSTA;
extern volatile near struct {
  unsigned TX9D:1;
  unsigned TRMT:1;
  unsigned BRGH:1;
  unsigned SENDB:1;
  unsigned SYNC:1;
  unsigned TXEN:1;
  unsigned TX9:1;
  unsigned CSRC:1;
} TXSTAbits;
extern volatile near unsigned char       TXREG;
extern volatile near unsigned char       RCREG;
extern volatile near unsigned char       SPBRG;
extern volatile near unsigned char       SPBRGH;
extern volatile near unsigned char       T3CON;
extern volatile near union {
  struct {
    unsigned TMR3ON:1;
    unsigned TMR3CS:1;
    unsigned NOT_T3SYNC:1;
    unsigned T3CCP1:1;
    unsigned T3CKPS:2;
    unsigned :1;
    unsigned RD16:1;
  };
  struct {
    unsigned :2;
    unsigned T3SYNC:1;
    unsigned :1;
    unsigned T3CKPS0:1;
    unsigned T3CKPS1:1;
  };
} T3CONbits;
extern volatile near unsigned char       TMR3L;
extern volatile near unsigned char       TMR3H;
extern volatile near unsigned char       ECCP1AS;
extern volatile near union {
  struct {
    unsigned PSSBD:2;
    unsigned PSSAC:2;
    unsigned ECCPAS:3;
    unsigned ECCPASE:1;
  };
  struct {
    unsigned PSSBD0:1;
    unsigned PSSBD1:1;
    unsigned PSSAC0:1;
    unsigned PSSAC1:1;
    unsigned ECCPAS0:1;
    unsigned ECCPAS1:1;
    unsigned ECCPAS2:1;
  };
} ECCP1ASbits;
extern volatile near unsigned char       PWM1CON;
extern volatile near union {
  struct {
    unsigned PDC:7;
    unsigned PRSEN:1;
  };
  struct {
    unsigned PDC0:1;
    unsigned PDC1:1;
    unsigned PDC2:1;
    unsigned PDC3:1;
    unsigned PDC4:1;
    unsigned PDC5:1;
    unsigned PDC6:1;
  };
} PWM1CONbits;
extern volatile near unsigned char       BAUDCON;
extern volatile near union {
  struct {
    unsigned ABDEN:1;
    unsigned WUE:1;
    unsigned :1;
    unsigned BRG16:1;
    unsigned CKTXP:1;
    unsigned DTRXP:1;
    unsigned RCIDL:1;
    unsigned ABDOVF:1;
  };
  struct {
    unsigned :4;
    unsigned SCKP:1;
  };
} BAUDCONbits;
extern volatile near unsigned char       BAUDCTL;
extern volatile near union {
  struct {
    unsigned ABDEN:1;
    unsigned WUE:1;
    unsigned :1;
    unsigned BRG16:1;
    unsigned CKTXP:1;
    unsigned DTRXP:1;
    unsigned RCIDL:1;
    unsigned ABDOVF:1;
  };
  struct {
    unsigned :4;
    unsigned SCKP:1;
  };
} BAUDCTLbits;
extern volatile near unsigned char       PSTRCON;
extern volatile near struct {
  unsigned STRA:1;
  unsigned STRB:1;
  unsigned STRC:1;
  unsigned STRD:1;
  unsigned STRSYNC:1;
} PSTRCONbits;
extern volatile near unsigned char       REFCON0;
extern volatile near struct {
  unsigned :4;
  unsigned FVR1S0:1;
  unsigned FVR1S1:1;
  unsigned FVR1ST:1;
  unsigned FVR1EN:1;
} REFCON0bits;
extern volatile near unsigned char       VREFCON0;
extern volatile near struct {
  unsigned :4;
  unsigned FVR1S0:1;
  unsigned FVR1S1:1;
  unsigned FVR1ST:1;
  unsigned FVR1EN:1;
} VREFCON0bits;
extern volatile near unsigned char       REFCON1;
extern volatile near union {
  struct {
    unsigned D1NSS:1;
    unsigned :1;
    unsigned D1PSS:2;
    unsigned :1;
    unsigned DAC1OE:1;
    unsigned D1LPS:1;
    unsigned D1EN:1;
  };
  struct {
    unsigned :2;
    unsigned D1PSS0:1;
    unsigned D1PSS1:1;
  };
} REFCON1bits;
extern volatile near unsigned char       VREFCON1;
extern volatile near union {
  struct {
    unsigned D1NSS:1;
    unsigned :1;
    unsigned D1PSS:2;
    unsigned :1;
    unsigned DAC1OE:1;
    unsigned D1LPS:1;
    unsigned D1EN:1;
  };
  struct {
    unsigned :2;
    unsigned D1PSS0:1;
    unsigned D1PSS1:1;
  };
} VREFCON1bits;
extern volatile near unsigned char       REFCON2;
extern volatile near struct {
  unsigned DAC1R0:1;
  unsigned DAC1R1:1;
  unsigned DAC1R2:1;
  unsigned DAC1R3:1;
  unsigned DAC1R4:1;
} REFCON2bits;
extern volatile near unsigned char       VREFCON2;
extern volatile near struct {
  unsigned DAC1R0:1;
  unsigned DAC1R1:1;
  unsigned DAC1R2:1;
  unsigned DAC1R3:1;
  unsigned DAC1R4:1;
} VREFCON2bits;
extern volatile near unsigned char       CCP1CON;
extern volatile near union {
  struct {
    unsigned CCP1M:4;
    unsigned DC1B:2;
    unsigned P1M:2;
  };
  struct {
    unsigned CCP1M0:1;
    unsigned CCP1M1:1;
    unsigned CCP1M2:1;
    unsigned CCP1M3:1;
    unsigned DC1B0:1;
    unsigned DC1B1:1;
    unsigned P1M0:1;
    unsigned P1M1:1;
  };
} CCP1CONbits;
extern volatile near unsigned            CCPR1;
extern volatile near unsigned char       CCPR1L;
extern volatile near unsigned char       CCPR1H;
extern volatile near unsigned char       ADCON2;
extern volatile near union {
  struct {
    unsigned ADCS:3;
    unsigned ACQT:3;
    unsigned :1;
    unsigned ADFM:1;
  };
  struct {
    unsigned ADCS0:1;
    unsigned ADCS1:1;
    unsigned ADCS2:1;
    unsigned ACQT0:1;
    unsigned ACQT1:1;
    unsigned ACQT2:1;
  };
} ADCON2bits;
extern volatile near unsigned char       ADCON1;
extern volatile near struct {
  unsigned NVCFG0:1;
  unsigned NVCFG1:1;
  unsigned PVCFG0:1;
  unsigned PVCFG1:1;
} ADCON1bits;
extern volatile near unsigned char       ADCON0;
extern volatile near union {
  struct {
    unsigned ADON:1;
    unsigned GO_NOT_DONE:1;
    unsigned CHS:4;
  };
  struct {
    unsigned :1;
    unsigned GO:1;
    unsigned CHS0:1;
    unsigned CHS1:1;
    unsigned CHS2:1;
    unsigned CHS3:1;
  };
  struct {
    unsigned :1;
    unsigned DONE:1;
  };
  struct {
    unsigned :1;
    unsigned NOT_DONE:1;
  };
  struct {
    unsigned :1;
    unsigned GO_DONE:1;
  };
} ADCON0bits;
extern volatile near unsigned            ADRES;
extern volatile near unsigned char       ADRESL;
extern volatile near unsigned char       ADRESH;
extern volatile near unsigned char       SSPCON2;
extern volatile near struct {
  unsigned SEN:1;
  unsigned RSEN:1;
  unsigned PEN:1;
  unsigned RCEN:1;
  unsigned ACKEN:1;
  unsigned ACKDT:1;
  unsigned ACKSTAT:1;
  unsigned GCEN:1;
} SSPCON2bits;
extern volatile near unsigned char       SSPCON1;
extern volatile near union {
  struct {
    unsigned SSPM:4;
    unsigned CKP:1;
    unsigned SSPEN:1;
    unsigned SSPOV:1;
    unsigned WCOL:1;
  };
  struct {
    unsigned SSPM0:1;
    unsigned SSPM1:1;
    unsigned SSPM2:1;
    unsigned SSPM3:1;
  };
} SSPCON1bits;
extern volatile near unsigned char       SSPSTAT;
extern volatile near union {
  struct {
    unsigned BF:1;
    unsigned UA:1;
    unsigned R_NOT_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_NOT_A:1;
    unsigned CKE:1;
    unsigned SMP:1;
  };
  struct {
    unsigned :2;
    unsigned R:1;
    unsigned :2;
    unsigned D:1;
  };
  struct {
    unsigned :2;
    unsigned W:1;
    unsigned :2;
    unsigned A:1;
  };
  struct {
    unsigned :2;
    unsigned NOT_W:1;
    unsigned :2;
    unsigned NOT_A:1;
  };
  struct {
    unsigned :2;
    unsigned R_W:1;
    unsigned :2;
    unsigned D_A:1;
  };
  struct {
    unsigned :2;
    unsigned NOT_WRITE:1;
    unsigned :2;
    unsigned NOT_ADDRESS:1;
  };
} SSPSTATbits;
extern volatile near unsigned char       SSPADD;
extern volatile near unsigned char       SSPBUF;
extern volatile near unsigned char       T2CON;
extern volatile near union {
  struct {
    unsigned T2CKPS:2;
    unsigned TMR2ON:1;
    unsigned T2OUTPS:4;
  };
  struct {
    unsigned T2CKPS0:1;
    unsigned T2CKPS1:1;
    unsigned :1;
    unsigned T2OUTPS0:1;
    unsigned T2OUTPS1:1;
    unsigned T2OUTPS2:1;
    unsigned T2OUTPS3:1;
  };
} T2CONbits;
extern volatile near unsigned char       PR2;
extern volatile near unsigned char       TMR2;
extern volatile near unsigned char       T1CON;
extern volatile near union {
  struct {
    unsigned TMR1ON:1;
    unsigned TMR1CS:1;
    unsigned NOT_T1SYNC:1;
    unsigned T1OSCEN:1;
    unsigned T1CKPS:2;
    unsigned T1RUN:1;
    unsigned RD16:1;
  };
  struct {
    unsigned :2;
    unsigned T1SYNC:1;
    unsigned :1;
    unsigned T1CKPS0:1;
    unsigned T1CKPS1:1;
  };
} T1CONbits;
extern volatile near unsigned char       TMR1L;
extern volatile near unsigned char       TMR1H;
extern volatile near unsigned char       RCON;
extern volatile near union {
  struct {
    unsigned NOT_BOR:1;
    unsigned NOT_POR:1;
    unsigned NOT_PD:1;
    unsigned NOT_TO:1;
    unsigned NOT_RI:1;
    unsigned :1;
    unsigned SBOREN:1;
    unsigned IPEN:1;
  };
  struct {
    unsigned BOR:1;
    unsigned POR:1;
    unsigned PD:1;
    unsigned TO:1;
    unsigned RI:1;
  };
} RCONbits;
extern volatile near unsigned char       WDTCON;
extern volatile near union {
  struct {
    unsigned SWDTEN:1;
  };
  struct {
    unsigned SWDTE:1;
  };
} WDTCONbits;
extern volatile near unsigned char       OSCCON2;
extern volatile near struct {
  unsigned LFIOFS:1;
  unsigned HFIOFL:1;
  unsigned PRI_SD:1;
} OSCCON2bits;
extern volatile near unsigned char       OSCCON;
extern volatile near union {
  struct {
    unsigned SCS0:1;
    unsigned SCS1:1;
    unsigned IOFS:1;
    unsigned OSTS:1;
    unsigned IRCF:3;
    unsigned IDLEN:1;
  };
  struct {
    unsigned :4;
    unsigned IRCF0:1;
    unsigned IRCF1:1;
    unsigned IRCF2:1;
  };
} OSCCONbits;
extern volatile near unsigned char       T0CON;
extern volatile near union {
  struct {
    unsigned T0PS:3;
    unsigned PSA:1;
    unsigned T0SE:1;
    unsigned T0CS:1;
    unsigned T08BIT:1;
    unsigned TMR0ON:1;
  };
  struct {
    unsigned T0PS0:1;
    unsigned T0PS1:1;
    unsigned T0PS2:1;
  };
} T0CONbits;
extern volatile near unsigned char       TMR0L;
extern volatile near unsigned char       TMR0H;
extern          near unsigned char       STATUS;
extern          near struct {
  unsigned C:1;
  unsigned DC:1;
  unsigned Z:1;
  unsigned OV:1;
  unsigned N:1;
} STATUSbits;
extern          near unsigned            FSR2;
extern          near unsigned char       FSR2L;
extern          near unsigned char       FSR2H;
extern volatile near unsigned char       PLUSW2;
extern volatile near unsigned char       PREINC2;
extern volatile near unsigned char       POSTDEC2;
extern volatile near unsigned char       POSTINC2;
extern          near unsigned char       INDF2;
extern          near unsigned char       BSR;
extern          near unsigned            FSR1;
extern          near unsigned char       FSR1L;
extern          near unsigned char       FSR1H;
extern volatile near unsigned char       PLUSW1;
extern volatile near unsigned char       PREINC1;
extern volatile near unsigned char       POSTDEC1;
extern volatile near unsigned char       POSTINC1;
extern          near unsigned char       INDF1;
extern          near unsigned char       W;
extern          near unsigned char       WREG;
extern          near unsigned            FSR0;
extern          near unsigned char       FSR0L;
extern          near unsigned char       FSR0H;
extern volatile near unsigned char       PLUSW0;
extern volatile near unsigned char       PREINC0;
extern volatile near unsigned char       POSTDEC0;
extern volatile near unsigned char       POSTINC0;
extern          near unsigned char       INDF0;
extern volatile near unsigned char       INTCON3;
extern volatile near union {
  struct {
    unsigned INT1IF:1;
    unsigned INT2IF:1;
    unsigned :1;
    unsigned INT1IE:1;
    unsigned INT2IE:1;
    unsigned :1;
    unsigned INT1IP:1;
    unsigned INT2IP:1;
  };
  struct {
    unsigned INT1F:1;
    unsigned INT2F:1;
    unsigned :1;
    unsigned INT1E:1;
    unsigned INT2E:1;
    unsigned :1;
    unsigned INT1P:1;
    unsigned INT2P:1;
  };
} INTCON3bits;
extern volatile near unsigned char       INTCON2;
extern volatile near union {
  struct {
    unsigned RABIP:1;
    unsigned :1;
    unsigned TMR0IP:1;
    unsigned :1;
    unsigned INTEDG2:1;
    unsigned INTEDG1:1;
    unsigned INTEDG0:1;
    unsigned NOT_RABPU:1;
  };
  struct {
    unsigned :7;
    unsigned RABPU:1;
  };
} INTCON2bits;
extern volatile near unsigned char       INTCON;
extern volatile near union {
  struct {
    unsigned RABIF:1;
    unsigned INT0IF:1;
    unsigned TMR0IF:1;
    unsigned RABIE:1;
    unsigned INT0IE:1;
    unsigned TMR0IE:1;
    unsigned PEIE_GIEL:1;
    unsigned GIE_GIEH:1;
  };
  struct {
    unsigned :1;
    unsigned INT0F:1;
    unsigned T0IF:1;
    unsigned :1;
    unsigned INT0E:1;
    unsigned T0IE:1;
    unsigned PEIE:1;
    unsigned GIE:1;
  };
  struct {
    unsigned :6;
    unsigned GIEL:1;
    unsigned GIEH:1;
  };
} INTCONbits;
extern          near unsigned            PROD;
extern          near unsigned char       PRODL;
extern          near unsigned char       PRODH;
extern volatile near unsigned char       TABLAT;
extern volatile near unsigned short long TBLPTR;
extern volatile near unsigned char       TBLPTRL;
extern volatile near unsigned char       TBLPTRH;
extern volatile near unsigned char       TBLPTRU;
extern volatile near unsigned short long PC;
extern volatile near unsigned char       PCL;
extern volatile near unsigned char       PCLATH;
extern volatile near unsigned char       PCLATU;
extern volatile near unsigned char       STKPTR;
extern volatile near union {
  struct {
    unsigned STKPTR:5;
    unsigned :1;
    unsigned STKUNF:1;
    unsigned STKFUL:1;
  };
  struct {
    unsigned SP0:1;
    unsigned SP1:1;
    unsigned SP2:1;
    unsigned SP3:1;
    unsigned SP4:1;
    unsigned :2;
    unsigned STKOVF:1;
  };
} STKPTRbits;
extern          near unsigned short long TOS;
extern          near unsigned char       TOSL;
extern          near unsigned char       TOSH;
extern          near unsigned char       TOSU;

#pragma varlocate 15 UEP0
#pragma varlocate 15 UEP0bits
#pragma varlocate 15 UEP1
#pragma varlocate 15 UEP1bits
#pragma varlocate 15 UEP2
#pragma varlocate 15 UEP2bits
#pragma varlocate 15 UEP3
#pragma varlocate 15 UEP3bits
#pragma varlocate 15 UEP4
#pragma varlocate 15 UEP4bits
#pragma varlocate 15 UEP5
#pragma varlocate 15 UEP5bits
#pragma varlocate 15 UEP6
#pragma varlocate 15 UEP6bits
#pragma varlocate 15 UEP7
#pragma varlocate 15 UEP7bits
#pragma varlocate 15 UEIE
#pragma varlocate 15 UEIEbits
#pragma varlocate 15 UADDR
#pragma varlocate 15 UADDRbits
#pragma varlocate 15 UFRML
#pragma varlocate 15 UFRMLbits
#pragma varlocate 15 UFRMH
#pragma varlocate 15 UFRMHbits
#pragma varlocate 15 UEIR
#pragma varlocate 15 UEIRbits


#line 1292 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
 
#line 1294 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1295 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"


#line 1298 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
 
#line 1300 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1301 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1302 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1303 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"

#line 1305 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1306 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1307 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1308 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 1309 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"


#line 1313 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
 
#line 1315 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"


#line 1318 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18f14k50.h"
#line 35 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"

#line 37 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 39 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 41 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 43 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 45 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 47 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 49 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 51 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 53 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 55 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 57 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 59 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 61 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 63 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 65 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 67 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 69 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 71 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 73 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 75 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 77 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 79 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 81 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 83 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 85 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 87 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 89 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 91 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 93 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 95 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 97 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 99 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 101 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 103 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 105 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 107 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 109 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 111 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 113 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 115 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 117 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 119 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 121 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 123 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 125 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 127 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 129 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 131 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 133 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 135 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 137 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 139 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 141 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 143 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 145 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 147 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 149 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 151 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 153 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 155 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 157 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 159 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 161 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 163 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 165 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 167 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 169 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 171 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 173 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 175 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 177 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 179 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 181 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 183 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 185 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 187 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 189 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 191 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 193 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 195 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 197 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 199 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 201 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 203 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 205 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 207 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 209 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 211 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 213 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 215 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 217 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 219 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 221 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 223 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 225 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 227 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 229 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 231 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 233 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 235 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 237 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 239 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 241 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 243 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 245 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 247 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 249 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 251 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 253 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 255 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 257 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 259 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 261 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 263 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 265 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 267 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 269 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 271 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 273 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 275 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 277 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 279 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 281 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 283 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 285 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 287 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 289 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 291 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 293 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 295 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 297 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 299 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 301 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 303 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 305 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 307 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 309 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 311 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 313 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 315 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 317 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 319 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 321 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 323 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 325 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 327 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 329 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 331 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 333 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 335 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 337 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 339 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 341 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 343 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 345 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 347 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 349 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 351 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 353 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 355 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 357 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 359 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 361 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 363 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 365 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 367 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 369 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 371 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 373 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 375 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 377 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 379 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 381 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 383 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 385 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 387 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 389 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 391 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 393 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 395 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 397 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 399 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 401 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 403 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 405 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 407 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 409 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 411 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 413 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 415 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 417 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 419 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 421 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 423 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 425 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 427 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 429 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 431 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 433 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 435 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 437 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 439 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 441 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 443 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 445 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 447 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 449 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 451 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 453 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 455 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 457 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 459 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 461 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 463 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 465 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 467 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 469 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 471 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 473 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 475 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 477 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 479 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 481 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 483 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 485 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 487 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 489 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 491 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 493 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 495 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 497 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 499 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 501 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 503 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 505 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 507 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 509 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 511 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 513 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 515 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 517 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 519 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 521 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 523 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 525 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 527 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 529 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 531 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 533 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 535 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 537 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 539 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 541 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 543 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 545 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 547 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 549 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 551 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 553 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 555 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 557 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 559 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"

#line 561 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/p18cxxx.h"
#line 16 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"


 
#line 20 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"

#line 22 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"

 
#line 25 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"


#line 31 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"
 
void Delay10TCYx(auto  unsigned char);


#line 38 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"
 
void Delay100TCYx(auto  unsigned char);


#line 45 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"
 
void Delay1KTCYx(auto  unsigned char);


#line 52 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"
 
void Delay10KTCYx(auto  unsigned char);

#line 56 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/delays.h"
#line 10 "ignition.c"


#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"

#line 3 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"

#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"
 


#line 5 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"

typedef void* va_list;
#line 8 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"
#line 9 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"
#line 10 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"
#line 11 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"
#line 12 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdarg.h"
#line 4 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"

#line 1 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"
 

#line 4 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"

typedef unsigned char wchar_t;


#line 10 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"
 
typedef signed short int ptrdiff_t;
typedef signed short int ptrdiffram_t;
typedef signed short long int ptrdiffrom_t;


#line 20 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"
 
typedef unsigned short int size_t;
typedef unsigned short int sizeram_t;
typedef unsigned short long int sizerom_t;


#line 34 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"
 
#line 36 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"


#line 41 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"
 
#line 43 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"

#line 45 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stddef.h"
#line 5 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"



#line 9 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"
 
#line 11 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"

#line 13 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"


typedef unsigned char FILE;

 
#line 19 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"
#line 20 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"

extern FILE *stderr;
extern FILE *stdout;


int putc (auto char c, auto FILE *f);
int vsprintf (auto char *buf, auto const far  rom char *fmt, auto va_list ap);
int vprintf (auto const far  rom char *fmt, auto va_list ap);
int sprintf (auto char *buf, auto const far  rom char *fmt, ...);
int printf (auto const far  rom char *fmt, ...);
int fprintf (auto FILE *f, auto const far  rom char *fmt, ...);
int vfprintf (auto FILE *f, auto const far  rom char *fmt, auto va_list ap);
int puts (auto const far  rom char *s);
int fputs (auto const far  rom char *s, auto FILE *f);

#line 36 "C:/Program Files (x86)/Microchip/mplabc18/v3.38/h/stdio.h"
#line 12 "ignition.c"

 
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

 
#pragma udata
unsigned int A=0;			
unsigned int ZcountL=0;		
unsigned int ZcountH=0;		
unsigned int Zcount=0;		
unsigned char NoRev;		
unsigned int Rev=0;			
unsigned int Rev1=0;	
unsigned int revav0=0;		
unsigned int revav1=0;		
unsigned int Ave=0;			
unsigned int timer1;		
unsigned int timing;		
unsigned int i =0;
unsigned int ignition =0;
unsigned int injection =0;
char Msg1[] = "        ";	

char Msg2[] = "        ";	
char Msg3[] = "        ";	
char Msg4[] = "        ";	
unsigned int doel=615;		
unsigned int doel2=615;		

 
void Display(void);
void ltostring(char digit, unsigned long data, char *buffer);
unsigned int AD_input(char chanl);
void high_isr (void);
void low_isr (void);


#pragma code high_vector=0x8
void high_interrupt(void)
{
	_asm
		GOTO high_isr
	_endasm
}
#pragma code

#pragma interrupt high_isr
void high_isr (void)
{
	if(INTCON3bits.INT2IF == 1){		
		INTCON3bits.INT2IF = 0;			
		A = 0;							
	  	if(T0CONbits.TMR0ON ==0 ){		
				TMR0H=0;				
				TMR0L=0;				
			T0CONbits.TMR0ON = 1;		
		}
		else
		{
			ZcountL = TMR0L;			
			ZcountH = TMR0H;			
			TMR0H=0;					
			TMR0L=0;					
			NoRev = 0;		
		}
		TMR1H = 0;					
		TMR1L = 0;					
	}

	if(PIR1bits.CCP1IF == 1){			
		PIR1bits.CCP1IF = 0;			
		if(PORTCbits.RC1 == 1){			
			LATAbits.LATA2 = 1;			
		ignition++;
		}
	}
	
	if(PIR2bits.CCP2IF == 1){			
		CCPR1=doel2;
		PIR2bits.CCP2IF = 0;			
		LATAbits.LATA2 = 0;				
		
	}
}

#pragma code low_vector=0x18
void low_interrupt(void)
{
	_asm
		GOTO low_isr
	_endasm
}
#pragma code

#pragma interruptlow low_isr
void low_isr (void)
{	
	if(INTCON3bits.INT1IF == 1){		
		INTCON3bits.INT1IF = 0;			
		if(PORTBbits.RB0 == 1){			
			A--;						
		}
		else{
			A++;						
		}
		if(A>719){						
			A=719;						
		}
	}
   	else if(INTCONbits.TMR0IF == 1){	
		INTCONbits.TMR0IF = 0;			
		T0CONbits.TMR0ON = 0;			
		TMR0H=0;						
		TMR0L=0;						
		NoRev = 1;						
		Rev = 0;						
		Ave = 0;						
	}	
}

void main(void)
{



	CMCON = 0x07;			
 	LATA = 0;				
   	LATB = 0;				
  	LATC = 0;				
 	TRISA = 0x00;			
	TRISB = 0x07;			
 	TRISC = 0x03;			
	RCONbits.IPEN = 1;		
	INTCON=0xE0;			
	INTCON2=0x80;			
	INTCON3=0x98;			
	T0CON=0x06;				
	TMR0H=0;				
	TMR0L=0;				
	T1CON=0x83;				
	IPR1bits.CCP1IP = 1;	
	IPR2bits.CCP2IP = 1;	
	PIE1bits.CCP1IE = 1;	
	PIE2bits.CCP2IE = 1;	
	CCP1CON=0x0A;			
	CCP2CON=0x0A;			



	CCPR2=705;
  	T3CON=0x00;				
	lcd_init();				
	lcd_clear();			


    while(1)
    {

					
#line 183 "ignition.c"
 

 
		   	if((Rev1 >= 250) && (Rev1 < 2250)){
												
				CCPR2=711;							
			}else if((Rev1 >= 2250) && (Rev1 < 2750)){
												
				CCPR2=710;							
			}else if((Rev1 >= 2750) && (Rev1 < 3250)){
												
				CCPR2=709;							
			}else if((Rev1 >= 3250) && (Rev1 < 4000)){
												
				CCPR2=706;							
			}else if((Rev1 >= 4000) && (Rev1 < 5750)){
												
				CCPR2=705;							
			}else{									
				LATAbits.LATA2 = 0;					
			}




		LATAbits.LATA0 = !PORTBbits.RB2;		

		if(timer1 > 670 || timer1 <360 ){	
			LATAbits.LATA1 = 1;					
		}
		else{
			LATAbits.LATA1 = 0;
			injection++;
		}	
			Zcount = ZcountL;					
			Zcount += (unsigned int)ZcountH<<8;	
		if(NoRev == 0){							
			Rev = 11250000/Zcount;				
			Rev = Rev/10;						
			Rev = Rev*10;						
			Rev1 = Rev;							
			doel=(unsigned int)704-(337500/Zcount);
			doel2=doel;




		}
		if(NoRev ==1){							
			LATAbits.LATA2 = 0;					
			Rev = 0;
			doel=704;
			doel2=doel;
		}
			timer1 = TMR1L;						
			timer1 += TMR1H*256; 				
				i++;
				if(i == 800){ 
				Display();
				i = 0;
			}
												
	}
}

unsigned int AD_input(char chanl)
{
    	unsigned int adData;        	
    	
	ADCON0 = 0x01 + (chanl * 4);
    	ADCON0bits.GO = 1;             	
    	while(ADCON0bits.NOT_DONE);    	
 	adData = ADRESH * 256 + ADRESL;
	return(adData);                   	
}


void ltostring(char digit, unsigned long data, char *buffer)
{
	char i;
	buffer += digit;					
	for(i=digit; i>0; i--) {			
		buffer--;						
			*buffer = (data % 10) + '0';
			data = data / 10;			

	}
				
}

void Display(void) 
{
	lcd_cmd(0x80);							
	sprintf(Msg1,"%3d.%2d",(5*A)/10,(5*A)%10);		
	lcd_str((char *)Msg1);					

	lcd_cmd(0x88);							
	sprintf(Msg3,"%d",ignition);		
	lcd_str((char *)Msg3);					
 
 	lcd_cmd(0xC0);							
	sprintf(Msg2,"%4drpm",Rev);
   	lcd_str((char *)Msg2);					

 	
#line 289 "ignition.c"
 
}
