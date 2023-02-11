module data_memory (addr, write_data, read_data, clk, mem_read, mem_write, signed_unsigned, mem_size);

   input [31:0] addr;
   input [31:0] write_data;
   output reg [31:0] read_data;

   input clk, mem_read, mem_write, signed_unsigned;
   input [1:0] mem_size;

   reg [31:0] dmemory [63:0];
   reg [31:0] write_data_in;

   wire [5:0] shifted_addr;
   wire [2:0] DATA_MEM_In;
   wire [31:0] DATA;

   assign shifted_addr = addr[5:0];

   assign DATA_MEM_In = {signed_unsigned,mem_size};
   assign DATA = (mem_read) ? dmemory[addr] : 32'bx;

   always @(posedge clk)
   begin
       if (mem_read == 1'b1)

           begin

               case(DATA_MEM_In)
               3'b001: begin
                   read_data[7:0] = DATA[7:0];
                   read_data[31:8] = DATA[7]?24'b111111111111111111111111 : 8'b0 ;
                   end

               3'b010:begin
                   read_data[15:0] = DATA[15:0];
                   read_data[31:15] = DATA[15]?16'b1111111111111111 : 8'b0 ;
                   end

               3'b011: read_data = DATA;
               3'b101: read_data = {24'b0, DATA[7:0]};
               3'b110: read_data= {16'b0, DATA[15:0]};
               endcase

           end

       else if (mem_write == 1'b1)

           begin

               case(DATA_MEM_In)
               3'b001: begin
                   write_data_in = {24'b0, write_data[7:0]};
                   dmemory[addr] = write_data_in;
               end
               3'b010:begin
                   write_data_in = {16'b0, write_data[15:0]};
                   dmemory[addr] = write_data_in;
               end

               3'b011:begin
                   dmemory[addr] = write_data;
               end
               endcase
           end

   end

endmodule