// Problem: 53 - mt2015_q4a
module top_module (input x, input y, output z);
    assign z = (x^y) & x;
endmodule
