`timescale 1ns / 1ps

module and1(input D0, input D1,output SelData);
    assign SelData = D0 & D1;
endmodule