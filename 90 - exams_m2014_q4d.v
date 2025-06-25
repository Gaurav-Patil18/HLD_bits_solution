// Problem: 90 - exams/m2014_q4d
module top_module (
    input clk,
    input in, 
    output reg out);
 always@(posedge clk)begin

		 out<=out^in;
    end
endmodule
