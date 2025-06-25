// Problem: 180 - cs450/counter_2bc
module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    always@(posedge clk,posedge areset)begin
        if(areset)state<='d1;
        else if(train_valid)begin
            if(train_taken)state<=(state=='d3)?'d3:(state+1);
            else  state<=(state=='d0)?'d0:(state-1);  
        end
    end
endmodule
