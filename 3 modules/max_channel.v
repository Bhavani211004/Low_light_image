`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 16:31:35
// Design Name: 
// Module Name: max_channel
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
module max_channel (
    input wire clk,
    input wire rst_n,
    input wire pixel_valid,

    input wire [7:0] r_in,
    input wire [7:0] g_in,
    input wire [7:0] b_in,

    output reg [7:0] gi_out,
    output reg gi_valid
);

wire [7:0] max_gb;

assign max_gb = (g_in > b_in) ? g_in : b_in;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        gi_out <= 0;
        gi_valid <= 0;
    end
    else if(pixel_valid)
    begin
        gi_out <= (r_in > max_gb) ? r_in : max_gb;
        gi_valid <= 1'b1;
    end
    else
        gi_valid <= 1'b0;
end

endmodule