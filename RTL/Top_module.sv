`timescale 10ps/1ps

module Top_module;
    
    parameter data_width = 3,h_width=10,v_width=10,horiz=640,vert=480,addr_width=19;

    bit clk;

    initial begin
        forever begin
        #1 clk=  ~clk;
        end
    end

    intf_VGA #(.data_width(data_width))INTF(clk);
    VGA_TOP #(.data_width(data_width),.h_width(h_width),.v_width(v_width),.horiz(horiz),.vert(vert),.addr_width(addr_width))DUT(INTF.DUT);
    VGA_Test #(.data_width(data_width))TEST(INTF.TEST);

    bind VGA_TOP vga_assertions VGA_ASSER(INTF.DUT);

endmodule