module sum(sum,a,b,cin);
    
    output sum;
    input a, b, cin;
    wire axorb;
        
    assign axorb = a ^ b;
    assign sum = axorb ^ cin;
            
endmodule
