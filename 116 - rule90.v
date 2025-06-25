// Problem: 116 - rule90
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
 genvar i;   
 wire [511:0]q_a;
    assign q_a[0]=q[1];
    assign q_a[511]=q[510];
    always@(posedge clk)
        begin
            if(load)q<=data;
            else 
                begin 
                   q<=q_a; 
                end
        end
generate
    for(i=1;i<=510;i=i+1)
                        begin:a
                           assign q_a[i]=q[i-1]^q[i+1];   
                        end
endgenerate
endmodule
