`timescale 1ns / 1ps

`include "iob_lib.vh"
`include "system.vh"

//PHEADER

module system_top 
  (
   output                             trap,
   //tester uart
   input                              uart_valid,
   input [`iob_uart_swreg_ADDR_W-1:0] uart_addr,
   input [`DATA_W-1:0]                uart_wdata,
   input [3:0]                        uart_wstrb,
   output [`DATA_W-1:0]               uart_rdata,
   output                             uart_ready,
`include "iob_gen_if.vh"
   );
 
   localparam AXI_ID_W  = 4;
   localparam AXI_LEN_W = 8;
   localparam AXI_ADDR_W=`DDR_ADDR_W;
   localparam AXI_DATA_W=`DATA_W;
 
   //PWIRES

   
   /////////////////////////////////////////////
   // TEST PROCEDURE
   //
   initial begin

`ifdef VCD
      $dumpfile("system.vcd");
      $dumpvars();
`endif

   end
   
   //
   // INSTANTIATE COMPONENTS
   //

   //AXI wires for connecting system to memory

`ifdef USE_DDR
 `include "m_axi_wire.vh"
`endif

   //
   // UNIT UNDER TEST
   //
   system
     #(
       .AXI_ID_W(AXI_ID_W),
       .AXI_LEN_W(AXI_LEN_W),
       .AXI_ADDR_W(AXI_ADDR_W),
       .AXI_DATA_W(AXI_DATA_W)
       )
   uut
     (
      //PORTS
`ifdef USE_DDR
 `include "m_axi_portmap.vh"
`endif               
      .clk (clk),
      .rst (rst),
      .trap (trap)
      );


   //instantiate the axi memory
`ifdef USE_DDR
   axi_ram 
     #(
 `ifdef DDR_INIT
       .FILE("firmware.hex"),
       .FILE_SIZE(`FW_SIZE),
 `endif
       .ID_WIDTH(AXI_ID_W),
       .DATA_WIDTH (`DATA_W),
       .ADDR_WIDTH (`DDR_ADDR_W)
       )
   ddr_model_mem
     (
 `include "s_axi_portmap.vh"
      .clk(clk),
      .rst(rst)
      );   
`endif //  `ifdef USE_DDR

   
   // **************** IM TB ****************
   // REMOVE when connected to VGA 
   //iterator
   integer               i;

   // ROM blocks
   reg 			 r_en;			    
   reg [`IM_ADDR_W-1:0]  r_addr;

   assign im_r_en = r_en;
   assign im_r_addr = r_addr;
   
   // RAM block
   reg 			 w_en;			    
   reg [`IM_ADDR_W-1:0]  w_addr;   
   reg [`IM_DATA_W-1:0]  w_data;

   assign im_w_en = w_en;
   assign im_w_addr = w_addr;
   assign im_w_data = w_data;

   initial begin      
      
      // Initialize Inputs
      r_en = 0;
      r_addr = 0;
      w_en = 0;
      w_addr = 0;
      w_data = 0;
           
      // Confirm data in memory blocks
      @(posedge clk) #1;
      r_en = 1; 
      
	 
      // Individual mem readout
      @(posedge clk) #1;
      for(i = 0; i < 2**`IM_ADDR_W; i = i + 1) begin
	 r_addr = i;

	 @(posedge clk) #1;
	 //$display("Data: %h", r_data);
	 
      end // for (i = 0; i < 2**`IM_ADDR_W; i = i + 1)
      
      @(posedge clk) #1;
      @(posedge clk) #1;
      @(posedge clk) #1;
                  
      r_en = 0;
      @(posedge clk) #1;
    
      
   end // initial begin
   
    
   //finish simulation on trap
   /* always @(posedge trap) begin
    #10 $display("Found CPU trap condition");
    $finish;
   end*/

   //sram monitor - use for debugging programs
   /*
    wire [`SRAM_ADDR_W-1:0] sram_daddr = uut.int_mem0.int_sram.d_addr;
    wire sram_dwstrb = |uut.int_mem0.int_sram.d_wstrb & uut.int_mem0.int_sram.d_valid;
    wire sram_drdstrb = !uut.int_mem0.int_sram.d_wstrb & uut.int_mem0.int_sram.d_valid;
    wire [`DATA_W-1:0] sram_dwdata = uut.int_mem0.int_sram.d_wdata;


    wire sram_iwstrb = |uut.int_mem0.int_sram.i_wstrb & uut.int_mem0.int_sram.i_valid;
    wire sram_irdstrb = !uut.int_mem0.int_sram.i_wstrb & uut.int_mem0.int_sram.i_valid;
    wire [`SRAM_ADDR_W-1:0] sram_iaddr = uut.int_mem0.int_sram.i_addr;
    wire [`DATA_W-1:0] sram_irdata = uut.int_mem0.int_sram.i_rdata;

    
    always @(posedge sram_dwstrb)
    if(sram_daddr == 13'h090d)  begin
    #10 $display("Found CPU memory condition at %f : %x : %x", $time, sram_daddr, sram_dwdata );
    //$finish;
      end
    */

endmodule
