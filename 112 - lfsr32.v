// Problem: 112 - lfsr32
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg[31:0] q
); 
    always@(posedge clk)
        begin
            if(reset) q<='d1;
            else 
                begin
                    q<={q[0],q[31:23],q[22]^q[0],q[21:3],q[2]^q[0],q[1]^q[0]};
                end
        end
endmodule
