// Problem: 97 - edgecapture
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]out_int;
    always@(posedge clk)begin
        if(reset)begin
            out<='d0;
            out_int<=in;
        end else begin
            out_int<=in;
            out<=((out_int&(~in))=='d0)?out:(out|(out_int&(~in)));
        end
            
    end
endmodule
