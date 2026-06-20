`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:38:13
// Design Name: 
// Module Name: denominator_adder_tree
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


module denominator_adder_tree(

    input wire [15:0] den0,
    input wire [15:0] den1,
    input wire [15:0] den2,
    input wire [15:0] den3,
    input wire [15:0] den4,
    input wire [15:0] den5,
    input wire [15:0] den6,
    input wire [15:0] den7,
    input wire [15:0] den8,
    input wire [15:0] den9,
    input wire [15:0] den10,

    output wire [19:0] denominator

);

    //--------------------------------------------------
    // Stage 1
    //--------------------------------------------------

    wire [16:0] s0;
    wire [16:0] s1;
    wire [16:0] s2;
    wire [16:0] s3;
    wire [16:0] s4;

    assign s0 = den0 + den1;
    assign s1 = den2 + den3;
    assign s2 = den4 + den5;
    assign s3 = den6 + den7;
    assign s4 = den8 + den9;

    //--------------------------------------------------
    // Stage 2
    //--------------------------------------------------

    wire [17:0] t0;
    wire [17:0] t1;
    wire [17:0] t2;

    assign t0 = s0 + s1;
    assign t1 = s2 + s3;
    assign t2 = s4 + den10;

    //--------------------------------------------------
    // Stage 3
    //--------------------------------------------------

    wire [18:0] u0;

    assign u0 = t0 + t1;

    //--------------------------------------------------
    // Final Stage
    //--------------------------------------------------

    assign denominator = u0 + t2;

endmodule
