#LIBRERIA CLIMATOL#

# Instalamos CLIMATOL
install.packages("maps")
install.packages("climatol", dependencies = T)
library(climatol)

# NIVEL I

# 1. Generar un diagrama de Walter y Lieth con la data de datcli, este debe llevar
#    de título “Estación Campo de Marte”, a una altitud de 80 msnm durante el año 2017, 
#    con los meses simbolizados por números. Las temperaturas deberán visualizarse de 
#    color verde; las precipitaciones, en naranja; los meses de congelación segura, en 
#    azul y los de congelación probable, en celeste. No trazar una línea suplementaria
#    de precipitación.

# Usando diagwl

data(datcli) # Llamamos a la data

# Ploteando el diagrama de Walter y Lieth

diagwl(datcli, # Nombre de la data
       "Estación Campo de Marte", # Titulo
       80, # Altitud de la estacion climatologica 
       "Año 2017", # Periodo en la que se calculo los promedios
       mlab = "xd", # Etiquetas para los meses en el eje x, ingles: 'en', español: 'es', numerico: 'xd' 
       pcol = "orange", # Color para la precipitacion 
       tcol = "green",  # Color para la temperatura
       pfcol="light blue", # Color de relleno para las heladas probables
       sfcol = "blue", # Color de relleno para las heladas seguras
       shem = F, # Del hemisfeio, Sur: 'T', Norte: 'F'
       p3line = F # Dibujar una linea de precipitacion suplementaria
       )

# 2. Recrea minuciosamente el siguiente diagrama de la rosa de los vientos 
#    (pista: col=rainbow(8)).

# Generamos un nuevo directorio para que no se mezclen los archivos generados 

setwd("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 2")

# Usando rosavent

data(windfr) # Llamamos a la data 

# Ploteamos una rosa de los vientos:

rosavent(windfr, # Marco de datos que contiene la frecuencia del viento 
         fnum = 6, # Numero de circulos de refencia a trazar 
         fint = 2, # Pasos de frecunecia entre circulos 
         flab = 1, # Parametro que indica que circulos deben etiquetarce, Solo Ext: '1', Todo: '2'
         ang = 3*pi/8,# Angulo a lo largo del cual se etiquetaran los circulos 
         col = rainbow(8), # Color para rellenar los poligonos de la frecuencia 
         uni = "km/s" # Unidades de la velocidad para el encabezado de la viñeta
         )

# Nivel II

# 3. Convertir la data diaria de tmax en una data de medias mensuales. 
#    Posteriormente, homogeneizar dichos datos mensuales con una normalización por 
#    estandarización y gráficos de medias anuales y correcciones aplicadas en el análisis
#    exploratorio de datos (utilizar dos decimales).

# Generamos un nuevo directorio para que no se mezclen los archivos generados 

setwd("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 3")

# Para este caso usaremos 'dd2m' para calcular los datos mensuales apartir de datos diarios

data(tmax) # Llamamos a la data 

# Exportamos archivos del database de R a nuestro equipo:

write.table(dat, # Nuestra data 
            'Tmax_2001-2003.dat', # Nombre del archivo 
            row.names = F, # Nombre de las filas
            col.names = F # Nombre de las columnas
            )

write.table(est.c, # Nuestra data 
            'Tmax_2001-2003.est', 
            row.names = F, 
            col.names = F 
            )

# Convertimos el database (.dat) diario a mensual:

dd2m('Tmax', # Acronimo de la variable climatica 
     2001, 2003, # Año inicial y final de los datos presentes 
     ndec = 2, # Numero de decimales 
     valm = 2 # Valor mensual a calcular, Suma: '1', Media: '2', Maximo: '3', Minimo: '4'
     )

# Leemos la tabla y lo nombramos

Tmax_m <- read.table('Tmax-m_2001-2003.dat', 
                      header = FALSE)

# Por ultimo usaremos 'homogen' es la encargada de homogenizar una serie climatologias de temperaturas diarias:

