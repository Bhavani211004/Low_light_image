`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 21:19:06
// Design Name: 
// Module Name: beta_generator
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


module beta_generator(

    input wire [7:0] gi0,
input wire [7:0] gi1,
input wire [7:0] gi2,
input wire [7:0] gi3,
input wire [7:0] gi4,
input wire [7:0] gi5,
input wire [7:0] gi6,
input wire [7:0] gi7,
input wire [7:0] gi8,
input wire [7:0] gi9,
input wire [7:0] gi10,

    input  wire [7:0] pci_min_0,
    input  wire [7:0] pci_min_1,
    input  wire [7:0] pci_min_2,
    input  wire [7:0] pci_min_3,
    input  wire [7:0] pci_min_4,
    input  wire [7:0] pci_min_5,
    input  wire [7:0] pci_min_6,
    input  wire [7:0] pci_min_7,
    input  wire [7:0] pci_min_8,
    input  wire [7:0] pci_min_9,
    input  wire [7:0] pci_min_10,

    output wire beta0,
    output wire beta1,
    output wire beta2,
    output wire beta3,
    output wire beta4,
    output wire beta5,
    output wire beta6,
    output wire beta7,
    output wire beta8,
    output wire beta9,
    output wire beta10

);

assign beta0  = (pci_min_0  >= gi0);
assign beta1  = (pci_min_1  >= gi1);
assign beta2  = (pci_min_2  >= gi2);
assign beta3  = (pci_min_3  >= gi3);
assign beta4  = (pci_min_4  >= gi4);
assign beta5  = (pci_min_5  >= gi5);
assign beta6  = (pci_min_6  >= gi6);
assign beta7  = (pci_min_7  >= gi7);
assign beta8  = (pci_min_8  >= gi8);
assign beta9  = (pci_min_9  >= gi9);
assign beta10 = (pci_min_10 >= gi10);

endmodule