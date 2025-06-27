`timescale 1ns/1ps
module InstructionMemory_tb;
    reg [5:0] ReadAddress;
    wire [31:0] Instruction;

    InstructionMemory dut (.ReadAddress(ReadAddress),
                            .Instruction(Instruction));

    initial begin
        //test 1
        ReadAddress = 6'h10;
        #10;

        //test 2
        ReadAddress = 6'h3E;
        #10;

        //test 3
        ReadAddress = 6'h2D;
        #10;

        //test 4
        ReadAddress = 6'h2B;
        #10;

        //test 5
        ReadAddress = 6'h1B;
        #10;

        $finish;
    end

endmodule;