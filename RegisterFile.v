module RegisterFile (input [5:0] R1,
                    input [5:0] R2,
                    input [5:0] WR,
                    input [31:0] WD,
                    input RegWrite,
                    output reg [31:0] RD1,
                    output reg [31:0] RD2);

    reg [31:0] REG [0:63];

    integer i;
    initial begin 
        for (i = 0; i < 64; i = i +1) begin
            REG[i] = i;
        end

    end

    always @ (*) begin
        if (RegWrite) begin
            REG[WR] = WD;
        end
        else begin
            RD1 = REG[R1];
            RD2 = REG[R2];
        end
    end
endmodule