`timescale 1ns/1ps

/*ALU operations
0000 - AND
0001 - OR
0010 - ADD
0011 - XOR
0100 - SLL
0101 - SLL
0110 - SUB
0111 - Unsigned Branch
1000 - SRL
1001 - SRA
1010
1011

*/

module alu (ScrA,ScrB,OpCode,ALUResult,zero,Comparatorenable,equal_inequal);
    parameter DATA_WIDTH = 32;
    parameter OPCODE_LENFTH =4;
    input  [DATA_WIDTH-1:0] ScrA;
    input  [DATA_WIDTH-1:0] ScrB;
    input  [OPCODE_LENFTH-1:0] OpCode;

    output reg [DATA_WIDTH-1:0] ALUResult;
	output  reg zero;
    input  equal_inequal;
    input  Comparatorenable;
    

always @ (OpCode or ScrA or ScrB)
begin
    ALUResult='d0;
    zero='b0;

    case(OpCode)
    4'b0000: begin//AND 
        ALUResult = ScrA & ScrB;
    end
    4'b0001: begin//OR
        ALUResult = ScrA | ScrB;
    end
    4'b0010: begin//ADD
        ALUResult = ScrA + ScrB;
    end
    4'b0011: begin//XOR
        ALUResult = ScrA ^ ScrB;
        if (Comparatorenable=='b1) begin
            if (equal_inequal=='b1) begin
                zero=(ALUResult==32'b0);
            end else begin
                zero=(ALUResult!=32'b0);
            end
        end
    end
    4'b0100:begin//SLL
        ALUResult = ScrA << ScrB;
    end
    4'b0101:begin//SLT set less than
        ALUResult = ($signed(ScrA) < $signed(ScrB));// less than Correction
        if (Comparatorenable=='b1) begin
            if (equal_inequal=='b1) begin
                zero=(ALUResult!=32'b0);
            end else begin
                zero=(ALUResult==32'b0);
            end
        end
    end
    4'b0110://SUB
        begin
        ALUResult = $signed (ScrA)-$signed(ScrB);
        zero = ($signed(ALUResult)==$signed(1'd0));
        end
    4'b0111://SLTU
        begin
            ALUResult=(ScrA<ScrB);
            if (Comparatorenable=='b1) begin
            if (equal_inequal=='b1) begin
                zero=(ALUResult!=32'b0);
            end else begin
                zero=(ALUResult==32'b0);
            end
        end
        end
    4'b1000:begin//SRL
        ALUResult = ScrA >> ScrB;
    end
    4'b1001:begin//SRLA
        ALUResult = $signed(ScrA) >>> ScrB;
    end
    

    default:begin
        ALUResult= 'b0;
    end
    endcase
    

end
    
endmodule