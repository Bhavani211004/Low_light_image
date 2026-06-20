`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 23:00:32
// Design Name: 
// Module Name: linear_approx
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




module linear_approx (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  d,
    output reg  [15:0] gamma_out
);

//--------------------------------------------------
// Segment 0
//--------------------------------------------------
wire [15:0] seg0_term =
    ((d << 8) + (d << 7) + (d << 5));

wire [15:0] seg0 =
    (seg0_term < 16'd16384) ?
    (16'd16384 - seg0_term) :
    16'd0;

//--------------------------------------------------
// Segment 1
//--------------------------------------------------
wire [15:0] seg1_term =
    ((d << 7) + (d << 6) + (d << 5));

wire [15:0] seg1 =
    (seg1_term < 16'd13631) ?
    (16'd13631 - seg1_term) :
    16'd0;

//--------------------------------------------------
// Segment 2
//--------------------------------------------------
wire [15:0] seg2_term =
    ((d << 7) + (d << 4) + (d << 2));

wire [15:0] seg2 =
    (seg2_term < 16'd10747) ?
    (16'd10747 - seg2_term) :
    16'd0;

//--------------------------------------------------
// Segment 3
//--------------------------------------------------
wire [15:0] seg3_term =
    ((d << 6) + (d << 4) + (d << 3));

wire [15:0] seg3 =
    (seg3_term < 16'd7966) ?
    (16'd7966 - seg3_term) :
    16'd0;

//--------------------------------------------------
// Segment 4
//--------------------------------------------------
wire [15:0] seg4_term =
    ((d << 5) + (d << 3) + (d << 2));

wire [15:0] seg4 =
    (seg4_term < 16'd5017) ?
    (16'd5017 - seg4_term) :
    16'd0;

//--------------------------------------------------
// Segment 5
//--------------------------------------------------
wire [15:0] seg5_term =
    (d << 5);

wire [15:0] seg5 =
    (seg5_term < 16'd2364) ?
    (16'd2364 - seg5_term) :
    16'd0;

//--------------------------------------------------
// Segment 6
//--------------------------------------------------
wire [15:0] seg6_term =
    ((d << 2) + (d << 1));

wire [15:0] seg6 =
    (seg6_term < 16'd1053) ?
    (16'd1053 - seg6_term) :
    16'd0;

//--------------------------------------------------
// Segment 7
//--------------------------------------------------
wire [15:0] seg7 = 16'd416;

//--------------------------------------------------
// Segment Select
//--------------------------------------------------
always @(*)
begin
    if (rst)
        gamma_out = 16'd0;
    else
    begin
        if      (d < 8'd32)
            gamma_out = seg0;

        else if (d < 8'd64)
            gamma_out = seg1;

        else if (d < 8'd96)
            gamma_out = seg2;

        else if (d < 8'd128)
            gamma_out = seg3;

        else if (d < 8'd160)
            gamma_out = seg4;

        else if (d < 8'd192)
            gamma_out = seg5;

        else if (d < 8'd224)
            gamma_out = seg6;

        else
            gamma_out = seg7;
    end
end
endmodule

`timescale 1ns/1ps

