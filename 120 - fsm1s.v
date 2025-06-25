// Problem: 120 - fsm1s
module top_module(clk, reset, in, out);
    input clk;
    input reset;
    input in;
    output reg out;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin
           
            next_state = 1'b0;
        end else begin
            
            case (present_state)
                1'b0: next_state = in ? 1'b0 : 1'b1; // B
                1'b1: next_state = in ? 1'b1 : 1'b0; // A
            endcase  
        end

         present_state = next_state;
        case (present_state)
            1'b0: out = 1'b1; // State B
            1'b1: out = 1'b0; // State A
        endcase
    end
endmodule
