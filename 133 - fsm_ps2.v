// Problem: 133 - fsm_ps2
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
parameter a=0,b=1,c=2,d=3;
    reg[1:0]state,next_state;
    // State transition logic (combinational)
    always@(*)begin
        case(state)
           	    a:next_state=in[3]?b:a;
                b:next_state=c;
                c:next_state=d;
           	    d:next_state=in[3]?b:a;
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk)begin
        if(reset)state<=a;
        else state<=next_state;
    end
    // Output logic
    always@(*)begin
        case(state)
                a:done=0;
                b:done<=0;
                c:done<=0;
           	    d:done<=1;
        endcase
    end
endmodule
