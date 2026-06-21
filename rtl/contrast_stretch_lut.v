`timescale 1ns / 1ps

module contrast_stretch_lut(

    input  wire [7:0] fm,
    output wire [15:0] emod

);

reg [15:0] lut [0:255];

initial
begin
    $readmemh("emod.mem", lut);
end

assign emod = lut[fm];

endmodule