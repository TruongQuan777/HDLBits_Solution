module D_flipflop(input clk,input d, output reg q);
    always @(posedge clk)
        begin
            q<=d;
        end
endmodule

module top_module (
    input clk,
    input d,
    output q
);
    wire negclk;
    assign negclk=~clk;
    
    wire q1,q2;
    D_flipflop d1(clk,d,q1);
    D_flipflop d2(negclk,d,q2);
    
    assign q=(q1 & clk) | (q2 & negclk);
endmodule
