// Problem: 128 - lemmings1
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter L=0, R=1;
    reg state, next_state;
    wire [1:0]lr;
    assign lr={bump_left,bump_right};
    always @(*) begin
        // State transition logic
        case(state)
            L:next_state=((lr=='b00)|(lr=='b01))?L:R;
            R:next_state=((lr=='b00)|(lr=='b10))?R:L;
            default:next_state=L;    
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)state<=L;
        else state<=next_state;
    end

    // Output logic
    assign walk_left = ~state;
    assign walk_right = state;

endmodule
