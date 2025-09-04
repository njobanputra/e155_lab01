// Nina Jobanputra
// njobanputra@g.hmc.edu
// 9/1/2025
// This code dictates the off and on states of LED0 due 
// to the inputs of the switches.

module led0(
	input logic [3:0] s,
	output logic led
);
	assign led = s[1] ^ s[0];
	
endmodule