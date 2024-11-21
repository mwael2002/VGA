module VGA_TOP #(parameter data_width=12,h_width=10,v_width=10,horiz=640,vert=480,addr_width=19)(intf_VGA.DUT intf_DUT);
wire [v_width-1:0]v_count;
wire [h_width-1:0]h_count;

counter #(.h_width(h_width),.v_width(v_width)) counter_0(
.clk(intf_DUT.clk),
.rst_n(intf_DUT.rst_n),
.v_count(v_count),
.h_count(h_count)
);

synchronizer #(.h_width(h_width),.v_width(v_width)) synchronizer_0(
.rst_n(intf_DUT.rst_n),
.clk(intf_DUT.clk),
.v_count(v_count),
.h_count(h_count),
.h_sync(intf_DUT.h_sync),
.v_sync(intf_DUT.v_sync),
.video_on(intf_DUT.video_on)
);


rgb_data_mem #(.data_width(data_width),.horiz(horiz),.vert(vert),.addr_width(addr_width)) mem0(
.rgb_data(intf_DUT.rgb_data),
.video_on(intf_DUT.video_on),
.clk(intf_DUT.clk),
.rst_n(intf_DUT.rst_n)
);
endmodule

