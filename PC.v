`timescale 1ns / 1ps

module PC(
    input clk,
    input reset_n,
    input [19:0] nextPC,
    output reg [19:0] currPC
    );
    
    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            currPC <= 0;
        end
        else begin
            currPC <= nextPC;
        end
    end
    
endmodule
