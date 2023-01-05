#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "printf.h"



int main()
{
  //init uart
  uart_init(UART_BASE,FREQ/BAUD);

  //test puts
  printf("\n\n\nHello world!\n\n\n");  

  uart_finish();
}
