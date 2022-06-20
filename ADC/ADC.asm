
_main:

;ADC.c,7 :: 		void main() {
;ADC.c,8 :: 		OSCCON = 0x62; // 8000000
	MOVLW       98
	MOVWF       OSCCON+0 
;ADC.c,9 :: 		ANSELA = 0X02; // ra1 pin as analog
	MOVLW       2
	MOVWF       ANSELA+0 
;ADC.c,10 :: 		TRISA.B1 = 1; // as input
	BSF         TRISA+0, 1 
;ADC.c,11 :: 		ADC_Init(); // initializing of adc module
	CALL        _ADC_Init+0, 0
;ADC.c,13 :: 		UART1_Init(115200);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       16
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ADC.c,14 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;ADC.c,16 :: 		do{
L_main1:
;ADC.c,17 :: 		adcresult = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adcresult+0 
	MOVF        R1, 0 
	MOVWF       _adcresult+1 
;ADC.c,18 :: 		inttostr(adcresult, voltageTxt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVF        _voltageTxt+0, 0 
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ADC.c,19 :: 		UART1_Write_Text(voltageTxt);
	MOVF        _voltageTxt+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       0
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ADC.c,21 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;ADC.c,23 :: 		}while(1);
	GOTO        L_main1
;ADC.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
