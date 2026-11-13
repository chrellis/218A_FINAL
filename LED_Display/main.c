/**
 * @file main.c
 * @brief PIC32MX170F256B: HUB75 64x32 display refreshed from a Timer1 ISR
 */
#include <xc.h>
#include <sys/attribs.h>
#include "displayConfig.h"
#include "displayDriver.h"

// 8MHz FRC -> /2 -> x20 -> /2 = 40MHz, PBCLK = SYSCLK
#pragma config FNOSC = FRCPLL
#pragma config FPLLIDIV = DIV_2
#pragma config FPLLMUL = MUL_20
#pragma config FPLLODIV = DIV_2
#pragma config FPBDIV = DIV_1
#pragma config POSCMOD = OFF
#pragma config OSCIOFNC = OFF
#pragma config FSOSCEN = OFF
#pragma config IESO = OFF
#pragma config FCKSM = CSDCMD
#pragma config FWDTEN = OFF
#pragma config JTAGEN = OFF

extern void setup(void);
extern void loop(void);

void __ISR(_TIMER_1_VECTOR, IPL4SOFT) Timer1Handler(void)
{
    IFS0CLR = _IFS0_T1IF_MASK;
    refreshDisplay();
}

static void refreshTimerInit(void)
{
    T1CON = 0;
    T1CONbits.TCKPS = 2;                            // 1:64
    PR1 = (PCLK / 64 / REFRESH_RATE) - 1;
    TMR1 = 0;
    IPC1bits.T1IP = 4;
    IPC1bits.T1IS = 0;
    IFS0CLR = _IFS0_T1IF_MASK;
    IEC0SET = _IEC0_T1IE_MASK;
    T1CONbits.ON = 1;
}

int main(void)
{
    INTCONSET = _INTCON_MVEC_MASK;
    setup();                                        // calls displayInit()
    refreshTimerInit();
    __builtin_enable_interrupts();

    while (1) {
        loop();
    }
    return 0;
}
