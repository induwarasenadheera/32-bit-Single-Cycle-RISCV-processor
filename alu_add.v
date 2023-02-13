// 32-bit alu for only addition operation
// data input width: 2 32-bit
// data output width: 1 32-bit, no "zero" output
// control: no control input, only addition mem_writeetration implemented
module alu_add(clk,in1, in2, add_out);
   input clk;
	input [31:0] in1, in2;
	output reg [31:0] add_out;
	always@(posedge clk)begin
		 add_out =in1+in2;
	end
endmodule