
#ifndef __LCD_H__
#define __LCD_H__

#include <zpuino-types.h>
#include <register.h>


#define LCD_DB7 FPGA_PIN_M15
#define LCD_DB6 FPGA_PIN_P17
#define LCD_DB5 FPGA_PIN_R16
#define LCD_DB4 FPGA_PIN_R15

#define LCD_E   FPGA_PIN_M18
#define LCD_RS  FPGA_PIN_L18
#define LCD_RW  FPGA_PIN_L17


void LCD_print(const char*s);
void LCD_move_to(uint32_t line, uint32_t col);
void LCD_shift_left();
void LCD_shift_right();
void LCD_clear();
void LCD_reset();
void LCD_init();

#endif /* __LCD_H__ */
