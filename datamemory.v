module datamemory (addr, write_data, read_data, clk, mem_read, mem_write, DATA_MEM_In);

   input [31:0] addr;
   input [31:0] write_data;
   input clk, mem_read, mem_write;
   input [2:0] DATA_MEM_In;
   output reg [31:0] read_data;

   reg [31:0] dmemory [64:0];
   reg [31:0] write_data_in;

   wire [5:0] shifted_addr;
   wire [2:0] DATA_MEM_In;
   wire [31:0] DATA;

  assign shifted_addr = addr[5:0];

  //assign DATA = dmemory[addr];
	
	

   always @(posedge clk)
   begin
       if (mem_read == 1'b1)

           begin

               case(DATA_MEM_In)
               3'b001: begin
                 read_data = $signed(dmemory[shifted_addr][7:0]);
   
                   end

               3'b010:begin
                 read_data = $signed(dmemory[shifted_addr][15:0]);
                   end

               3'b011: read_data = dmemory[shifted_addr];
                 3'b101: read_data = $unsigned(dmemory[shifted_addr][7:0]);
                 3'b110: read_data= $unsigned(dmemory[shifted_addr][15:0]);
               endcase

           end

       else if (mem_write == 1'b1)

           begin

               case(DATA_MEM_In)
               3'b001: begin
                 write_data_in = $signed(write_data[7:0]);
                   dmemory[shifted_addr] = write_data_in;
               end
               3'b010:begin
                 write_data_in = $signed(write_data[15:0]);
                   dmemory[shifted_addr] = write_data_in;
               end

               3'b011:begin
                   dmemory[shifted_addr] = write_data;
               end
               endcase
           end
		end	
endmodule