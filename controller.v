`timescale 1ns/1ps

module controller(inSrc,reg_w,mem_w,mem_r,branch,ALUSRC,ALU0,ALU1,J_Type);
    input [6:0] inSrc;
    output reg reg_w,mem_r,mem_w,branch,ALUSRC,ALU0,ALU1,J_Type;
always @ (inSrc)
begin
    case(inSrc)
    7'b0110011://Rtype
    begin
        reg_w ='b1;
        mem_w ='b0;
        mem_r ='b0;
        branch='b0;
        ALUSRC='b0;
        ALU0  ='b0;
        ALU1  ='b0;
        J_Type='b0;
    end

    7'b0010011://I type arithmatic and logical
    begin
        reg_w ='b1;
        mem_w ='b0;
        mem_r ='b0;
        branch='b0;
        ALUSRC='b1;
        ALU0  ='b0;
        ALU1  ='b1;
        J_Type='b0;
    end
    7'b0000011:// Load
    begin
        reg_w ='b1;
        mem_w ='b0;
        mem_r ='b1;
        branch='b0;
        ALUSRC='b1;
        ALU0  ='b1;
        ALU1  ='b0;
        J_Type='b0;
    end
    7'b0100011://Store
    begin
        reg_w ='b0;
        mem_w ='b1;
        mem_r ='b0;
        branch='b0;
        ALUSRC='b1;
        ALU0  ='b1;
        ALU1  ='b0;
        J_Type='b0;
    end
    7'b1100011://Branch
    begin
        reg_w ='b0;
        mem_w ='b0;
        mem_r ='b0;
        branch='b1;
        ALUSRC='b0;
        ALU0  ='b1;
        ALU1  ='b1;
        J_Type='b0;
    end
    7'b1101111://Jump and Link
    begin
        reg_w ='b1;
        mem_w ='b0;
        mem_r ='b0;
        branch='b1;
        ALUSRC='b0;
        J_Type='b1;
    end
    7'b0110111://Lui
    begin
        reg_w ='b1;
        mem_w ='b0;
        mem_r ='b0;
        branch='b0;
        ALUSRC='b1;
        J_Type='b0;
    end
    7'b0010111:
    begin
        reg_w ='b1;
        mem_w ='b0;
        mem_r ='b0;
        branch='b0;
        ALUSRC='b0;
        J_Type='b0;
        end

    default:
    begin
        reg_w ='b0;
        mem_w ='b0;
        mem_r ='b0;
        branch='b0;
        ALUSRC='b0;
        ALU0  ='b0;
        ALU1  ='b0;
        J_Type='b0;
    end
endcase
end
endmodule
