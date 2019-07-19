# Time series

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


## Clasificación descriptiva de las series temporales 

Las series temporales se pueden clasificar en:

### Estacionarias

Una serie es estacionaria cuando es estable a lo largo del tiempo, es decir, cuando la media y varianza son constantes en el tiempo. Esto se refleja gráficamente en que los valores de la serie tienden a oscilar alrededor de una media constante y la variabilidad con respecto a esa media también permanece constante en el tiempo.

Un proceso estocástico se dice que es estacionario si

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
