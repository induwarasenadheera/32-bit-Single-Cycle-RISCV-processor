module CSD_Golden_Top(




	//////////// SEG7 //////////
	input [31:0] data,

	output		     [6:0]		HEX0,

	output		     [6:0]		HEX1,

	output		     [6:0]		HEX2,

	output		     [6:0]		HEX3,

	output		     [6:0]		HEX4,  		//comment this using "//" if you are using Altera DE0 

	output		     [6:0]		HEX5,		//comment this using "//" if you are using Altera DE0

    output		     [6:0]      HEX6,
    output		     [6:0]      HEX7
	//////////// LED  //////////




	//////////// SW  //////////



);


wire [6:0] out_ssd;
wire [6:0] out_ssd1;
wire [6:0] out_ssd2;
wire [6:0] out_ssd3;
wire [6:0] out_ssd4;
wire [6:0] out_ssd5;
wire [6:0] out_ssd6;
wire [6:0] out_ssd7;


//=======================================================
//  REG/WIRE declarations
//=======================================================
SevenSeg s0(data[3:0],out_ssd);
SevenSeg s1(data[7:4],out_ssd1);
SevenSeg s2(data[11:8],out_ssd2);
SevenSeg s3(data[15:12],out_ssd3);
SevenSeg s4(data[19:16],out_ssd4);
SevenSeg s5(data[23:20],out_ssd5);
SevenSeg s6(data[27:24],out_ssd6);
SevenSeg s7(data[31:28],out_ssd7);

assign HEX0 = out_ssd;
assign HEX1 = out_ssd1;
assign HEX2 = out_ssd2;
assign HEX3 = out_ssd3;
assign HEX4 = out_ssd4;
assign HEX5 = out_ssd5;
assign HEX6 = out_ssd6;
assign HEX7 = out_ssd7;




//=======================================================
//  Structural coding
//=======================================================



endmodule