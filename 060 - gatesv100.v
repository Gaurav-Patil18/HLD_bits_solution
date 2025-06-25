// Problem: 60 - gatesv100
module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
genvar i,j,k;
    generate
        for(i=0;i<'d99;i=i+1)begin :a
            assign out_both[i]=in[i]&in[i+1];
        end
    endgenerate
    
    generate
        for(j=1;j<'d100;j=j+1)begin :b
            assign out_any[j]=in[j]|in[j-1];
        end
    endgenerate
    
    generate
        for(k=0;k<'d100;k=k+1)begin :c
            assign out_different[k]=in[k]^in[(k+1)%100];
        end
    endgenerate
    
endmodule
