PROGRAMACION - TAREA 5
================
CALDAS MORALES, Fernando James D. \|
30/01/2022

# LIBRERIA CLIMATOL

``` r
library(climatol)
```

    ## Loading required package: maps

    ## Loading required package: mapdata

## NIVEL I

**1. Generar un diagrama de Walter y Lieth con la data de datcli, este
debe llevar de título “Estación Campo de Marte”, a una altitud de 80
msnm durante el año 2017, con los meses simbolizados por números. Las
temperaturas deberán visualizarse de color verde; las precipitaciones,
en naranja; los meses de congelación segura, en azul y los de
congelación probable, en celeste. No trazar una línea suplementaria de
precipitación.**

``` r
data(datcli) # Llamamos a la data
```

Usando diagwl, plotearemos el diagrama de Walter y Lieth

``` r
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
```

![](TAREA5_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

**2. Recrea minuciosamente el siguiente diagrama de la rosa de los
vientos (pista: col=rainbow(8)).**

``` r
data(windfr) # Llamamos a la data 
```

Usando rosavent, ploteamos una rosa de los vientos:

``` r
rosavent(windfr, # Marco de datos que contiene la frecuencia del viento 
         fnum = 6, # Numero de circulos de refencia a trazar 
         fint = 2, # Pasos de frecunecia entre circulos 
         flab = 1, # Parametro que indica que circulos deben etiquetarce, Solo Ext: '1', Todo: '2'
         ang = 3*pi/8,# Angulo a lo largo del cual se etiquetaran los circulos 
         col = rainbow(8), # Color para rellenar los poligonos de la frecuencia 
         uni = "km/s" # Unidades de la velocidad para el encabezado de la viñeta
         )
```

![](TAREA5_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

## NIVEL II

**3. Convertir la data diaria de tmax en una data de medias mensuales.
Posteriormente, homogeneizar dichos datos mensuales con una
normalización por estandarización y gráficos de medias anuales y
correcciones aplicadas en el análisis exploratorio de datos (utilizar
dos decimales). Para este caso usaremos ‘dd2m’ para calcular los datos
mensuales apartir de datos diarios**

Generamos un nuevo directorio para que no se mezclen los archivos
generados

``` r
setwd("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 3")
```

``` r
data(tmax) # Llamamos a la data 
```

Exportamos archivos del database de R a nuestro equipo:

``` r
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
```

Convertimos el database (.dat) diario a mensual:

``` r
dd2m('Tmax', # Acronimo de la variable climatica 
     2001, 2003, # Año inicial y final de los datos presentes 
     ndec = 2, # Numero de decimales 
     valm = 2 # Valor mensual a calcular, Suma: '1', Media: '2', Maximo: '3', Minimo: '4'
     )
```

    ##   1  2  3
    ## 
    ## Monthly mean values saved to file Tmax-m_2001-2003.dat 
    ##   (Months with more than 10 missing original daily data
    ##   have also been set to missing)

Leemos la tabla y lo nombramos

``` r
Tmax_m <- read.table('Tmax-m_2001-2003.dat', 
                      header = FALSE)
```

Por ultimo usaremos ‘homogen’ es la encargada de homogenizar una serie
climatologias de temperaturas diarias:

``` r
homogen('Tmax', # Variable
        2001, 2003, # Año inicial y final
        nm = 0, # Como era diararia = 0 
        std = 2, # Tipo de estandirizacion, si queremos que al dato se le divida por su media
        ndec = 2, # Numero de decimales
        gp = 3, # Parametro Grafico 
        expl = TRUE # Si queremos que haga un analicis exploratorio 
        )
```

    ## 
    ## HOMOGEN() APPLICATION OUTPUT  (From R's contributed package 'climatol' 3.1.1)
    ## 
    ## =========== Homogenization of Tmax, 2001-2003. (Mon Jan 31 15:07:36 2022)
    ## 
    ## Parameters: varcli=Tmax anyi=2001 anyf=2003 suf=NA nm=0 nref=10,10,4 std=2 swa=NA ndec=2 dz.max=5 dz.min=-5 wd=0,0,100 snht1=0 snht2=0 tol=0.02 maxdif=0.005 mxdif=0.005 maxite=999 force=FALSE wz=0.001 trf=0 mndat=NA gp=3 ini=NA na.strings=NA vmin=NA vmax=NA nclust=100 cutlev=NA grdcol=#666666 mapcol=#666666 hires=TRUE expl=TRUE metad=FALSE sufbrk=m tinc=NA tz=UTC cex=1.2 verb=TRUE
    ## 
    ## Data matrix: 1095 data x 3 stations

    ## Computing inter-station distances:  1  2
    ## 
    ## 
    ## ========== STAGE 3 (Final computation of all missing data) ==========
    ## 
    ## Computing inter-station weights... (done)

    ## Computation of missing data with outlier removal
    ## (Suggested data replacements are provisional)
    ## 
    ## The following lines will have one of these formats:
    ##   Station(rank) Date: Observed -> Suggested (Anomaly, in std. devs.)
    ##   Iteration Max.data.difference (Station_code)
    ## 2 0.0388 (S03)
    ## 3 -0.0044 (S01)
    ## 
    ## Last series readjustment (please, be patient...)

    ## 
    ## ======== End of the missing data filling process, after 2.4 secs 
    ## 
    ## ----------- Final computations:
    ## 
    ## ACmx: Station maximum absolute autocorrelations of anomalies
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.490   0.510   0.530   0.520   0.535   0.540 
    ## 
    ## SNHT: Standard normal homogeneity test (on anomaly series)
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   18.00   23.45   28.90   38.47   48.70   68.50 
    ## 
    ## RMSE: Root mean squared error of the estimated data
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   3.664   3.672   3.680   3.716   3.742   3.804 
    ## 
    ## POD: Percentage of original data
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   81.00   84.50   88.00   87.33   90.50   93.00 
    ## 
    ##   ACmx SNHT RMSE POD Code Name     
    ## 1 0.54 68.5 3.7  81  S01  La Vall  
    ## 2 0.53 28.9 3.7  88  S02  Lucent   
    ## 3 0.49 18.0 3.8  93  S03  Sunflower

    ## 
    ## ----------- Generated output files: -------------------------
    ## 
    ## Tmax_2001-2003.txt :  This text output 
    ## Tmax_2001-2003_out.csv :  List of corrected outliers 
    ## Tmax_2001-2003_brk.csv :  List of corrected breaks 
    ## Tmax_2001-2003.pdf :  Diagnostic graphics 
    ## Tmax_2001-2003.rda :  Homogenization results. Postprocess with (examples):
    ##    dahstat('Tmax',2001,2003) #get averages in file Tmax_2001-2003-me.csv 
    ##    dahstat('Tmax',2001,2003,stat='tnd') #get OLS trends and their p-values 
    ##    dahgrid('Tmax',2001,2003,grid=YOURGRID) #get homogenized grids 
    ##    ... (See other options in the package documentation)

**4. Recortar la data mensual de Ptest desde 1965 hasta 2005.
Homogeneizar dicha data mediante clústers o áreas rectangulares, con un
ancho de superposición de 0, mediante una estandarización y con gráficos
de totales anuales en el análisis exploratorio de datos. Mostrar las
medias de las series homogeneizadas en un archivo Excel que, además,
mencione los totales anuales y los datos de la latitud, longitud y
nombre de cada estación (utilizar dos decimales).**

Generamos un nuevo directorio para que no se mezclen los archivos
generados

``` r
setwd("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 4 y 5")
```

Homogenizamos una serie climatologica de precipitacion (1951-2010):

``` r
data(Ptest)
```

Exportamos archivos del database de R a nuestro equipo:

``` r
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
```

Recortamos el database (.dat) de 1951-2010 a 1965-2005, para este caso
usaremos ‘datsubset’

``` r
datsubset('Ptest', 
          1951, 2010, # Lo que tenemos 
          1965, 2005,  # Lo que queremos
          1 # Numero minimo de años con datos 
          )
```

    ## Subset data written to files Ptest_1965-2005.dat and Ptest_1965-2005.est

Por ultimo usaremos ‘homogsplit’ para homogenizar una serie
climatologica mensual por clusters:

``` r
homogsplit('Ptest', 1965, 2005,
           2, 39, # Coordenadas 
           0, 0, # Superposicion de las medianas y las paralelas 
           std = 3, # Analices de estanderizacion, que reste la media y lo divida entre la estaderizacion estandar 
           nm = 12, # numeros de meses 0
           ndec = 2, # Numero de decimales
           gp = 4, # Parametro Grafico 
           expl = TRUE # Si queremos que haga un analicis exploratorio 
           )
```

    ## 
    ## HOMOGSPLIT() APPLICATION OUTPUT  (From R's contributed package 'climatol' 3.1.1)
    ## 
    ## =========== Homogenization of Ptest, 1965-2005. (Mon Jan 31 15:07:39 2022)
    ## 
    ## Parameters: varcli=Ptest anyi=1965 anyf=2005 xc=2 yc=39 xo=0 yo=0 maponly=FALSE suf=NA nm=12 nref=10,10,4 swa=NA std=3 ndec=2 dz.max=5 dz.min=-5 wd=0,0,100 snht1=25 snht2=25 tol=0.02 maxdif=NA mxdif=NA force=FALSE wz=0.001 trf=0 mndat=NA gp=4 ini=NA na.strings=NA maxite=999 vmin=NA vmax=NA nclust=100 grdcol=#666666 mapcol=#666666 hires=TRUE expl=TRUE metad=FALSE sufbrk=m tinc=NA tz=UTC cex=1.2 verb=TRUE x=NA
    ## 
    ## 
    ## ==================================================
    ## 
    ##               AREA  1 1 
    ## 
    ## ==================================================
    ## 
    ## No target stations in this area
    ## 
    ## ==================================================
    ## 
    ##               AREA  1 2 
    ## 
    ## ==================================================
    ## 
    ## No target stations in this area
    ## 
    ## ==================================================
    ## 
    ##               AREA  2 1 
    ## 
    ## ==================================================
    ## 
    ## No target stations in this area
    ## 
    ## ==================================================
    ## 
    ##               AREA  2 2 
    ## 
    ## ==================================================
    ## 
    ## 
    ## HOMOGEN() APPLICATION OUTPUT  (From R's contributed package 'climatol' 3.1.1)
    ## 
    ## =========== Homogenization of Ptest-1, 1965-2005. (Mon Jan 31 15:07:40 2022)
    ## 
    ## Parameters: varcli=Ptest-1 anyi=1965 anyf=2005 suf=NA nm=12 nref=10,10,4 std=3 swa=NA ndec=2 dz.max=5 dz.min=-5 wd=0,0,100 snht1=0 snht2=0 tol=0.02 maxdif=0.005 mxdif=0.005 maxite=999 force=FALSE wz=0.001 trf=0 mndat=NA gp=4 ini=NA na.strings=NA vmin=NA vmax=NA nclust=100 cutlev=NA grdcol=#666666 mapcol=#666666 hires=TRUE expl=TRUE metad=FALSE sufbrk=m tinc=NA tz=UTC cex=1.2 verb=TRUE
    ## 
    ## Data matrix: 492 data x 20 stations

    ## 
    ## -------------------------------------------
    ## Stations in the 3 clusters:
    ## 
    ## $`1`
    ##      Z Code        Name
    ## 1  183 S031 Station_031
    ## 2  125 S047 Station_047
    ## 8    1 S095 Station_095
    ## 11   6 S088 Station_088
    ## 17 120 S036 Station_036
    ## 18 155 S015 Station_015
    ## 
    ## $`2`
    ##      Z Code        Name
    ## 3  100 S098 Station_098
    ## 5   79 S081 Station_081
    ## 6   64 S069 Station_069
    ## 20  70 S100 Station_100
    ## 
    ## $`3`
    ##      Z Code        Name
    ## 4  129 S051 Station_051
    ## 7  865 S058 Station_058
    ## 9   38 S039 Station_039
    ## 10 107 S034 Station_034
    ## 12 160 S055 Station_055
    ## 13 160 S042 Station_042
    ## 14  20 S075 Station_075
    ## 15  89 S038 Station_038
    ## 16  27 S007 Station_007
    ## 19 265 S097 Station_097
    ## 
    ## ---------------------------------------------

    ## Computing inter-station distances:  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18  19
    ## 
    ## 
    ## ========== STAGE 3 (Final computation of all missing data) ==========
    ## 
    ## Computing inter-station weights... (done)

    ## Computation of missing data with outlier removal
    ## (Suggested data replacements are provisional)
    ## 
    ## The following lines will have one of these formats:
    ##   Station(rank) Date: Observed -> Suggested (Anomaly, in std. devs.)
    ##   Iteration Max.data.difference (Station_code)
    ## 2 -19.047 (S047)
    ## 3 -4.0477 (S047)
    ## 4 -0.9227 (S047)
    ## 5 -0.2418 (S047)
    ## 6 -0.0685 (S047)
    ## 7 0.0223 (S100)
    ## 8 0.0113 (S100)
    ## 9 0.0058 (S100)
    ## 10 0.003 (S100)
    ## 
    ## Last series readjustment (please, be patient...)

    ## 
    ## ======== End of the missing data filling process, after 32.07 secs 
    ## 
    ## ----------- Final computations:
    ## 
    ## ACmx: Station maximum absolute autocorrelations of anomalies
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##  0.4100  0.5650  0.6100  0.6053  0.6550  0.7500       1 
    ## 
    ## SNHT: Standard normal homogeneity test (on anomaly series)
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    8.20   14.28   23.60   33.12   33.12  136.50 
    ## 
    ## RMSE: Root mean squared error of the estimated data
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   43.05   55.48   64.67   65.77   75.84   87.21 
    ## 
    ## POD: Percentage of original data
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   43.00   53.00   59.00   58.35   63.00   72.00 
    ## 
    ##    ACmx SNHT  RMSE POD Code Name       
    ## 1    NA  14.3 74.5 43  S031 Station_031
    ## 2  0.71 136.5 87.1 49  S047 Station_047
    ## 3  0.54  14.2 45.6 53  S098 Station_098
    ## 4  0.63  21.2 80.7 58  S051 Station_051
    ## 5  0.63  24.9 69.4 54  S081 Station_081
    ## 6  0.65  10.1 58.7 57  S069 Station_069
    ## 7  0.63  23.7 62.2 60  S058 Station_058
    ## 8  0.73 113.4 87.1 59  S095 Station_095
    ## 9  0.46  37.1 49.5 63  S039 Station_039
    ## 10 0.57  50.1 61.3 67  S034 Station_034
    ## 11 0.56  31.8 79.7 69  S088 Station_088
    ## 12 0.61  15.2 62.4 59  S055 Station_055
    ## 13 0.75  48.2 70.8 60  S042 Station_042
    ## 14 0.61  25.5 73.3 63  S075 Station_075
    ## 15 0.41   8.2 49.0 72  S038 Station_038
    ## 16 0.47   8.9 43.1 68  S007 Station_007
    ## 17 0.66  11.4 57.5 59  S036 Station_036
    ## 18 0.61  26.5 87.2 53  S015 Station_015
    ## 19 0.57  23.5 49.4 53  S097 Station_097
    ## 20 0.70  17.6 67.0 48  S100 Station_100

    ## 
    ## ----------- Generated output files: -------------------------
    ## 
    ## Ptest-1_1965-2005.txt :  This text output 
    ## Ptest-1_1965-2005_out.csv :  List of corrected outliers 
    ## Ptest-1_1965-2005_brk.csv :  List of corrected breaks 
    ## Ptest-1_1965-2005.pdf :  Diagnostic graphics 
    ## Ptest-1_1965-2005.rda :  Homogenization results. Postprocess with (examples):
    ##    dahstat('Ptest-1',1965,2005) #get averages in file Ptest-1_1965-2005-me.csv 
    ##    dahstat('Ptest-1',1965,2005,stat='tnd') #get OLS trends and their p-values 
    ##    dahgrid('Ptest-1',1965,2005,grid=YOURGRID) #get homogenized grids 
    ##    ... (See other options in the package documentation)
    ## 
    ## 
    ## ======== End of homogenization of overlapping areas, after 32.46 secs 
    ## 
    ## ----------- Generated output files: -------------------------
    ## 
    ## Ptest_1965-2005.txt :  This text output
    ## Ptest_1965-2005_out.csv :  List of corrected outliers
    ## Ptest_1965-2005_brk.csv :  List of corrected breaks
    ## Ptest-*_1965-2005.pdf :  Diagnostic graphics (one file per area)
    ## Ptest_1965-2005-map.pdf :  Map of specified areas
    ## Ptest_1965-2005.rda :  Homogenization results. Postprocess with (examples):
    ##    dahstat('Ptest',1965,2005) #get averages in file Ptest_1965-2005-me.csv
    ##    dahstat('Ptest',1965,2005,stat='tnd') #get OLS trends and their p-values
    ##    dahgrid('Ptest',1965,2005,grid=YOURGRID) #get homogenized grids
    ##    ... (See other options in the package documentation)

Hallamos la serie homogenizada de precipitacion:

``` r
dahstat('Ptest', 1965, 2005, stat="me", ndc=3, vala=1, estcol=c(1,2,5))
```

    ## Mean values of Ptest (1965-2005)
    ##   written to Ptest_1965-2005_me.csv

# Nivel III

*5. Con la data homogenizada del ejercicio anterior (si no se ha
realizado, iniciar homogeneizando tal cual se menciona en el ejercicio
4) plotear un gráfico de calor con las medias de precipitación mensual
de acuerdo con la latitud y longitud, este debe abarcar desde el punto
2.1°E 39.1°N hasta el punto 3.5°E 40°N, con una separación de 0.001
entre líneas.*

*Además, debe tener un título principal y etiquetado en ambos ejes.
Adicionalmente, plotear un mapa de la zona del mundo en cuestión encima
de dicho gráfico (use col=rainbow(100)).*

Con el database homogenizado creamos un archivo grillado y usaresmos
‘dahgrid’:

``` r
grilla<-expand.grid(x=seq(2.1,3.5,0.001),y=seq(39.1,40,0.001))
library(sp)
coordinates(grilla)<-~ x+y
dahgrid('Ptest', 1965, 2005, grid=grilla)
```

    ## Interpolating 492 grids...:        2 %  4 %  6 %  8 % 10 % 12 % 14 % 16 % 18 % 20 % 22 % 24 % 26 % 28 % 30 % 33 % 35 % 37 % 39 % 41 % 43 % 45 % 47 % 49 % 51 % 53 % 55 % 57 % 59 % 61 % 63 % 65 % 67 % 69 % 71 % 73 % 75 % 77 % 79 % 81 % 83 % 85 % 87 % 89 % 91 % 93 % 96 % 98 % 100 % (done)
    ## 
    ## Normalized grids (-1.034183 to 11.596198) saved to file Ptest_1965-2005.nc 
    ## Means and standard deviations (of the whole series) saved to files
    ## Ptest_1965-2005_m.nc, Ptest_1965-2005_s.nc and Ptest_1965-2005_msd.csv

*Medias diarias de precipitacion homogenizada:*

``` r
library(ncdf4)
```

``` r
nc_med <- nc_open("D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 4 y 5/Ptest_1965-2005_m.nc")
print(nc_med)
```

    ## File D:/Programas/Python - Tareas/PROGRAMACION - 2021/TAREA_5/Archivos/Pregunta 4 y 5/Ptest_1965-2005_m.nc (NC_FORMAT_CLASSIC):
    ## 
    ##      1 variables (excluding dimension variables):
    ##         float Ptest.m[lon,lat]   
    ##             _FillValue: NaN
    ##             long_name: Ptest 1965-2005 means
    ## 
    ##      2 dimensions:
    ##         lon  Size:1401 
    ##             units: deg.E
    ##             long_name: lon
    ##         lat  Size:901 
    ##             units: deg.N
    ##             long_name: lat

``` r
precp <- ncvar_get(nc_med,'Ptest.m') 
lati <- ncvar_get(nc_med,'lat')
lati <- rev(lati)
longi <- ncvar_get(nc_med,'lon')
dims_variable <- dim(precp)
```

``` r
library(fields)
```

    ## Loading required package: spam

    ## Spam version 2.8-0 (2022-01-05) is loaded.
    ## Type 'help( Spam)' or 'demo( spam)' for a short introduction 
    ## and overview of this package.
    ## Help for individual functions is also obtained by adding the
    ## suffix '.spam' to the function name, e.g. 'help( chol.spam)'.

    ## 
    ## Attaching package: 'spam'

    ## The following objects are masked from 'package:base':
    ## 
    ##     backsolve, forwardsolve

    ## Loading required package: viridis

    ## Loading required package: viridisLite

    ## 
    ## Attaching package: 'viridis'

    ## The following object is masked from 'package:maps':
    ## 
    ##     unemp

    ## 
    ## Try help(fields) to get started.

``` r
image.plot(longi,lati,precp[,length(lati):1], main = paste("Medias de precipitacion mensual"), xlab = 'Longitud',ylab = 'Latitud', col = rainbow(100))
library(maps)
map("world", add=T)
```

![](TAREA5_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->
