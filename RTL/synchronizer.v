module synchronizer #(parameter h_width=10,v_width=10,h_sync_count=640,v_sync_count=480,
                                right_border=16,left_border=47,
                                top_border=32,bottom_border=10,
                                h_retrace=96,v_retrace=2 ,
                                h_max=h_sync_count+right_border+left_border+h_retrace,
                                v_max=v_sync_count+top_border+bottom_border+v_retrace
                          )
(
    input clk,rst_n,
    input   [v_width-1:0]v_count,
    input   [h_width-1:0]h_count,
    output  reg h_sync,v_sync,video_on  
);

always@(posedge clk or negedge rst_n) begin
    
    if(!rst_n)
    h_sync<=0;
    
    else if( (h_count>(left_border+h_sync_count+right_border) && h_count<=(left_border+h_sync_count+right_border+h_retrace) ) )
    h_sync<=0;
    
    else
    h_sync<=1;
    
end

always@(posedge clk or negedge rst_n) begin
    
    if(!rst_n)
    v_sync<=0;
    
    else if( (v_count>(top_border+v_sync_count+bottom_border) && v_count<=(top_border+v_sync_count+bottom_border+v_retrace)) )
    v_sync<=0;
    
    else
    v_sync<=1;
    
end

always@(posedge clk or negedge rst_n) begin
    
    if(!rst_n)
    video_on<=0;
    
    else if( (h_count>left_border && h_count<=h_sync_count+left_border) && (v_count>top_border && v_count<=top_border+v_sync_count) )
    video_on<=1;
    
    else
    video_on<=0;
    
end

endmodule