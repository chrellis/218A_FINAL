/* 
 * Author: J. Bajic
 */

#include <xc.h>
#include "displayDriver.h"
#include "RGB565/hue.h"

/*
void setup(void)
{    
    displayInit();
    displaySetBrightness(40);

    displayGoTo(0,0);
    displaySetFont(DEFAULT_BIG);
    displayPrint("AaBbCcDd",  COLOR(RED));
    displayNewLine();
    
    displaySetFont(DEFAULT_SMALL);
    displayPrint("AaBbCcDd", COLOR(RGB(0,255,0)));
    displayNewLine();
    
    displaySetFont(DEFAULT_EXTRA_SMALL);
    displayPrint("A B C D ", COLOR(HSV(240,100,100))); // no small letters
    displayNewLine();  
    
    
    displayDelay(300); // refreshing display       
}

void loop(void)
{
    displayGoTo(5,40);
    displayDrawRectangle(10,15, COLOR(BLUE), COLOR(HSV(60,100,100)));
    
    displayGoTo(30,50);
    displayDrawCircle(10, COLOR(RGB(255,0,255)), COLOR(CYAN));
    
    displayGoTo(64,32);
    displayLoadImage(hue, TRUE);
    
    displayDelay(300);  
    
    displayScroll(UP, 64, 2);
    displayDelay(300);
    displayScroll(DOWN, 128, 1);
    displayDelay(300);
    displayScroll(LEFT, 192, 1);
    displayDelay(300);
    displayScroll(RIGHT, 96, 2);
    displayDelay(300);
    displayScroll(RIGHT|UP, 192, 1);
    displayDelay(300);  

    displayMirror(X_AXIS);
    displayDelay(300);
    displayMirror(Y_AXIS);
    displayDelay(300);
    displayMirror(X_AXIS|Y_AXIS);
    displayDelay(300);
    
    
    displayFill(COLOR(BLUE));
    displayDelay(300);    
    displayInvert();
    displayDelay(300);
    displayInvert();
    displayDelay(300);
    
    //blink
    simpleDelay(500);    // not refreshing display
    displayDelay(50);
    simpleDelay(500);
    displayDelay(50);
    simpleDelay(500);
    displayDelay(50);
    simpleDelay(500);
    displayDelay(50);   
    
    displayClear();
} */

static uint32_t countdownStart;
static uint8_t displayedSeconds = 60;

static void drawHueCircle(uint8_t left)
{
    uint8_t x, y;

    for (y = 0; y < 8; y++) {
        for (x = 0; x < 8; x++) {
            uint16_t source = ((uint16_t)(y * 4 + 2) * 32 + x * 4 + 2) * 2;
            color_t pixel;

            pixel.color = hue_IMG[source] | ((uint16_t)hue_IMG[source + 1] << 8);
            displaySetPixel(left + x, y, gammaCorrected(pixel));
        }
    }
}

static void drawSeconds(uint8_t seconds)
{
    char text[] = "00";

    text[0] = '0' + seconds / 10;
    text[1] = '0' + seconds % 10;
    displayFillArea(24, 22, 40, 30, COLOR(BLACK));
    displaySetFont(DEFAULT_SMALL);
    displayGoTo(26, 22);
    displayPrint(text, COLOR(GREEN));
}

void setup(void)
{
    displayInit();
    displaySetBrightness(40);

    drawHueCircle(2);
    drawHueCircle(54);

    displaySetFont(DEFAULT_SMALL);
    displayGoTo(16, 0);
    displayPrint("Task 1", COLOR(WHITE));

    displaySetFont(DEFAULT_EXTRA_SMALL);
    displayGoTo(8, 11);
    displayPrint("TIME REMAINING", COLOR(WHITE));

    drawSeconds(displayedSeconds);
    countdownStart = _CP0_GET_COUNT();
}

void loop(void)
{
    uint32_t elapsed;
    uint8_t remaining;

    if (displayedSeconds == 0)
        return;

    elapsed = (uint32_t)(_CP0_GET_COUNT() - countdownStart) / (SYS_FREQ / 2);
    remaining = elapsed >= 60 ? 0 : (uint8_t)(60 - elapsed);
    if (remaining != displayedSeconds) {
        displayedSeconds = remaining;
        drawSeconds(remaining);
    }
}