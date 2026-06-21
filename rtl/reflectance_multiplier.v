`timescale 1ns / 1ps

module reflectance_multiplier(

    input  wire [7:0]  pc,
    input  wire [31:0] reciprocal,

   output wire [15:0] reflectance


);

wire [39:0] product;

assign product = pc * reciprocal;

// Remove Q0.32 scaling
assign reflectance = product >> 8;

endmodule
