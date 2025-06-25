// Problem: 94 - exams/ece241_2013_q7
module top_module (
    input clk,
    input j,
    input k,
    output reg Q); 

     always@(posedge clk)begin
         case({j,k})
                 2'b01:Q<=0;
                 2'b10:Q<=1;
                 2'b11:Q<=~Q;
         endcase
    end


endmodule
