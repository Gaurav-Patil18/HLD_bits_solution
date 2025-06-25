// Problem: 98 - dualedge
module top_module (
    input clk,
    input d,
    output q
);
reg q_reg1,q_reg2;
    always@(posedge clk)begin
       	q_reg1<=d^q_reg2;
    end
    
    always@(negedge clk)begin
        q_reg2<=d^q_reg1;
    end
    assign q=q_reg1^q_reg2;     
endmodule
