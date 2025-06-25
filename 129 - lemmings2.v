// Problem: 129 - lemmings2
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
	output aaah); //  

    parameter L=0, R=1;
    reg aaah_int;
    reg state, next_state;
    wire [1:0]lr;
    assign lr={bump_left,bump_right};
    always @(*) begin
        // State transition logic
        case(state)
            L:next_state=((lr=='b00)|(lr=='b01)|(aaah=='b1)|(ground=='b0))?L:R;
            R:next_state=((lr=='b00)|(lr=='b10)|(aaah=='b1)|(ground=='b0))?R:L;
            default:next_state=L;    
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)state<=L;
        else state<=next_state;
    end

    always@(posedge clk)begin
        aaah<=(~ground);
    end
    // Output logic
    assign walk_left = (!aaah)?(~state):0;
    assign walk_right = (!aaah)?(state):0;

endmodule
