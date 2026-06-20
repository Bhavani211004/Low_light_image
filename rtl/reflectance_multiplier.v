`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 14:14:22
// Design Name: 
// Module Name: reflectance_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module reflectance_multiplier(

    input  wire [7:0]  pc,
    input  wire [31:0] reciprocal,

    output wire [7:0] reflectance

);

wire [39:0] product;

assign product = pc * reciprocal;

assign reflectance = product[23:16];
// Equivalent to product >> 16

endmodule
