// Problem: 173 - sim/circuit10
module top_module (
    input clk,
    input a,
    input b,
    output reg q,
    output reg state  );

    reg next_state;
    always@(*)begin
        if(state)next_state=((a|b));
        else  next_state=(a&b);
    end
    
    always@(posedge clk)begin
        state<=next_state;
    end
    
    always@(*)begin
        if(state)q=~(a^b);
         else  q=(a^b);
    end
endmodule
