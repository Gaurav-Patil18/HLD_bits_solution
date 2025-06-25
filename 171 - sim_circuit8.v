// Problem: 171 - sim/circuit8
module top_module (
    input clock,
    input a,
    output p,
    output q);
    reg j,k;
    always@(negedge clock)begin
        k<=a;
    end
    assign p=(clock)?a:k;
    assign q=k;
endmodule
