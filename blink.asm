.equ DDRB, 0x04
.equ PORTB, 0x05

.org  0x0000

reset:
	sbi DDRB, 5
	
main:
    sbi PORTB, 5
	rcall wait
    cbi PORTB, 5
	rcall wait
	rjmp main

wait:
	ldi r16, 1
OUTER_LOOP:
	ldi r24, 1
	ldi r25, 1
DELAY_LOOP:
	adiw r24, 1
	brne DELAY_LOOP
	dec r16
	nop
	nop
	brne OUTER_LOOP
	ret
