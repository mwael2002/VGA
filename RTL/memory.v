module data_stream_synchronizer #(parameter  data_width=12)(
    input   [data_width-1:0] data_stream,
	 input   video_on,
    input   clk,rst_n,
    output  reg [data_width-1:0]rgb_data
);

always @(posedge clk,negedge rst_n) begin

    if(!rst_n)
    rgb_data<=0;
    else
    rgb_data<=(video_on)?data_stream:0;
end
endmodule
