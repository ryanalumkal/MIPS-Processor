`timescale 1ns/1ps
module PC_tb;

    reg clk;
    reg rst;

    initial begin
        clk = 0;
        rst = 0;
    end

    wire [5:0] PC;
    wire [5:0] PC_next;
    wire [5:0] increment = 6'd1;

    PC PC1 (.clk(clk),
            .rst(rst),
            .PC_next(PC_next),
            .PC(PC));

    Adder Adder1 (.clk(clk),
                .DataIn1(PC),
                .DataIn2(increment),
                .DataOut(PC_next));

    always #5 clk = ~clk;

    initial begin

        //test 1
        #10;

        #10;


        #10;

        #10;

        $finish;
    end

endmodule