//CHECK
module controller (input clk,
                input rst,
                input [5:0] op,
                input zero,
                output reg memread,
                output reg memwrite,
                output reg alusrca,
                output reg memtoreg,
                output reg iord,
                output pcen,
                output reg regwrite,
                output reg regdst,
                output reg [1:0] pcsource
                output reg [1:0]  alusrcb,
                output reg [1:0] aluop,
                output reg [3:0] irwrite);

    parameter FETCH1 = 4'b0001;
    parameter FETCH2 = 4'b0010;
    parameter FETCH3 = 4'b0011;
    parameter FETCH4 = 4'b0100;
    parameter DECODE = 4'b0101;
    parameter MEMADR = 4'b0110;
    parameter LBRD = 4'b0111;
    parameter LBWR = 4'b1000;
    parameter SBWR = 4'b1001;
    parameter RTYPEEXEC = 4'b1010;
    parameter RTYPEWR = 4'b1011;
    parameter BEQEXEC = 4'b1100;
    parameter JEX = 4'b1101;
    parameter ADDIWR = 4'b1110;

    parameter LB = 6'b100000;
    parameter SB = 6'b101000;
    parameter RTYPE = 6'b000000;
    parameter BEQ = 6'b000100;
    parameter JUMP = 6'b000010;
    parameter ADDI = 6'b001000;

    reg [3:0] state, nextstate;
    reg pcwrite, pcwritecond;


    always @ (posedge clk) begin
        if (rst) state <= FETCH1;
        else state <= nextstate;
    end

    always @ (*) begin
        case (state)
            FETCH1: nextstate <= FETCH2;
            FETCH2: nextstate <= FETCH3;
            FETCH3: nextstate <= FETCH4;
            FETCH4: nextstate <= DECODE;
            DECODE: begin
                case (op)
                    LB: nextstate <= MEMADR;
                    SB: nextstate <= MEMADR;
                    RTYPE: nextstate <= RTYPEEXEC;
                    BEQ: nextstate <= BEQEXEC;
                    JUMP: nextstate <= JEX;
                    ADDI: nextstate <= ADDIWR;
                    default: nextstate <= FETCH1; // Default to fetch if unknown op
                endcase
            end
            MEMADR: begin
                case (op)
                    LB: nextstate <= LBRD;
                    SB: nextstate <= SBWR;
                    ADDI: nextstate <= ADDIWR;
                    default: nextstate <= FETCH1; // Default to fetch if not load/store
                endcase
            end
            LBRD: nextstate <= LBWR;
            LBWR: nextstate <= FETCH1;
            SBWR: nextstate <= FETCH1;
            RTYPEEXEC: nextstate <= RTYPEWR;
            RTYPEWR: nextstate <= FETCH1;
            BEQEXEC: nextstate <= FETCH1;
            JEX: nextstate <= FETCH1; // Jump execution
            ADDIWR: nextstate <= FETCH1; // Add immediate write
            default: nextstate <= FETCH1; // Fallback state
        endcase
    end

    always @ (*) begin

        irwrite <= 4'b0000; // Default no instruction write
        pcwrite <= 0;
        pcwritecond <= 0;
        regwrite <= 0;
        regdst <= 0;
        memread <= 0;
        memwrite <= 0;
        alusrca <= 0;
        alusrcb <= 2'b00;
        aluop <= 2'b00;
        pcsource <= 2'b00;
        iord <= 0;
        memtoreg <= 0;

        case(state)
            FETCH1: begin
                memread <= 1; // Enable memory read for instruction fetch
                irwrite <= 4'b0001; // Write instruction register
                alusrcb <= 2'b01; // Use immediate value for ALU source B
                pcwrite <= 1; // Enable PC write to fetch next instruction
            end
            FETCH2: begin
                memread <= 1; // Continue memory read for instruction fetch
                irwrite <= 4'b0010; // Write instruction register
                alusrcb <= 2'b01; // Continue using immediate value for ALU source
                pcwrite <= 1; // Continue PC write
            end
            FETCH3: begin
                memread <= 1; // Continue memory read for instruction fetch
                irwrite <= 4'b0011; // Write instruction register
                alusrcb <= 2'b01; // Continue using immediate value for ALU source
                pcwrite <= 1; // Continue PC write
            end
            FETCH4: begin
                memread <= 1; // Continue memory read for instruction fetch
                irwrite <= 4'b0100; // Write instruction register
                alusrcb <= 2'b01; // Continue using immediate value for ALU source
                pcwrite <= 1; // Continue PC write
            end

            //FIX !!!!!!

            DECODE: begin
                alusrcb <= 2'b11; // Use register value for ALU source B
                pcwrite <= 0; // Disable PC write in decode state
            end
            MEMADR: begin
                alusrca <= 1; // Use ALU source A for address calculation
                iord <= 1; // Set I/O read/write mode for memory access
            end
            LBRD: begin
                memread <= 1; // Enable memory read for load byte
            end
            LBWR: begin
                regwrite <= 1; // Write to register from memory data
                memtoreg <= 1; // Memory to register transfer
            end
            SBWR: begin
                memwrite <= 1; // Enable memory write for store byte
            end
            RTYPEEXEC: begin
                alusrca <= 0; // Use ALU source A for RTYPE execution
                regwrite <= 1; // Enable register write for RTYPE result
                regdst <= 1; // Select destination register for RTYPE operation
            end
            RTYPEWR: begin
                regwrite <= 1; // Write result back to register file for RTYPE operation
            end
            BEQEXEC: begin
                pcwritecond <= zero; // Conditional PC write based on zero flag for BEQ operation
            end
            JEX: begin
                pcsource <= 2'b01; // Set PC source to jump address for JUMP instruction
                pcwrite <= 1; // Enable PC write for jump execution
            end 
            ADDIWR: begin 
                regwrite <= 1; // Write result of ADDI to register file 
                regdst <= 0; // Use destination register from instruction field 
            end

endmodule