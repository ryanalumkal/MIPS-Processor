`timescale 1ns/1ps
module ALU_tb;
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] control;
    wire overflow;
    wire zero;
    wire [31:0] result;

    //design under test
    ALU dut (.A(A),
            .B(B),
            .control(control),
            .overflow(overflow),
            .zero(zero),
            .result(result));

    initial begin
        //test 1
        A = 32'd2;
        B = 32'd1;
        control = 4'b0000;
        #10;


        //test 2
        A = 32'd2;
        B = 32'd1;
        control = 4'b0001;
        #10;

        //test 3
        A = 32'd2;
        B = 32'd1;
        control = 4'b0010;
        #10;

        //test 4
        A = 32'd2;
        B = 32'd1;
        control = 4'b0110;
        #10;

        //test 5
        A = 32'd2;
        B = 32'd1;
        control = 4'b0111;
        #10;

         //test 5
        A = 32'd1;
        B = 32'd2;
        control = 4'b0111;
        #10;


        //test 7
        A = 32'd2;
        B = 32'd1;
        control = 4'b1100;
        #10;

        $finish;

    end
endmodule