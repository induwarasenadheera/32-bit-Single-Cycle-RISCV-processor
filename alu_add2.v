
module alu_add2(in1, in2, add_out);
	input [31:0] in1, in2;
	output reg [31:0] add_out;
	always@(*)begin
		 add_out =in1+in2;
	end
endmodule