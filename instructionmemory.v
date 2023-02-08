module instructionmemory (
	 input clk,
	 input write_en,
	 input [31:0] instr_in,
    input [31:0] address,
    output reg [31:0] instr,
	 output reg [6:0] opcode,
	 output reg [4:0] rd,
	 output reg [4:0] rs1,
	 output reg [4:0] rs2,
	 output reg [2:0] func3,
	 output reg [6:0] func7
    );
reg [31:0] mem [511:0];
initial
begin
//	mem[0] = 32'h00000033;
//	mem[1] = 32'h00400033;
//	mem[2] = 32'h00c0c033;
//	mem[3] = 32'h00e0e033;
//	mem[4] = 32'h01000000;
//	mem[5] = 32'h01400000;

//$readmemh("mem1file.dat",mem1);
end

always @(posedge clk) begin
	if (write_en == 1)
		mem[address] = instr_in;
	else
		instr = mem[address];
		opcode = instr[6:0];
		rd = instr[11:7];
		rs1 = instr[14:12];
		rs2 = instr[19:15];
		func3 = instr[24:20];
		func7 = instr[31:25];
end


endmodule
