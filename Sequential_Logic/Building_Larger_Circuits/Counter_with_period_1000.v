module top_module (
    input clk,
    input reset,
    output [9:0] q);
    int count=0;
    always @(posedge clk)
        begin
            if(reset) q<=0;
            else if(q<999) 
                begin
                q<=q+1;
                end
            else q=0;
            
        end

endmodule
