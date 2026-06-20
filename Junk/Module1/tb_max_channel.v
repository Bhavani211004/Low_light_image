`timescale 1ns/1ps

module tb_max_channel_image;

parameter PIXELS = 276212;

reg clk;
reg rst_n;
reg pixel_valid;

reg [7:0] r_in;
reg [7:0] g_in;
reg [7:0] b_in;

wire [7:0] gi_out;
wire gi_valid;

reg [7:0] red_mem   [0:PIXELS-1];
reg [7:0] green_mem [0:PIXELS-1];
reg [7:0] blue_mem  [0:PIXELS-1];

integer i;
integer fout;

max_channel DUT(
    .clk(clk),
    .rst_n(rst_n),
    .pixel_valid(pixel_valid),
    .r_in(r_in),
    .g_in(g_in),
    .b_in(b_in),
    .gi_out(gi_out),
    .gi_valid(gi_valid)
);

always #5 clk = ~clk;

initial begin

    $readmemh("C:/Users/Me/Downloads/red.hex", red_mem);
    $readmemh("C:/Users/Me/Downloads/green.hex", green_mem);
    $readmemh("C:/Users/Me/Downloads/blue.hex", blue_mem);

    fout = $fopen("gi_output.hex","w");

    $display("red[0]=%h", red_mem[0]);
    $display("red[1]=%h", red_mem[1]);
    $display("green[0]=%h", green_mem[0]);
    $display("blue[0]=%h", blue_mem[0]);
    clk = 0;
    rst_n = 0;
    pixel_valid = 0;

    #20;

    rst_n = 1;
    pixel_valid = 1;

    for(i=0;i<PIXELS;i=i+1)
    begin
        r_in = red_mem[i];
        g_in = green_mem[i];
        b_in = blue_mem[i];

        #10;

        if(gi_valid)
            $fwrite(fout,"%02h\n",gi_out);
    end

    $fclose(fout);

    #100;
    $finish;
end

endmodule
