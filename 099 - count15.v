// Problem: 99 - count15
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        begin
            q<=(reset)?'b0:(q+1);
        end    
endmodule
