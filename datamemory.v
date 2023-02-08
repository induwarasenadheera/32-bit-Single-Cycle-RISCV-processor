module datamemory (
  input clk,
  input [31:0] address,
  input [31:0] data_in,
  input write_enable,
  input read_enable,
  output reg [31:0] data_out
);

  reg [31:0] mem [0:1023];

  always @(posedge clk) begin
    if (write_enable)
      mem[address] = data_in;
    else if (read_enable)
      data_out = mem[address];
  end

//  initial begin
//    for (int i = 0; i < 1024; i = i + 1)
//      mem[i] = i;
//  end

endmodule
