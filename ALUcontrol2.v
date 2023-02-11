module ALUcontrol2 (instr,alu_op,operation,ALU_En,equal_comp,mem);
    input [3:0] instr;
    input [1:0] alu_op;
    input ALU_En;

    output [3:0] operation;
    output [2:0] mem;
    output [1:0] equal_comp;

    wire [2:0] alu_op3 ={ALU_En,alu_op};
    always @(*)
    begin
        case(alu_op3)
        3'b100://R type
        begin
            case(instr)
            4'b0000:
                assign operation=4'b0010;
            4'b0001:
                assign operation=4'b0110;
            4'b1000:
                assign operation=4'b0011;
            4'b1100:
                assign operation=4'b0001;
            4'b1110:
                assign operation=4'b0000;
            4'b0010:
                assign operation=4'b0100;
            4'b1010:
                assign operation=4'b1000;
            4'b1011:
                assign operation=4'b1001;
            4'b0100:
                assign operation=4'b0101;
            4'b0110:
                assign operation=4'b0111;
            endcase

        end
        3'b101:
        3'b110:
        3'b111:
        default:
            assign operation=4'b1111;
    endcase
    end


endmodule