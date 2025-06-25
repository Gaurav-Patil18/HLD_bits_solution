// Problem: 8 - xnorgate
module top_module( 
    input a, 
    input b, 
    output out );
    assign out=~(a^b);
endmodule
