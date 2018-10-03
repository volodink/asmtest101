all: build
build: clean
	avr-as -mmcu=atmega328p -o blink.o blink.asm
	avr-ld -o blink.elf blink.o
	avr-objcopy --output-target=ihex blink.elf blink.hex
	avr-objdump -m avr -D blink.hex
	avr-size -C --mcu=atmega328p blink.elf
clean:
	rm -f blink.o blink.elf blink.hex
flash: build
	avrdude -p m328p -c arduino -v -P /dev/ttyUSB0 -b57600 -U flash:w:blink.hex
