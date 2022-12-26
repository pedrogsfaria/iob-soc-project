#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "printf.h"
#include "iob-im.h"

int main()
{
  
  //Init peripherals
  uart_init(UART_BASE,FREQ/BAUD);
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
