module id(
          //Input
          clk, rst, instr, write_data,
          //Output
          error,
          //Fetch Control
          jalr, brj, fimm, register,
          //Datapath Control
          sub, src0, src1, aluctl, setctl,
          //Memory Control
          enable, wr, createdump, data_in,
          //Writeback Control
          memalusel
          );
          
  //////////////
  //INPUT/OUTPUT
  //////////////
  
  //proc inputs
  input clk, rst;
  //infetch inputs
  input [15:0] instr;
  //wb inputs
  input [15:0] write_data;
  
  //proc outputs
  output error;
  //infetch outputs
  output jalr, brj;
  output [15:0] fimm, register;
  //ex outputs
  output sub;
  output [1:0] setctl;
  output [2:0] aluctl;
  output [15:0] src0, src1;  
  //mem outputs
  output enable, wr, createdump;
  output [15:0] data_in;
  //wb outputs
  output memalusel;
  
  ////////////////
  //INTERNAL WIRES
  ////////////////
  
  //Decoder -> Register File
  wire rfwr;
  wire [2:0] rsAddr, rtAddr, rdAddr;  
  //Decoder -> Extender
  wire op;
  wire [1:0] immsel;
  //Decoder -> Reg/Imm Mux
  wire immregsel;
  //Decoder -> Src2 Inv
  wire src2inv;
  //Decoder -> Branch/Jump
  wire beqz, bnez, bltz, bgez;
  //Register File -> Reg/Imm Mux
  wire [15:0] rt;
  //Register File -> Inverter
  wire [15:0] rs;
  //Register File -> Error
  wire rfErr;
  //Extender -> Reg/Imm Mux
  wire [15:0] imm;
  //Extender -> Error
  wire extErr;
  //Reg/Imm Mux -> Inv
  wire [15:0] src2i;
  //Flags -> Branch/Jump
  wire zero, notzero, neg, posz;
  
  
  rf_bypass rf(
           // Outputs
           .read1data(rs), .read2data(rt), .err(rfErr),
           // Inputs
           .clk(clk), .rst(rst), .read1regsel(rsAddr), .read2regsel(rtAddr), 
           .writeregsel(rdAddr), .writedata(write_data), .write(rfwr)
           );
  ext extender(
            //Input
            .instr(instr[10:0]), .select(immsel), .op(op),
            //Output
            .imm(imm), .err(extErr)
            );
  sixteenmux2_1 regimm(
            //Input
            .InA(rt), .InB(imm), .Op(immregsel), 
            //Output
            .Out(src2i)
            );
  flags branchflags(
            //Input
            .in(rs),
            //Output
            .zero(zero), .notzero(notzero), .neg(neg), .posz(posz)
            );
            
  assign data_in = rt;
  
  //Invert outputs if necessary
  assign src0 = sub ? ~rs : rs;
  assign src1 = src2inv ? ~src2i : src2i;
  assign fimm = imm;
endmodule