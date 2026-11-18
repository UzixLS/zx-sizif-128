`timescale 1ps / 1ps

// Pin-level board wrapper. The original ULA is compiled without source edits.
// --pins-inout-enables exports va/vd plus their __out and __en ports to C++,
// which resolves the resistor-separated buses and the external RAM/ROM.
module sizif (
    input wire clk14,
    input wire reset_n,
    input wire [39:0] keys,
    inout wire [16:0] va,
    inout wire [7:0] vd,
    input wire [7:0] cpu_in,
    output wire [15:0] addr,
    output wire [7:0] cpu_out,
    output wire cpu_data_drive,
    output wire rd_n,
    output wire wr_n,
    output wire mreq_n,
    output wire iorq_n,
    output wire m1_n,
    output wire rfsh_n,
    output wire int_n,
    output wire n_vrd,
    output wire n_vwr,
    output wire n_romcs,
    output wire ra14,
    output wire [3:0] rgbi,
    output wire csync,
    output wire [8:0] video_x,
    output wire [8:0] video_y,
    output wire pixel_strobe,
    output wire [15:0] debug_pc,
    output wire [5:0] debug_paging,
    output wire halt_n
);
    // Deterministic power-on phase for the free-running raster counters.
    initial begin
        ula.hc0 = 0;
        ula.vc = 0;
        ula.blink_cnt = 0;
    end

    wire cpu_clk;
    wire mreq, iorq, rd, wr, m1, rfsh, halt;
    wire data_z, adr_z, controls_z;
    wire [15:0] cpu_addr;

    Z80 cpu (
        .clk(cpu_clk), .reset(~reset_n), .p_int(~int_n),
        .p_wait(1'b0), .nmi(1'b0), .busrq(1'b0), .busack(),
        .data_in(cpu_in), .data_out(cpu_out), .data_z(data_z),
        .adr(cpu_addr), .adr_z(adr_z), .controls_z(controls_z),
        .mreq(mreq), .iorq(iorq), .rd(rd), .wr(wr),
        .p_m1(m1), .rfsh(rfsh), .halt(halt)
    );

    assign addr = adr_z ? 16'hffff : cpu_addr;
    assign cpu_data_drive = ~data_z;
    assign {mreq_n, iorq_n, rd_n, wr_n} = {4{controls_z}} | ~{mreq, iorq, rd, wr};
    assign {m1_n, rfsh_n, halt_n} = ~{m1, rfsh, halt};
    assign debug_pc = {cpu.registers.reg_pch, cpu.registers.reg_pcl};

    reg [4:0] kd;
    integer row;

    always @* begin
        kd = 5'b11111;
        for (row = 0; row < 8; row = row + 1) begin
            if (!addr[row + 8]) begin
                kd = kd & keys[row * 5 +: 5];
            end
        end
    end

    wire r, g, b, bright;

    zx_ula ula (
        .rst_n(reset_n), .clk14(clk14), .clkpal(1'b0), .clkcpu(cpu_clk),
        .vd(vd), .va(va), .ra14(ra14),
        .a0(addr[0]), .a1(addr[1]), .a14(addr[14]), .a15(addr[15]),
        .n_rd(rd_n), .n_wr(wr_n), .n_mreq(mreq_n), .n_iorq(iorq_n),
        .n_m1(m1_n), .n_rfsh(rfsh_n), .n_int(int_n),
        .n_vrd(n_vrd), .n_vwr(n_vwr), .n_romcs(n_romcs),
        .kd(kd), .tape_in(1'b1), .tape_out(), .beeper(),
        .ay_clk(), .ay_bdir(), .ay_bc1(),
        .r(r), .g(g), .b(b), .i(bright), .chroma(), .csync(csync)
    );

    assign rgbi = {bright, r, g, b};

    // These coordinates identify the RGB sample about to be latched on the
    // next master-clock rising edge, without guessing a PAL sync threshold.
    assign video_x = ula.hc;
    assign video_y = ula.vc;
    assign pixel_strobe = ula.hc0[0];
    assign debug_paging = {ula.lock_7ffd, ula.rombank, ula.vbank, ula.rambank};
endmodule
