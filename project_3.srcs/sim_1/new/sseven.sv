`timescale 1ns / 1ps

module tb_seven_seg_decoder;

    reg CLK100MHZ;
    reg CPU_RESETN;
    reg [15:0] SW;
    wire CA, CB, CC, CD, CE, CF, CG, DP;
    wire [7:0] AN;

    sev_seg_top uut (
        .CLK100MHZ(CLK100MHZ),
        .CPU_RESETN(CPU_RESETN),
        .CA(CA), .CB(CB), .CC(CC), .CD(CD), .CE(CE), .CF(CF), .CG(CG), .DP(DP),
        .AN(AN),
        .SW(SW)
    );

    always begin
        #5 CLK100MHZ = ~CLK100MHZ;
    end

    initial begin
        CLK100MHZ = 0;
        CPU_RESETN = 0;
        SW = 16'b0;

        #10;
        CPU_RESETN = 1;

        #10;
        SW = 16'h1234;
        
        #10;
        SW = 16'hABCD;

        #10;
        SW = 16'h0F0F;

        #10;
        SW = 16'h0000;

        #10;
        SW = 16'hFFFF;

        #10;
        SW = 16'h8888;

        #10;
        SW = 16'h5555;

        #10;
        $finish;
    end

    initial begin
        $monitor("Time: %t, SW: %h, AN: %h, CA: %b, CB: %b, CC: %b, CD: %b, CE: %b, CF: %b, CG: %b, DP: %b", 
                 $time, SW, AN, CA, CB, CC, CD, CE, CF, CG, DP);
    end

endmodule
