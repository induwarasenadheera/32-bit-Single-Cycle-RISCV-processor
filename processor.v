module processor(clk,PCreset,Instruct);

    input clk;
    wire [31:0] a1;
    wire [31:0] a2;
    wire [31:0] a3;
    wire [31:0] a4;
    wire a5;
    input wire PCreset;
    wire [31:0] a6;
    alu_add A1(a3,'b100,a2,clk);
    alu_add A2(a3,a4,a1,clk);
    mux21 addPC(a2,a1,a5,a6);
    PC PC(clk,PCreset,a6,a3);

    output wire [31:0] Instruct;

    instructionmemory instructionmemory(a3,clk,Instruct); 
    wire reg_w;
    wire mem_r;
    wire mem_w;
    wire branch;
    wire ALUSRC;
    wire ALU0;
    wire ALU1;
    wire J_Type;
    wire ALU_En;
    wire mem_reg;
    wire [31:0] ReadRegData1;
    wire [31:0] ReadRegData2;
    wire [31:0] WriteRegData;
    RegisterFile RegisterFile(clk,Instruct[19:15],Instruct[24:20],Instruct[11:7],WriteRegData,reg_w,ReadRegData1,ReadRegData2);

    wire [31:0] Immediate;
    ImmediateGen ImmediateGen(Instruct,Immediate);

    controller controller (Instruct[6:0],reg_w,mem_w,mem_r,branch,ALUSRC,ALU0,ALU1,J_Type,ALU_En,mem_reg);
    shifter shifter(Immediate,a4);

    wire [31:0] ReadRegData2_Immediate;

    mux21 regImm(ReadRegData1,Immediate,ALUSRC,ReadRegData2_Immediate);

    wire [3:0] operation;
    wire [1:0] equal_comp;
    wire [2:0] mem;
    ALUcontrol ALUcontrol(Instruct,{ALU0,ALU1},operation,ALU_En,equal_comp,mem);

    wire zero;
    wire [31:0] ALUResult;
    alu alu(ReadRegData1,ReadRegData2_Immediate,operation,ALUResult,zero,equal_comp[1],equal_comp[0]);
    and1 and1(zero,branch,a5);




endmodule
