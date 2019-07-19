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
