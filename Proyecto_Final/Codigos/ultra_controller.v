//==========================================================================
// Modulo de control de un sensor ultrasonico HC-SR04
//==========================================================================

module ultra_controller #(
  parameter CLOCK_FREQ        = 50_000_000, //clk de la FPGA que trabaja a 50 MHz
            SOUND_SPEED       = 343, // Usado para calcular la distancia o el set point del sensor
            DETECT_CM         = 15, //distancia que queremos medir
            TRIG_US           = 10, //tiempo que se manda el trigger al sensor
            INTERVAL_MS       = 50, // cada cuanto se manda el pulso de trigger al sensor
            WAIT_TIMEOUT_US   = 30_000,
            COUNT_TIMEOUT_US  = 50_000
)(
  input  wire       clk,
  input  wire       rst,
  input  wire       echo_i,
  output reg        trigger_o,
  output reg        object_detected,
  output reg        timeout_error
);

  // clock-cycle counts
  localparam integer TRIG_CYCLES         = (CLOCK_FREQ/1_000_000) * TRIG_US; //ciclos necesarios para mantener el trigger en ¨1¨
  localparam integer INTERVAL_CYCLES     = (CLOCK_FREQ/1_000)     * INTERVAL_MS; //ciclos entre cada disparo del trigger 
  localparam integer WAIT_TIMEOUT_CYCLES = (CLOCK_FREQ/1_000_000) * WAIT_TIMEOUT_US; //ciclos que espera la FPGA antes de que llege el primer posedge de echo
  localparam integer COUNT_TIMEOUT_CYCLES= (CLOCK_FREQ/1_000_000) * COUNT_TIMEOUT_US; // ciclos limite que espera la FPGA antes de que arroje un timeout error
  localparam integer DETECT_CYCLES       = (CLOCK_FREQ * DETECT_CM * 2)/ (SOUND_SPEED * 100); // ciclos correspondientes a la distancia establecida (basicamente el set-point)

  // estados de la FSM
  localparam [1:0]
    IDLE    = 2'd0,
    PULSE   = 2'd1,
    WAIT    = 2'd2,
    MEASURE = 2'd3;

  reg [1:0]   state;
  reg [31:0]  cnt_int, cnt_trig, cnt_wait, cnt_echo, measured_echo;
  reg         echo_s0, echo_s1;
  wire        echo_rise =  echo_s0 & ~echo_s1; // detecta el flanco de subida
  wire        echo_fall = ~echo_s0 &  echo_s1; // detecta el flanco de bajada 

  always @(posedge clk or posedge rst) begin //aqui empieza la FSM 
    if (rst) begin //si rst esta en alto toda la maquina de estados esta quieta y todo queda en 0
      state           <= IDLE;
      cnt_int         <= 0;
      cnt_trig        <= 0;
      cnt_wait        <= 0;
      cnt_echo        <= 0;
      measured_echo   <= 0;
      trigger_o       <= 0;
      object_detected <= 0;
      timeout_error   <= 0;
      echo_s0         <= 0;
      echo_s1         <= 0;
    end else begin
      // sinc. echo_i
      echo_s0 <= echo_i;
      echo_s1 <= echo_s0;

      case (state)
        //---------------------------------
        IDLE: begin
          trigger_o <= 0; 
          if (cnt_int < INTERVAL_CYCLES)
            cnt_int <= cnt_int + 1;
          else begin
            cnt_int         <= 0;
            cnt_trig        <= 0;
            object_detected <= 0;
            timeout_error   <= 0;
            state           <= PULSE;
          end
        end

        //---------------------------------
        PULSE: begin
          trigger_o <= 1;
          if (cnt_trig < TRIG_CYCLES-1) // Cuenta hasta llegar al ciclo de trigger 
            cnt_trig <= cnt_trig + 1;
          else begin // cuando el contador llega  los ciclos de trigger -1 pasa al siguiente estado y resetea el contador de trigger y de wait
            cnt_trig  <= 0;
            cnt_wait  <= 0;
            trigger_o <= 0; //manda el trigger a 0 por que ya se mando la señal
            state     <= WAIT;
          end
        end

        //---------------------------------
        WAIT: begin
          if (echo_rise) begin // cuando echo_rise es 1 hace lo siguiente 
            cnt_echo <= 0; // restea echo si en dado caso tenia algun valor guardado
            state    <= MEASURE;
          end
          else if (cnt_wait < WAIT_TIMEOUT_CYCLES)
            cnt_wait <= cnt_wait + 1; //cuenta hasta los ciclos de imeout en espera
          else begin
            timeout_error <= 1; //arroja error y devuelve a IDLE, pero nunca para 
            state         <= IDLE;
          end
        end

        //---------------------------------
        MEASURE: begin
          if (echo_fall) begin // cuando ya se recibio todo pulso de echo. 
            measured_echo   <= cnt_echo; 
            object_detected <= (cnt_echo <= DETECT_CYCLES);
            state           <= IDLE;
          end
          else if (cnt_echo < COUNT_TIMEOUT_CYCLES)
            cnt_echo <= cnt_echo + 1;
          else begin
            measured_echo   <= COUNT_TIMEOUT_CYCLES;
            object_detected <= 0;
            timeout_error   <= 1;
            state           <= IDLE;
          end
        end

        default: state <= IDLE;
      endcase
    end
  end

endmodule
