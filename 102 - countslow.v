// Problem: 102 - countslow
module top_module (
    input clk,
    input slowena,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        begin
            if(reset) q<='b0;
            else if(slowena) q<=(q=='d9)?'b0:(q+1);
        end    
endmodule
