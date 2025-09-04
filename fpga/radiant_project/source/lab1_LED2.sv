// Nina Jobanputra
// njobanputra@g.hmc.edu
// 9/1/2025
// This code dictates the behaviour of LED2 so that it blinks at 2.4 Hz

module led2(
	input logic clk, 
	input logic reset,
	output logic led
);

logic [31 :0] counter;

always_ff @(posedge clk)
	if (reset==0) begin
		counter = 31'b0;
		led = 1'b0;
	end else if (counter == 31'd5000000) begin
		counter = 31'b0;
		led = ~led;
	end else begin
		counter = counter + 1;
	end

endmodule