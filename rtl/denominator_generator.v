`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:29:59
// Design Name: 
// Module Name: denominator_generator
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


module denominator_generator(

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

    output wire [15:0] den0,
    output wire [15:0] den1,
    output wire [15:0] den2,
    output wire [15:0] den3,
    output wire [15:0] den4,
    output wire [15:0] den5,
    output wire [15:0] den6,
    output wire [15:0] den7,
    output wire [15:0] den8,
    output wire [15:0] den9,
    output wire [15:0] den10

);

assign den0  = beta0  ? gamma0  : 16'd0;
assign den1  = beta1  ? gamma1  : 16'd0;
assign den2  = beta2  ? gamma2  : 16'd0;
assign den3  = beta3  ? gamma3  : 16'd0;
assign den4  = beta4  ? gamma4  : 16'd0;
assign den5  = beta5  ? gamma5  : 16'd0;
assign den6  = beta6  ? gamma6  : 16'd0;
assign den7  = beta7  ? gamma7  : 16'd0;
assign den8  = beta8  ? gamma8  : 16'd0;
assign den9  = beta9  ? gamma9  : 16'd0;
assign den10 = beta10 ? gamma10 : 16'd0;

endmodule
