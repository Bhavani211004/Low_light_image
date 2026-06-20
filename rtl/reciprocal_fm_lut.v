`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 14:13:44
// Design Name: 
// Module Name: reciprocal_fm_lut
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



`timescale 1ns / 1ps

module reciprocal_fm_lut(

    input  wire [7:0] fm,
    output reg  [31:0] reciprocal

);

reg [31:0] rom [0:255];

initial begin
    $readmemh("reciprocal_fm.mem", rom);
end

always @(*) begin
    reciprocal = rom[fm];
end

endmodule