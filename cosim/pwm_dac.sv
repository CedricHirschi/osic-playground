`timescale 1ns/1ps

module pwm_dac (
    input logic       clk_i,  // Clock signal
    input logic       rst_ni, // Active-low reset signal
    input logic [3:0] set_i,  // 4-bit control signal for the duty cycle

    output logic      pwm_o   // PWM output signal
);

    logic [3:0] counter_d, counter_q;

    initial begin
        $display("PWM DAC digital part started");
        $dumpfile("pwm_dac.vcd");
        $dumpvars(0, pwm_dac);
    end

    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            counter_q <= '0;
        end else begin
            counter_q <= counter_d;
        end
    end

    always_comb begin
        if (!rst_ni) begin
            counter_d = '0;
        end else begin
            counter_d = counter_q + 1;
        end
    end

    assign pwm_o = (counter_q < set_i) ? 1'b1 : 1'b0;

endmodule