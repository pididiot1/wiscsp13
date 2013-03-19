module ext_bench();
  
  reg op;
  reg [1:0] select;
  reg [10:0] instr;
  
  wire err;
  wire [15:0] imm;
  
  ext extender(
            //Input
            .instr(instr), .select(select), .op(op), 
            //Output
            .imm(imm), .err(err)
            );
            
  initial begin
    instr = 11'b10111010101;
    select = 2'b00;
    op = 0;
    #16 $stop;
  end
  
  always begin
    #2 op = 1;
    #2 op = 0;
       select = 2'b01;
    #2 op = 1;
    #2 op = 0;
       select = 2'b10;
    #2 op = 1;
    #2 op = 0;
       select = 2'b11;
    #2 op = 1;
  end
  
endmodule