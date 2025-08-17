module mips #(parameter WIDTH=8, REGBITS=3)
            (input clk, 
            input rst,
            input [WIDTH-1:0] memdata,
            output memread,
            output memwrite,
            output [WIDTH-1:0] adr,
            output [WIDTH-1:0] writedata);

    wire [31:0] instr;
    wire zero, alusrca, memtoreg, iord, pcen, regwrite, regdst;
    wire [1:0] aluop, pcsource, alusrcb;
    wire [3:0] irwrite;
    wire [2:0] alucont;

    controller controller (clk, reset, instr[31:26], zero, memread, memwrite, alusrca, memtoreg, iord, pcen, regwrite, regdst, pcsource, alusrcb, aluop, irwrite);
    
    alucontrol alucontrol (aluop, instr[5:0], alucont);

    datapath #(WIDTH, REGBITS) datapath (clk, reset, memdata, alusrca, memtoreg, iord, pcen, regwrite, regdst, pcsource, alusrcb, irwrite, alucont, zero, instr, adr, writedata);

endmodule