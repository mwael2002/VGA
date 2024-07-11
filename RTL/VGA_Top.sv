module VGA_TOP #(parameter h_width=10,v_width=10)(intf_VGA.DUT intf_DUT);
wire [v_width-1:0]v_count;
wire [h_width-1:0]h_count;

counter dut0(
.clk(intf_DUT.clk),
.rst_n(intf_DUT.rst_n),
.v_count(v_count),
.h_count(h_count)
);

synchronizer dut1(
.rst_n(intf_DUT.rst_n),
.clk(intf_DUT.clk),
.v_count(v_count),
.h_count(h_count),
.h_sync(intf_DUT.h_sync),
.v_sync(intf_DUT.v_sync),
.video_on(intf_DUT.video_on)
);


data_stream_synchronizer dut2(
.rgb_data(intf_DUT.rgb_data),
.video_on(intf_DUT.video_on),
.clk(intf_DUT.clk),
.rst_n(intf_DUT.rst_n),
.data_stream(intf_DUT.data_stream)
);
endmodule

