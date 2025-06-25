// Problem: 7 - norgate
module top_module( 
    input a, 
    input b, 
    output out );
    assign out=~(a|b);
endmodule
