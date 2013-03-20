module mem(
          //Inputs
          clk, rst, data_in, addr, enable, wr, createdump,
          //Outputs
          data_out
          );
  
  //proc inputs
  input clk, rst;
  //id inputs
  input enable, wr, createdump;
  input [15:0] data_in;
  //ex inputs
  input [15:0] addr;
  
  output [15:0] data_out;
  
  memory2c dmem(
                  //Inputs
                  .data_in(data_in), .addr(addr), .enable(enable), .wr(wr), 
                  .createdump(createdump), .clk(clk), .rst(rst),
                  //Outputs
                  .data_out(data_out)
                  );
  
endmodule