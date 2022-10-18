`timescale 1ns / 1ps



module motor_time_control(
    input [3:0]i_motor,
    input [3:0] i_sec_10,i_sec_1,
    input [2:0] i_select,
    output  o_motor_control
    );

    reg  r_motor_control;
    assign o_motor_control = r_motor_control;

    always @(*) begin
        if((i_sec_10 == 0) &&(i_sec_1 == 0) ) begin
            r_motor_control <= 0;
        end
        else begin
            case(i_select)
                3'd0 : r_motor_control <= 1'b0;
                3'd1 : r_motor_control <= i_motor[0];
                3'd2 : r_motor_control <= i_motor[1];
                3'd3 : r_motor_control <= i_motor[2];
                3'd4 : r_motor_control <= i_motor[3];
                default : r_motor_control <= 1'b0;
            endcase
        end

        
    end 
    



endmodule
