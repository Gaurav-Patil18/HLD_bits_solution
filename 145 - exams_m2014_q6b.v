// Problem: 145 - exams/m2014_q6b
module top_module (
    input [3:1] y,
    input w,
    output Y2);
    parameter a=0,b=1,c=2,d=3,e=4,f=5;
    always@(*)begin
        case(y)
            	a:Y2=0;
                b:Y2=1;
                c:Y2=w?1:0;
                d:Y2=0;
                e:Y2=w?1:0;
                f:Y2=1;
        endcase
    end
endmodule
