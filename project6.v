`timescale 1ns / 1ps

module project6(clk, rst, x, y, state);

input clk, rst, x;
output y;
output reg [1:0] state;
reg [1:0] next_state;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= 2'b00;
    else
        state <= next_state;
end
always @(state or x) begin
    case(state)
        2'b00: next_state <= x ? 2'b01 : 2'b00; 
        2'b01: next_state <= x ? 2'b11 : 2'b00; 
        2'b11: next_state <= x ? 2'b10 : 2'b00;     
        2'b10: next_state <= x ? 2'b10 : 2'b00;   
    endcase
end
assign y = (~x) & (state != 2'b00);

endmodule
