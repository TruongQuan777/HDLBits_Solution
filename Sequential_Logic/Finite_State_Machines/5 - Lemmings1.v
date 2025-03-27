module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    reg state, next_state;

    always @(*) begin
        if(state==0)
            begin
                if({bump_left,bump_right}==2'b11 ||{bump_left,bump_right}==2'b10) 
                    begin
                        next_state=1;
                    end
                else
                    next_state=state;
            end
        else if(state==1)
            begin
                if({bump_left,bump_right}==2'b11 ||{bump_left,bump_right}==2'b01) 
                    begin
                        next_state=0;
                    end
                else
                    next_state=1;
            end
        if(state==0)
            begin
                walk_left=1;
                walk_right=0;
            end
        else if(state==1)
            begin
                walk_left=0;
                walk_right=1;
            end
    end

    always @(posedge clk, posedge areset) begin
        if(areset) 
            begin
                state=0;
            end
        else
            state=next_state;
            
    end

    // Output logic
    // assign walk_left = (state == ...);
    // assign walk_right = (state == ...);

endmodule
