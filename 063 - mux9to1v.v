// Problem: 63 - mux9to1v
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output reg[15:0] out );
    always@(*)begin
        case(sel)
            'd0:out=a;
            'd1:out=b;
            'd2:out=c;
            'd3:out=d;
            'd4:out=e;
            'd5:out=f;
            'd6:out=g;
            'd7:out=h;
            'd8:out=i;
            default:out=16'hFFFF;    
        endcase
    end
endmodule
