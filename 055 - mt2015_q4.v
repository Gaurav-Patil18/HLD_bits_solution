// Problem: 55 - mt2015_q4
module top_module (input x, input y, output z);
    A a1(.x(x),.y(y),.z(z1));
    A a2(.x(x),.y(y),.z(z2));
    B b1(.x(x),.y(y),.z(z3));
    B b2(.x(x),.y(y),.z(z4));
    wire z1,z2,z3,z4;
    assign z=(z2&z4)^(z1|z3);
endmodule

module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B (input x, input y, output z);
    assign z = ~(x^y);
endmodule
