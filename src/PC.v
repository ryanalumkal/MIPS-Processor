`timescale 1ns/1ps
module PC (input clk,
            input rst,
            input [5:0] PC_next,
            output reg [5:0] PC);

    initial begin
        PC = 0;
    end

    always @ (posedge clk) begin
        if (rst) begin
            PC <= 0;
        end else begin
            PC <= PC_next;
        end
    end
endmodule