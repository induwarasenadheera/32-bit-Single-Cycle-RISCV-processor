
module controller(Opcode,RegWrite, MemWrite, MemRead, Branch, ALUSrc, Aluop,jump, ALU_En, mem_reg);
    input [6:0] Opcode;
	 output wire [1:0] Aluop;
	 output wire RegWrite, MemWrite, MemRead, Branch, ALUSrc,jump, ALU_En, mem_reg;
    reg [9:0] control_signal;
    wire Alu0, Alu1;
    assign {RegWrite, MemWrite, MemRead, Branch, ALUSrc, Alu0, Alu1,jump, ALU_En, mem_reg} = control_signal;
	 assign Aluop={Alu0, Alu1};

  always @(*)
	begin
		case(Opcode)
			7'b0110011 : control_signal <= 10'b1000000000; // R-type 
			7'b0000011 : control_signal <= 10'b1010110000; // I-type load
			7'b0010011 : control_signal <= 10'b1000101000; // I-type imm
			7'b0100011 : control_signal <= 10'b0100110001; // s-type
			7'b1100011 : control_signal <= 10'b0001011000; // sb-type
			7'b1101111 : control_signal <= 10'b10001xx110; // jal-type
			7'b0110111 : control_signal <= 10'b10001xx010; // lui-type
			7'b0010111 : control_signal <= 10'b00000xx010; // auipc-type
			default : control_signal <= 10'bxxxxxxxxxx;
      endcase
    end
endmodule
