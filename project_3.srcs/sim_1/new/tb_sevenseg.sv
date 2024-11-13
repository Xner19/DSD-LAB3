`timescale 1ns / 1ps

module sevensegments_tb;

    logic [3:0] in;
    logic F;

    sevensegments_behavioral dut (
        .in(in),
        .F(F)
    );

    initial begin
        // Apply all possible input combinations
        for (int i = 0; i < 16; i++) begin
            in = i;
            #10;
        end
        $finish;
    end

endmodule