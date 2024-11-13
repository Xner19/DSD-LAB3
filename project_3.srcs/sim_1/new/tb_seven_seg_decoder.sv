`timescale 1ns / 1ps

module tb_seven_seg_decoder;

    // Inputs
    reg [3:0] wxyz;

    // Outputs
    wire [6:0] seg;

    // Instantiate the seven_seg_decoder module
    seven_seg_decoder uut (
        .wxyz(wxyz),
        .seg(seg)
    );

    // Test sequence
    initial begin
        // Initialize input
        wxyz = 4'b0000; // 0
        #10;
        
        wxyz = 4'b0001; // 1
        #10;
        
        wxyz = 4'b0010; // 2
        #10;
        
        wxyz = 4'b0011; // 3
        #10;
        
        wxyz = 4'b0100; // 4
        #10;
        
        wxyz = 4'b0101; // 5
        #10;
        
        wxyz = 4'b0110; // 6
        #10;
        
        wxyz = 4'b0111; // 7
        #10;
        
        wxyz = 4'b1000; // 8
        #10;
        
        wxyz = 4'b1001; // 9
        #10;
        
        wxyz = 4'b1010; // A
        #10;
        
        wxyz = 4'b1011; // b
        #10;
        
        wxyz = 4'b1100; // C
        #10;
        
        wxyz = 4'b1101; // d
        #10;
        
        wxyz = 4'b1110; // E
        #10;
        
        wxyz = 4'b1111; // F
        #10;
        
        $finish;  // End simulation
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %t | wxyz = %b | seg = %b", $time, wxyz, seg);
    end

endmodule
