module VGA_TOP #(data_width=3,parameter h_width=10,v_width=10)(
    input   clk,rst_n,
    input [data_width-1:0] data_in,
    output  h_sync,v_sync,
    output  [data_width-1:0] rgb_data
);

wire [v_width-1:0]v_count;
wire [h_width-1:0]h_count;

wire clk_out;

assign rgb_data=(video_on)?data_in:0;

counter #(.h_width(h_width),.v_width(v_width)) counter_0(
.clk(clk),
.rst_n(rst_n),
.v_count(v_count),
.h_count(h_count)
);

synchronizer #(.h_width(h_width),.v_width(v_width)) synchronizer_0(
.rst_n(rst_n),
.clk(clk),
.v_count(v_count),
.h_count(h_count),
.h_sync(h_sync),
.v_sync(v_sync),
.video_on(video_on)
);



endmodule
