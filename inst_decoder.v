module inst_decoder(
  input [31:0] instruction,
  output reg [4:0] rs1,
  output reg [4:0] rs2,
  output reg [4:0] rd,
  output reg [6:0] opcode,
  output reg [31:0] imm,
  output reg [3:0] func
);
  
  always @(*)
  begin
    opcode = instruction[6:0];// extract opcode
	 
	 case(opcode)
			7'b0110011 : // R-type
				begin
						 rd = instruction[11:7];
						 rs1 = instruction[19:15];
						 rs2 = instruction[24:20];
						 imm = 32'hx;
						 func = {instruction[14:12],instruction[30]};
				end			
			
			7'b0000011 :  // I-type load
				begin
						rd = instruction[11:7];
						rs1 = instruction[19:15];
						rs2 = instruction[24:20];
						imm = $signed(instruction[11:0]);
						func = {instruction[14:12],instruction[30]};
				end
			
			7'b0010011 :  // I-type imm
				begin
						rd = instruction[11:7];
						rs1 = instruction[19:15];
						rs2 = 5'hx;
						imm = $signed(instruction[11:0]);	
						func = {instruction[14:12],instruction[30]};

				end		
			
			
			7'b0100011 :  // s-type
				begin
						rd = instruction[11:7];
						rs1 = instruction[19:15];
						rs2 = instruction[24:20];
						imm = $signed({instruction[11:5],instruction[4:0]});	
						func = {instruction[14:12],instruction[30]};
						
				end
			
			
			7'b1100011 :  // sb-type
				begin
						rd = 5'hx;
						rs1 = instruction[19:15];
						rs2 = instruction[24:20];
						imm = $signed({instruction[12],instruction[10:5],instruction[4:1],instruction[11]});	
						func = {instruction[14:12],instruction[30]};
						
				end
						
			
			7'b1101111 :  // jal-type
				begin
						rd = instruction[11:7];
						rs1 = 5'hx;
						rs2 = 5'hx;
						imm = $signed({instruction[20],instruction[10:1],instruction[11],instruction[19:12]});	
						func = 4'hx;
				end
			
			
			7'b0110111 :  // lui-type
				begin
						rd = instruction[11:7];
						rs1 = 5'hx;
						rs2 = 5'hx;
						imm = $signed(instruction[31:12]);	
						func = 4'hx;
						
				end
			
			
			7'b0010111 :  // auipc-type
				begin
						rd = instruction[11:7];
						rs1 = 5'hx;
						rs2 = 5'hx;
						imm = $signed(instruction[31:12]);
						func = 4'hx;
				end
			
			
		endcase
    
  end
endmodule