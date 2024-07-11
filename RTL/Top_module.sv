`timescale 10ps/1ps

module Top_module;
    
    bit clk;

    initial begin
        forever begin
        #1 clk=  ~clk;
        end
    end

    intf_VGA INTF(clk);
    VGA_TOP DUT(INTF.DUT);
    VGA_Test TEST(INTF.TEST);

    bind VGA_TOP vga_assertions VGA_ASSER(INTF.DUT);

endmodule