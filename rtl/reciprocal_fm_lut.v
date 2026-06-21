



`timescale 1ns / 1ps

module reciprocal_fm_lut(

    input  wire [7:0] fm,
    output reg  [31:0] reciprocal

);

reg [31:0] rom [0:255];

initial
begin
    $readmemh("reciprocal_fm.mem", rom);
end

always @(*)
begin
    if(fm == 8'd0)
        reciprocal = 32'd0;
    else
        reciprocal = rom[fm];
end

endmodule
