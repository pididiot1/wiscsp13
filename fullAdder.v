module fullAdder(sum,cout,a,b,cin);
    
    output sum, cout;
    input a, b, cin;
    wire axorb, aandb, cinandxor;
        
    assign axorb = a ^ b;
    assign aandb = a & b;
    assign sum = axorb ^ cin;
    assign cinandxor = cin & axorb;
    assign cout = aandb | cinandxor;
            
endmodule
