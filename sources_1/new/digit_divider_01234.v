`timescale 1ns / 1ps



module digit_divider_01234(
    input [2:0] i_select,
    output [3:0] o_select_1,o_select_10

    );

    assign o_select_1 = i_select % 10;
    assign o_select_10 = i_select / 10 % 10;


endmodule
