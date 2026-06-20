`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 21:29:46
// Design Name: 
// Module Name: numerator_generator
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


module numerator_generator(

    input wire beta0,
    input wire beta1,
    input wire beta2,
    input wire beta3,
    input wire beta4,
    input wire beta5,
    input wire beta6,
    input wire beta7,
    input wire beta8,
    input wire beta9,
    input wire beta10,

    input wire [15:0] gamma0,
    input wire [15:0] gamma1,
    input wire [15:0] gamma2,
    input wire [15:0] gamma3,
    input wire [15:0] gamma4,
    input wire [15:0] gamma5,
    input wire [15:0] gamma6,
    input wire [15:0] gamma7,
    input wire [15:0] gamma8,
    input wire [15:0] gamma9,
    input wire [15:0] gamma10,

    input wire [7:0] pci_min_0,
    input wire [7:0] pci_min_1,
    input wire [7:0] pci_min_2,
    input wire [7:0] pci_min_3,
    input wire [7:0] pci_min_4,
    input wire [7:0] pci_min_5,
    input wire [7:0] pci_min_6,
    input wire [7:0] pci_min_7,
    input wire [7:0] pci_min_8,
    input wire [7:0] pci_min_9,
    input wire [7:0] pci_min_10,

    output wire [23:0] num0,
    output wire [23:0] num1,
    output wire [23:0] num2,
    output wire [23:0] num3,
    output wire [23:0] num4,
    output wire [23:0] num5,
    output wire [23:0] num6,
    output wire [23:0] num7,
    output wire [23:0] num8,
    output wire [23:0] num9,
    output wire [23:0] num10

);

assign num0  = beta0  ? (gamma0  * pci_min_0 ) : 24'd0;
assign num1  = beta1  ? (gamma1  * pci_min_1 ) : 24'd0;
assign num2  = beta2  ? (gamma2  * pci_min_2 ) : 24'd0;
assign num3  = beta3  ? (gamma3  * pci_min_3 ) : 24'd0;
assign num4  = beta4  ? (gamma4  * pci_min_4 ) : 24'd0;
assign num5  = beta5  ? (gamma5  * pci_min_5 ) : 24'd0;
assign num6  = beta6  ? (gamma6  * pci_min_6 ) : 24'd0;
assign num7  = beta7  ? (gamma7  * pci_min_7 ) : 24'd0;
assign num8  = beta8  ? (gamma8  * pci_min_8 ) : 24'd0;
assign num9  = beta9  ? (gamma9  * pci_min_9 ) : 24'd0;
assign num10 = beta10 ? (gamma10 * pci_min_10) : 24'd0;

endmodule
