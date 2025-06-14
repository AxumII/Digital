module demux_signals_4 (
    input wire clk,           // Reloj del sistema (por ejemplo, 50 MHz)
    output reg ch0,           // Salida 0: siempre 0
    output reg ch1,           // Salida 1: pulso 1 Hz
    output reg ch2,           // Salida 2: pulso 10 Hz
    output reg ch3            // Salida 3: siempre 1
);

    parameter CLK_FREQ = 50000000; // Frecuencia del reloj en Hz

    reg pulse_1hz = 0;
    reg pulse_10hz = 0;

    reg [25:0] counter_1hz = 0;
    reg [23:0] counter_10hz = 0;

    // Generador de pulso de 1Hz
    always @(posedge clk) begin
        if (counter_1hz >= (CLK_FREQ/2)-1) begin
            pulse_1hz <= ~pulse_1hz;
            counter_1hz <= 0;
        end else begin
            counter_1hz <= counter_1hz + 1;
        end
    end

    // Generador de pulso de 10Hz
    always @(posedge clk) begin
        if (counter_10hz >= (CLK_FREQ/20)-1) begin
            pulse_10hz <= ~pulse_10hz;
            counter_10hz <= 0;
        end else begin
            counter_10hz <= counter_10hz + 1;
        end
    end

    // Asignación de salidas
    always @(*) begin
        ch0 = 1'b0;         // Canal 0: siempre 0
        ch1 = pulse_1hz;    // Canal 1: pulso de 1 Hz
        ch2 = pulse_10hz;   // Canal 2: pulso de 10 Hz
        ch3 = 1'b1;         // Canal 3: siempre 1
    end

endmodule
