`timescale 1ns / 1ps

module upcounter_2bit (
    input  clk, reset,   
    output reg [1:0] q    
);

    always @(posedge clk or posedge reset) begin
        if (reset) 
            q <= 2'b00;      
        else 
            q <= q + 1'b1;    
    end

endmodule

