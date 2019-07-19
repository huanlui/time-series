# Time series

## Conceptos previos

* https://es.wikipedia.org/wiki/Autocorrelaci%C3%B3n
* https://es.wikipedia.org/wiki/Proceso_estoc%C3%A1stico

* Pvalor < 0.05 => rechazo hipótesis nula (Ho)- 
* Pvalor > 0.05 => acepto Ho. 

Esto es porque todas las hipótesis se hacen con una confianza de 95% (el 0.05=1-NC es el nivel de significancia, alpha). 

## Introducción

Series de tiempo o temporales en español. Ya no son de Machine Learning. No hay un aprendizaje. Sólo son estadísticas y fórmulas que permiten predecir a un plazo determinado. 

![serie-temporal](https://s3-ap-south-1.amazonaws.com/av-blog-media/wp-content/uploads/2018/02/train_test-768x438.png)

Ya no tengo una Y a predecir y varias X. Lo que tengo es una Y(t), donde t es tiempo e Y es la variable a predecir. 

Por tanto:

* Ya no tenemos datos supervisados ni no supervisados.
* No queremos predecir una variable que depende de otras.
* Ahora tenemos una variable que depende únicamente del tiempo.
* ¿Podemos utilizar los mismos modelos que aprendimos en los cursos anteriores?

## Definición 

Una serie tiempo es una secuencia de observaciones, medidos en determinados momentos del tiempo, ordenados cronológicamente y, espaciados entre sí de manera uniforme, así los datos usualmente son dependientes entre sí. El principal objetivo de una serie de tiempo 𝑋_𝑡  (𝑡=1,…,𝑛), es su análisis para hacer pronóstico. 

Son variables **discretas**. 

## Ejemplos de aplicación

### Economía y Marketing
* Proyecciones del empleo y desempleo.
* Evolución del índice de precios de la leche.
* Beneficios netos mensuales de cierta entidad bancaria.
* Índices del precio del petróleo.

###  Demografía
* Número de habitantes por año.
* Tasa de mortalidad infantil por año.

### Medioambiente
* Evolución horaria de niveles de óxido de azufre y de niveles de óxido de nitrógeno en una ciudad durante una serie de años.
* Lluvia recogida diariamente en una localidad.
* Temperatura media mensual.
* Medición diaria del contenido en residuos tóxicos en un río. 

## Componentes de una serie temporal

El análisis clásico de las series temporales se basa en la suposición de que los valores que toma la variable de observación es la consecuencia de tres componentes, cuya actuación conjunta da como resultado los valores medidos, estos componentes son:

### Componente tendencia

Se puede definir como un cambio a **largo plazo** que se produce en la relación al nivel medio, o el cambio a largo plazo de la media. La tendencia se identifica con un movimiento suave de la serie a largo plazo.

### Componente estacional

Muchas series temporales presentan **cierta periodicidad** o dicho de otro modo, variación de cierto período (semestral, mensual, etc.). Estos efectos son fáciles de entender y se pueden medir explícitamente o incluso se pueden eliminar de la serie de datos, a este proceso se le llama desestacionalización de la serie.

### Componente aleatoria

Esta componente **no responde a ningún patrón de comportamiento**, sino que es el resultado de factores fortuitos o aleatorios que inciden de forma aislada en una serie de tiempo

Por tanto 
> 𝑋_𝑡=𝑇_𝑡+𝐸_𝑡+𝐼_𝑡

Donde 
* 𝑇_𝑡 es la **tendencia**.
* 𝐸_𝑡 es la **componente estacional**.
* 𝐼_𝑡   es la **componente aleatoria**. 

![componentes](https://3qeqpr26caki16dnhd19sv6by6v-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/Multiplicative-Decomposition-of-Airline-Passenger-Dataset.png)

## Clasificación descriptiva de las series temporales 

Las series temporales se pueden clasificar en:

### Estacionarias

Una serie es estacionaria cuando es estable a lo largo del tiempo, es decir, cuando la media y varianza son constantes en el tiempo. Esto se refleja gráficamente en que los valores de la serie tienden a oscilar alrededor de una media constante y la variabilidad con respecto a esa media también permanece constante en el tiempo.

Un proceso estocástico (estocástico=depende del tiempo y tiene componente aleatoria) se dice que es estacionario si

𝔼[𝑋_𝑡 ]=𝔼[𝑋_(𝑡+𝑘) ]=𝜇. Media constante.

𝑉𝑎𝑟[𝑋_𝑡 ]=𝑉𝑎𝑟[𝑋_(𝑡+𝑘) ]=𝜎^2. Varianza constante

𝔼[〖(𝑋〗_𝑡−𝜇)(𝑋_(𝑡+𝑘)−𝜇)] (covarianza) no depende del tiempo


### No estacionarias

Son series en las cuales la tendencia y/o variabilidad cambian en el tiempo. Los cambios en la media determinan una tendencia a crecer o decrecer a largo plazo, por lo que la serie no oscila alrededor de un valor constante.

![media_estacionaria](https://estrategiastrading.com/wp-content/uploads/2016/12/media_estacionaria.png)
La serie de la izquierda tiene una media constante, en cambio la figura de la derecha muestra tendencia, y su media se incrementa con el paso del tiempo.

![homoscedasticidad](https://estrategiastrading.com/wp-content/uploads/2016/12/homoscedasticidad.png)
La serie de la derecha no es estacionaria, su varianza se incrementa.

![Autocovarianza](https://estrategiastrading.com/wp-content/uploads/2016/12/autocovarianza.png)

## Cross validation en series de tiempo

La cross validation la usábamos 

Cogemos una pequeña parte de la serie para entrenar y otra pequeña (contigua, claro) para testear. Pequeña porque las series temporales aciertan sobre todo en tiempos pequeños, no tiene sentido probar con test muy largo).

Luego voy aumentando el training, dejando la longitud de test igual. 

![image](https://miro.medium.com/max/736/1*5vky1z29e1iO6iOvCTBJxg.png)

Ver (https://towardsdatascience.com/time-series-nested-cross-validation-76adba623eb9)

# Modelos


## Modelo Autoregresivo AR(p)

Este modelo es muy bonito en teoría, pero no suele pasar. 

Los modelos autoregresivos se basan en la idea de que el valor actual de la serie 𝑋_𝑡, puede explicarse en función de valores pasados 𝑋_(𝑡−1),…,𝑋_(𝑡−𝑝), donde 𝑝 determina el número de retrasos necesarios para pronosticar un valor actual. El modelo autoregresivo de orden 𝑝 está dado por:

𝑋_𝑡=𝜙_0+𝜙_1 𝑋_(𝑡−1)+⋯+𝜙_𝑝 𝑋_(𝑡−𝑝)+𝜀_𝑡

Donde 𝜀_𝑡 es un ruido blanco.

Ejemplo de modelo autoregresivo de orden 2 (obviando ruido blanco):

X_(t+1) = 𝜙_1 𝑋_(t) + 𝜙_2 𝑋_(t-1)

En este caso mi coeficiente  *t+1* es 𝜙_1 vceces mi coeficiente *t* + 𝜙_2 veces mi coeficiente *t - 1*

## Modelo autoregresivo de media móvil ARMA(p,q)

Sólo aplicable paraa series de tiempo estacionarias (con media y varianza constante y covarianza no dependiente del tiempo). Es porque si me media no es constante, cuando yo haga depender mi nueva serie de valores anteriores, el modelo no va a salir bien. 

Es muy probable que una serie de tiempo 𝑋_𝑡, tenga características de AR y MA a la vez y, por consiguiente, sea ARMA. Por tanto, 𝑋_𝑡  sigue un proceso, en este proceso habrá términos autoregresivos y términos de media móvil.

𝑋_𝑡=〖𝜙_0+𝜙_1 𝑋_(𝑡−1)+⋯+𝜙_𝑝 𝑋_(𝑡−𝑝)+𝜃〗_0+
𝜃_1 𝜀_(𝑡−1)+⋯+𝜃_𝑞 𝜀_(𝑡−𝑞)+𝜀_𝑡

Donde 𝜀_𝑡 es un ruido blanco.


## Modelo autoregresivo integrado de media móvil ARIMA(p,d,q)

También funciona para no estacionarias. 

Los modelos de series de tiempo analizados hasta ahora se basan en el supuesto de estacionariedad, esto es, la media y la varianza para una serie de tiempo son constantes en el tiempo y la covarianza es invariante en el tiempo. Pero la mayoría de las series de tiempo no son estacionarias, porque pueden ir cambiando de nivel en el tiempo o sencillamente la varianza no es constante en el tiempo, a este tipo de proceso se les considera *procesos integrados*.

Por consiguiente, se debe diferenciar una serie de tiempo d veces para hacerla estacionaria y luego aplicarla a esta serie diferenciada un modelo ARMA(p,q), se dice que la serie original es ARIMA(p,d,q), es decir, una serie de tiempo autoregresiva integrada de media móvil. Donde p denota el número de términos autoregresivos, d el número de veces que la serie debe ser diferenciada para hacerla estacionaria y q el número de términos de la media móvil.

𝑋_𝑡=〖𝜙_0+𝜙_1 𝑋_(𝑡−1)^𝑑+⋯+𝜙_𝑝 𝑋_(𝑡−𝑝)^𝑑+𝜃〗_0+

𝜃_1 𝜀_(𝑡−1)^𝑑+⋯+𝜃_𝑞 𝜀_(𝑡−𝑞)^𝑑+𝜀_𝑡


La **construcción** de los modelos se lleva de manera iterativa mediante un proceso en el que se puede distinguir cuatro etapas: 

![media](/media/arima.png)

### Identificación. 

Utilizando los datos ordenados cronológicamente se intentara sugerir un modelo que merezca la pena ser investigada. El objetivo es determinar los valores que sean apropiados para reproducir la serie de tiempo. En esta etapa es posible identificar más de un modelo candidato que pueda describir la serie. 

### Estimación.

Considerando el modelo apropiado para la serie de tiempo se realiza inferencia sobre los parámetros.

### Validación.

Se realizan contraste de diagnostico para validar si el modelo seleccionado se ajusta a los datos, si no es así, escoger el próximo modelo candidato y repetir los pasos anteriores.

Se usa el AIC para ver si el modelo de serie es mejor. A menor AIC, mejor modelo de serie. 

Los residuos son la diferencia entre valor estimado y valor real. Los residuos deberían ser normales, es decir, caer en una banda. Un modelo NO ES BUENO si los residuos siguen un patrón. 

### Predicción.

Una vez seleccionado el mejor modelo candidato se pueden hacer pronósticos en términos probabilísticos de los valores futuros. 

### Existe en R una función auto-arima que te lo hace

Lo que hay detrás de esta función es esto. Lo explica porque en un TFM lo preguntó y el tío le dijo que usaba el auto arima sin saber lo que hacía dentro. 

* Se ajustan cuatro modelos iniciales:
𝐴𝑅𝐼𝑀𝐴(0,𝑑,0),
𝐴𝑅𝐼𝑀𝐴(2,𝑑,2),
𝐴𝑅𝐼𝑀𝐴(1,𝑑,0),
𝐴𝑅𝐼𝑀𝐴(0,𝑑,1).
* El mejor modelo (aquel con el AIC más pequeño) es seleccionado. Le llamaremos “modelo actual”.
* Se hacen variaciones sobre el modelo actual:
Variar 𝑝 y/o 𝑞 con valores ±1

Incluye o no la constante de 𝐴𝑅 en el modelo.

El mejor modelo considerado hasta ahora (ya sea el modelo actual o una de estas variaciones) se convierte en el nuevo modelo actual.

* Se repite el paso 2 (c) hasta que no se pueda encontrar un AIC inferior.

### Contraste de hipótesis

Estacionariedad de Dickey-Fuller.

* H0: Los residuales del modelo ARIMA son estacionarios
* Ha: Los residuales del modelo ARIMA no son estacionarios

Prueba de independencia de los residuales (Box-Pierce test).

* H0: Los residuales del modelo ARIMA son independientes.
* Ha: Los residuales del modelo ARIMA no son independientes. 

## Exponential smoothing

En el modelo autoregresivo, todas las observaciones tienen el mismo peso. Pero puede ser más sensato agregar un mayor peso a las observaciones más recientes que a las observaciones más viejas. Este es exactamente el concepto detrás del simple exponencial smoothing.

𝑋_(𝑡+1)=𝛼𝑥_𝑡  +𝛼(1−𝛼) 𝑥_(𝑡−1 )+𝛼(1−𝛼)^2  𝑥_(𝑡−2)+⋯

Donde 0≤𝛼≤1 es el parámetro de suavizado.

## Holt-Winters

Lo que hace es aplicar el exponential smoothing de las tres componentes T, E e I. 

El método de Holt-Winters comprende la ecuación de pronóstico y tres ecuaciones de suavizado (similar a exponencial smoothing): una para el nivel, otra para la tendencia y otra para el componente estacional, con los correspondientes parámetros de suavizado. Usamos 𝑚 para denotar la frecuencia de la estacionalidad, es decir, el número de estaciones en un año. Por ejemplo, para datos trimestrales 𝑚=4, para datos mensuales 𝑚=12.

### Aditivo

![aditivo](wintersAditivo.PNG)

### Multiplicativo

![aditivo](wintersMultiplicativo.PNG)
