module top_module (
    input clk,
    
    input reset,      // Synchronous reset
    input data,
    input done_counting,
    input ack,
    
    output shift_ena,
    output counting,
    output done
    );
    
    reg[4:0] state;
    reg[4:0] next_state;
    always @(posedge clk)
        begin
            
        if(reset) state<=0;
    	else state<=next_state;
            
        end
    always @(*)
        begin
            if(state==0)
                begin
                    casex({data,done_counting,ack})
                    3'b0??: next_state=state;
                    3'b1??: next_state=1;
                    endcase
                end
            if(state==1)
                begin
                    casex({data,done_counting,ack})
                    3'b0??: next_state=0;
                    3'b1??: next_state=2;
                    endcase
                end
            if(state==2)
                begin
                    casex({data,done_counting,ack})
                    3'b0??: next_state=3;
                    3'b1??: next_state=state;
                    endcase
                end
            if(state==3)
                begin
                    casex({data,done_counting,ack})
                    3'b0??: next_state=0;
                    3'b1??: next_state=4;
                    endcase
                end
            if(state==4)
                begin
                    next_state=5;
                end
            if(state==5)
                begin
                    next_state=6;
                end
            if(state==6)
                begin
                    next_state=7;
                end
            if(state==7)
                begin
                    next_state=8;
                end
            if(state==8)
                begin
                    casex({data,done_counting,ack})
                   3'b?0?: next_state=state;
                    3'b?1?: next_state=9;
                    endcase
                end
            if(state==9)
                begin
                    casex({data,done_counting,ack})
                    3'b??0: next_state=state;
                    3'b??1: next_state=0;
                    endcase
                end
        end
    assign shift_ena=((state<=7) && state >=4);
    assign counting=(state==8);
    assign done=(state==9);
endmodule

