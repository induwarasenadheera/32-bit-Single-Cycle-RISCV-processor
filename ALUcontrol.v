// 32-bit alu
// data input width: 2 32-bit
// data output width: 1 32-bit and one "zero" output
// control: 4-bit
// zero: output 1 if all bits of data output is 0
module ALUcontrol (instr,alu_op,operation);
	input [31:0] instr;
	input [1:0] alu_op;
	wire [3:0] funct;
	wire [2:0] funct3;
	output [3:0] operation;
	//output wire flag_control;
	
	
	reg [3:0] operation;
	assign funct= {instr[14:12],instr[30]};
	assign funct3 = {instr[14:12]};
	
	always @ (instr)
	begin
		//flag_control={alu_op[0]}&{alu_op[1]};
		case (alu_op)
		2'b00: //Rtype
			begin 
				case(funct)
				4'b0000:
					begin
						operation = 0010;
					end
				4'b0001:
					begin
						operation = 0110;
					end
				4'b1000:
					begin
						operation = 0011;
					end
				4'b1100:
					begin
						operation = 0001;
					end
				4'b1110:
					begin
						operation = 0000;
					end
				4'b0010:
					begin
						operation = 0100;
					end
				4'b1010:
					begin
						operation = 1000;
					end
				4'b1011:
					begin
						operation = 1001;
					end
				4'b0100:
					begin
						operation = 0101;
					end
				4'b0110:
					begin
						operation = 0111;
					end
					
					endcase
			end
		2'b01://Itype
			begin 
			case(funct3)
			3'b000:
				begin
					operation=0010;
				end
			3'b100:
				begin
					operation = 0011;
				end
			3'b110:
				begin
					operation = 0001;
				end
			3'b111:
				begin
					operation = 0000;
				end
			3'b001:
				begin
					operation = 0100;
				end
			3'b101:
			begin
				if (instr[30]==0)
					operation =1000;
				else
					operation = 1001;
			end
			
			endcase
			
			end
		2'b10:
			begin 
				operation=0010;
			end
		2'b11:
			begin 
				case(funct3)
				3'b000:
				begin
					operation = 0011;
				end
				3'b001:
				begin
					operation = 0011;
				end
				3'b100:
				begin
					operation = 0101;
				end
				3'b101:
				begin
					operation = 0101;
				end
				3'b110:
				begin
					operation = 0111;
				end
				3'b111:
				begin
					operation = 0111;
				end
				
				endcase
			end
		//default: 
			//begin 
				//zero<=0; 
				//alu_out<=in_a; 
			//end
	endcase
	end
endmodule