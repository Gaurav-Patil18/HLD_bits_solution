// Problem: 172 - sim/circuit9
module top_module (
    input clk,
    input a,
    output [3:0] q );
    always@(posedge clk)
        if(!a)q=(q=='d6)?'d0:(q+1);
    else q='d4;
endmodule
