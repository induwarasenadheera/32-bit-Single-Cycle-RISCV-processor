module PC(
    input clk,
    input reset,
    input [31:0] nextPC,
    output reg [31:0] currPC
    );
    
	 
  always @ (posedge clk or posedge reset) begin
        if (reset) begin
            currPC <= 32'h0000_0004;
        end
        else begin
            currPC <= nextPC;
        end
    end
    
endmodule