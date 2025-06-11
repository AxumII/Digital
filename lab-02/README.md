# Segunda practica de laboratorio CMOS

## Integrantes

### Jairo David Diaz Luna

### Juan Angel Pinzon Lopez

### Erick Hosbany Calvache Pacheco
# Práctica 2 - Laboratorio CMOS: Compuertas NAND CD4011B y HF4001

Este informe documenta la segunda práctica de laboratorio de Electrónica Digital, centrada en la caracterización de compuertas NAND CMOS (CD4011B y HF4001), comparándolas con la compuerta TTL 74LS00. Se evaluaron parámetros como la función de transferencia, los tiempos de conmutación, la sensibilidad a entradas flotantes y el consumo de potencia a diferentes frecuencias.

---

## 1. Introducción

La práctica tuvo como objetivo caracterizar el comportamiento de las compuertas lógicas NAND CMOS CD4011B y HF4001, bajo diversas condiciones de alimentación y frecuencia. Se realizaron mediciones de:
- Funciones de transferencia.
- Tiempos de subida, bajada y retardo.
- Potencia consumida.
- Comportamiento con entradas no conectadas.

Los resultados se compararon con la tecnología TTL (compuerta 74LS00) usando datos del informe "Electrónica Digital I".

---

## 2. Compuerta CD4011B

### 2.1 Pin al aire
Se observó el comportamiento de la entrada al dejarla desconectada, con un cable de 10 cm. Esta prueba permitió detectar la sensibilidad a ruidos o interferencias electromagnéticas, comunes cuando una entrada no está forzada a un potencial definido.

### 2.2 Función de Transferencia
Se obtuvo con una alimentación de 5V, y se visualizó mediante un osciloscopio:

![Función de Transferencia CD4011B](informe/imagenes/transferencia_cd4011b.png)

- **CH1 (amarillo)**: Señal de entrada, T = 1ms, F = 1kHz, Vpp = 4.96V
- **CH2 (azul)**: Señal de salida, Vpp = 5.04V, Vr = 2.47V
- **Relación de fase**: 4.398 rad (252°)

El modo XY muestra una curva que representa la relación entre la entrada y la salida.

### 2.3 Tabla de Verdad

| Entrada A | Entrada B | Salida Y |
|-----------|-----------|-----------|
| 0         | 0         | 1         |
| 0         | 1         | 1         |
| 1         | 0         | 1         |
| 1         | 1         | 0         |

### 2.4 Tiempos de Conmutación
Se usaron ondas cuadradas a distintas frecuencias y se midieron los siguientes parámetros:
- Tiempos de subida (Tsubida)
- Tiempos de bajada (Tbajada)
- Retardos de propagación (Tretardo)

### 2.5 Potencia Consumida a Diferentes Frecuencias

![Potencia CD4011B](informe/imagenes/potencia_cd4011b.png)

| Frecuencia [Hz] | Tsubida [ns] | Tbajada [ns] | Tretardo [ns] | Corriente [A] | Potencia [W] |
|-----------------|---------------|---------------|----------------|----------------|----------------|
| 10              | ind           | 30            | 0              | 0.005          | 0              |
| 100             | 148           | 91            | 43             | 0.00293        | 0.01465        |
| 1000            | 154           | 97            | 48             | 0.00241        | 0.01205        |
| 10000           | 164           | 102           | 49             | 0.00175        | 0.00875        |
| 100000          | 174           | 108           | 60             | 0.00006        | 0.0003         |

La corriente disminuye con la frecuencia, lo cual es coherente con el comportamiento dinámico de las compuertas CMOS.

---

## 3. Compuerta HF4001

### 3.1 Función de Transferencia

![Transferencia HF4001](informe/imagenes/transferencia_hf4001.png)

- **Entrada (CH1)**: Escala 2.00V
- **Salida (CH2)**: Vpp = 5.44V, periodo = 1.00ms, Vmedio = 2.72V
- **Frecuencia medida**: 999.997 Hz

### 3.2 Señales de Entrada y Salida

![Señales HF4001](informe/imagenes/señales_hf4001.png)

- CH1 (Entrada): Escala 2.00V
- CH2 (Salida): Mismo comportamiento que la función de transferencia

### 3.3 Potencia Consumida

![Potencia HF4001](informe/imagenes/potencia_hf4001.png)

| Frecuencia [Hz] | Tensión [V] | Corriente [A] | Potencia [W] |
|-----------------|-------------|----------------|----------------|
| 1               | 5           | 0.002          | 0.01           |
| 10              | 5           | 0.0007         | 0.0035         |
| 100             | 5           | 0.0005         | 0.0025         |
| 1000            | 5           | 0.00025        | 0.00125        |
| 10000           | 5           | 0.00016        | 0.0008         |

---

## 4. Comparación con Compuerta TTL 74LS00

### 4.1 Niveles Lógicos y Márgenes de Ruido
**Según el informe "Electrónica Digital I":**

- VIH (min): 2.0V
- VIL (max): 0.8V
- VOH (min): 2.7V (típico: 3.5V)
- VOL (max): 0.4V (típico: 0.25V)

Márgenes de ruido:
- Alto: 2.7V - 2.0V = 0.7V
- Bajo: 0.8V - 0.4V = 0.4V

Las compuertas CMOS, aunque no se listaron sus valores exactos, suelen tener márgenes de ruido superiores.

### 4.2 Consumo de Potencia
**TTL 74LS00:**
- Output HIGH: hasta 1.6 mA
- Output LOW: hasta 4.4 mA

**CMOS CD4011B y HF4001:**
- Disminuyen su consumo con el aumento de frecuencia, comportamiento algo atípico considerando que la potencia dinámica debería aumentar. Esto podría atribuirse a las condiciones del experimento o instrumentos utilizados.

### 4.3 Velocidad de Conmutación
**TTL 74LS00:**
- tPLH: típico 9 ns, máx. 15 ns
- tPHL: típico 10 ns, máx. 15 ns

**CMOS CD4011B:**
- Tsubida: 148 - 174 ns
- Tbajada: 91 - 108 ns
- Tretardo: 30 - 60 ns

Los tiempos son significativamente mayores en CMOS 4000 comparado con TTL LS, lo que confirma que son tecnologías más lentas.

---

## 5. Conclusiones

- Las compuertas CMOS como la CD4011B y HF4001 presentan bajo consumo de energía y buena inmunidad al ruido.
- Las compuertas TTL (74LS00) ofrecen mayor velocidad a costa de un mayor consumo.
- El comportamiento anómalo en el consumo descendente con la frecuencia en CMOS podría ser explicado por el entorno de laboratorio o las condiciones de medición.
- La selección entre CMOS y TTL depende del requerimiento entre velocidad, consumo y robustez.

---

> Informe realizado como parte del curso de Electrónica Digital I  
> Universidad Nacional de Colombia - Junio 2025
