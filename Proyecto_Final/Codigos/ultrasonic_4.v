//==========================================================================
// Mid-level: Instancia cuatro sensores HC-SR04 y genera 4 LEDs
//==========================================================================

module ultrasonic_4(
  input  wire        clk,
  input  wire        rst,
  input  wire [3:0]  echo_i,           // echo inputs para los 4 sensores
  output wire [3:0]  trigger_o,        // trigger outputs para los 4 sensores
  output wire [3:0]  led_detect        // 1 LED por cada sensor si detecta un objeto
);

  genvar i; // genera la variable i 
  generate
    for (i = 0; i < 4; i = i + 1) begin : U_SENSOR
      wire obj_det;
      wire to_err;

      ultra_controller #(
        .CLOCK_FREQ      (50_000_000),
        .SOUND_SPEED     (343),
        .DETECT_CM       (15),
        .TRIG_US         (10),
        .INTERVAL_MS     (50),
        .WAIT_TIMEOUT_US (30_000),
        .COUNT_TIMEOUT_US(50_000)
      ) u_ultra (
        .clk             (clk),
        .rst             (rst),
        .echo_i          (echo_i[i]),
        .trigger_o       (trigger_o[i]),
        .object_detected (obj_det),
        .timeout_error   (to_err)
      );

      // Mapea el led a object_detected
      assign led_detect[i] = obj_det;
    end
  endgenerate

endmodule
