`timescale 1ns/1ps
/*
input is 26 bits and the input is shifeted by two bits to increase the value by 4
*/

module shifter(inp,out);
    input [31:0] inp;
    output reg [31:0] out;
    
    always @(inp)
    begin
        out = inp << 2;
    end
endmodule