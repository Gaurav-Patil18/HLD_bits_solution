// Problem: 152 - exams/review2015_count1k
module top_module (
    input clk,
    input reset,
    output reg[9:0] q);
    always@(posedge clk)begin
        if(reset)q<='b0;
        else q<=(q=='d999)?0:(q+1);
    end
endmodule
