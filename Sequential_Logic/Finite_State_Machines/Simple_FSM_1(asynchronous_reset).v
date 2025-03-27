module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

        
    always @(*) begin    // This is a combinational always block
        if(state==B && in==0) next_state=A;
        else if(state==B&&in==1) next_state=B;
        else if(state==A && in==0) next_state=B;
        else if(state==A && in==1) next_state=A;
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset) state=B;
        else
            state=next_state;
    end
  
    assign out=state;
  
endmodule
