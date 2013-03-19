module mem(clk, rst);
  
  input clk, rst;
  
  memory2c memory(
                  //Inputs
                  data_in, addr, enable, wr, createdump, .clk(clk), .rst(rst),
                  //Outputs
                  data_out
                  );
  
endmodule