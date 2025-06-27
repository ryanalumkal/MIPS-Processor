`timescale 1ns/1ps
module RegisterFile_tb;
    reg [5:0] R1;
    reg [5:0] R2;
    reg [5:0] WR;
    reg [31:0] WD;
    reg RegWrite;
    wire [31:0] RD1;
    wire [31:0] RD2;


    RegisterFile dut (.R1(R1),
                    .R2(R2),
                    .WR(WR),
                    .WD(WD),
                    .RegWrite(RegWrite),
                    .RD1(RD1),
                    .RD2(RD2));

    initial begin
        //test case 1
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0; //works
        #10;

        //test case 2
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h19;
        RegWrite = 1; //works
        #10;


        //test case 3
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h01;
        WD = 6'h24;
        RegWrite = 1; //works
        #10;


        //test case 4
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0; //works
        #10;


        //test case 5
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0;
        #10;


        //test case 6
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0;
        #10;


        //test case 7
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0;
        #10;


        //test case 8
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0;
        #10;


        //test case 9
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0;
        #10;


        //test case 10
        R1 = 6'h00;
        R2 = 6'h01;
        WR = 6'h00;
        WD = 6'h00;
        RegWrite = 0;
        #10;

        $finish;
    end
endmodule