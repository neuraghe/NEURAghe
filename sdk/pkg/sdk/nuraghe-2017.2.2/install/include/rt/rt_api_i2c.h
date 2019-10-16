#ifndef __RT__RT_API_I2C_H__
#define __RT__RT_API_I2C_H__

void i2c_config(unsigned char i2c_id, unsigned int clkDivider);
unsigned int i2c_read(unsigned char i2c_id, unsigned int addr);
unsigned int * i2c_read_burst(unsigned char i2c_id, unsigned int addr, unsigned char nbrBytes);
void i2c_write(unsigned char i2c_id, unsigned int addr, unsigned char value);

#endif


