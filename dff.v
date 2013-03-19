
<!-- saved from url=(0084)http://pages.cs.wisc.edu/~karu/courses/cs552/spring2013//handouts/verilog_code/dff.v -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
// D-flipflop

module dff (q, d, clk, rst);

    output         q;
    input          d;
    input          clk;
    input          rst;

    reg            state;

    assign #(1) q = state;

    always @(posedge clk) begin
      state = rst? 0 : d;
    end

endmodule
// DUMMY LINE FOR REV CONTROL :0:
</pre></body></html>