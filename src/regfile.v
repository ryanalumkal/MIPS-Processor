moule regfile #(parameter WIDTH = 8, REGBITS = 3)
            (input clk, 
            input regwrite,
            input [REGBITS-1:0] readreg1, readreg2, wa,
            input [WIDTH-1:0] writedata,
            output reg [WIDTH-1:0] readdata1, readdata2);

    reg [WIDTH-1:0] RAM [(1<<REGBITS)-1:0]; // Register file

    always @(posedge clk or posedge rst) begin
        if (regwrite) RAM[wa] <= writedata; // Write data to register

        assign readdata1 = readreg1 ? RAM[readreg1] : 0; // Read data from register 1
        assign readdata2 = readreg2 ? RAM[readreg2] : 0; // Read data from register 2
    end
endmodule