`include "util.vh"

module zx_ula(
	input rst_n,
	input clk14,
	input clk16,

	output clkcpu,

	inout [7:0] vd,
	inout [16:0] va,
	output ra14,
	input a0,
	input a1,
	input a14,
	input a15,

	input n_rd,
	input n_wr,
	input n_mreq,
	input n_iorq,
	input n_m1,
	input n_rfsh,
	output reg n_int,

	output n_vrd,
	output n_vwr,
	output reg n_romcs,

	input [4:0] kd,
	input tape_in,
	output tape_out,
	output beeper,

	output ay_clk,
	output reg ay_bdir,
	output reg ay_bc1,

	output reg r,
	output reg g,
	output reg b,
	output reg i,
	output [1:0] chroma,
	output reg csync
);

wire timings = 0;
wire turbo = 0;
wire [2:0] border;

reg n_iorq_delayed;
always @(posedge clkcpu)
	n_iorq_delayed <= n_iorq;
wire n_iorq0 = n_iorq | n_iorq_delayed;


/* SCREEN CONTROLLER */
localparam H_AREA         = 256;
localparam V_AREA         = 192;
localparam SCREEN_DELAY   = 8;

localparam H_LBORDER_S48  = 32 - SCREEN_DELAY;
localparam H_RBORDER_S48  = 64 + SCREEN_DELAY;
localparam H_BLANK1_S48   = 16;
localparam H_SYNC_S48     = 32;
localparam H_BLANK2_S48   = 48;
localparam H_TOTAL_S48    = H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48 + H_LBORDER_S48;
localparam V_BBORDER_S48  = 56;
localparam V_SYNC_S48     = 8;
localparam V_TBORDER_S48  = 56;
localparam V_TOTAL_S48    = V_AREA + V_BBORDER_S48 + V_SYNC_S48 + V_TBORDER_S48;

localparam H_LBORDER_S128 = 48 - SCREEN_DELAY;
localparam H_RBORDER_S128 = 48 + SCREEN_DELAY;
localparam H_BLANK1_S128  = 28;
localparam H_SYNC_S128    = 32;
localparam H_BLANK2_S128  = 44;
localparam H_TOTAL_S128   = H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128 + H_LBORDER_S128;
localparam V_BBORDER_S128 = 56;
localparam V_SYNC_S128    = 15;
localparam V_TBORDER_S128 = 48;
localparam V_TOTAL_S128   = V_AREA + V_BBORDER_S128 + V_SYNC_S128 + V_TBORDER_S128;

localparam H_LBORDER_PENT = 72 - SCREEN_DELAY;
localparam H_RBORDER_PENT = 56 + SCREEN_DELAY;
localparam H_BLANK1_PENT  = 0;
localparam H_SYNC_PENT    = 32;
localparam H_BLANK2_PENT  = 32;
localparam H_TOTAL_PENT   = H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT + H_BLANK2_PENT + H_LBORDER_PENT;
localparam V_BBORDER_PENT = 48;
localparam V_SYNC_PENT    = 16;
localparam V_TBORDER_PENT = 64;
localparam V_TOTAL_PENT   = V_AREA + V_BBORDER_PENT + V_SYNC_PENT + V_TBORDER_PENT;

reg [`CLOG2(`MAX(V_TOTAL_S128, V_TOTAL_PENT))-1:0] vc;
reg [`CLOG2(`MAX(H_TOTAL_S128, H_TOTAL_PENT)):0] hc0;
wire [`CLOG2(`MAX(H_TOTAL_S128, H_TOTAL_PENT))-1:0] hc = hc0[$bits(hc0)-1:1];

wire hc0_reset_s128 = hc0 == (H_TOTAL_S128<<1) - 1'b1;
wire hc0_reset_pent = hc0 == (H_TOTAL_PENT<<1) - 1'b1;
wire vc_reset_s128 = vc == V_TOTAL_S128 - 1'b1;
wire vc_reset_pent = vc == V_TOTAL_PENT - 1'b1;
wire hsync_s128 = (hc >= (H_AREA + H_RBORDER_S128 + H_BLANK1_S128)) &&
			      (hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128));
wire hsync_pent = hc[8:5] == 4'b1010;
wire vsync_s128 = (vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128));
wire vsync_pent = vc[8:4] == 5'b01111;
wire blank_s128 = vsync_s128 || ((hc >= (H_AREA + H_RBORDER_S128)) &&
						        (hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128)));
wire blank_pent = vsync_pent || hc[8:6] == 3'b101;

wire hc0_reset  = timings? hc0_reset_s128  : hc0_reset_pent;
wire vc_reset   = timings? vc_reset_s128   : vc_reset_pent;
wire hsync0     = timings? hsync_s128      : hsync_pent;
wire vsync0     = timings? vsync_s128      : vsync_pent;
wire blank      = timings? blank_s128      : blank_pent;

wire screen_load = (vc < V_AREA) && (hc < H_AREA);
wire screen_show = (vc < V_AREA) && (hc >= SCREEN_DELAY) && (hc < H_AREA + SCREEN_DELAY);

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		hc0 <= 0;
		vc <= 0;
	end
	else if (hc0_reset) begin
		hc0 <= 0;
		if (vc_reset) begin
			vc <= 0;
		end
		else begin
			vc <= vc + 1'b1;
		end
	end 
	else begin
		hc0 <= hc0 + 1'b1;
	end
end

reg [3:0] blink_cnt;
wire blink = blink_cnt[$bits(blink_cnt)-1];
always @(posedge vc_reset or negedge rst_n) begin
    if (!rst_n)
        blink_cnt <= 0;
    else
        blink_cnt <= blink_cnt + 1'b1;
end

reg [7:0] bitmap, attr, bitmap_next, attr_next;
wire pixel = bitmap[7];
always @(posedge clk14) begin
	if (hc0[0]) begin
		if (blank)
			{i, g, r, b} <= 4'b0000;
		else begin
			{g, r, b} = (pixel ^ (attr[7] & blink))? attr[2:0] : attr[5:3];
			i = (g | r | b) & attr[6];
		end
		csync <= ~(vsync0 ^ hsync0);
	end
end

reg screen_read;
wire attr_read = screen_read & ~hc0[0];
wire bitmap_read = screen_read & hc0[0];
wire [14:0] bitmap_addr = { 2'b10, vc[7:6], vc[2:0], vc[5:3], hc[7:3] };
wire [14:0] attr_addr = { 5'b10110, vc[7:3], hc[7:3] };
wire [14:0] screen_addr = attr_read? attr_addr : bitmap_addr;
wire screen_update = hc0[3:0] == 4'b1111;
// wire border_update = (~((screen_load && (hc0[3:0] == 4'b1111)) || (screen_show && (hc0[3:0] != 4'b1110))))
// 				&& (timings == 0 || hc0[3:0] == 4'b1111);
wire border_update = ((screen_load == 0 && screen_show == 0) || (screen_load == 0 && hc0[3:0] == 4'b1111) || (screen_show == 0 && timings == 0))
				&& (timings == 0 || hc0[3:0] == 4'b1111);

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		screen_read <= 0;
		attr <= 0;
		bitmap <= 0;
		attr_next <= 0;
		bitmap_next <= 0;
	end
	else begin
		screen_read <= screen_load && (n_mreq == 1 && n_iorq == 1);

		if (attr_read)
			attr_next <= vd;
		if (bitmap_read)
			bitmap_next <= vd;

		if (screen_load && screen_update)
			attr <= attr_next;
		else if (border_update)
			attr <= {2'b00, border, 3'b000};
		
		if (screen_load && screen_update)
			bitmap <= bitmap_next;
		else if (hc0[0])
			bitmap <= {bitmap[6:0], 1'b0};
	end
end


/* PORT #FE */
wire port_fe_cs = n_m1 == 1 && n_iorq0 == 0 && a0 == 0;
reg port_fe_rd;
always @(posedge clk14)
	port_fe_rd <= port_fe_cs && n_rd == 0;

wire [7:0] port_fe_data = {1'b1, tape_in, 1'b1, kd[4:0]};
reg [7:0] port_fe;
assign beeper = port_fe[4];
assign tape_out = port_fe[3] ^ tape_in;
assign border = port_fe[2:0];
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		port_fe <= 0;
	else if (port_fe_cs && n_wr == 0)
		port_fe <= vd;
end


/* PORT #7FFD */
wire port_7ffd_cs = n_m1 == 1 && n_iorq0 == 0 && a1 == 0 && a15 == 0;
reg [7:0] port_7ffd;
wire [2:0] rambank = port_7ffd[2:0];
wire vbank = port_7ffd[3];
wire rombank = port_7ffd[4];
wire lock_7ffd = port_7ffd[5];
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		port_7ffd <= 0;
	else if (port_7ffd_cs && n_wr == 0 && lock_7ffd == 0)
		port_7ffd <= vd;
end


/* INT GENERATOR */
localparam INT_V_S128      = 248;
localparam INT_H_FROM_S128 = 0;
localparam INT_H_TO_S128   = 72;
localparam INT_V_PENT      = 239;
localparam INT_H_FROM_PENT = 312;
localparam INT_H_TO_PENT   = 384;
wire n_int_s128 = vc != INT_V_S128 || hc < INT_H_FROM_S128 || hc > INT_H_TO_S128;
wire n_int_pent = vc != INT_V_PENT || hc < INT_H_FROM_PENT || hc > INT_H_TO_PENT;
always @(posedge clk14)
	n_int <= timings? n_int_s128 : n_int_pent;


/* CLOCK */
reg [2:0] clk_cnt;
always @(posedge clk14) begin
	clk_cnt <= clk_cnt + 1'b1;
end
assign clkcpu = turbo? clk_cnt[0] : clk_cnt[1];


/* AY */
always @(posedge clkcpu or negedge rst_n) begin
	if (!rst_n) begin
		ay_bc1 <= 0;
		ay_bdir <= 0;
	end
	else begin
		ay_bc1  <= a15 == 1 && a14 == 1 && a1 == 0 && n_m1 == 1 && n_iorq0 == 0;
		ay_bdir <= a15 == 1 && a1 == 0 && n_m1 == 1 && n_iorq0 == 0 && n_wr == 0;
	end
end
assign ay_clk = clk_cnt[2];


/* VIDEO */
reg [2:0] chroma0;
chroma_gen chroma_gen1(
	.cg_clock(clk16),
	.cg_rgb({g,r,b}),
	.cg_hsync(~hsync0),
	.cg_enable(1'b1),
	.cg_pnsel(1'b0),
	.cg_out(chroma0)
);
assign chroma[0] = chroma0[1]? chroma0[0] : 1'bz;
assign chroma[1] = chroma0[2]? chroma0[0] : 1'bz;


/* MEMORY CONTROLLER */
// 7ffe a15-14 va16-14
//  xxx   01     010   bank 2
//  xxx   10     101   bank 5
//  000   11     000   bank 0
//  001   11     001   bank 1 | contended
//  010   11     010   bank 2
//  011   11     011   bank 3 | contended
//  100   11     100   bank 4
//  101   11     101   bank 5 | contended (video)
//  110   11     110   bank 6
//  111   11     111   bank 7 | contended (video alt)
// 7ffe a15-14  ra14
//    0   00       0   rom0
//    1   00       1   rom1

wire n_vcs_cpu = n_mreq | ~(a15 | a14);
assign n_vrd = ((n_vcs_cpu == 0 && n_rd == 0) || screen_read == 1)? 1'b0 : 1'b1 ;
assign n_vwr = ((n_vcs_cpu == 0 && n_wr == 0) && screen_read == 0)? 1'b0 : 1'b1;
always @(posedge clkcpu) begin
	n_romcs <= n_mreq |   a15 | a14;
end


assign va[16:0] = 
				  screen_read? {1'b1, vbank, screen_addr} :
				  a15 & a14? {rambank, {14{1'bz}}} :
				  {a14, a15, a14, {14{1'bz}}};

assign vd[7:0] = 
				 port_fe_rd? port_fe_data :
				 n_iorq0 == 0 && n_rd == 0? {8{1'b1}} :
				 {8{1'bz}};

assign ra14 = rombank;


endmodule
