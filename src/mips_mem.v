module mips_mem #(parameter WIDTH 8,
                REGBITS = 3)
                (input clk, 
                input rst);
    
    wire memread, memwrite;
    wire [WIDTH-1:0] adr, writedata;
    wire [WIDTH-1:0] memdata;

    mips #(WIDTH, REGBITS) mips (clk, rst, memdata, memread, memwrite, adr, writedata);

    exmem #(WIDTH, REGBITS) exmem (clk, memwrite, adr, writedata, memdata);

endmodule