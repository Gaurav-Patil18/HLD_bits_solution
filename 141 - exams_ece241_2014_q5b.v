// Problem: 141 - exams/ece241_2014_q5b
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg state;
    always@(posedge clk,posedge areset)begin
        if(areset)state<=0;
        else state<=state?state:x;
    end
    
    assign z=state?(x?0:1):x;
endmodule

