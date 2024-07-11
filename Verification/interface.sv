//`timescale 100 ps/10ps
interface intf_VGA #(parameter data_width=12)(input bit clk);
    
    logic rst_n;
    logic [data_width-1:0]rgb_data;
	logic  h_sync,v_sync,video_on;
    logic  [data_width-1:0]data_stream;

    /*clocking cb @(posedge clk);

    default input #4ps output #4ps;

    input clk,h_sync,v_sync,video_on,rgb_data;
    output rst_n,data_stream;

    endclocking*/
    
    modport TEST (input clk,h_sync,v_sync,video_on,rgb_data,
    output rst_n,data_stream);
    
    modport DUT (
    input clk,rst_n,data_stream,
    output h_sync,v_sync,video_on,rgb_data
    );

endinterface 