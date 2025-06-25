// Problem: 75 - kmap3
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out=(c&(~b))|a;
endmodule
