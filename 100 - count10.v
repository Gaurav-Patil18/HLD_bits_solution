// Problem: 100 - count10
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        begin
            if(reset) q<='b0;
            else q<=(q=='d9)?'b0:(q+1);
        end    
endmodule
