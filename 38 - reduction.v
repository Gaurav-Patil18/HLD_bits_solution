// Problem: 38 - reduction
module top_module (
    input [7:0] in,
    output parity); 
assign parity=^in;
endmodule
