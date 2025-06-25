// Problem: 169 - sim/circuit6
module top_module (
    input [2:0] a,
    output [15:0] q ); 
    always@(*)begin
        case(a)
            'd0:q='h1232;
            'd1:q='haee0;
            'd2:q='h27d4;
            'd3:q='h5a0e;
            'd4:q='h2066;
            'd5:q='h64ce;
            'd6:q='hc526;
            'd7:q='h2f19;
            default:q='h0000;
            
        endcase
    end
endmodule
