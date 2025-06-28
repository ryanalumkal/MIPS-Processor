`timescale 1ns/1ps
module RegisterFile ( input clk,
                    input [4:0] R1,
                    input [4:0] R2,
                    input [4:0] WR,
                    input [31:0] WD,
                    input RegWrite,
                    output reg [31:0] RD1,
                    output reg [31:0] RD2);

    reg [31:0] REG [0:31];

    integer i;
    initial begin 
        for (i = 0; i < 32; i = i +1) begin
            REG[i] = i;
        end

    end

    always @ (*) begin
        RD1 = REG[R1];
        RD2 = REG[R2];
    end

    always @ (posedge clk) begin
         if (RegWrite) begin
            REG[WR] <= WD;
        end
    end
endmodule