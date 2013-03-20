module halfAdder(sum,cout,a,cin);
    
output sum, cout;
input a, cin;
                
assign sum = a ^ cin;
assign cout = a & cout;
                        
endmodule
