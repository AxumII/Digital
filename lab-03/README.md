# Tercera Práctica de Laboratorio - Verilog en FPGA

## Integrantes

- Jairo David Diaz Luna
- Juan Angel Pinzon Lopez
- Erick Hosbany Calvache Pacheco

---

## Descripción General

En esta práctica se desarrollaron, simularon e implementaron en FPGA varios circuitos combinacionales fundamentales usando el lenguaje Verilog, comprobando su funcionamiento tanto en simulación como en hardware real.  
El objetivo es reforzar el diseño digital básico, la síntesis en FPGA y la interpretación de resultados experimentales en laboratorio.

---

## Módulos Implementados

### 1. Comparador de Dos Bits

**Descripción:**  
El comparador recibe dos números de 2 bits (A y B) y entrega tres salidas:  
- Una se activa si A > B  
- Otra si A < B  
- Otra si A = B  

Esto permite distinguir de manera sencilla la relación entre dos valores binarios.

**Código fuente:** [`comparador_2_bits.v`](./comparador_2_bits.v)

**Evidencia experimental:**  
Se realizaron pruebas variando las entradas para obtener todas las posibles salidas.  
| Caso  | Imagen                                    |
|-------|-------------------------------------------|
| A = B | ![A = B](Imagenes/comparador_AB_igual.jpg) |
| A > B | ![A > B](Imagenes/comparador_A_mayor_B.jpg) |
| A < B | ![A < B](Imagenes/comparador_A_menor_B.jpg) |

---

### 2. Medio Sumador (Half Adder)

**Descripción:**  
Circuito que suma dos bits de entrada (A, B) y produce dos salidas:  
- Suma (S)  
- Acarreo (C)

Es la base de cualquier sumador binario.

**Código fuente:** [`Half_adder.v`](./Half_adder.v)

**Evidencia experimental:**  
Pruebas para ambos posibles casos en los que la suma es 1:
| Entradas   | Imagen                                 |
|------------|----------------------------------------|
| A=0, B=0   | ![A=0, B=0](Imagenes/half_adder_00.jpg) |
| A=1, B=0 o A=0, B=1 | ![A=1 o B=1](Imagenes/half_adder_01.jpg) |
| A=1, B=1   | ![A=1, B=1](Imagenes/half_adder_11.jpg) |

---

### 3. Sumador Completo (Full Adder)

**Descripción:**  
Circuito que suma tres bits (A, B, Cin), produciendo la suma y el acarreo de salida (Cout).  
Es fundamental para construir sumadores de más de un bit.

**Código fuente:** [`full_adder.v`](./full_adder.v)

**Evidencia experimental:**  
Se muestran ejemplos de funcionamiento con distintas combinaciones de entrada:

| A | B | Cin | Imagen                                  |
|---|---|-----|-----------------------------------------|
| 0 | 0 | 0   | ![000](Imagenes/full_adder_000.jpg)     |
| 0 | 0 | 1   | ![001](Imagenes/full_adder_001.jpg)     |
| 0 | 1 | 0   | ![010](Imagenes/full_adder_01X.jpg)     |
| 1 | 1 | 1   | ![111](Imagenes/full_adder_111.jpg)     |

---

### 4. Inversor en Anillo

**Descripción:**  
El inversor en anillo es un circuito oscilador formado por un número impar de inversores.  
Se implementó y midió tanto con compuertas TTL físicas (hardware) como con la FPGA usando Verilog.

**Código fuente:** [`anillo.v`](./anillo.v)

**Evidencia experimental:**  
| Implementación       | Imagen                                 |
|---------------------|----------------------------------------|
| TTL (osciloscopio)  | ![TTL](Imagenes/inversor_anillo_ttl.jpg) |

---

## Desarrollo y Metodología

- Todos los módulos fueron descritos en Verilog, simulados para verificar su funcionamiento lógico y posteriormente sintetizados en una FPGA.
- Se conectaron los circuitos a interruptores y leds, y se midieron las salidas con instrumentos del laboratorio, incluyendo osciloscopio para el inversor en anillo.
- Las fotos documentan los estados reales observados en la placa, validando la correcta implementación.

---

## Simulación

Para simular cualquiera de los módulos usando Icarus Verilog (ejemplo):

```sh
iverilog -o modulo_tb modulo_tb.v modulo.v
vvp modulo_tb
