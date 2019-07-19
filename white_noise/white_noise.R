white_noise <- rnorm(1000,0.1)

plot(white_noise,type="l")
lines(1:1000,rep(1,1000),col="blue", lwd=2 ) #lineas de separación para ver varianza. 
lines(1:1000,rep(-1,1000),col="blue", lwd=2 )

acf(white_noise) # aquí estoy viendo la autocorrelación 

#acf me muestra en x=0 la correlaci´pon de la serie con respecto a sí misma
# en x=1, me muestra la correclación de la serie con ella misma menos una muestra (ya no me sale casi correlación. )
