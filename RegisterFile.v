`timescale 1ns / 1ps

module RegisterFile(
    input clk,
    input [4:0] ReadRegNum1,
    input [4:0] ReadRegNum2,
    input [4:0] WriteRegNum,
    input [31:0] WriteRegData,
    input RegWrite,
    output [31:0] ReadRegData1,
    output [31:0] ReadRegData2
    );
    
    reg [31:0]  regs [0:31];
    
    /*initialize memory*/
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            regs[i] <= 32'h0000_0000;
        end
    end
    
    always @ (posedge clk) begin
        if (RegWrite) begin
            regs[WriteRegNum] <= WriteRegData;
        end
        else begin
            regs[WriteRegNum] <= regs[WriteRegNum];
        end
    end
    
    assign ReadRegData1 = regs[ReadRegNum1];
    assign ReadRegData2 = regs[ReadRegNum2];
    
endmodule