# ----------------------------------------------------------------------------
#     _____
#    /     \
#   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET Design Resource Center
#      \======/         www.em.avnet.com/drc
#       \====/
# ----------------------------------------------------------------------------
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2009 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------

## System Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# System Reset
set_property PACKAGE_PIN T17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

create_clock -period 10.000 [get_ports clk]

## USB-UART Interface
set_property PACKAGE_PIN B18 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property PACKAGE_PIN A18 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {ssd_seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[1]}]
set_property PACKAGE_PIN W6 [get_ports {ssd_seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[2]}]
set_property PACKAGE_PIN U8 [get_ports {ssd_seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[3]}]
set_property PACKAGE_PIN V8 [get_ports {ssd_seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[4]}]
set_property PACKAGE_PIN U5 [get_ports {ssd_seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[5]}]
set_property PACKAGE_PIN V5 [get_ports {ssd_seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[6]}]
set_property PACKAGE_PIN U7 [get_ports {ssd_seg[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_seg[7]}]

set_property PACKAGE_PIN V7 [get_ports ssd_dp]							
	set_property IOSTANDARD LVCMOS33 [get_ports ssd_dp]

set_property PACKAGE_PIN U2 [get_ports {ssd_anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {ssd_anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {ssd_anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {ssd_anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_anode[3]}]
