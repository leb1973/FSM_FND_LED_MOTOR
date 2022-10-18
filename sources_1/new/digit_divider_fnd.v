`timescale 1ns / 1ps



module digit_divider_fnd(
    input [13:0] i_value,
   
    
    output [3:0] o_1,o_10,o_100,o_1000

    );

    assign o_msec_1 = i_select % 10;
    assign o_msec_10 = i_select / 10 % 10;

    assign o_sec_1 = i_sec % 10;
    assign o_sec_10 = i_sec /10 % 10; 
    
    
    
    
endmodule
