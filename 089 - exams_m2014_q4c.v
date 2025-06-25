// Problem: 89 - exams/m2014_q4c
module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
 always@(posedge clk)begin
        if(r)q<='b0;
        else q<=d;
    end
endmodule
