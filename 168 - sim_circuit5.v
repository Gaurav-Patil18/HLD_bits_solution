// Problem: 168 - sim/circuit5
module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output reg[3:0] q );
    always@(*)begin
        case(c)
            'd0:q=b;
            'd1:q=e;
            'd2:q=a;
            'd3:q=d;
            default:q='hf;
        endcase
    end
endmodule
