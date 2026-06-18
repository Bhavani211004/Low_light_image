module line_buffer(
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire [7:0] data_in,

    output reg [7:0] row0,
    output reg [7:0] row1,
    output reg [7:0] row2,
    output reg [7:0] row3,
    output reg [7:0] row4,
    output reg [7:0] row5,
    output reg [7:0] row6,
    output reg [7:0] row7,
    output reg [7:0] row8,
    output reg [7:0] row9,
    output reg [7:0] row10
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

        row0  <= 0;
        row1  <= 0;
        row2  <= 0;
        row3  <= 0;
        row4  <= 0;
        row5  <= 0;
        row6  <= 0;
        row7  <= 0;
        row8  <= 0;
        row9  <= 0;
        row10 <= 0;
    end
    else if(wr_en)
    begin

        row0 <= data_in;

        row1 <= lb0[ptr];
        row2 <= lb1[ptr];
        row3 <= lb2[ptr];
        row4 <= lb3[ptr];
        row5 <= lb4[ptr];
        row6 <= lb5[ptr];
        row7 <= lb6[ptr];
        row8 <= lb7[ptr];
        row9 <= lb8[ptr];
        row10 <= lb9[ptr];

        lb0[ptr] <= data_in;
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
