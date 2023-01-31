#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "printf.h"
#include "iob-ssd.h"
#include "iob-im.h"
#include "iob-gpio.h"

//#define REFRESH_RATE 0x000005 // Simulation 
#define REFRESH_RATE 0X07A120 // FPGA build

int main() {
	
  uint32_t g_input = 0;
  uint32_t g_input_old = 0;
  
  // Peripherals Init 
  uart_init(UART_BASE,FREQ/BAUD);
  ssd_init(SSD_BASE, REFRESH_RATE);
  gpio_init(GPIO_BASE);
  im_init(IM_BASE);

  printf("\n\n\nInit Done!\n\n\n"); 
  
  printf("\n\n\nLoop\n\n\n");  
  while(1) {
	  
    g_input = gpio_get();
	  
    if(g_input != g_input_old) {
		  
      if(g_input == 0){
	im_set(0);
	ssd_set_number(0x0001);
	printf("\nImage: 0\n");
      } else {
	im_set(1);
	ssd_set_number(0x0002);
	printf("\nImage: 1\n");
      }  		  
		  
      g_input_old = g_input;  
    }	
	  
  }

  uart_finish();
}
