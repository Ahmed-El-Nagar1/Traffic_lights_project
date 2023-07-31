
_display_Auto:

;TL-Ahmed Osama.c,6 :: 		void display_Auto(int timer, int color){
;TL-Ahmed Osama.c,7 :: 		for(counter = timer; counter >= 0 ;--counter){
	MOVF       FARG_display_Auto_timer+0, 0
	MOVWF      _counter+0
	MOVF       FARG_display_Auto_timer+1, 0
	MOVWF      _counter+1
L_display_Auto0:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Auto49
	MOVLW      0
	SUBWF      _counter+0, 0
L__display_Auto49:
	BTFSS      STATUS+0, 0
	GOTO       L_display_Auto1
;TL-Ahmed Osama.c,8 :: 		if(portc.b2 == 1){
	BTFSS      PORTC+0, 2
	GOTO       L_display_Auto3
;TL-Ahmed Osama.c,9 :: 		color = 0;
	CLRF       FARG_display_Auto_color+0
	CLRF       FARG_display_Auto_color+1
;TL-Ahmed Osama.c,10 :: 		break;
	GOTO       L_display_Auto1
;TL-Ahmed Osama.c,11 :: 		}
L_display_Auto3:
;TL-Ahmed Osama.c,12 :: 		portb = number[counter];
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _number+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TL-Ahmed Osama.c,13 :: 		if(counter == 3 && color == 0){
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Auto50
	MOVLW      3
	XORWF      _counter+0, 0
L__display_Auto50:
	BTFSS      STATUS+0, 2
	GOTO       L_display_Auto6
	MOVLW      0
	XORWF      FARG_display_Auto_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Auto51
	MOVLW      0
	XORWF      FARG_display_Auto_color+0, 0
L__display_Auto51:
	BTFSS      STATUS+0, 2
	GOTO       L_display_Auto6
L__display_Auto45:
;TL-Ahmed Osama.c,14 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;TL-Ahmed Osama.c,15 :: 		portd.b6=1;
	BSF        PORTD+0, 6
;TL-Ahmed Osama.c,16 :: 		}
L_display_Auto6:
;TL-Ahmed Osama.c,17 :: 		if(counter == 3 && color == 1){
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Auto52
	MOVLW      3
	XORWF      _counter+0, 0
L__display_Auto52:
	BTFSS      STATUS+0, 2
	GOTO       L_display_Auto9
	MOVLW      0
	XORWF      FARG_display_Auto_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Auto53
	MOVLW      1
	XORWF      FARG_display_Auto_color+0, 0
L__display_Auto53:
	BTFSS      STATUS+0, 2
	GOTO       L_display_Auto9
L__display_Auto44:
;TL-Ahmed Osama.c,18 :: 		portd.b3=1;
	BSF        PORTD+0, 3
;TL-Ahmed Osama.c,19 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;TL-Ahmed Osama.c,20 :: 		}
L_display_Auto9:
;TL-Ahmed Osama.c,21 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display_Auto10:
	DECFSZ     R13+0, 1
	GOTO       L_display_Auto10
	DECFSZ     R12+0, 1
	GOTO       L_display_Auto10
	DECFSZ     R11+0, 1
	GOTO       L_display_Auto10
	NOP
	NOP
;TL-Ahmed Osama.c,7 :: 		for(counter = timer; counter >= 0 ;--counter){
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;TL-Ahmed Osama.c,23 :: 		}
	GOTO       L_display_Auto0
L_display_Auto1:
;TL-Ahmed Osama.c,25 :: 		}
L_end_display_Auto:
	RETURN
; end of _display_Auto

_display_Manual:

;TL-Ahmed Osama.c,27 :: 		int display_Manual(int color){
;TL-Ahmed Osama.c,28 :: 		portc.b2 = 0;
	BCF        PORTC+0, 2
;TL-Ahmed Osama.c,30 :: 		if(portc.b2 != 0){
	BTFSS      PORTC+0, 2
	GOTO       L_display_Manual11
;TL-Ahmed Osama.c,32 :: 		while(porta.b4 == 1 && portc.b2 != 0);
L_display_Manual12:
	BTFSS      PORTA+0, 4
	GOTO       L_display_Manual13
	BTFSS      PORTC+0, 2
	GOTO       L_display_Manual13
L__display_Manual46:
	GOTO       L_display_Manual12
L_display_Manual13:
;TL-Ahmed Osama.c,34 :: 		for(counter = 3;counter>=0;--counter){
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_display_Manual16:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Manual55
	MOVLW      0
	SUBWF      _counter+0, 0
L__display_Manual55:
	BTFSS      STATUS+0, 0
	GOTO       L_display_Manual17
;TL-Ahmed Osama.c,36 :: 		if(portc.b2 != 0){
	BTFSS      PORTC+0, 2
	GOTO       L_display_Manual19
;TL-Ahmed Osama.c,38 :: 		if(color == 0){
	MOVLW      0
	XORWF      FARG_display_Manual_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Manual56
	MOVLW      0
	XORWF      FARG_display_Manual_color+0, 0
L__display_Manual56:
	BTFSS      STATUS+0, 2
	GOTO       L_display_Manual20
;TL-Ahmed Osama.c,39 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;TL-Ahmed Osama.c,40 :: 		portd.b6=1;
	BSF        PORTD+0, 6
;TL-Ahmed Osama.c,41 :: 		}
L_display_Manual20:
;TL-Ahmed Osama.c,42 :: 		if(color == 1){
	MOVLW      0
	XORWF      FARG_display_Manual_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_Manual57
	MOVLW      1
	XORWF      FARG_display_Manual_color+0, 0
L__display_Manual57:
	BTFSS      STATUS+0, 2
	GOTO       L_display_Manual21
;TL-Ahmed Osama.c,43 :: 		portd.b4 = 0;
	BCF        PORTD+0, 4
;TL-Ahmed Osama.c,44 :: 		portd.b3 = 1;
	BSF        PORTD+0, 3
;TL-Ahmed Osama.c,45 :: 		}
L_display_Manual21:
;TL-Ahmed Osama.c,47 :: 		portb = number[counter];
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _number+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TL-Ahmed Osama.c,49 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display_Manual22:
	DECFSZ     R13+0, 1
	GOTO       L_display_Manual22
	DECFSZ     R12+0, 1
	GOTO       L_display_Manual22
	DECFSZ     R11+0, 1
	GOTO       L_display_Manual22
	NOP
	NOP
;TL-Ahmed Osama.c,50 :: 		portc.b2 = 0;
	BCF        PORTC+0, 2
;TL-Ahmed Osama.c,51 :: 		}else{
	GOTO       L_display_Manual23
L_display_Manual19:
;TL-Ahmed Osama.c,52 :: 		break;
	GOTO       L_display_Manual17
;TL-Ahmed Osama.c,53 :: 		}
L_display_Manual23:
;TL-Ahmed Osama.c,34 :: 		for(counter = 3;counter>=0;--counter){
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;TL-Ahmed Osama.c,55 :: 		}
	GOTO       L_display_Manual16
L_display_Manual17:
;TL-Ahmed Osama.c,56 :: 		}else{
	GOTO       L_display_Manual24
L_display_Manual11:
;TL-Ahmed Osama.c,57 :: 		return;
	GOTO       L_end_display_Manual
;TL-Ahmed Osama.c,58 :: 		}
L_display_Manual24:
;TL-Ahmed Osama.c,59 :: 		while(porta.b4 == 0);
L_display_Manual25:
	BTFSC      PORTA+0, 4
	GOTO       L_display_Manual26
	GOTO       L_display_Manual25
L_display_Manual26:
;TL-Ahmed Osama.c,60 :: 		}
L_end_display_Manual:
	RETURN
; end of _display_Manual

_Auto:

;TL-Ahmed Osama.c,67 :: 		void Auto(int color){
;TL-Ahmed Osama.c,68 :: 		while(portc.b2 != 1){
L_Auto27:
	BTFSC      PORTC+0, 2
	GOTO       L_Auto28
;TL-Ahmed Osama.c,72 :: 		if (color == 0){
	MOVLW      0
	XORWF      FARG_Auto_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Auto59
	MOVLW      0
	XORWF      FARG_Auto_color+0, 0
L__Auto59:
	BTFSS      STATUS+0, 2
	GOTO       L_Auto29
;TL-Ahmed Osama.c,73 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;TL-Ahmed Osama.c,74 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;TL-Ahmed Osama.c,75 :: 		display_Auto(23,color);
	MOVLW      23
	MOVWF      FARG_display_Auto_timer+0
	MOVLW      0
	MOVWF      FARG_display_Auto_timer+1
	MOVF       FARG_Auto_color+0, 0
	MOVWF      FARG_display_Auto_color+0
	MOVF       FARG_Auto_color+1, 0
	MOVWF      FARG_display_Auto_color+1
	CALL       _display_Auto+0
;TL-Ahmed Osama.c,76 :: 		if(portc.b2 == 1){
	BTFSS      PORTC+0, 2
	GOTO       L_Auto30
;TL-Ahmed Osama.c,77 :: 		return;
	GOTO       L_end_Auto
;TL-Ahmed Osama.c,78 :: 		}
L_Auto30:
;TL-Ahmed Osama.c,79 :: 		portd.b2 = 0;
	BCF        PORTD+0, 2
;TL-Ahmed Osama.c,80 :: 		portd.b6 = 0;
	BCF        PORTD+0, 6
;TL-Ahmed Osama.c,81 :: 		color++;
	INCF       FARG_Auto_color+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Auto_color+1, 1
;TL-Ahmed Osama.c,82 :: 		}
L_Auto29:
;TL-Ahmed Osama.c,86 :: 		if(color == 1){
	MOVLW      0
	XORWF      FARG_Auto_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Auto60
	MOVLW      1
	XORWF      FARG_Auto_color+0, 0
L__Auto60:
	BTFSS      STATUS+0, 2
	GOTO       L_Auto31
;TL-Ahmed Osama.c,87 :: 		portd.b4 = 1;
	BSF        PORTD+0, 4
;TL-Ahmed Osama.c,88 :: 		portd.b5 = 1;
	BSF        PORTD+0, 5
;TL-Ahmed Osama.c,89 :: 		display_Auto(15,color);
	MOVLW      15
	MOVWF      FARG_display_Auto_timer+0
	MOVLW      0
	MOVWF      FARG_display_Auto_timer+1
	MOVF       FARG_Auto_color+0, 0
	MOVWF      FARG_display_Auto_color+0
	MOVF       FARG_Auto_color+1, 0
	MOVWF      FARG_display_Auto_color+1
	CALL       _display_Auto+0
;TL-Ahmed Osama.c,90 :: 		if(portc.b2 == 1){
	BTFSS      PORTC+0, 2
	GOTO       L_Auto32
;TL-Ahmed Osama.c,91 :: 		return;
	GOTO       L_end_Auto
;TL-Ahmed Osama.c,92 :: 		}
L_Auto32:
;TL-Ahmed Osama.c,93 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;TL-Ahmed Osama.c,94 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;TL-Ahmed Osama.c,95 :: 		color++;
	INCF       FARG_Auto_color+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Auto_color+1, 1
;TL-Ahmed Osama.c,96 :: 		}
L_Auto31:
;TL-Ahmed Osama.c,100 :: 		if(color == 2 && portc.b2 != 1){
	MOVLW      0
	XORWF      FARG_Auto_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Auto61
	MOVLW      2
	XORWF      FARG_Auto_color+0, 0
L__Auto61:
	BTFSS      STATUS+0, 2
	GOTO       L_Auto35
	BTFSC      PORTC+0, 2
	GOTO       L_Auto35
L__Auto47:
;TL-Ahmed Osama.c,101 :: 		portd.b3 = 0;
	BCF        PORTD+0, 3
;TL-Ahmed Osama.c,102 :: 		portd.b2 = 1;
	BSF        PORTD+0, 2
;TL-Ahmed Osama.c,103 :: 		portd.b7 = 1;
	BSF        PORTD+0, 7
;TL-Ahmed Osama.c,104 :: 		portd.b4 = 0;
	BCF        PORTD+0, 4
;TL-Ahmed Osama.c,105 :: 		portd.b2 = 0;
	BCF        PORTD+0, 2
;TL-Ahmed Osama.c,106 :: 		color = 0;
	CLRF       FARG_Auto_color+0
	CLRF       FARG_Auto_color+1
;TL-Ahmed Osama.c,107 :: 		}
L_Auto35:
;TL-Ahmed Osama.c,108 :: 		}
	GOTO       L_Auto27
L_Auto28:
;TL-Ahmed Osama.c,109 :: 		}
L_end_Auto:
	RETURN
; end of _Auto

_Manual:

;TL-Ahmed Osama.c,111 :: 		void Manual(int color){
;TL-Ahmed Osama.c,113 :: 		while(portc.b2 == 1){
L_Manual36:
	BTFSS      PORTC+0, 2
	GOTO       L_Manual37
;TL-Ahmed Osama.c,115 :: 		if(color == 0){
	MOVLW      0
	XORWF      FARG_Manual_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual63
	MOVLW      0
	XORWF      FARG_Manual_color+0, 0
L__Manual63:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual38
;TL-Ahmed Osama.c,116 :: 		portd.b4 = 0;
	BCF        PORTD+0, 4
;TL-Ahmed Osama.c,118 :: 		portd.b3 = 0;
	BCF        PORTD+0, 3
;TL-Ahmed Osama.c,120 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;TL-Ahmed Osama.c,122 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;TL-Ahmed Osama.c,124 :: 		display_Manual(color);
	MOVF       FARG_Manual_color+0, 0
	MOVWF      FARG_display_Manual_color+0
	MOVF       FARG_Manual_color+1, 0
	MOVWF      FARG_display_Manual_color+1
	CALL       _display_Manual+0
;TL-Ahmed Osama.c,126 :: 		portd.b5 = 1;
	BSF        PORTD+0, 5
;TL-Ahmed Osama.c,128 :: 		portd.b2 = 0;
	BCF        PORTD+0, 2
;TL-Ahmed Osama.c,130 :: 		portd.b4=1;
	BSF        PORTD+0, 4
;TL-Ahmed Osama.c,132 :: 		portd.b6 = 0;
	BCF        PORTD+0, 6
;TL-Ahmed Osama.c,134 :: 		color++;
	INCF       FARG_Manual_color+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Manual_color+1, 1
;TL-Ahmed Osama.c,135 :: 		}
L_Manual38:
;TL-Ahmed Osama.c,138 :: 		if(color == 1){
	MOVLW      0
	XORWF      FARG_Manual_color+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual64
	MOVLW      1
	XORWF      FARG_Manual_color+0, 0
L__Manual64:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual39
;TL-Ahmed Osama.c,139 :: 		display_Manual(color);
	MOVF       FARG_Manual_color+0, 0
	MOVWF      FARG_display_Manual_color+0
	MOVF       FARG_Manual_color+1, 0
	MOVWF      FARG_display_Manual_color+1
	CALL       _display_Manual+0
;TL-Ahmed Osama.c,141 :: 		portd.b5 = 0;
	BCF        PORTD+0, 5
;TL-Ahmed Osama.c,143 :: 		portd.b4 = 1;
	BSF        PORTD+0, 4
;TL-Ahmed Osama.c,145 :: 		portb.b2 = 1;
	BSF        PORTB+0, 2
;TL-Ahmed Osama.c,147 :: 		color = 0;
	CLRF       FARG_Manual_color+0
	CLRF       FARG_Manual_color+1
;TL-Ahmed Osama.c,148 :: 		}
L_Manual39:
;TL-Ahmed Osama.c,149 :: 		portb =0;
	CLRF       PORTB+0
;TL-Ahmed Osama.c,151 :: 		portc.b2=0;
	BCF        PORTC+0, 2
;TL-Ahmed Osama.c,152 :: 		}
	GOTO       L_Manual36
L_Manual37:
;TL-Ahmed Osama.c,153 :: 		}
L_end_Manual:
	RETURN
; end of _Manual

_main:

;TL-Ahmed Osama.c,155 :: 		void main() {
;TL-Ahmed Osama.c,156 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;TL-Ahmed Osama.c,157 :: 		trisb = 0x00;
	CLRF       TRISB+0
;TL-Ahmed Osama.c,158 :: 		trisd = 0x00;
	CLRF       TRISD+0
;TL-Ahmed Osama.c,159 :: 		trisc = 0x00;
	CLRF       TRISC+0
;TL-Ahmed Osama.c,160 :: 		porta = 0;
	CLRF       PORTA+0
;TL-Ahmed Osama.c,161 :: 		trisa.b4 = 1;
	BSF        TRISA+0, 4
;TL-Ahmed Osama.c,162 :: 		portd = 0;
	CLRF       PORTD+0
;TL-Ahmed Osama.c,163 :: 		portb = 0;
	CLRF       PORTB+0
;TL-Ahmed Osama.c,164 :: 		portc = 0;
	CLRF       PORTC+0
;TL-Ahmed Osama.c,165 :: 		portc.b0 = 1;
	BSF        PORTC+0, 0
;TL-Ahmed Osama.c,166 :: 		while(1){
L_main40:
;TL-Ahmed Osama.c,167 :: 		portd = 0;
	CLRF       PORTD+0
;TL-Ahmed Osama.c,168 :: 		portb = 0;
	CLRF       PORTB+0
;TL-Ahmed Osama.c,169 :: 		if(portc.b2 != 1){
	BTFSC      PORTC+0, 2
	GOTO       L_main42
;TL-Ahmed Osama.c,170 :: 		Auto(color);
	MOVF       _color+0, 0
	MOVWF      FARG_Auto_color+0
	MOVF       _color+1, 0
	MOVWF      FARG_Auto_color+1
	CALL       _Auto+0
;TL-Ahmed Osama.c,171 :: 		}else{
	GOTO       L_main43
L_main42:
;TL-Ahmed Osama.c,173 :: 		Manual(color);
	MOVF       _color+0, 0
	MOVWF      FARG_Manual_color+0
	MOVF       _color+1, 0
	MOVWF      FARG_Manual_color+1
	CALL       _Manual+0
;TL-Ahmed Osama.c,174 :: 		}
L_main43:
;TL-Ahmed Osama.c,176 :: 		}
	GOTO       L_main40
;TL-Ahmed Osama.c,177 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
