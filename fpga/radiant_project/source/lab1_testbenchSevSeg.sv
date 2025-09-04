// Nina Jobanputra
// njobanputra@g.hmc.edu
// 9/1/2025
// This is the testbench for the seven segment display.

module testbench();
 logic clk, reset;
 logic [3:0] s;
 logic [7:0] expected;
 logic [31:0] vectornum, errors;
 logic [7:0] testvectors[10000:0];
 
// instantiate device under test
sevenSegDis dut(reset, s);

// generate clock
always
	begin
		clk=1; #5; clk=0; #5;
end
 
// at start of test, load vectors and pulse reset
initial
	begin
	$readmemb("sevenSegVectors.tv", testvectors);
	vectornum = 0; errors = 0; reset = 1; #22; reset = 0;
 end
 
// apply test vectors on rising edge of clk
always @(posedge clk)
 begin
	#1; {s, expected} = testvectors[vectornum];
 end
 
// check results on falling edge of clk
always @(negedge clk)
 if (~reset) begin // skip during reset
    if (seg !== expected) begin // check result
    $display("Error: inputs = %b", {s});
    $display(" outputs = %b (%b expected)",
    seg, expected);
    errors = errors + 1;
 end
 vectornum = vectornum + 1;
 if (testvectors[vectornum] === 8'bx) begin
	$display("%d tests completed with %d errors", vectornum, errors);
	$stop;
 end
 end
endmodule 