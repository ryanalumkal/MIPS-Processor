module datapath #(parameter WIDTH=8,
                reg REGBITS=3)
            (input clk,
            input rst,
            input [WIDTH-1:0] memdata,
            input alusrca,
            input memtoreg,
            input iord,
            input pcen,
            input regwrite,
            input regdst,
            input [1:0] pcsource, alusrcb,
            input [2:0] alucont,
            alu [3:0] irwrite,
            output zero,
            output [31:0] instr,
            output [WIDTH-1:0] adr,
            output [WIDTH-1:0] writedata);

    localparam CONST_ZERO = 0;
    localparam CONST_ONE = 1;

    wire [REGBITS-1:0] readreg1, readreg2, writereg;
    wire [WIDTH-1:0] pc, nextpc, md, rd1, rd2, wd, a, src1, src2, aluresult, aluout, constx4;

    assign constx4 = {instr[WIDTH-3:0], 2'b00}; // Shift left by 2 for word addressing

    assign readreg1 = instr[REGBITS+20:21]; // rs
    assign readreg2 = instr[REGBITS+15:16]; // rt
    assign writereg = instr[REGBITS+10:11]; // rd
    mux2 #(REGBITS) mux1 (
        .a(readreg2),
        .b(CONST_ZERO),
        .sel(regdst),
        .y(writereg)
    );

    flopen #(8) ir0 (
        .clk(clk),
        .en(irwrite[0]),
        .d(memdata[7:0]),
        .q(instr[7:0])
    );

    flopen #(8) ir1 (
        .clk(clk),
        .en(irwrite[1]),
        .d(memdata[15:8]),
        .q(instr[15:8])
    );

    flopen #(8) ir2 (
        .clk(clk),
        .en(irwrite[2]),
        .d(memdata[23:16]),
        .q(instr[23:16])
    );

    flopen #(8) ir3 (
        .clk(clk),
        .en(irwrite[3]),
        .d(memdata[31:24]),
        .q(instr[31:24])
    );

    flopenr #(WIDTH) pc_reg (
        .clk(clk),
        .rst(rst),
        .en(pcen),
        .d(nextpc),
        .q(pc)
    );

    flop #(WIDTH) md_reg (
        .clk(clk),
        .d(memdata),
        .q(md)
    );

    flop #(WIDTH) rd1_reg (
        .clk(clk),
        .d(rd1),
        .q(a)
    );

    flop #(WIDTH) rd2_reg (
        .clk(clk),
        .d(rd2),
        .q(b)
    );

    flop #(WIDTH) res (
        .clk(clk),
        .d(aluresult),
        .q(aluout)
    );

    mux2 #(WIDTH) adrmux (
        .a(pc),
        .b(aluout),
        .sel(iord),
        .y(adr)
    );

    mux2 #(WIDTH) src1mux (
        .a(rd2),
        .b(constx4),
        .sel(alusrca),
        .y(src1)
    );

    mux4 #(WIDTH) src2mux (
        .a(writedata),
        .b(CONST_ONE),
        .c (instr[WIDTH-1:0]),
        .d (constx4),
        .sel(alusrcb),
        .y(src2)
    );

    mux4 #(WIDTH) pcmux (
        .a(aluresult),
        .b(aluout),
        .c(constx4),
        .d(CONST_ZERO),
        .sel(pcsource),
        .y(nextpc)
    );
    mux2 #(WIDTH) wdmux (
        .a(aluout),
        .b(md),
        .sel(memtoreg),
        .y(wd)
    );
    regfile #(WIDTH,REGBITS) rf (
        .clk(clk),
        .regwrite(regwrite),
        .ra1(ra1),
        .ra2(ra2),
        .wa(wa),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );
    alu #(WIDTH) alunit (
        .src1(src1),
        .src2(src2),
        .alucont(alucont),
        .aluresult(aluresult)
    );
    zerodetect #(WIDTH) zd (
        .aluresult(aluresult),
        .zero(zero)
    );

endmodule