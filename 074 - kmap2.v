// Problem: 74 - kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out=(c|(~d)|(~b))&(c|(~a)|(~b))&(a|b|(~c)|(~d))&(d|(~a)|(~c));
endmodule
