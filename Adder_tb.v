`timescale 1ns / 1ps

//works
module Adder_tb;
    reg[5:0] A, B;
    wire [5:0] Sum;

    //dut = Design Under Test
    Adder dut (.DataIn1(A),
                .DataIn2(B),
                .DataOut(Sum));

    initial begin
        //Test 1
        A = 6'd5;
        B = 6'd10;
        #10;

        //Test 2
        A = 6'd20;
        B = 6'd2;
        #10;

        $finish;
    end
endmodule

