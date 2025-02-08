// ===================================================================================
// Project:   USB PD Adapter for CH32X035
// Version:   v1.3
// Year:      2024
// Author:    Stefan Wagner
// Github:    https://github.com/wagiminator
// EasyEDA:   https://easyeda.com/wagiminator
// License:   http://creativecommons.org/licenses/by-sa/3.0/
// ===================================================================================
//
// Description:
// ------------
// With the USB PD Adapter you can use almost any PPS-capable USB Type-C PD power 
// supply to power your projects with different selectable voltages and high currents.
// Important values such as voltage, current, power and energy are displayed on the
// OLED. The USB PD Adapter is based on the cheap and easy-to-use CH32X035 32-bit
// RISC-V microcontroller with hardware USB PD support and the INA219 voltage and
// current sensor IC.
//
// References:
// -----------
// - WCH Nanjing Qinheng Microelectronics: http://wch.cn
//
// Compilation Instructions:
// -------------------------
// - Make sure GCC toolchain (gcc-riscv64-unknown-elf, newlib) and Python3 with chprog
//   are installed. In addition, Linux requires access rights to the USB bootloader.
// - Press the BOOT button on the MCU board and keep it pressed while connecting it
//   via USB to your PC.
// - Run 'make flash'.
//
// Operating Instructions:
// -----------------------
// 1. Connect the USB PD Adapter to a USB Type-C PD power supply using a USB-C cable.
// 2. Use the INC/DEC buttons to select the desired output voltage in steps of 20mV.
// 3. Connect the device to the power consumer via the output screw terminal.
// 4. Use the RST button to clear the energy counter.


// ===================================================================================
// Libraries, Definitions and Macros
// ===================================================================================
#include <config.h>                               // user configurations
#include <system.h>                               // system functions
#include <gpio.h>                                 // GPIO functions
#include <usbpd_sink.h>                           // USB PD sink functions
#include <debug_serial.h>                         // debug.out:PA2

void basic();

// ===================================================================================
void DLY_LED(int ontime, int offtime){
    PIN_high(PB12); DLY_ms(ontime); PIN_low(PB12); DLY_ms(offtime);
}

void set_LED(uint16_t onoff){
	if(onoff==0) PIN_low(PB12);
	else         PIN_high(PB12);
}

uint8_t set_PPS(uint16_t setvolt){
	uint8_t rc;
	for(int lp=0; lp<5; lp++){
		if(PD_connect() && PD_getPPSNum()){
			if(PD_setVoltage(setvolt)!=0) { rc = 0; break; }
		} else {
			DEBUG_printf("*"); // ERR
		}
		DLY_LED(100,1000); rc = 1;
	}
	if(rc!=0) rc = 23; // PPS Error
	return rc;
}

void test_pps(){
  uint16_t setvolt;                        // selected volatge
  while(1){
    if(PD_connect() && PD_getPPSNum()){      // init USB PD, PPS
      int lpct = 0;
      while(1) {
	    int vv = 4+lpct; setvolt = vv*1000; 
	    if(PD_setVoltage(setvolt)==0) break;
	    DEBUG_printf("%d ", vv); DLY_LED(1000,1);
	    lpct++; if(lpct>16) {lpct = 0; DEBUG_printf("\r\n");}
      }
	} else {
	  DEBUG_printf("*"); // ERR
	  DLY_LED(100,1000);
	}
  }
}

// ===================================================================================
// Main Function
// ===================================================================================
int main(void) {

  DEBUG_init(); 
  //DEBUG_printf("pps_start 4-20V\r\n");
  PIN_output(PB12);  //for(int i=0; i<2; i++) DLY_LED(200,200);

  basic();
  //set_pps(9000);

}
