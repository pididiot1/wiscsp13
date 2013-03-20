module fullAdder_bench();
  
  reg a, b, cin;
  wire sum, cout;
  
  fullAdder adder(.sum(sum),.cout(cout),.a(a),.b(b),.cin(cin));
  
  initial begin
    a = 0; b = 0; cin = 0;
    #16 $stop;
  end
  
  
  always begin
    #2 a = ~a;
  end
  always #4 b = ~b;
  always #8 cin = ~cin;
endmodule
