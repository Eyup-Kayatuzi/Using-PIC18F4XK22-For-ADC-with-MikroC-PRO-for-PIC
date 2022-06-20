#include "stdint.h"

int adcresult = 0;
float voltage;
char voltageTxt;

void main() {
     OSCCON = 0x62; // 8000000
     ANSELA = 0X02; // ra1 pin as analog
     TRISA.B1 = 1; // as input
     ADC_Init(); // initializing of adc module

     UART1_Init(115200);
     Delay_ms(100);

     do{
        adcresult = ADC_Read(1);
        inttostr(adcresult, voltageTxt);
        UART1_Write_Text(voltageTxt);

        Delay_ms(100);

     }while(1);
}