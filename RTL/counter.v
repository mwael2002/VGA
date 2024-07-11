module counter #(parameter  h_width=10,v_width=10,h_sync_count=640,v_sync_count=480,
                            right_border=16,left_border=47,
                            top_border=32,bottom_border=10,
                            h_retrace=96,v_retrace=2 ,
                            h_max=h_sync_count+right_border+left_border+h_retrace,
                            v_max=v_sync_count+top_border+bottom_border+v_retrace
                          )(
    input  clk,rst_n,
    output reg[v_width-1:0]v_count,
    output reg[h_width-1:0]h_count
);

wire v_flag,h_flag;

assign v_flag = (v_count==v_max)?1:0;
assign h_flag = (h_count==h_max)?1:0;

always @(posedge clk ,negedge rst_n) begin
    if(!rst_n) begin
        v_count<=0;
        h_count<=0;
    end
    else if(!h_flag) begin
        h_count<=h_count+1;
    end
    else if(!v_flag)begin
        v_count<=v_count+1;
        h_count<=0;
    end
    else begin
        v_count<=0;
        h_count<=0;
    end
end

endmodule
