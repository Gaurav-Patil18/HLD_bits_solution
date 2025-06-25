// Problem: 117 - rule110
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg[511:0] q ); 

 wire [511:0]q_a;
    
    assign q_a[0]=q[0];
    assign q_a[511]=q[511]|(q[511]^q[510]);
    
    always@(posedge clk)
        begin
            if(load)q<=data;
            else 
                begin 
                   q<=q_a; 
                end
        end
    
genvar i;      
generate
    for(i=1;i<=510;i=i+1)
                        begin:a
                            assign q_a[i]=((q[i]&&(~q[i+1]))|(q[i]^q[i-1]));   
                        end
endgenerate
endmodule
