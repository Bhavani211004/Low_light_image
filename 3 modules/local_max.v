`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 16:56:31
// Design Name: 
// Module Name: local_max
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


module local_max(
    input wire clk,
    input wire rst,
    input wire pixel_valid,

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

    output reg [7:0] pci_out,
    output reg pci_valid
);

reg [7:0] C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10;

wire [7:0] v01  = (row0 > row1)  ? row0 : row1;
wire [7:0] v23  = (row2 > row3)  ? row2 : row3;
wire [7:0] v45  = (row4 > row5)  ? row4 : row5;
wire [7:0] v67  = (row6 > row7)  ? row6 : row7;
wire [7:0] v89  = (row8 > row9)  ? row8 : row9;

wire [7:0] v0123 = (v01 > v23) ? v01 : v23;
wire [7:0] v4567 = (v45 > v67) ? v45 : v67;
wire [7:0] v8910 = (v89 > row10) ? v89 : row10;

wire [7:0] v0 = (v0123 > v4567) ? v0123 : v4567;

wire [7:0] column_max =
                (v0 > v8910) ? v0 : v8910;

wire [7:0] h01  = (C0 > C1) ? C0 : C1;
wire [7:0] h23  = (C2 > C3) ? C2 : C3;
wire [7:0] h45  = (C4 > C5) ? C4 : C5;
wire [7:0] h67  = (C6 > C7) ? C6 : C7;
wire [7:0] h89  = (C8 > C9) ? C8 : C9;

wire [7:0] h0123 = (h01 > h23) ? h01 : h23;
wire [7:0] h4567 = (h45 > h67) ? h45 : h67;
wire [7:0] h8910 = (h89 > C10) ? h89 : C10;

wire [7:0] h0 = (h0123 > h4567) ? h0123 : h4567;

wire [7:0] window_max =
                (h0 > h8910) ? h0 : h8910;

always @(posedge clk)
begin
    if(rst)
    begin
        C0 <= 0;
        C1 <= 0;
        C2 <= 0;
        C3 <= 0;
        C4 <= 0;
        C5 <= 0;
        C6 <= 0;
        C7 <= 0;
        C8 <= 0;
        C9 <= 0;
        C10 <= 0;

        pci_out <= 0;
        pci_valid <= 0;
    end
    else if(pixel_valid)
    begin
        C0 <= C1;
        C1 <= C2;
        C2 <= C3;
        C3 <= C4;
        C4 <= C5;
        C5 <= C6;
        C6 <= C7;
        C7 <= C8;
        C8 <= C9;
        C9 <= C10;
        C10 <= column_max;

        pci_out <= window_max;
        pci_valid <= 1'b1;
    end
    else
        pci_valid <= 1'b0;
end

endmodule