`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 22:51:32
// Design Name: 
// Module Name: edge_preserving_filter
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

module edge_preserving_filter(

    input wire clk,
   input wire rst_n,

    //--------------------------
    // 11-pixel window
    //--------------------------
input wire [7:0] row0,
input wire [7:0] row1,
input wire [7:0] row2,
input wire [7:0] row3,
input wire [7:0] row4,
input wire [7:0] row5,
input wire [7:0] row6,
input wire [7:0] row7,
input wire [7:0] row8,
input wire [7:0] row9,
input wire [7:0] row10,
    

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

   output wire [27:0] fm,
output wire [27:0] numerator_dbg,
output wire [19:0] denominator_dbg,
output wire [31:0] reciprocal_dbg

);
wire [31:0] reciprocal;

//////////////////////////////////////////////////////////
// Difference
//////////////////////////////////////////////////////////

wire [7:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10;

assign d0  = (pci_min_0  > row0 ) ? (pci_min_0  - row0 ) : (row0  - pci_min_0 );
assign d1  = (pci_min_1  > row1 ) ? (pci_min_1  - row1 ) : (row1  - pci_min_1 );
assign d2  = (pci_min_2  > row2 ) ? (pci_min_2  - row2 ) : (row2  - pci_min_2 );
assign d3  = (pci_min_3  > row3 ) ? (pci_min_3  - row3 ) : (row3  - pci_min_3 );
assign d4  = (pci_min_4  > row4 ) ? (pci_min_4  - row4 ) : (row4  - pci_min_4 );
assign d5  = (pci_min_5  > row5 ) ? (pci_min_5  - row5 ) : (row5  - pci_min_5 );
assign d6  = (pci_min_6  > row6 ) ? (pci_min_6  - row6 ) : (row6  - pci_min_6 );
assign d7  = (pci_min_7  > row7 ) ? (pci_min_7  - row7 ) : (row7  - pci_min_7 );
assign d8  = (pci_min_8  > row8 ) ? (pci_min_8  - row8 ) : (row8  - pci_min_8 );
assign d9  = (pci_min_9  > row9 ) ? (pci_min_9  - row9 ) : (row9  - pci_min_9 );
assign d10 = (pci_min_10 > row10) ? (pci_min_10 - row10) : (row10 - pci_min_10);

//////////////////////////////////////////////////////////
// Gamma Outputs
//////////////////////////////////////////////////////////


wire [15:0] gamma0;
wire [15:0] gamma1;
wire [15:0] gamma2;
wire [15:0] gamma3;
wire [15:0] gamma4;
wire [15:0] gamma5;
wire [15:0] gamma6;
wire [15:0] gamma7;
wire [15:0] gamma8;
wire [15:0] gamma9;
wire [15:0] gamma10;

linear_approx LA0(
    .clk(clk),
    .rst(~rst_n),   // linear_approx expects active-high reset
    .d(d0),
    .gamma_out(gamma0)
);


linear_approx LA1 (.clk(clk), .rst(~rst_n), .d(d1),  .gamma_out(gamma1));
linear_approx LA2 (.clk(clk), .rst(~rst_n), .d(d2),  .gamma_out(gamma2));
linear_approx LA3 (.clk(clk), .rst(~rst_n), .d(d3),  .gamma_out(gamma3));
linear_approx LA4 (.clk(clk), .rst(~rst_n), .d(d4),  .gamma_out(gamma4));
linear_approx LA5 (.clk(clk), .rst(~rst_n), .d(d5),  .gamma_out(gamma5));
linear_approx LA6 (.clk(clk), .rst(~rst_n), .d(d6),  .gamma_out(gamma6));
linear_approx LA7 (.clk(clk), .rst(~rst_n), .d(d7),  .gamma_out(gamma7));
linear_approx LA8 (.clk(clk), .rst(~rst_n), .d(d8),  .gamma_out(gamma8));
linear_approx LA9 (.clk(clk), .rst(~rst_n), .d(d9),  .gamma_out(gamma9));
linear_approx LA10(.clk(clk), .rst(~rst_n), .d(d10), .gamma_out(gamma10));



//////////////////////////////////////////////////////////
// Beta Wires
//////////////////////////////////////////////////////////

wire beta0;
wire beta1;
wire beta2;
wire beta3;
wire beta4;
wire beta5;
wire beta6;
wire beta7;
wire beta8;
wire beta9;
wire beta10;

beta_generator DUT7(

.pci_min_0(pci_min_0),
.pci_min_1(pci_min_1),
.pci_min_2(pci_min_2),
.pci_min_3(pci_min_3),
.pci_min_4(pci_min_4),
.pci_min_5(pci_min_5),
.pci_min_6(pci_min_6),
.pci_min_7(pci_min_7),
.pci_min_8(pci_min_8),
.pci_min_9(pci_min_9),
.pci_min_10(pci_min_10),

.gi0(row0),
.gi1(row1),
.gi2(row2),
.gi3(row3),
.gi4(row4),
.gi5(row5),
.gi6(row6),
.gi7(row7),
.gi8(row8),
.gi9(row9),
.gi10(row10),

.beta0(beta0),
.beta1(beta1),
.beta2(beta2),
.beta3(beta3),
.beta4(beta4),
.beta5(beta5),
.beta6(beta6),
.beta7(beta7),
.beta8(beta8),
.beta9(beta9),
.beta10(beta10)

);




//////////////////////////////////////////////////////////
// Numerator Wires
//////////////////////////////////////////////////////////

wire [23:0] num0;
wire [23:0] num1;
wire [23:0] num2;
wire [23:0] num3;
wire [23:0] num4;
wire [23:0] num5;
wire [23:0] num6;
wire [23:0] num7;
wire [23:0] num8;
wire [23:0] num9;
wire [23:0] num10;

wire [27:0] numerator;

//////////////////////////////////////////////////////////
// Numerator Generator
//////////////////////////////////////////////////////////

numerator_generator DUT8(

.beta0(beta0),
.beta1(beta1),
.beta2(beta2),
.beta3(beta3),
.beta4(beta4),
.beta5(beta5),
.beta6(beta6),
.beta7(beta7),
.beta8(beta8),
.beta9(beta9),
.beta10(beta10),

.gamma0(gamma0),
.gamma1(gamma1),
.gamma2(gamma2),
.gamma3(gamma3),
.gamma4(gamma4),
.gamma5(gamma5),
.gamma6(gamma6),
.gamma7(gamma7),
.gamma8(gamma8),
.gamma9(gamma9),
.gamma10(gamma10),

.pci_min_0(pci_min_0),
.pci_min_1(pci_min_1),
.pci_min_2(pci_min_2),
.pci_min_3(pci_min_3),
.pci_min_4(pci_min_4),
.pci_min_5(pci_min_5),
.pci_min_6(pci_min_6),
.pci_min_7(pci_min_7),
.pci_min_8(pci_min_8),
.pci_min_9(pci_min_9),
.pci_min_10(pci_min_10),

.num0(num0),
.num1(num1),
.num2(num2),
.num3(num3),
.num4(num4),
.num5(num5),
.num6(num6),
.num7(num7),
.num8(num8),
.num9(num9),
.num10(num10)

);

//////////////////////////////////////////////////////////
// Numerator Adder Tree
//////////////////////////////////////////////////////////

numerator_adder_tree DUT9(

.num0(num0),
.num1(num1),
.num2(num2),
.num3(num3),
.num4(num4),
.num5(num5),
.num6(num6),
.num7(num7),
.num8(num8),
.num9(num9),
.num10(num10),

.numerator(numerator)

);

//////////////////////////////////////////////////////////
// Denominator Wires
//////////////////////////////////////////////////////////

wire [15:0] den0;
wire [15:0] den1;
wire [15:0] den2;
wire [15:0] den3;
wire [15:0] den4;
wire [15:0] den5;
wire [15:0] den6;
wire [15:0] den7;
wire [15:0] den8;
wire [15:0] den9;
wire [15:0] den10;

wire [19:0] denominator;

//////////////////////////////////////////////////////////
// Denominator Generator
//////////////////////////////////////////////////////////

denominator_generator DUT10(

.beta0(beta0),
.beta1(beta1),
.beta2(beta2),
.beta3(beta3),
.beta4(beta4),
.beta5(beta5),
.beta6(beta6),
.beta7(beta7),
.beta8(beta8),
.beta9(beta9),
.beta10(beta10),

.gamma0(gamma0),
.gamma1(gamma1),
.gamma2(gamma2),
.gamma3(gamma3),
.gamma4(gamma4),
.gamma5(gamma5),
.gamma6(gamma6),
.gamma7(gamma7),
.gamma8(gamma8),
.gamma9(gamma9),
.gamma10(gamma10),

.den0(den0),
.den1(den1),
.den2(den2),
.den3(den3),
.den4(den4),
.den5(den5),
.den6(den6),
.den7(den7),
.den8(den8),
.den9(den9),
.den10(den10)

);

denominator_adder_tree DUT11(

.den0(den0),
.den1(den1),
.den2(den2),
.den3(den3),
.den4(den4),
.den5(den5),
.den6(den6),
.den7(den7),
.den8(den8),
.den9(den9),
.den10(den10),

.denominator(denominator)

);

//////////////////////////////////////////////////////
// MODULE 12 : Reciprocal LUT
//////////////////////////////////////////////////////

reciprocal_lut DUT12(

.denominator(denominator),

.reciprocal(reciprocal)

);

//////////////////////////////////////////////////////
// MODULE 13 : Final Multiplier
//////////////////////////////////////////////////////

final_multiplier DUT13(

.numerator(numerator),

.reciprocal(reciprocal),

.fm(fm)

);
assign numerator_dbg   = numerator;
assign denominator_dbg = denominator;
assign reciprocal_dbg  = reciprocal;
endmodule