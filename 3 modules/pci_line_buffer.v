`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 16:54:01
// Design Name: 
// Module Name: pci_line_buffer
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

module pci_line_buffer(
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire [7:0] pci_in,

    output reg [7:0] pci_row0,
    output reg [7:0] pci_row1,
    output reg [7:0] pci_row2,
    output reg [7:0] pci_row3,
    output reg [7:0] pci_row4,
    output reg [7:0] pci_row5,
    output reg [7:0] pci_row6,
    output reg [7:0] pci_row7,
    output reg [7:0] pci_row8,
    output reg [7:0] pci_row9,
    output reg [7:0] pci_row10
);

localparam ROW_LEN = 694;

(* ram_style = "block" *) reg [7:0] lb0 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb1 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb2 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb3 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb4 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb5 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb6 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb7 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb8 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb9 [0:ROW_LEN-1];
(* ram_style = "block" *) reg [7:0] lb10[0:ROW_LEN-1];

integer ptr;

always @(posedge clk)
begin
    if(rst)
    begin
        ptr <= 0;

        pci_row0  <= 0;
        pci_row1  <= 0;
        pci_row2  <= 0;
        pci_row3  <= 0;
        pci_row4  <= 0;
        pci_row5  <= 0;
        pci_row6  <= 0;
        pci_row7  <= 0;
        pci_row8  <= 0;
        pci_row9  <= 0;
        pci_row10 <= 0;
    end
    else if(wr_en)
    begin

        pci_row0 <= pci_in;

        pci_row1 <= lb0[ptr];
        pci_row2 <= lb1[ptr];
        pci_row3 <= lb2[ptr];
        pci_row4 <= lb3[ptr];
        pci_row5 <= lb4[ptr];
        pci_row6 <= lb5[ptr];
        pci_row7 <= lb6[ptr];
        pci_row8 <= lb7[ptr];
        pci_row9 <= lb8[ptr];
        pci_row10 <= lb9[ptr];

        lb0[ptr] <= pci_in;
        lb1[ptr] <= lb0[ptr];
        lb2[ptr] <= lb1[ptr];
        lb3[ptr] <= lb2[ptr];
        lb4[ptr] <= lb3[ptr];
        lb5[ptr] <= lb4[ptr];
        lb6[ptr] <= lb5[ptr];
        lb7[ptr] <= lb6[ptr];
        lb8[ptr] <= lb7[ptr];
        lb9[ptr] <= lb8[ptr];
        lb10[ptr] <= lb9[ptr];

        if(ptr == ROW_LEN-1)
            ptr <= 0;
        else
            ptr <= ptr + 1;
    end
end

endmodule
