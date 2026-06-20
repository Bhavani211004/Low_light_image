`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:58:59
// Design Name: 
// Module Name: reciprocal_lut
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


module reciprocal_lut(

    input  wire [19:0] denominator,
    output reg  [31:0] reciprocal

);

    reg [31:0] rom [0:180224];

    initial
    begin
        $readmemh("reciprocal_lut.mem", rom);
    end

    always @(*) begin
        if (denominator == 20'd0)
            reciprocal = 32'd0;
        else
            reciprocal = rom[denominator];
    end

endmodule