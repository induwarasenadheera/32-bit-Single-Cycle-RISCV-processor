
module top_RV32I(input c, input rst);
	
	wire [31:0] ALU_result,ReadRegData1,ReadRegData2,alu_in2, RegwriteData,pc_add4,pc_addimm;
	wire [1:0] Aluop;
   wire [3:0] operation,func;
   wire [1:0] eqcomp;
	wire [2:0] mem;
	wire RegW, MemW, MemR, Branch, ALUSrc,jump, ALU_En, mem_reg,pc_select,zero_flag;
   wire [31:0] inst,imm, curr_inst_addr,memRdata;
   wire [4:0] rs1,rs2,rd;
   wire [6:0] opcode;
	wire [31:0] Inst_addr;
	
	//CSD_Golden_Top gold(.data(ALU_result),.HEX0(HEX0),.HEX1(HEX1),.HEX2(HEX2),.HEX3(HEX3),.HEX4(HEX4),.HEX5(HEX5),.HEX6(HEX6),.HEX7(HEX7));

  //Clock_divider clk_div(c,clk); 
  PC program_counter(.clk(c),.reset(rst),.nextPC(Inst_addr),.currPC(curr_inst_addr));
  //PC program_counter(.clk(c),.nextPC(Inst_addr),.currPC(curr_inst_addr));
  alu_add2 adder1(.in1(32'd4), .in2(curr_inst_addr),.add_out(pc_add4));
  alu_add2 adder2(.in1(imm), .in2(curr_inst_addr),.add_out(pc_addimm));
  and1 ANDgate(.D0(Branch), .D1(zero_flag),.SelData(pc_select));
  mux21 pc_mux21(.D0(pc_add4), .D1(pc_addimm),.select(pc_select), .SelData(Inst_addr));

  instructionmemory Instruction_memory (.addr(curr_inst_addr), .instruction(inst));
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
    .WriteRegData(RegwriteData),//..........
    .RegWrite(RegW),
    .ReadRegData1(ReadRegData1),
    .ReadRegData2(ReadRegData2));
	 
	controller contr(.Opcode(opcode),.RegWrite(RegW), .MemWrite(MemW), .MemRead(MemR), .Branch(Branch), .ALUSrc(ALUSrc), .Aluop(Aluop),.jump(jump), .ALU_En(ALU_En), .mem_reg(mem_reg));
   mux21 mux21(.D0(ReadRegData2), .D1(imm),.select(ALUSrc), .SelData(alu_in2));
   ALUcontrol ALU_control(.alu_op(Aluop), .out_to_alu(operation), .funct(func), .equal_comp(eqcomp), .mem(mem), .ALU_En(ALU_En));
	
   alu ALU(.ScrA(ReadRegData1),.ScrB(alu_in2),.ALU_opcode(operation),.ALUResult(ALU_result),.zero(zero_flag),.Comparatorenable(eqcomp[1]),.equal_inequal(eqcomp[0]));
	
	datamemory datamemory(.addr(ALU_result), .write_data(ReadRegData2), .read_data(memRdata), .clk(c), .mem_read(MemR), .mem_write(MemW), .DATA_MEM_In(mem));
   mux21 muxmem21(.D0(ALU_result), .D1(memRdata),.select(mem_reg), .SelData(RegwriteData));

	
endmodule

