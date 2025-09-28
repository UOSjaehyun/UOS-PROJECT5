`timescale 1ns / 1ps

module up_counter_oneshot (
    input wire clk,
    input wire reset,
    input wire input_sm1,
    output reg [2:0] state
);

    reg input_sm1_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 3'b000;
            input_sm1_reg <= 1'b0;
        end
        else begin
            input_sm1_reg <= input_sm1;

            if (input_sm1 && !input_sm1_reg) begin
                if (state == 3'b111)
                    state <= 3'b000;
                else
                    state <= state + 1'b1;
            end
        end
    end

endmodule