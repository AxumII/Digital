# Primer laboratorio tecnologia  TTL

## Integrantes

### Jairo David Diaz Luna

### Juan Angel Pinzon Lopez

## metodologia

Para esta practica se uso la  compuerta SN74LS00N, Osciloscopio , Generador de señales, un multimetro y una fuente de alimentacion DC a 5V para alimentar la compuerta.

<div align="center">
<img src="/Lab01/Imagenes/Pin_out_SN74LS00N.jpg" alt ="pin out" width = "200px" height = "auto"/>
</div>

Se uso el siguiente circuito en la protoboard

<div align="center">
<img src="/Lab01/Imagenes/Circuito_en_la_protoboard.jpg" alt="Montaje" width = "auto" height = "200px"/>
</div>

## Resultados

### primera parte

1. A continuacion se listan las diferentes especificaciones tecnicas de la compuerta

    * El V<sub>CC</sub> Para la compuerta es de minimo 4.75 V y maximo 5.25 V
    * El V<sub>IH</sub> debe ser de minimo 2 V
    * El V<sub>IL</sub> debe ser de maximo 0.8 V
    * La corriente de salida en alto (I<sub>OH</sub>) de ser de -0.4 mA
    * I<sub>OL</sub> ha de ser maximo 8 mA
    * El V<sub>OH</sub> el minimo es de 2.5V y el TYP de 3.4V
    * El V<sub>OL</sub> debe ser maximo de 0.4 V
    * La I<sub>I</sub> debe ser de maximo 0.1 mA
    * I<sub>IH</sub> debe ser de maximo 20 $\mu$ A
    * I<sub>IL</sub> debe ser de minimo -0.4 mA
    * I<sub>OS</sub> debe estar entre -20 mA y -100 mA
 
2. La funcion de transferencia obtenida de la compuerta cuando se le aplica una onda triangular de 100 Hz es:

<div align="center">
<img src="/Lab01/Imagenes/Transferencia100Hz.jpg" width = "300px" height="auto">
</div>

<div align="center">
<img src="/Lab01/Imagenes/FuncionTransferencia100Hz2.jpg" width="300px" height="auto">
</div>

3. La funcion de transferencia obtenida de la compuerta al aplicarle una onda cuadrada de frecuencia de 1 kHz es:

<div align="center">
<img src="/Lab01/Imagenes/1kHz_FT_con_carga.jpg" width = "300px" height = "auto">
</div>

<div align="center">
<img src="/Lab01/Imagenes/Transferencia1kHz_sin_carga.jpg" width = "300px" height = "auto">
</div>

4. Se obtuvo:

    * Corriente en 2 entradas

    <div align="center">
    <img src="/Lab01/Imagenes/Iin_2_compuertas.jpg" width = "auto" height = "300px">
    </div>

    * Corriente en 1 entrada

    <div align="center">
    <img src="/Lab01/Imagenes/Iin_1_compuerta.jpg" width = "auto" height = "300px">
    </div>

    * Corriente de salida en alto:

    <div align="center">
    <img src="/Lab01/Imagenes/Iout_High.jpg" width = "auto" height = "300px">
    </div>

    * Corriente de salida en bajo

    <div align="center">
    <img src="/Lab01/Imagenes/Iout_low.jpg" width = "auto" height = "300px">
    </div>

5. 

6. Se obtuvo lo siguiente:

    * Onda cuadrada a 100 Hz: 
        - Sin carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/I_100Hz.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/100Hzrise_sincarga.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/100Hz_down_sin_carga.jpg" width = "auto" height = "300px">
            </div> 

        - Con carga: 

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/I_100Hz_con_carga.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/100Hz_trise_con_carga.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/100Hz_tdown_con_carga.jpg" width = "auto" height = "300px">
            </div> 

    * Onda cuadrada a 1kHz:

        - Sin carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/1kHz_I_sin_carga.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/1kHz_ts_sin_carga.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/1kHz_tb_sin_carga.jpg" width = "auto" height = "300px">
            </div> 

        - Con carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/1kHz_I_con.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/1kHz_ts_con.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/1kHz_tb_con.jpg" width = "auto" height = "300px">
            </div> 

    * Señal cuadrada a 10 kHz:

        - Sin carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/10kHz_I_sin.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/10kHz_ts_sin.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/10kHz_Tb_sin.jpg" width = "auto" height = "300px">
            </div> 

        - Con carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/10kHz_I_con.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/10kHz_ts_con.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/10kHz_tb_con.jpg" width = "auto" height = "300px">
            </div> 

    * Señal cuadrada a 100 kHz:

        - Sin carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/100kHz_I_sin.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/100kHz_ts_sin.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/100kHz_tb_sin.jpg" width = "auto" height = "300px">
            </div> 

        - Con carga: 

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/100kHz_I_con.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/100kHz_ts_con.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/100kHz_tb_con.jpg" width = "auto" height = "300px">
            </div> 

    * Onda cuadrada a 1 MHz:

        - Sin carga: 

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/1MHz_I_sin.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/1MHz_ts_sin.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/1MHz_tb_sin.jpg" width = "auto" height = "300px">
            </div> 
        
        - Con carga:

            + Corriente:
            <div align="center">
            <img src="/Lab01/Imagenes/1MHz_I_con.jpg" width = "300px" height = "auto">
            </div>

            + Tiempo de subida:
            <div align="center">
            <img src="/Lab01/Imagenes/1MHz_ts_con.jpg" width = "auto" height = "300px">
            </div>
            
            + Tiempo de bajada:
            <div align="center">
            <img src="/Lab01/Imagenes/1MHz_tb_con.jpg" width = "auto" height = "300px">
            </div> 

