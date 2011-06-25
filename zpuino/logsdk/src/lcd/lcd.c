#include <zpuino.h>
#include <lcd.h>
#include <delay.h>

void LCD_init()
{
	pinMode(LCD_E, OUTPUT);
	pinMode(LCD_RS, OUTPUT);
	pinMode(LCD_RW, OUTPUT);
	
	LCD_reset();
}

void LCD_datamode_output()
{
	pinMode(LCD_DB4, OUTPUT);
	pinMode(LCD_DB5, OUTPUT);
	pinMode(LCD_DB6, OUTPUT);
	pinMode(LCD_DB7, OUTPUT);
}

void LCD_datamode_input()
{
	pinMode(LCD_DB4, INPUT);
	pinMode(LCD_DB5, INPUT);
	pinMode(LCD_DB6, INPUT);
	pinMode(LCD_DB7, INPUT);
}

void LCD_pulse_E()
{
	digitalWrite(LCD_E,HIGH);
	delayMicroseconds(1);
	digitalWrite(LCD_E,LOW);
}

void LCD_set4(unsigned cmd)
{
	digitalWrite(LCD_DB4, !!(cmd&0x10));
	digitalWrite(LCD_DB5, !!(cmd&0x20));
	digitalWrite(LCD_DB6, !!(cmd&0x40));
	digitalWrite(LCD_DB7, !!(cmd&0x80));
}

void LCD_write_inst4(unsigned cmd)
{
	LCD_set4(cmd);
	LCD_pulse_E();
}

void LCD_write_inst8(unsigned cmd)
{
	digitalWrite(LCD_E,LOW);
	digitalWrite(LCD_RS,LOW);
	digitalWrite(LCD_RW,LOW);

	LCD_datamode_output();
	LCD_write_inst4(cmd);
	cmd<<=4;
	delayMicroseconds(1);
	LCD_write_inst4(cmd);
	delayMicroseconds(40);
	LCD_datamode_input();
}

void LCD_write_data(uint32_t data)
{
	digitalWrite(LCD_RS,HIGH);

	LCD_datamode_output();
	LCD_set4(data);
	LCD_pulse_E();
	delayMicroseconds(1);
	data<<=4;
	LCD_set4(data);
	LCD_pulse_E();
	delayMicroseconds(40);
	LCD_datamode_input();
}

void LCD_read_four(uint32_t *target)
{
	// Read data
	(*target) |= digitalRead(LCD_DB7);
	(*target)<<=1;
	(*target) |= digitalRead(LCD_DB6);
	(*target)<<=1;
	(*target) |= digitalRead(LCD_DB5);
	(*target)<<=1;
	(*target) |= digitalRead(LCD_DB4);
}

uint32_t LCD_read_data()
{
	uint32_t r=0;
	digitalWrite(LCD_RS,HIGH);
	digitalWrite(LCD_RW,HIGH);
	delayMicroseconds(1); // should be about 40ns
	digitalWrite(LCD_E,HIGH);
	delayMicroseconds(1);
	LCD_read_four(&r);
	digitalWrite(LCD_E,LOW);
	delayMicroseconds(1);
	digitalWrite(LCD_E,HIGH);
	LCD_read_four(&r);
	digitalWrite(LCD_E,LOW);
	delayMicroseconds(40);
	return r;
}

void LCD_clear()
{
	LCD_write_inst8(0x01);
	delay(2);
}

void LCD_reset()
{
	delay(20);
	LCD_write_inst4(0x30);
	delay(20);
	LCD_write_inst4(0x30);
	delay(1);
	LCD_write_inst4(0x30);
	delay(40);
	LCD_write_inst4(0x20);
	delay(40);
	LCD_write_inst8(0x28); // Function set
	LCD_write_inst8(0x06); // Entry mode
	LCD_write_inst8(0x0C); // Display control

	LCD_clear();
}

void LCD_print(const char*s)
{
	while (*s) {
		LCD_write_data(*s++);
	}
}
void LCD_move_to(uint32_t line, uint32_t col)
{
	uint32_t address = line ? 0xC0:0x80;
	address+=col;
	LCD_write_inst8(address);
}

void LCD_shift_left()
{
	LCD_write_inst8(0x18);
}

void LCD_shift_right()
{
	LCD_write_inst8(0x1C);
}

