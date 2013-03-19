module infetch(clk, rst);
  
  input clk, rst;
  
  reg16b pc(.writeData, .readData, .writeEn, .clk(clk), .rst(rst));
  memory2c imem(data_out, data_in, addr, enable, wr, createdump, .clk(clk), .rst(rst));
  
  
endmodule
