// Problem: 101 - count1to10
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        begin
            if(reset) q<='b1;
            else q<=(q=='d10)?'b1:(q+1);
        end    
endmodule
