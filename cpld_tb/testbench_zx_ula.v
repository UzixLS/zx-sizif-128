`define USE_FPGA
`include "../cpld/top.v"

`timescale 100ps/10ps 
module testbench_zx_ula();

reg rst_n;
reg clk14;

/* ULA */
zx_ula zx_ula1(
    .rst_n(rst_n),
    .clk14(clk14)
    );


/* CLOCKS & RESET */
initial begin
    rst_n = 0;
    #3000 rst_n = 1;
end

always begin
    clk14 = 0;
    #357 clk14 = 1;
    #358;
end 


initial zx_ula1.hc0 = 0;
initial zx_ula1.vc = 0;

/* TESTBENCH CONTROL */
initial begin
    $dumpfile("testbench_zx_ula.vcd");
    $dumpvars();
    #5000000 $finish;
    //#21000000 $finish;
end


always @(clk14) begin
    // if (v > 100) $dumpoff;
    // if (~n_iorq) $dumpon;
    // if (v == 1 && ovf == 1) $finish;
end



endmodule
