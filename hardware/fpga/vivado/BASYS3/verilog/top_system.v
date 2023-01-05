`timescale 1ns / 1ps
`include "system.vh"

module top_system(
	          input 	    clk,
	          input 	    reset,

	          //uart
	          output 	    uart_txd,
	          input 	    uart_rxd,

		  //VGA
		  output 	    v_sync,
		  output 	    h_sync,
		  output [3:0] 	    Red,
		  output [3:0] 	    Green,
		  output [3:0] 	    Blue
		  );

   //
   // RESET MANAGEMENT
   //

   //system reset
   reg [15:0] cpixel = 4'hFFFF;
   assign pixel = cpixel;

   wire                         sys_rst;

   reg [15:0] 			rst_cnt;
   reg                          sys_rst_int;

   always @(posedge clk, posedge reset)
     if(reset) begin
        sys_rst_int <= 1'b0;
        rst_cnt <= 16'hFFFF;
     end else begin
        if(rst_cnt != 16'h0)
          rst_cnt <= rst_cnt - 1'b1;
        sys_rst_int <= (rst_cnt != 16'h0);
     end

   assign sys_rst = sys_rst_int;

   //
   // SYSTEM
   //
   system system
     (
      .clk           (clk),
      .rst           (sys_rst),
      .trap          (trap),

      //UART
      .uart_txd      (uart_txd),
      .uart_rxd      (uart_rxd),
      .uart_rts      (),
      .uart_cts      (1'b1),

      //VGA
      .pixel(pixel),
      .v_sync(v_sync),
      .h_sync(h_sync),
      .Red(Red),
      .Green(Green),
      .Blue(Blue),
      .pixel_ADDR(pixel_ADDR)  
      );

endmodule // top_system

