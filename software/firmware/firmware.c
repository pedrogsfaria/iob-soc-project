#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "printf.h"
#include "iob-ssd.h"
#include "iob-im.h"

//#define REFRESH_RATE 0x000005 // Simulation 
#define REFRESH_RATE 0X07A120 // FPGA build



int main()
{
  
  //Init peripherals
  uart_init(UART_BASE,FREQ/BAUD);
  ssd_init(SSD_BASE, REFRESH_RATE);
  im_init(IM_BASE);

  printf("\n\n\nInit Done!\n\n\n"); 
  
  uint16_t ssd_display = 0x0126;
  uint8_t mblock = 1;

  printf("\n\nInit done \n");
  
  printf("\n\nSSD set number \n");
  ssd_set_number(ssd_display);  

  printf("Memory block set: %d\n", mblock);
  im_set(mblock);

  while(1);

  uart_finish();
}
