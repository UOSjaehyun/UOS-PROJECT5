`timescale 1ns / 1ps

module updown_counter_3bit (
    input wire clk, reset,
    output reg [2:0] q
);

    reg direction_is_up; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 3'b000;
            direction_is_up <= 1'b1; 
        end
        else begin
            if (direction_is_up) begin 
                if (q == 3'b111) begin
                    direction_is_up <= 1'b0; 
                    q <= q - 1'b1;           
                end
                else begin
                    q <= q + 1'b1;           
                end
            end
            else begin
                if (q == 3'b000) begin 
                    direction_is_up <= 1'b1;
                    q <= q + 1'b1;           
                end
                else begin
                    q <= q - 1'b1;           
                end
            end
        end
    end

endmodule
