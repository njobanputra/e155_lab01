// Nina Jobanputra
// njobanputra@g.hmc.edu
// 9/1/2025
// This code dictates the off and on states of LED1 due 
// to the inputs of the switches.

module led1(
	input logic [3:0] s,
	output logic led
);
	assign led = s[3] & s[2];
	
endmodule
