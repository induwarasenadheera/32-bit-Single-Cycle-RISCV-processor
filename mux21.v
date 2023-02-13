module mux21(input [31:0] D0, input [31:0] D1, input select, output reg [31:0] SelData);
    always@(*) begin 
    if (select == 0) 
         SelData = D0 ;
    else
         SelData = D1;
	 end
endmodule