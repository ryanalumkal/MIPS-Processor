`timescale 1ns/1ps
module top;

    parameter  DataSize = 32;
    parameter PCsize = 6;

    reg clk;
    reg rst;

    initial begin
        clk = 0;
        rst = 0;
    end

    wire [PCsize-1: 0] PC;
    wire [PCsize-1: 0] PC_next;
    wire [5:0] increment = 6'd1;

    always #5 clk = ~clk;

    wire [DataSize-1: 0] Instruction;
    wire [2:0] ALUop;
    wire RegWrite;
    wire [DataSize-1:0] WD;
    
    wire [DataSize-1:0] A;
    wire [DataSize-1:0] B;

    wire overflow;
    wire zero;
    wire [DataSize-1:0] result;

    assign WD = result;

    PC PC1 (.clk(clk),
            .rst(rst),
            .PC_next(PC_next),
            .PC(PC));

    Adder Adder1 (.clk(clk),
                .DataIn1(PC),
                .DataIn2(increment),
                .DataOut(PC_next));

    Control Control1 (.OpCode(Instruction[31:26]),
                    .Func(Instruction[5:0]),
                    .ALUOp(ALUop),
                    .RegWrite(RegWrite));

    InstructionMemory InstructionMemory1 (.ReadAddress(PC),
                                        .Instruction(Instruction));

    RegisterFile RegisterFile1 (.R1(Instruction[25:21]),
                                .R2(Instruction[20:16]),
                                .WR(Instruction[15:11]),
                                .WD(WD),
                                .RegWrite(RegWrite),
                                .RD1(A),
                                .RD2(B));

    ALU ALU1 (.A(A),
            .B(B),
            .ALUOp(ALUop),
            .overflow(overflow),
            .zero(zero),
            .result(result));

endmodule