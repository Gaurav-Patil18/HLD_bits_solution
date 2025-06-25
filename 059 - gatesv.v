// Problem: 59 - gatesv
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
genvar i,j,k;
    generate
        for(i=0;i<'d3;i=i+1)begin :a
            assign out_both[i]=in[i]&in[i+1];
        end
    endgenerate
    
    generate
        for(j=1;j<'d4;j=j+1)begin :b
            assign out_any[j]=in[j]|in[j-1];
        end
    endgenerate
    
    generate
        for(k=0;k<'d4;k=k+1)begin :c
            assign out_different[k]=in[k]^in[(k+1)%4];
        end
    endgenerate
    
endmodule
