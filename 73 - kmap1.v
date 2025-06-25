// Problem: 73 - kmap1
module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out=b|c|((~b)&&a);
endmodule
