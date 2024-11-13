module seven_seg_decoder(
    input  wire [3:0] bin,      // 4-bit binary input (0-F)
    output reg  [6:0] seg       // 7-bit output for segments a-g
);

    logic w, x, y, z;
    
    assign w = bin[3];
    assign x = bin[2];
    assign y = bin[1];
    assign z = bin[0];

    assign seg[0] = (~w & x & ~y & ~z) | (~w & ~x & ~y & z) | (w & x & ~y & z) | (w & ~x & y & z);
    assign seg[1] = (w & y & z) | (w & x & z) | (x & y & ~z) | (~w & x & ~y & z);
    assign seg[2] = (~w & ~x & y & ~z) | (w & x & y) | (w & x & ~z);
    assign seg[3] = (x & y & z) | (~w & ~x & ~y & z) | (~w & x & ~y & ~z);
    assign seg[4] = (~w & z) | (~x & ~y & z) | (~w & x & ~y);
    assign seg[5] = (~w & y & z) | (~w & ~x & z) | (~w & ~x & y) | (w & x & ~y & z);
    assign seg[6] = (~w & ~x & ~y) | (~w & x & y & z) | (w & x & ~y & ~z);

endmodule
