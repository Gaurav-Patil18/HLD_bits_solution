// Problem: 46 - exams/m2014_q4e
module top_module (
    input in1,
    input in2,
    output out);
    assign out=~(in1|in2);
endmodule
