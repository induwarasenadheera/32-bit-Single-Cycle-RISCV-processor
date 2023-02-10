`timescale 1ns / 1ps

module MUX(input [31:0] D0, input [31:0] D1, input select, output [31:0] SelData);
    assign SelData = (select == 0) ? D0 : D1;
endmodule
