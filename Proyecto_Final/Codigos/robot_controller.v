module robot_controller (
    input  wire        clk,
    input  wire        rst,
    input  wire        switch,
    input  wire [3:0]  echo_i,
    output wire [3:0]  trigger_o,
    output wire [3:0]  led_detect,
    output wire [3:0]  movement_sel,
    output wire [7:0]  sel_protected
);

    //====================================================
    // 1) FSM básica con dos estados: IDLE y WORK
    //====================================================
    parameter IDLE = 1'b0;
    parameter WORK = 1'b1;

    reg state;

    always @(posedge clk or posedge rst) begin
        if (rst) // si rst es 1 el estado es IDLE
            state <= IDLE;
        else begin
            case (state)
                IDLE: begin
                    if (switch == 1'b0) // cuando la FPGA recibe un 0 del switch hace el trabajo
                        state <= WORK;
                    else
                        state <= IDLE;
                end
                WORK: begin
                    if (switch == 1'b1)
                        state <= IDLE;
                    else
                        state <= WORK;
                end
                default: state <= IDLE;
            endcase
        end
    end

    //====================================================
    // 2) Señales internas
    //====================================================
    wire [3:0] trigger_o_internal;
    wire [3:0] led_detect_internal;
    wire [3:0] movement_sel_internal;
    wire [7:0] sel_protected_internal;

    // Módulos funcionales instanciados
    ultrasonic_4 u_ultra4 (
        .clk        (clk),
        .rst        (rst),
        .echo_i     (echo_i),
        .trigger_o  (trigger_o_internal),
        .led_detect (led_detect_internal)
    );

    algorithmic_machine u_fsm_motor_mov (
        .clk           (clk),
        .rst           (rst),
        .sensor        (led_detect_internal),
        .movement_sel  (movement_sel_internal)
    );

    general_controller u_ctrl_mov (
        .clk           (clk),
        .rst           (rst),
        .movement_sel  (movement_sel_internal),
        .sel_protected (sel_protected_internal)
    );

    //=========================================================================================================================
    // 3) Salidas condicionadas por FSM, compara si la FSM esta en work o no y dependiendo de eso manda 0  a todas las salidas
    //=========================================================================================================================
    assign trigger_o     = (state == WORK) ? trigger_o_internal     : 4'b0000;
    assign led_detect    = (state == WORK) ? led_detect_internal    : 4'b0000;
    assign movement_sel  = (state == WORK) ? movement_sel_internal  : 4'b0000;
    assign sel_protected = (state == WORK) ? sel_protected_internal : 8'b00000000;

endmodule
