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

  printf("\n\nInit done \n");

  // ********* SSD Test ********* //
  uint16_t ssd_display = 0x0123;  
  
  printf("\n\nSSD set number \n");
  ssd_set_number(ssd_display);  

  im_init(IM_BASE);

  printf("\n\nInit done \n");

  // ********* IM Test ********* //
  uint8_t mblock;

  for(mblock = 0; mblock < 4; mblock++){

    printf("Memory block set: %d\n", mblock);

    im_set(mblock);

    //Delay for reading
    for(int t = 0; t < 1000; t++);

  } 


  uart_finish();
}
