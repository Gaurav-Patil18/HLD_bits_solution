// Problem: 118 - conwaylife
module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg[255:0] q ); 
    
genvar i,j,l,m,k,n;
wire [15:0]mem[15:0];
wire [15:0]mem1[15:0];
wire [255:0]q1;
    wire [3:0]sum[255:0];

	 generate
         for (k=0;k<16;k=k+1) begin :a
             for(n=0;n<16;n=n+1)begin: b
                			 assign mem1[k][n]=q[(16*k)+n];
                            end
                        end
    endgenerate    
    
    
    
    generate
        for (i=0;i<16;i=i+1) begin :b
            for(j=0;j<16;j=j+1)begin: c

                assign sum[16*i+j]=mem1[(i==15)?0:i+1][j]+mem1[i][(j==15)?0:j+1]+mem1[(i==15)?0:i+1][(j==15)?0:j+1]+mem1[i][(j==0)?'d15:j-1]+mem1[(i==15)?0:i+1][(j==0)?'d15:j-1]+mem1[(i==0)?'d15:i-1][j]+mem1[(i==0)?'d15:i-1][(j==0)?'d15:j-1]+mem1[(i==0)?'d15:i-1][(j==15)?0:j+1];
                assign mem[i][j]=(sum[16*i+j]=='d2)?mem1[i][j]:((sum[16*i+j]=='d3)?'d1:'d0);
            end
        end
    endgenerate
    
    generate
         for (l=0;l<16;l=l+1) begin :d
              for(m=0;m<16;m=m+1)begin: e
                               assign q1[(16*l)+m]=mem[l][m];
                            end
                        end
    endgenerate
    
    always@(posedge clk)
        begin
                if(load)q<=data;
            else begin
                       q<=q1;
                
            end
        end
endmodule
