// Problem: 23 - module_shift
module top_module ( input clk, input d, output q );
wire q0,q1;
    my_dff x( clk, d, q0 );
    my_dff y(  clk, q0,  q1 );
    my_dff z( clk, q1, q );
endmodule
