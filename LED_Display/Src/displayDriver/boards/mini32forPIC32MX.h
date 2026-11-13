/*
 * PIC32MX170F256B direct connection to a two-RGB-group HUB75 panel.
 * The clock settings match main.c: FRCPLL 40 MHz, PBCLK 40 MHz.
 */
#ifndef BOARDS_MINI32FORPIC32MX_H_
#define BOARDS_MINI32FORPIC32MX_H_

#include <p32xxxx.h>

#define BOARD_NAME "PIC32MX170F256B_DIRECT"
#define SYS_FREQ 40000000L
#define PCLK SYS_FREQ

/* R1/G1/B1 and R2/G2/B2 carry one pixel each per panel clock. */
#define R1(bit) LATAbits.LATA0 = (bit)
#define G1(bit) LATAbits.LATA1 = (bit)
#define B1(bit) LATAbits.LATA2 = (bit)
#define R2(bit) LATAbits.LATA3 = (bit)
#define G2(bit) LATAbits.LATA4 = (bit)
#define B2(bit) LATBbits.LATB8 = (bit)

#define A(bit) LATBbits.LATB2 = (bit)
#define B(bit) LATBbits.LATB3 = (bit)
#define C(bit) LATBbits.LATB4 = (bit)
#define D(bit) LATBbits.LATB5 = (bit)

#define LAT_HIGH LATBSET = 0x0040u
#define LAT_LOW  LATBCLR = 0x0040u
#define OE_HIGH  LATBSET = 0x0080u
#define OE_LOW   LATBCLR = 0x0080u
#define CLK_HIGH LATBSET = 0x4000u
#define CLK_LOW  LATBCLR = 0x4000u

static inline void displayPortInit(void)
{
    /* Preload outputs while the pins are still inputs; OE is active low. */
    LATACLR = 0x001fu;
    LATBCLR = 0x417cu;
    LATBSET = 0x0080u;
    ANSELACLR = 0x0003u;
    ANSELBCLR = 0x400cu;
}

#define enablePORTclocks() displayPortInit()
#define R1_IO TRISAbits.TRISA0 = 0
#define G1_IO TRISAbits.TRISA1 = 0
#define B1_IO TRISAbits.TRISA2 = 0
#define R2_IO TRISAbits.TRISA3 = 0
#define G2_IO TRISAbits.TRISA4 = 0
#define B2_IO TRISBbits.TRISB8 = 0
#define A_IO TRISBbits.TRISB2 = 0
#define B_IO TRISBbits.TRISB3 = 0
#define C_IO TRISBbits.TRISB4 = 0
#define D_IO TRISBbits.TRISB5 = 0
#define LAT_IO TRISBbits.TRISB6 = 0
#define OE_IO TRISBbits.TRISB7 = 0
#define CLK_IO TRISBbits.TRISB14 = 0

#endif /* BOARDS_MINI32FORPIC32MX_H_ */
