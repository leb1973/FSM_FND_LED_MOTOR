`timescale 1ns / 1ps


module Top(
    input i_clk,
    input i_reset,
    input i_modeSW,
    input [2:0] i_fansw,
    input [4:0] i_button,
    output [3:0] o_LED,
    output o_motor,
    output [7:0] o_fndfont,
    output [3:0] o_digitposition
    );

    wire [4:0] w_button;
    wire  w_clk;
    wire w_clk_digit;
    wire [9:0] w_counter;
    wire [1:0] w_counter_digit;
    wire [3:0] w_motor;
    wire [2:0] w_lightState;
    wire [3:0] w_value;
    wire [6:0] w_sec;
    wire [6:0] w_msec;
    wire [3:0] w_sec_1,w_sec_10,w_msec_1,w_msec_10,w_select_1,w_select_10;
    wire [3:0] w_out_FND_BCD;
    wire [3:0] w_outFND,w_outBCD;
    
    
    

    clock_divider clock_divide (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk)
    );



    counter counter(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .o_counter(w_counter)
    );



    clock_divider_fnd clock_divider_fnd(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk_digit)

    );

    Time_clock_counter Time_clock_counter(
    .i_clk(w_clk_digit),
    .i_reset(i_reset),
    .i_fantime(i_fansw),
    .o_sec(w_sec),
    .o_msec(w_msec)
    
    );

    digit_divider_fnd digit_divider_fnd(
    .i_sec(w_sec),
    .i_msec(w_msec),
    .o_sec_1(w_sec_1),
    .o_sec_10(w_sec_10),
    .o_msec_1(w_msec_1),
    .o_msec_10(w_msec_10)
    );

    digit_divider_01234 digit_divider_01234(
    .i_select(w_lightState),
    .o_select_1(w_select_1),
    .o_select_10(w_select_10)

    );

    Mux_2x1_01234 Mux_2x1_01234(
    .i_select_1(w_select_1),
    .i_select_10(w_select_10),
    .i_counter_Mux(w_counter_digit),
    .o_outBCD(w_outBCD)
    );

    Mux_fnd Mux_fnd(
    .i_sec_1(w_sec_1),
    .i_sec_10(w_sec_10),
    .i_msec_1(w_msec_1),
    .i_msec_10(w_msec_10),
    .i_sel(w_counter_digit),
    .o_outFND(w_outFND)
    );

    counter_digit counter_digit(
    .i_clk(w_clk_digit),
    .i_reset(i_reset),
    .o_counter(w_counter_digit)
    );

    decoder_digit decoder_digit(
    .i_digitsel(w_counter_digit),
    .o_outdigit(o_digitposition)
    );


    

    comparator Compare(
    .i_counter(w_counter),
    .o_motor_1(w_motor[0]),
    .o_motor_2(w_motor[1]),
    .o_motor_3(w_motor[2]),
    .o_motor_4(w_motor[3])

    );

    motor_time_control motor_time_control(
    .i_motor(w_motor),
    .i_sec_1(w_sec_1),
    .i_sec_10(w_sec_10),
    .i_select(w_lightState),
    .o_motor_control(o_motor)
    );

    buttoncontroller ButtonController0 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[0]),
    .o_button(w_button[0])
    );


    buttoncontroller ButtonController1 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[1]),
    .o_button(w_button[1])
    );

    

    buttoncontroller ButtonController2 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[2]),
    .o_button(w_button[2])
    );

    buttoncontroller ButtonController3 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[3]),
    .o_button(w_button[3])
    );

    buttoncontroller ButtonController4 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[4]),
    .o_button(w_button[4])
    );

    FSM_LED FSM_LED(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_lightState(w_lightState)
    );

    Mux_2x1 Mux_2x1(
    .i_outFND(w_outFND),
    .i_outBCD(w_outBCD),
    .i_modeSW(i_modeSW),
    .o_out_FND_BCD(w_out_FND_BCD)
    );
    

    BCDtoFND_decoder BCDtoFND_decoder(
    .i_value(w_out_FND_BCD),
    .o_font(o_fndfont)
    );

   

    decoder_2x4 decoder_2x4(
    .i_digitSelect(w_lightState),
    .o_digit(o_LED)

    ); 

   

    
    

    // Mux Mux(
    // .i_x(w_motor_control),
    // .i_select(w_lightState),
    // .o_y(o_motor) 
    // );
    


    
endmodule
