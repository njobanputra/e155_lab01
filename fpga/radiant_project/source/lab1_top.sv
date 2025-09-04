// Nina Jobanputra
// njobanputra@g.hmc.edu
// 9/1/2025
// This code combines the LED files and 
// 7 segment display code.

module top(
	input logic reset,
	input logic [3:0] s,
	output logic [2:0] led,
	output logic [6:0] seg
);
	logic clk;
	
	HSOSC #(.CLKHF_DIV(2'b01)) 
      hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
	  
	sevenSegDis sevenSeg(s, seg);
	led2 led2(clk, reset, led[2]);
	led1 led1(s, led[1]);
	led0 led0(s, led[0]);


endmodule
