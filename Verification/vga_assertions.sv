module vga_assertions(intf_VGA.DUT asser);


property prop_h_sync_pos;
  disable iff(!asser.rst_n)( @(posedge asser.clk) $rose(asser.h_sync) |=> asser.h_sync[*703] 
  ##1 !asser.h_sync); 
endproperty

property prop_h_sync_neg;
  disable iff(!asser.rst_n)( @(posedge asser.clk) $fell(asser.h_sync) |=> !asser.h_sync[*95] 
  ##1 asser.h_sync); 
endproperty

property prop_v_sync_pos;
  disable iff(!asser.rst_n)( @(posedge asser.clk) $rose(asser.v_sync) |-> asser.v_sync[*418400]  
  ##1 !asser.v_sync ); 
endproperty

property prop_v_sync_neg;
  disable iff(!asser.rst_n)( @(posedge asser.clk) $fell(asser.v_sync) |-> !asser.v_sync[*1600]  
  ##1 asser.v_sync); 
endproperty

property prop_rgb_data_video_on;
  disable iff(!asser.rst_n)( @(posedge asser.clk) !asser.video_on |=> !asser.rgb_data); 
endproperty

property prop_video_on_pos;
  disable iff(!asser.rst_n)( @(posedge asser.clk) $rose(asser.video_on) |=> (asser.video_on && asser.h_sync && asser.v_sync ) [*639] ##1 !asser.video_on); 
endproperty

always@(*) begin;
  if(!asser.rst_n) begin
  a_rst:assert final(!asser.rgb_data && !asser.h_sync && !asser.v_sync);
  c_rst:cover final(!asser.rgb_data && !asser.h_sync && !asser.v_sync);
  end
end



a_h_sync_pos:assert property(prop_h_sync_pos); 
c_h_sync_pos:cover property(prop_h_sync_pos);

a_h_sync_neg:assert property(prop_h_sync_neg); 
c_h_sync_neg:cover property(prop_h_sync_neg);

a_v_sync_pos:assert property(prop_v_sync_pos);
c_v_sync_pos:cover property(prop_v_sync_pos);

a_v_sync_neg:assert property(prop_v_sync_neg);
c_v_sync_neg:cover property(prop_v_sync_neg);

a_rgb_data_video_on:assert property(prop_rgb_data_video_on);
c_rgb_data_video_on:cover property(prop_rgb_data_video_on);

a_video_on_pos:assert property(prop_video_on_pos);
c_video_on_pos:cover property(prop_video_on_pos);

endmodule