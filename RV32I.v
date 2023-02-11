`timescale 1ns/100ps

module RV32I(input c, input [31:0] Inst_addr, input rst, output [31:0] result);

	//PC pc (.clk(clk), .reset(rst))
	
	wire [31:0] ALU_result,ReadRegData1,ReadRegData2;
	wire [1:0] Aluop;
  wire [3:0] operation,func;
    wire [1:0] equal_comp;
	wire [2:0] mem;
	wire RegW, MemW, MemR, Branch, ALUSrc,jump, ALU_En, mem_reg;
  wire [31:0] inst,imm;
    wire [4:0] rs1,rs2,rd;
  wire [6:0] opcode;
	 
	assign result = ALU_result;
	
	//wire reg_w;
	instructionmemory Instruction_memory (.addr(Inst_addr), .reset(rst), .instruction(inst));
	inst_decoder Idecoder(
      .instruction(inst),
      .rs1(rs1),
      .rs2(rs2),
      .rd(rd),
      .opcode(opcode),
      .imm(imm),
      .func(func) 
    );
	RegisterFile register_file(
    .clk(c),
      .ReadRegNum1(rs1),
      .ReadRegNum2(rs2),
      .WriteRegNum(rd),
    .WriteRegData(ALU_result),//..........
    .RegWrite(RegW),
    .ReadRegData1(ReadRegData1),
    .ReadRegData2(ReadRegData2));
	controller contr(.Opcode(opcode),.RegWrite(RegW), .MemWrite(MemW), .MemRead(MemR), .Branch(Branch), .ALUSrc(ALUSrc), .Aluop(Aluop),.jump(jump), .ALU_En(ALU_En), .mem_reg(mem_reg));
  ALUcontrol ALU_control(.alu_op(Aluop), .out_to_alu(operation), .funct(func), .equal_comp(equal_comp), .mem(mem), .ALU_En(ALU_En));
	alu ALU(.ScrA(ReadRegData1),.ScrB(ReadRegData2),.ALU_opcode(operation),.ALUResult(ALU_result),.zero(),.Comparatorenable(equal_comp[0]),.equal_inequal(equal_comp[1]));

   

endmodule

