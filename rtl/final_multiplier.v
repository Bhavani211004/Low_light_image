`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 11:10:48
// Design Name: 
// Module Name: final_multiplier
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


module final_multiplier(

    input  wire [27:0] numerator,
    input  wire [31:0] reciprocal,

    output wire [27:0] fm

);

wire [59:0] product;

assign product = numerator * reciprocal;

// Remove Q0.32 scaling
assign fm = product >> 32;

endmodule
