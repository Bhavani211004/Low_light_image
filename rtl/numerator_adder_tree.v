`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:20:44
// Design Name: 
// Module Name: numerator_adder_tree
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

module numerator_adder_tree(

    input wire [23:0] num0,
    input wire [23:0] num1,
    input wire [23:0] num2,
    input wire [23:0] num3,
    input wire [23:0] num4,
    input wire [23:0] num5,
    input wire [23:0] num6,
    input wire [23:0] num7,
    input wire [23:0] num8,
    input wire [23:0] num9,
    input wire [23:0] num10,

    output wire [27:0] numerator

);

    //--------------------------------------------------
    // Stage 1
    //--------------------------------------------------

    wire [24:0] s0;
    wire [24:0] s1;
    wire [24:0] s2;
    wire [24:0] s3;
    wire [24:0] s4;

    assign s0 = num0 + num1;
    assign s1 = num2 + num3;
    assign s2 = num4 + num5;
    assign s3 = num6 + num7;
    assign s4 = num8 + num9;

    //--------------------------------------------------
    // Stage 2
    //--------------------------------------------------

    wire [25:0] t0;
    wire [25:0] t1;
    wire [25:0] t2;

    assign t0 = s0 + s1;
    assign t1 = s2 + s3;
    assign t2 = s4 + num10;

    //--------------------------------------------------
    // Stage 3
    //--------------------------------------------------

    wire [26:0] u0;

    assign u0 = t0 + t1;

    //--------------------------------------------------
    // Final Stage
    //--------------------------------------------------

    assign numerator = u0 + t2;

endmodule
