package vga_pkg;

class vga_class; 

    rand bit rst_n;
    rand bit [11:0] data_stream;
    bit [11:0] rgb_data;
    randc bit [3:0] one_color;
    bit [11:0] arr_red[15],arr_green[15],arr_blue[15];
    rand bit [11:0] red,green,blue;

    function new();

        this.cov_rgb=new();
        foreach (arr_red[i]) begin
            arr_red[i]={i+1,{8'b0}};
            arr_green[i]={{4'b0},i+1,{4'b0}};
            arr_blue[i]={{8'b0},i+1};
        end
    endfunction

    constraint c_rst_n{rst_n dist{0:=1,1:=199};}
    constraint c_data_stream{
                    data_stream dist{
                    12'b0:=1,                                      // all are off (black)
                    12'b1111_1111_1111:=1,                          // all are on (white)
                    red:=2,
                    green:=2,
                    blue:=2,
                    [12'b0000_0001_0001:12'b0000_1111_1111]:/20,      // green and blue
                    [12'b0001_0000_0001:12'b0001_0000_1111]:/20,      // red and blue
                    [12'b0001_0000_0001:12'b1111_1111_1111]:/90      // red, green and blue
                    };                                              

                red inside{arr_red};
                green inside{arr_green};
                blue inside {arr_blue};
                    
                    }                         
                    


   covergroup  cov_rgb;

    coverpoint this.rgb_data iff(rst_n){
        bins bin_rgb[]={[0:12'b1111_1111_1111]};

    option.auto_bin_max= 12'b1111_1111_1111;

    }

    
    
    endgroup

endclass 

endpackage