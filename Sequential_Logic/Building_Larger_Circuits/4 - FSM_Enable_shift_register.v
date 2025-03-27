module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg state;
    int count;
    always @(*)
        begin
            shift_ena=(state==0)?1:0;
        end
    always @(posedge clk)
        begin
            if(state==0)
                begin
                    if(reset)
                        begin
                            state<=state;
                            count<=0;
                        end
                    else
                        begin
                            if(count<3)
                                begin
                                    state<=state;
                                    count<=count+1;
                                end
                            if(count==3)
                                begin
                                    state<=1;
                                    count<=0;
                                end
                        end
                end
            if(state==1)
                begin
                    if(reset==0)
                        begin
                            state<=state;
                        end
                    else
                        begin
                            count<=0;
                            state<=0;
                        end
                end
        end
       

endmodule
