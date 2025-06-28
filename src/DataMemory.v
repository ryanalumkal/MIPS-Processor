`timescale 1ns/1ps
module DataMemory (input [7:0] ReadAddress,
                input [7:0] WriteAddress,
                input [31:0] WriteData,
                input MemWrite,
                input MemRead,
                output reg [31:0] ReadData);

    reg [31:0] DataMemoryWords [0:255]; //256 words ; 8 bit address

    always @ (*) begin
        if (MemRead) begin
            ReadData = DataMemoryWords[ReadAddress];
        end
        if (MemWrite) begin
            DataMemoryWords[WriteAddress] = WriteData;
        end
    end
endmodule