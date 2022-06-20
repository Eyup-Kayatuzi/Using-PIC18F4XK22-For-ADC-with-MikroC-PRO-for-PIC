#line 1 "C:/Users/ARGE/Desktop/MicroC_Folder2/ADC/ADC.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 3 "C:/Users/ARGE/Desktop/MicroC_Folder2/ADC/ADC.c"
int adcresult = 0;
float voltage;
char voltageTxt;

void main() {
 OSCCON = 0x62;
 ANSELA = 0X02;
 TRISA.B1 = 1;
 ADC_Init();

 UART1_Init(115200);
 Delay_ms(100);

 do{
 adcresult = ADC_Read(1);
 inttostr(adcresult, voltageTxt);
 UART1_Write_Text(voltageTxt);

 Delay_ms(100);

 }while(1);
}
