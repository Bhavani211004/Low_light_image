`timescale 1ns / 1ps

module image_reconstruction(

    input  wire [15:0] emod,
    input  wire [15:0] reflectance,

    output wire [7:0] enhanced_pixel

);

wire [31:0] product;
wire [23:0] pe_q8;

assign product = emod * reflectance;

assign pe_q8 = product >> 8;

assign enhanced_pixel =
        (pe_q8 > 24'd255) ? 8'd255 :
                            pe_q8[7:0];

endmodule