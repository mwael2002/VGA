module rgb_data_mem #(parameter  data_width=8,horiz=640,vert=480,addr_width=19)(

	input   video_on,
    input   clk,rst_n,
    output  reg [data_width-1:0]rgb_data
);

reg [data_width-1:0]memo[0:(horiz*vert)-1];

reg [addr_width-1:0] counter;

initial begin
$readmemb("rgb_bits_output.txt",memo);

end

always@(posedge clk or negedge rst_n)begin

		  if(!rst_n)
		  counter<=0;
		  
		  else if(counter==horiz*vert)
		  counter<=0;
		  
		  else if(video_on)
		  counter<=counter+1;


end


always @(posedge clk,negedge rst_n) begin

    if(!rst_n)
    rgb_data<=0;
    else if(video_on)
    rgb_data<=memo[counter];
	 else
	 rgb_data<=0;
end
endmodule
