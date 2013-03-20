module idecoder(
                //Input
                instr,
                //Output
                //id reg controls
                rfwr, rsAddr, rtAddr, rdAddr,
                //id ext controls
                op, immsel,
                //id reg/imm controls
                immregsel, src1sel,
                //id inv controls
                src2inv,
                //id br/jmp controls
                beqz, bnez, bltz, bgez,
                //infetch controls
                j, jr, jal, jalr, halt,
                //ex controls
                sub, aluctl, seq, slt, sle, sco,
                //mem controls
                enable, wr, createdump,
                //wboutputs
                memalusel
                );
  parameter HALT = 5'b00000,
            NOP  = 5'b00001,
            ADDI = 5'b01000,
            SUBI = 5'b01001,
            XORI = 5'b01010,
            ANDNI = 5'b01011,
            ROLI = 5'b10100,
            SLLI = 5'b10101,
            RORI = 5'b10110,
            SRLI = 5'b10111,
            ST = 5'b10000,
            LD = 5'b10001,
            
            STU = 5'b10011,
            
            BTR = 5'b11001,
            ALU = 5'b11011,
            SFT = 5'b11010,
            SEQ = 5'b11100,
            SLT = 5'b11101,
            SLE = 5'b11110,
            
            SCO = 5'b11111,
            
            BEQZ = 5'b01100,
            BNEZ = 5'b01101,
            BLTZ = 5'b01110,
            BGEZ = 5'b01111,
            
            LBI = 5'b11000,
            SLBI = 5'b10010,
            
            J = 5'b00100,
            JR = 5'b00101,
            JAL = 5'b00110,
            JALR = 5'b00111,
            
            SIIC = 5'b00010,
            RTI = 5'b00011;
  
  //////////////
  //INPUT/OUTPUT
  //////////////
  
  input [15:0] instr;
  
  //id reg controls
  output reg rfwr;
  output reg [2:0] rsAddr, rtAddr, rdAddr;
  //id ext controls
  output reg op;
  output reg [1:0] immsel;
  //id reg/imm controls
  output reg immregsel, src1sel;
  //id inv controls
  output src2inv;
  //id br/jmp controls
  output reg beqz, bnez, bltz, bgez;
  //infetch controls
  output reg j, jr, jal, jalr, halt;
  //ex controls
  output sub;
  output reg seq, slt, sle, sco;
  output reg [3:0] aluctl;
  //mem controls
  output reg enable, wr, createdump;
  //wboutputs
  output reg memalusel;
  
  ////////////////
  //INTERNAL WIRES
  ////////////////
  
  wire one, three;
  
  //Controlling logic
  always@(*) begin
    //Set default values to avoid additional flops
    rfwr = 0; rsAddr = 3'b0; rtAddr = 3'b0; rdAddr = 3'b0;
    op = 0; immsel = 2'b0;
    immregsel = 0; src1sel = 0;
    beqz = 0; bnez = 0; bltz = 0; bgez = 0;
    j = 0; jr = 0; jal = 0; jalr = 0; halt = 0;
    seq = 0; slt = 0; sle = 0; sco = 0;
    aluctl = 4'b0;
    enable = 0; wr = 0; createdump = 0;
    memalusel = 0;
    case(instr[15:11])
      HALT: begin
        halt = 1;
        createdump = 1;
      end
      NOP: begin
      end
      ADDI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 1;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      SUBI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 1;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      XORI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 0;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0010;
        memalusel = 0;
      end
      ANDNI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 0;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0011;
        memalusel = 0;
      end
      ROLI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 0;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0100;
        memalusel = 0;
      end
      SLLI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 0;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0101;
        memalusel = 0;
      end
      RORI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 0;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0110;
        memalusel = 0;
      end
      SRLI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 0;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0111;
        memalusel = 0;
      end
      ST: begin
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        op = 1;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0000;
        enable = 1;
        wr = 1;
      end
      LD: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[7:5];
        op = 1;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0000;
        enable = 1;
        memalusel = 1;
      end
      STU: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[7:5];
        op = 1;
        immsel = 2'b00;
        immregsel = 1;
        aluctl = 4'b0000;
        enable = 1;
        wr = 1;
        memalusel = 0;
      end
      BTR: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[4:2];
        aluctl = 4'b1001;
        memalusel = 0;
      end
      ALU: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[4:2];
        immregsel = 0;
        aluctl = {2'b00, instr[1:0]};
        memalusel = 0;
      end
      SFT: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[4:2];
        immregsel = 0;
        aluctl = {2'b01, instr[1:0]};
        memalusel = 0;
      end
      SEQ: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[4:2];
        immregsel = 0;
        seq = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      SLT: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[4:2];
        immregsel = 0;
        slt = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      SLE: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[4:2];
        immregsel = 0;
        sle = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      SCO: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rtAddr = instr[7:5];
        rdAddr = instr[4:2];
        immregsel = 0;
        sco = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      BEQZ: begin
        rsAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        beqz = 1;
      end
      BNEZ: begin
        rsAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        bnez = 1;
      end
      BLTZ: begin
        rsAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        bltz = 1;
      end
      BGEZ: begin
        rsAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        bgez = 1;
      end
      LBI: begin
        rfwr = 1;
        rdAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        immregsel = 1;
        src1sel = 1;
        aluctl = 4'b0000;
        memalusel = 0;
      end
      SLBI: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        immregsel = 1;
        aluctl = 4'b1000;
        memalusel = 0;
      end
      J: begin
        op = 1;
        immsel = 2'b10;
        j = 1;
      end
      JR: begin
        rsAddr = instr[10:8];
        op = 1;
        immsel = 2'b01;
        jr = 1;
      end
      JAL: begin
        rfwr = 1;
        rdAddr = 3'b111;
        op = 1;
        immsel = 2'b10;
        jal = 1;
      end
      JALR: begin
        rfwr = 1;
        rsAddr = instr[10:8];
        rdAddr = 3'b111;
        op = 1;
        immsel = 2'b01;
        jalr = 1;
      end
    endcase
  end
  
  assign sub = (instr[15:11] == SUBI) | ((instr[15:11] == ALU) & one) | (instr[15:13] == 3'b111);
  assign src2inv = (instr[15:11] == ANDNI) | ((instr[15:11] == ALU) & three);
  assign one = (instr[1:0] == 2'b01);
  assign three = (instr[1:0] == 2'b11);
  
endmodule