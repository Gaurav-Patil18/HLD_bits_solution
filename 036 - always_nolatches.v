// Problem: 36 - always_nolatches
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always@(*)begin
        case(scancode)

                16'he06b:begin	left=1;
                    			right=0;
                    			down=0;
                    			up=0;
                end
                16'he072:begin	down=1;
                    			left=0;
                                right=0;
                                up=0;
                end
                16'he074:begin	right=1;
                    			left=0;
                                down=0;
                                up=0;
                end
                16'he075:begin	up=1;
                    			left=0;
                                right=0;
                                down=0;
                end
                default :begin	
                    		left=0;
                    		right=0;
                    		down=0;
                    		up=0;
                end

        endcase
    end

endmodule
