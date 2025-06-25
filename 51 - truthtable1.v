// Problem: 51 - truthtable1
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    wire [2:0]x;
    assign x={x3,x2,x1};
    assign f=(x=='d2)|(x=='d3)|(x=='d5)|(x=='d7);
endmodule
