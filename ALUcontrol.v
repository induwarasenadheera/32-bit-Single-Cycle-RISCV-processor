// 32-bit alu
// data input width: 2 32-bit
// data output width: 1 32-bit and one "zero" output
// control: 4-bit
// zero: output 1 if all bits of data output is 0
module ALUcontrol (alu_op, out_to_alu, funct, equal_comp, mem, ALU_En);
	input [1:0] alu_op;
	input ALU_En;
	input [3:0] funct;
	output [3:0] out_to_alu;
	output reg [1:0] equal_comp;
	output reg [2:0] mem;
	
	reg [3:0] out_to_alu;
	
	assign funct3 = {funct[3:1]};
	
	always @ (funct)
	begin
		if (ALU_En == 'b0)begin
		equal_comp= 2'b00;
		mem= 3'b000;
		case (alu_op)
		2'b00: //Rtype
			begin 
				case(funct)
				4'b0000:
					begin
						out_to_alu <= 4'b0010;
					end
				4'b0001:
					begin
						out_to_alu <= 4'b0110;
					end
				4'b1000:
					begin
						out_to_alu <= 4'b0011;
					end
				4'b1100:
					begin
						out_to_alu <= 4'b0001;
					end
				4'b1110:
					begin
						out_to_alu <= 4'b0000;
					end
				4'b0010:
					begin
						out_to_alu <= 4'b0100;
					end
				4'b1010:
					begin
						out_to_alu <= 4'b1000;
					end
				4'b1011:
					begin
						out_to_alu <= 4'b1001;
					end
				4'b0100:
					begin
						out_to_alu <= 4'b0101;
					end
				4'b0110:
					begin
						out_to_alu <= 4'b0111;
					end
					
					endcase
			end
		2'b01:
			begin 
			case(funct3)
			3'b000:
				begin
					out_to_alu <= 4'b0010;
				end
			3'b100:
				begin
					out_to_alu <= 4'b0011;
				end
			3'b110:
				begin
					out_to_alu <= 4'b0001;
				end
			3'b111:
				begin
					out_to_alu <= 4'b0000;
				end
			3'b001:
				begin
					out_to_alu = 4'b0100;
				end
			3'b101:
			begin
				if (funct[0]==0)
					out_to_alu <= 4'b1000;
				else
					out_to_alu <= 4'b1001;
			end
			
			endcase
			
			end
		2'b10:
			begin 
				case(funct3)
				3'b000:
				begin
					out_to_alu <= 4'b0010;
					mem<= 3'b001;
				end
				3'b001:
				begin
					out_to_alu <= 4'b0010;
					mem<= 3'b010;
				end
				3'b010:
				begin
					out_to_alu <= 4'b0010;
					mem<= 3'b011;
				end
				3'b100:
				begin
					out_to_alu <= 4'b0010;
					mem<= 3'b101;
				end
				3'b101:
				begin
					out_to_alu <= 4'b0010;
					mem<= 3'b011;
				end
				
				endcase
			end
		2'b11:
			begin 
				case(funct3)
				3'b000:
				begin
					out_to_alu <= 4'b0011;
					equal_comp <= 2'b11;
				end
				3'b001:
				begin
					out_to_alu <= 4'b0011;
					equal_comp <= 2'b10;
				end
				3'b100:
				begin
					out_to_alu <= 4'b0101;
					equal_comp <= 2'b11;
				end
				3'b101:
				begin
					out_to_alu <= 4'b0101;
					equal_comp<= 2'b10;
				end
				3'b110:
				begin
					out_to_alu <= 4'b0111;
					equal_comp <= 2'b11;
				end
				3'b111:
				begin
					out_to_alu <= 4'b0111;
					equal_comp <= 2'b10;
				end
				
				endcase
			end

	endcase
	end
	end
endmodule
