import vga_pkg::*;

module VGA_Test(intf_VGA.TEST TB);
    
        vga_class vga_cl0;


        initial begin
            
        vga_cl0=new();
        TB.rst_n=0;
        @(negedge TB.clk);

        repeat(1000) begin
            
            assert (vga_cl0.randomize()) 
            else   $fatal("can't randomize");

            TB.rst_n=vga_cl0.rst_n;
            TB.data_stream=vga_cl0.data_stream;
            
            @(negedge TB.clk);

            vga_cl0.rgb_data=TB.rgb_data;
            vga_cl0.cov_rgb.sample();

        end     

        vga_cl0.c_rst_n.constraint_mode(0);
        TB.rst_n=1;
        repeat(900000) begin
            
            assert (vga_cl0.randomize()) 
            else   $fatal("can't randomize");

            
            TB.data_stream=vga_cl0.data_stream;
            
            @(negedge TB.clk);

            vga_cl0.rgb_data=TB.rgb_data;
            vga_cl0.cov_rgb.sample();

        end  

        $stop;
        end



endmodule