// 32-bit alu for only addition operation
// data input width: 2 32-bit
// data output width: 1 32-bit, no "zero" output
// control: no control input, only addition mem_writeetration implemented
module alu_add(in_a, in_b, add_out,clk);
	input clk;
	input [31:0] in_a, in_b;
	output reg [31:0] add_out;
	always @(posedge clk) 
	begin
		add_out=in_a+in_b;
	end
endmodule