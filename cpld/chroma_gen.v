// Based on Joerg Wolfram's code //

module chroma_gen #(
    parameter CLK_FREQ = 16_000_000
    ) (
    input clk,              // input clock
    input en,               // colour enable
    input hsync,            // hor. sync
    input ntsc,             // system (pal/ntsc)
    input r,                // rgbi input
    input g,
    input b,
    input i,
    output reg out_carrier, // chroma out
    output reg [1:0] out
);

localparam CARRIER_WIDTH =
    (CLK_FREQ == 14_000_000)? 17 :
    (CLK_FREQ == 14_318_180)? 17 :
    (CLK_FREQ == 16_000_000)? 14 :
    (CLK_FREQ == 17_734_475)? 3 :
    (CLK_FREQ == 20_000_000)? 14 :
    (CLK_FREQ == 24_000_000)? 17 :
    (CLK_FREQ == 25_000_000)? 16 :
    (CLK_FREQ == 28_000_000)? 18 :
    (CLK_FREQ == 28_375_000)? 16 :
    (CLK_FREQ == 28_636_360)? 18 :
    (CLK_FREQ == 32_000_000)? 15 :
    (CLK_FREQ == 35_468_950)? 3 :
    (CLK_FREQ == 40_000_000)? 15 :
    0;
localparam PAL_CARRIER =
    (CLK_FREQ == 14_000_000)? 83018 : // 20.776 error
    (CLK_FREQ == 14_318_180)? 81173 : // 11.72 error
    (CLK_FREQ == 16_000_000)? 9080 :  // 25 error
    (CLK_FREQ == 17_734_475)? 4 :     // 0 error
    (CLK_FREQ == 20_000_000)? 7264 :  // 25 error
    (CLK_FREQ == 24_000_000)? 48427 : // 5.51 error
    (CLK_FREQ == 25_000_000)? 23245 : // 13.14 error
    (CLK_FREQ == 28_000_000)? 83018 : // 20.78 error
    (CLK_FREQ == 28_375_000)? 20480 : // 25 error
    (CLK_FREQ == 28_636_360)? 81173 : // 11.76 error
    (CLK_FREQ == 32_000_000)? 9080 :  // 25 error
    (CLK_FREQ == 35_468_950)? 2 :     // 0 error
    (CLK_FREQ == 40_000_000)? 7264 :  // 25 error
    0;
localparam NTSC_CARRIER =
    (CLK_FREQ == 14_000_000)? 67025 : // 23.82 error
    (CLK_FREQ == 14_318_180)? 65536 : // 0 errror
    (CLK_FREQ == 16_000_000)? 7331 :  // 44.84 error
    (CLK_FREQ == 17_734_475)? 4 :     // 0 error (NTSC4.43)
    (CLK_FREQ == 20_000_000)? 5865 :  // 166.91 error
    (CLK_FREQ == 24_000_000)? 39098 : // 16.19 error
    (CLK_FREQ == 25_000_000)? 18767 : // 23.82 error
    (CLK_FREQ == 28_000_000)? 67025 : // 23.82 error
    (CLK_FREQ == 28_375_000)? 16535 : // 19.1 error
    (CLK_FREQ == 28_636_360)? 65536 : // 0 error
    (CLK_FREQ == 32_000_000)? 7331 :  // 44.84 error
    (CLK_FREQ == 35_468_950)? 2 :     // 0 error (NTSC4.43)
    (CLK_FREQ == 40_000_000)? 5865 :  // 166.91 error
    0;

// localparam PAL_CARRIER  = 64'd17_734_475 * (1<<(CARRIER_WIDTH-1)) / CLK_FREQ;
// localparam NTSC_CARRIER = 64'd14_318_180 * (1<<(CARRIER_WIDTH-1)) / CLK_FREQ;


// DDS for PAL-carrier
reg [CARRIER_WIDTH:0] carrier;
wire [31:0] carrier_next = (!ntsc)?
        (carrier + PAL_CARRIER)  :
        (carrier + NTSC_CARRIER) ;
always @(posedge clk) begin
    carrier <= carrier_next[CARRIER_WIDTH:0];
end


// burst generator
reg [3:0] burst_cnt;
always @(posedge carrier[CARRIER_WIDTH] or negedge hsync) begin
    if (hsync == 1'b0)
        burst_cnt <= 4'b0100;
    else if (burst_cnt != 4'b0000)
        burst_cnt <= burst_cnt + 1'b1;
end
wire burst = burst_cnt[3];


// odd/even line
reg oddeven;
always @(posedge hsync) begin
    if (!ntsc)
        oddeven <= ~oddeven;
    else
        oddeven <= 1'b0;
end

// carrier phase
reg [3:0] phase;
always @* begin
    if (burst == 1'b1) begin
        if ((oddeven == 1'b0) && (!ntsc))
            phase <= 4'h6; // burst phase 135 deg
        else
            phase <= 4'hA; // burst phase -135 deg
    end
    else if (oddeven == 1'b0) begin
        case ({r,g,b})
            3'b010:  phase <= 4'hB; // green
            3'b011:  phase <= 4'hD; // cyan
            3'b100:  phase <= 4'h5; // red
            3'b101:  phase <= 4'h3; // magenta
            3'b110:  phase <= 4'h7; // yellow
            default: phase <= 4'hF; // blue
        endcase
    end
    else begin
        case ({r,g,b})
            3'b010:  phase <= 4'h5; // green
            3'b011:  phase <= 4'h3; // cyan
            3'b100:  phase <= 4'hB; // red
            3'b101:  phase <= 4'hD; // magenta
            3'b110:  phase <= 4'h9; // yellow
            default: phase <= 4'h1; // blue
        endcase
    end
end


// carrier amplitude
reg [1:0] amplitude;
always @* begin
    if (burst == 1'b1)
        amplitude <= 2'b01;
    else case ({i,r,g,b}) 
        4'b0001: amplitude <= 2'b10;
        4'b0010: amplitude <= 2'b10;
        4'b0011: amplitude <= 2'b10;
        4'b0100: amplitude <= 2'b10;
        4'b0101: amplitude <= 2'b10;
        4'b0110: amplitude <= 2'b10;
        4'b1001: amplitude <= 2'b11;
        4'b1010: amplitude <= 2'b11;
        4'b1011: amplitude <= 2'b11;
        4'b1100: amplitude <= 2'b11;
        4'b1101: amplitude <= 2'b11;
        4'b1110: amplitude <= 2'b11;
        default: amplitude <= 2'b00;
    endcase
end


// modulated carrier
reg [3:0] scarrier;
always @*
    scarrier <= carrier[CARRIER_WIDTH:CARRIER_WIDTH-3] + phase;


// chroma signal
always @(posedge clk) begin
    out_carrier <= scarrier[3];
    out[1] <= en && amplitude[1];
    out[0] <= en && amplitude[0];
end


endmodule
