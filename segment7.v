module segment7(
input clk,
input[31:0] ALU_result,
output  [6:0]		HEX0,
output [6:0]		HEX1,
output [6:0]		HEX2,
output [6:0]		HEX3,
output [6:0]		HEX4,  	
output [6:0]		HEX5,	
output [6:0]		HEX6,
output [6:0]	HEX7	

);

always @(posedge clk)
   begin
	case(ALU_result[3:0])
	4'b0001: HEX0 <= 7'b1001111;	/* Symbol "1" */
	4'b0000: HEX0 <= 7'b0000001;	/* Symbol "0" */
	4'b0010: HEX0 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX0 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX0 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX0 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX0 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX0 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX0 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX0 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX0 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX0 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX0 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX0 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX0 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX0 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[7:4])
	4'b0000: HEX1 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX1 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX1 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX1 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX1 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX1 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX1 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX1 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX1 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX1 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX1 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX1 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX1 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX1 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX1 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX1 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[11:8])
	4'b0000: HEX2 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX2 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX2 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX2 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX2 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX2 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX2 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX2 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX2 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX2 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX2 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX2 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX2 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX2 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX2 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX2 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[15:12]) 
	4'b0000: HEX3 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX3 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX3 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX3 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX3 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX3 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX3 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX3 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX3 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX3 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX3 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX3 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX3 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX3 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX3 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX3 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[19:16])
	4'b0000: HEX4 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX4 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX4 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX4 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX4 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX4 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX4 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX4 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX4 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX4 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX4 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX4 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX4 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX4 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX4 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX4 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[23:20])
	4'b0000: HEX5 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX5 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX5 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX5 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX5 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX5 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX5 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX5 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX5 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX5 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX5 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX5 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX5 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX5 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX5 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX5 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[27:24]) 
	4'b0000: HEX6 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX6 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX6 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX6 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX6 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX6 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX6 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX6 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX6 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX6 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX6 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX6 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX6 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX6 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX6 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX6 <= 7'b0111000;	/* Symbol "F" */
	endcase
	
	case(ALU_result[31:28]) 
	4'b0000: HEX7 <= 7'b0000001;	/* Symbol "0" */
	4'b0001: HEX7 <= 7'b1001111;	/* Symbol "1" */
	4'b0010: HEX7 <= 7'b0010010;	/* Symbol "2" */
	4'b0011: HEX7 <= 7'b0000110;	/* Symbol "3" */
	4'b0100: HEX7 <= 7'b1001100;	/* Symbol "4" */
	4'b0101: HEX7 <= 7'b0100100;	/* Symbol "5" */
	4'b0110: HEX7 <= 7'b0100000;	/* Symbol "6" */
	4'b0111: HEX7 <= 7'b0001111;	/* Symbol "7" */
	4'b1000: HEX7 <= 7'b0000000;	/* Symbol "8" */
	4'b1001: HEX7 <= 7'b0001100;	/* Symbol "9" */
	4'b1010: HEX7 <= 7'b0001000;	/* Symbol "A" */
	4'b1011: HEX7 <= 7'b1100000;	/* Symbol "b" */
	4'b1100: HEX7 <= 7'b0110001;	/* Symbol "C" */
	4'b1101: HEX7 <= 7'b1000010;	/* Symbol "d" */
	4'b1110: HEX7 <= 7'b0110000;	/* Symbol "E" */
	4'b1111: HEX7 <= 7'b0111000;	/* Symbol "F" */
	endcase
   end
	endmodule
	