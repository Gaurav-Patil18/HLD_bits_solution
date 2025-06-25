// Problem: 131 - lemmings4
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output reg aaah,
    output digging ); 

    parameter L=0, R=1;
    reg state, next_state;
    reg Q;
    reg[4:0]counter;
    reg en;
    wire select;
    wire [1:0]lr;
    assign lr={bump_left,bump_right};
    always @(*) begin
        // State transition logic
        case(state)
            L:next_state=((lr=='b00)|(lr=='b01)|(aaah=='b1)|(ground=='b0)|(dig)|(digging))?L:R;
            R:next_state=((lr=='b00)|(lr=='b10)|(aaah=='b1)|(ground=='b0)|(dig)|(digging))?R:L;
            default:next_state=L;    
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            begin 
                state<=L;
                 Q<=0;
                counter<='b0;
                en<=0;
                aaah<=0;
            end
        else 
            begin
                state<=next_state;
                aaah<=en?0:(~ground);
                Q<=(select)?(~Q):(Q);
                
                if(aaah)counter<=(counter=='d20)?'d20:counter+1;
                else counter<=(counter=='d20)?'d20:0;
                en<=en?(en):((counter=='d20)&&(ground));
                
            end
    end

    
    // Output logic
    assign walk_left = en?0:(((aaah)|(digging))?0:(~state));
    assign walk_right = en?0:(((aaah)|(digging))?0:(state));
    assign select=Q?(~ground):(((aaah=='b0)&&(ground=='b1))&&dig);
    assign digging=en?0:Q;

endmodule
