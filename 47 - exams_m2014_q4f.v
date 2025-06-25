// Problem: 47 - exams/m2014_q4f
module top_module (
    input in1,
    input in2,
    output out);
    assign out=in1&&(~in2);
endmodule