homogen('Tmax', # Variable
        2001, 2003, # Año inicial y final
        nm = 0, # Como era diararia = 0 
        std = 2, # Tipo de estandirizacion, si queremos que al dato se le divida por su media
        ndec = 2, # Numero de decimales
        gp = 3, # Parametro Grafico 
        expl = TRUE # Si queremos que haga un analicis exploratorio 
        )

# 4. Recortar la data mensual de Ptest desde 1965 hasta 2005. Homogeneizar dicha data mediante 
#    clústers o áreas rectangulares, con un ancho de superposición de 0, mediante una estandarización
#    y con gráficos de totales anuales en el análisis exploratorio de datos. Mostrar las medias 
#    de las series homogeneizadas en un archivo Excel que, además, mencione los totales anuales y 
#    los datos de la latitud, longitud y nombre de cada estación (utilizar dos decimales).

# Generamos un nuevo directorio para que no se mezclen los archivos generados 

setwd("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 4 y 5")

# Homogenizamos una serie climatologica de precipitacion (1951-2010):

data(Ptest)

# Exportamos archivos del database de R a nuestro equipo:

write.table(dat,
            'Ptest_1951-2010.dat',
            row.names = F,
            col.names = F
            )

write.table(est.c,
            'Ptest_1951-2010.est',
            row.names = F,
            col.names = F
            )

# Recortamos el database (.dat) de 1951-2010 a 1965-2005, para este caso usaremos 'datsubset' 

datsubset('Ptest', 
          1951, 2010, # Lo que tenemos 
          1965, 2005,  # Lo que queremos
          1 # Numero minimo de años con datos 
          )

# Por ultimo usaremos 'homogsplit' para homogenizar una serie climatologica mensual por clusters:

homogsplit('Ptest', 1965, 2005,
           2, 39, # Coordenadas 
           0, 0, # Superposicion de las medianas y las paralelas 
           std = 3, # Analices de estanderizacion, que reste la media y lo divida entre la estaderizacion estandar 
           nm = 12, # numeros de meses 12
           ndec = 2, # Numero de decimales
           gp = 4, # Parametro Grafico 
           expl=TRUE
           )

# Hallamos la serie homogenizada de precipitacion:

dahstat('Ptest', 1965, 2005, stat="me", ndc=3, vala=1, estcol=c(1,2,5))

# Nivel III

# 5. Con la data homogenizada del ejercicio anterior (si no se ha realizado, iniciar homogeneizando tal cual
#    se menciona en el ejercicio 4) plotear un gráfico de calor con las medias de precipitación mensual de
#    acuerdo con la latitud y longitud, este debe abarcar desde el punto 2.1°E 39.1°N hasta el punto 3.5°E
#    40°N, con una separación de 0.001 entre líneas. 

#    Además, debe tener un título principal y etiquetado en
#    ambos ejes. Adicionalmente, plotear un mapa de la zona del mundo en cuestión encima de dicho gráfico
#    (use col=rainbow(100)).



# Con el database homogenizado creamos un archivo grillado usando `dahgrid`

grilla<-expand.grid(x=seq(2.1,3.5,0.001),y=seq(39.1,40,0.001))
library(sp)
coordinates(grilla)<-~ x+y
dahgrid('Ptest', 1965, 2005, grid=grilla)

# Medias diarias de precipitacion homogenizada:

library(ncdf4)
nc_med <- nc_open("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 4 y 5/Ptest_1965-2005_m.nc")
print(nc_med)
precp <- ncvar_get(nc_med,'Ptest.m') 
lati <- ncvar_get(nc_med,'lat')
lati <- rev(lati)
longi <- ncvar_get(nc_med,'lon')
dims_variable <- dim(precp)
library(fields)
image.plot(longi,lati,precp[,length(lati):1], main = paste("Medias de precipitacion diaria"), xlab = 'Longitud',ylab = 'Latitud', col = rainbow(100))

# Ploteamo un mapa de la zona del mundo 

library(maps)
map("world", add=T)





