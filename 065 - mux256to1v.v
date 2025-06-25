// Problem: 65 - mux256to1v
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    wire [3:0]in_2d[255:0];
    genvar i;
    generate
        for(i=0;i<1024;i=i+4)begin :a
            assign in_2d[i/4]={in[i+3],in[i+2],in[i+1],in[i]};
        end
    endgenerate
    
    assign out=in_2d[sel];
endmodule
