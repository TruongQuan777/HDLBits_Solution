module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    int count;
    reg state;
    always @(*)
        begin
            tc=(state==1'b0)?0:1;
        end
    always @(posedge clk)
        begin
            if(state==1'b0)
                begin
                    if(load)
                        begin
                            if(data>0)
                                begin
                            count<=data;
                            state<=state;
                                end
                            else
                                begin
                                    count<=data;
                                    state<=1'b1;
                                end
                        end
                    else
                        begin
                            count<=(count==1)?1:(count-1);
                            state<=(count==1)?1'b1:1'b0;
                        end
                            
                end
            else
                begin
                    if(load==0) state<=1'b1;
                    else
                        begin
                            if(data==0) state<=state;
                            else
                                begin
                                    state<=1'b0;
                                    count<=data;
                                end
                        end
                end
        end
    

endmodule
