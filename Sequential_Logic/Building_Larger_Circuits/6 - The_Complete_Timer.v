module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    reg [3:0] state;
    reg [3:0] next_state;
    reg[3:0] delay;
    reg[13:0] i;
    always @(posedge clk)
        begin
          		if(reset) state<=0;
                else
                    begin
                    state<=next_state;
                    end
         end    
    always @(posedge clk)
        begin
            if(reset) 
                begin
                    delay<=0;
                end
            else if(state==4 ||state==5 ||state==6||state==7)
                begin
                    delay<={delay[2:0],data};
                end
        end
    always @(posedge clk)
        begin
          if(reset) i<=0;
            else if(state==7) i<=0;
            else if(state==8)
            begin
                if(i<=(delay+1)*1000-2)
            		begin
              			i<=i+1;
            		end
              	else
                  begin
                    i<=0; 
                  end
                
            end
        end
    always @(*)
        begin
            	if(state==0)
                    begin
                      	counting=0;
                      	count=0;
                      	done=0;
                        if(data==1) next_state=1;
                        else next_state=state;
                    end
                if(state==1)
                    begin
                      	counting=0;
                      	count=0;
                      	done=0;
                        if(data==1) next_state=2;
                        else next_state=0;
                    end
                if(state==2)
                    begin
                      	counting=0;
                      	count=0;
                      	done=0;
                        if(data==1) next_state=state;
                        else next_state=3;
                    end
                if(state==3)
                    begin
                      	counting=0;
                      	count=0;
                      	done=0;
                        if(data==1) next_state=4;
                        else next_state=0;
                    end
            	if(state==4)
                	begin
                      	counting=0;
                      	count=0;
                      	done=0;
                    	next_state=5;
                	end
            if(state==5)
                begin
                    counting=0;
                    count=0;
                    done=0;
                    next_state=6;
                end
            if(state==6)
                begin
                    counting=0;
                    count=0;
                    done=0;
                    next_state=7;
                end
            if(state==7)
                begin
                    counting=0;
                    count=0;
                    done=0;
                    next_state=8;
                end
            
            if(state==8)
                begin
                    if(i<=(delay+1)*1000-2)
                        begin
                            counting=1;
                    		count=delay-(i/1000);
                    		done=0;
                            next_state=state;
                        end
                    if(i==(delay+1)*1000-1)
                        begin
                            counting=1;
                    		count=delay-(i/1000);
                    		done=0;
                            next_state=9;
                        end
                end
            if(state==9)
                begin
                    done=1;
                    counting=0;
                    count=0;
                    if(ack) next_state=0;
                    else next_state=state;
                end
                
                 
            
        end
  
endmodule
