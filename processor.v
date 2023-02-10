module processor(clk,a5,PCreset);

    input clk;
    wire [0:31] a1;
    wire [0:31] a2;
    wire [0:31] a3;
    wire [0:31] a4;
    input wire a5;
    input wire PCreset;
    wire [0:31] a6;
    alu_add A1(a3,'b100,a2);
    alu_add A2(a3,a4,a1);
    mux21 addPC(a2,a1,a5,a6);
    PC PC(clk,PCreset,a6,a3);
endmodule
