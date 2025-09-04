// Nina Jobanputra
// njobanputra@g.hmc.edu
// 9/3/2025
// This is the testbench for LED1.

module testbench();
 logic clk, reset;
 logic [3:0] s;
 logic led;
 logic [2:0]expected;
 logic [31:0] vectornum, errors;
 logic [7:0] testvectors[10000:0];
 
// instantiate device under test
led0 dut(s, led);

// generate clock
always
	begin
		clk=1; #5; clk=0; #5;
end
 
// at start of test, load vectors and pulse reset
initial
	begin
	$readmemb("led0.tv", testvectors);
	vectornum = 0; errors = 0; reset = 1; #22; reset = 0;
 end
 
// apply test vectors on rising edge of clk
always @(posedge clk)
 begin
	#1; {s, expected} = testvectors[vectornum][7:0];
 end
 
// check results on falling edge of clk
always @(negedge clk)
 if (~reset) begin // skip during reset
    if (led[0] !== expected) begin // check result
    $display("Error: inputs = %b", {s});
    $display(" outputs = %b (%b expected)", led, expected);
    errors = errors + 1;
 end
 vectornum = vectornum + 1;
 if (testvectors[vectornum] === 8'bx) begin
	$display("%d tests completed with %d errors", vectornum, errors);
	$stop;
 end
 end
endmodule 