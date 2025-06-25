// Problem: 24 - module_shift8
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0]q0,q1,q2;
    my_dff8 x( clk, d, q0 );
    my_dff8 y(  clk, q0,  q1 );
    my_dff8 z( clk, q1, q2 );
    
    always@(*)begin
        case(sel)
            'd3:q=q2;
            'd2:q=q1;
            'd1:q=q0;
            default:q=d;
        endcase
    end
endmodule
