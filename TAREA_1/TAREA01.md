PROGRAMACION
================
GRUPO 10 \|
Fecha :18/11/21

**Integrantes:** ALARCON CANDIOTTE, *Arthur* \| CALDAS MORALES,
*Fernando* \| VARGAS CAMPOS, *Valia*

### PARTE 01

**1. Calcula los valores numéricos aproximados de**

**1.a**

``` r
      (0.3 * 0.15)/(0.3 * 0.15 + 0.2 * 0.8 + 0.5 * 0.12)
```

    ## [1] 0.1698113

``` r
      round((0.3 * 0.15)/(0.3 * 0.15 + 0.2 * 0.8 + 0.5 * 0.12),2) # Redondeando
```

    ## [1] 0.17

**1.b.**

``` r
      (5^6) * (exp(-5))/factorial(6)
```

    ## [1] 0.1462228

``` r
      round((5^6) * (exp(-5))/factorial(6),2) # Redondeando
```

    ## [1] 0.15

**1.c.**

``` r
      (factorial(20)/(factorial(13)*factorial(7)))*(0.4^7)*(0.6^13)
```

    ## [1] 0.1658823

``` r
      round((factorial(20)/(factorial(13)*factorial(7)))*(0.4^7)*(0.6^13),2) # Redondeando
```

    ## [1] 0.17

``` r
      #### Tambien podria hacerse creando una funcion 
        
      permutar = function(n,r){factorial(n)/(factorial(n-r)*factorial(r))}
      permutar(20,7)*(0.4^7)*(0.6^13)
```

    ## [1] 0.1658823

``` r
      round(permutar(20,7)*(0.4^7)*(0.6^13),2) # Redondenado 
```

    ## [1] 0.17

**2. Realizar la siguiente suma**

**2.a.**

``` r
      sum(1:1000)
```

    ## [1] 500500

**2.b.**

``` r
      n = (0:10)
      sum(2^n)
```

    ## [1] 2047

**3. El vector grupo representa el grupo al que pertenece una serie de
alumnos**

``` r
load(url("https://goo.gl/uDzU8v")) # Cargamos las variables almacenadas en el archivo     
```

**3.a.** *¿Cuántos elementos tiene?*

``` r
length(grupo)
```

    ## [1] 192

**3.b.** *¿En qué posiciones del vector está la letra “A?*

``` r
      which(grupo == "A")  
```

    ##  [1]   2   8  17  21  28  84 101 108 111 115 123 136 190 192

**4. El vector nota representa la nota de un examen de los alumnos que
están en los grupos del vector grupo.**

**4.a.** *¿Cuanto suman todas las notas?*

``` r
      sum(nota)
```

    ## [1] 962

**4.b.** *¿Cual es la media aritmética de todas las notas?*

``` r
      mean(nota)
```

    ## [1] 5.010417

**4.c.** *¿En qué posiciones están las notas mayores de 7.0?*

``` r
      which(nota > 7.0)
```

    ## [1]  81 103 120 151

**4.d.** *Visualiza las notas ordenadas de mayor a menor*

``` r
      sort(nota,decreasing = TRUE)
```

    ##   [1] 7.7 7.5 7.4 7.2 7.0 6.9 6.9 6.8 6.8 6.8 6.8 6.8 6.6 6.5 6.4 6.4 6.4 6.4
    ##  [19] 6.3 6.2 6.2 6.2 6.2 6.2 6.2 6.1 6.1 6.1 6.1 6.0 6.0 6.0 6.0 6.0 6.0 5.9
    ##  [37] 5.9 5.9 5.9 5.9 5.9 5.9 5.9 5.9 5.8 5.8 5.8 5.8 5.8 5.7 5.7 5.7 5.7 5.7
    ##  [55] 5.6 5.6 5.6 5.6 5.6 5.6 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5
    ##  [73] 5.5 5.4 5.4 5.4 5.4 5.4 5.4 5.4 5.4 5.3 5.3 5.3 5.3 5.2 5.2 5.2 5.2 5.2
    ##  [91] 5.2 5.2 5.1 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 4.9 4.9 4.9 4.9 4.9 4.9
    ## [109] 4.8 4.8 4.8 4.8 4.8 4.8 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.6 4.6
    ## [127] 4.6 4.6 4.5 4.5 4.5 4.5 4.5 4.5 4.4 4.4 4.4 4.4 4.4 4.4 4.4 4.3 4.3 4.3
    ## [145] 4.2 4.2 4.2 4.2 4.2 4.2 4.2 4.2 4.1 4.1 4.1 4.1 4.1 4.0 4.0 4.0 4.0 4.0
    ## [163] 4.0 3.9 3.9 3.8 3.8 3.8 3.7 3.7 3.7 3.7 3.6 3.6 3.6 3.5 3.4 3.4 3.4 3.4
    ## [181] 3.2 3.2 3.2 3.1 3.0 2.9 2.9 2.9 2.7 2.6 2.5 1.7

**4.e.** *¿En qué posición está la nota máxima?*

``` r
      which.max(nota == max(nota))
```

    ## [1] 120

**5. A partir de los vectores grupo y nota definidos.**

**5.a.** *Suma las notas de los 10 primeros alumnos del vector*

``` r
      team10 <- data.frame(grupo, nota)
      head(team10,10)
```

    ##    grupo nota
    ## 1      B  4.9
    ## 2      A  5.4
    ## 3      E  5.2
    ## 4      D  6.8
    ## 5      B  5.0
    ## 6      D  6.2
    ## 7      D  4.4
    ## 8      A  4.1
    ## 9      D  4.3
    ## 10     C  5.5

``` r
      sum(head(team10$nota,10))
```

    ## [1] 51.8

**5.b.** *¿Cuántos alumnos hay del grupo C?*

``` r
      length(which(grupo == "C"))
```

    ## [1] 39

**5.c.** *¿Cuántos alumnos han aprobado?*

``` r
      length(which(nota > 5.0))
```

    ## [1] 93

``` r
      # o tambien 
      length(nota[nota>5])
```

    ## [1] 93

**5.d.** *¿Cuántos alumnos del grupo B han aprobado?*

``` r
      which(team10$grupo == "B"& team10$nota>5)
```

    ##  [1]  13  18  65  86 103 148 170 176 186 187

``` r
      length(which(grupo == "B" & nota>5))
```

    ## [1] 10

**5.e.** *¿Qué porcentaje de alumnos del grupo C han aprobado?*

``` r
      (100*22)/39  # 1ra forma
```

    ## [1] 56.41026

``` r
      length(which(team10$grupo == "C" & team10$nota>5))/length(which(team10$grupo=="C"))*100 # 2da forma
```

    ## [1] 56.41026

**5.f.** *¿De qué grupos son la máxima y mínima notas de toda la
muestra?*

``` r
      which.max(nota)
```

    ## [1] 120

``` r
      which.min(nota)
```

    ## [1] 142

``` r
      nota[120]
```

    ## [1] 7.7

``` r
      nota[142]
```

    ## [1] 1.7

``` r
      grupo[120]
```

    ## [1] "E"

``` r
      grupo[142]
```

    ## [1] "B"

**5.g.** *Nota media de los alumnos de grupo A y B, juntos, considerando
sólo a los que han aprobado.*

``` r
      which(team10$grupo == "A" & team10$nota>5) 
```

    ## [1]   2  17  28 108

``` r
      which(team10$grupo == "B"& team10$nota>5)
```

    ##  [1]  13  18  65  86 103 148 170 176 186 187

``` r
      notas_A <- nota[ c(2,  17,  28, 108)]
      notas_B <- nota [c(13,  18,  65,  86, 103, 148, 170, 176, 186, 187)]
      mean(notas_A<-nota[ c(2,  17,  28, 108)])
```

    ## [1] 5.425

``` r
      mean (nota[c(13,  18,  65,  86, 103, 148, 170, 176, 186, 187)])
```

    ## [1] 6.15

``` r
      notas_C<-nota[c(2,  17,  28, 108, 13,  18,  65,  86, 103, 148, 170, 176, 186, 187)]
      mean(notas_C)
```

    ## [1] 5.942857

**6. Calcula el percentil 66 de las notas de todos los alumnos, y
también de los alumnos del grupo C.**

``` r
    66*length(nota)/100
```

    ## [1] 126.72

``` r
    nota_ordenada <- sort(nota)
    nota_ordenada -> nota
    nota_ordenada[126]      
```

    ## [1] 5.5

``` r
    nota_ordenada[127]      
```

    ## [1] 5.5

**7. Un alumno tiene una nota de 4.9. ¿Qué porcentaje, del total de
alumnos, tiene una nota menor o igual que la suya? ¿Y qué porcentaje
tiene una nota mayor o igual que la suya?**

``` r
    length(which(nota<=4.9))/length(nota)*100
```

    ## [1] 46.875

``` r
    length(which(nota>=4.9))/length(nota)*100
```

    ## [1] 56.25

``` r
    which(nota==4.9)
```

    ## [1] 85 86 87 88 89 90

**8. Realiza el gráfico de diagramas de caja de las notas de cada grupo,
para poder comparar el nivel de cada uno de ellos.**

``` r
    boxplot(nota ~ grupo)
```

![](TAREA01_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

**9. Si la variable conc recoge la concentración de plomo (en ppm) en el
aire de cierta zona durante un día completo**

**9.a.** *¿Cuál ha sido la concentración máxima?*

``` r
      max(conc)
```

    ## [1] 47.34

**9.b.** *¿En cuántos de los muestreos se ha superado la concentración
de 40.0 ppm?*

``` r
      length(which(conc> 40.0))
```

    ## [1] 61

**9.c** *¿Cuál ha sido la concentración media del día?*

``` r
      mean(conc)
```

    ## [1] 24.07229

**9.d.** *¿Cuáles fueron las 10 mediciones más bajas del día?*

``` r
      head(sort(conc),10)
```

    ##  [1] 0.93 1.07 1.77 2.03 2.58 2.73 2.75 2.88 2.88 2.91

**9.e.** *Si la primera medida fue a las 00:00. ¿A qué hora del día se
alcanzó la concentración máxima?*

``` r
      max(conc)
```

    ## [1] 47.34

``` r
      conc[47.34]
```

    ## [1] 12.91

``` r
      which(conc==max(conc))
```

    ## [1] 142

``` r
      288/(24*60)
```

    ## [1] 0.2

``` r
      # 1 muestra - 5 min
      # 142 es el maximo
      (83-8)/90*60
```

    ## [1] 50

### PARTE 02

**1. Graficar los puntos
(1,1),(2,4),(3,9),(4,8),(5,25),(6,36),(7,49),(8,64),(9,81),(10,100) en
un plano utilizando RStudio.**

``` r
      m <- 1:10
      q <- m^2
      plot(m,q)
```

![](TAREA01_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

**2. Ingresar la matriz “A” en RStudio**

``` r
      matrix(c(1,2,3,2,4,6, 3,6,9,4,8,12),nrow = 4,ncol = 3,byrow = TRUE)
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    2    4    6
    ## [3,]    3    6    9
    ## [4,]    4    8   12

**3. Ingresar la matriz identidad de tamaño 3**

``` r
      diag(3)
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    0    0
    ## [2,]    0    1    0
    ## [3,]    0    0    1

**4. Crea una función que cree una matriz nula ingresando las
dimensiones**

``` r
F4 <- function(n) { I <- diag(n); for(i in 1:n){I[i,i]=0}; return(I)}
      F4(4)      
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    0    0    0    0
    ## [2,]    0    0    0    0
    ## [3,]    0    0    0    0
    ## [4,]    0    0    0    0

**5. Modificar la matriz diag(4), para que se parezca a la matriz B**

``` r
      D <-diag(4)
      D[1,1] = 0
      D[2,2] = 2
      D[3,3] = 3
      D[4,4] = 4
      D
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    0    0    0    0
    ## [2,]    0    2    0    0
    ## [3,]    0    0    3    0
    ## [4,]    0    0    0    4

**6. Obtener la matriz transpuesta de A (ejercicio 2)**

``` r
      t(matrix(c(1,2,3,2,4,6, 3,6,9,4,8,12),nrow = 4,ncol = 3,byrow = TRUE))
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    2    4    6    8
    ## [3,]    3    6    9   12

**7. Realizar las siguientes operaciones A+B,A−B,3B y AB**

``` r
      A7 <- matrix(c(1,2,3,4,2,4,6,8,3,6,9,12,0,0,0,0), nrow = 4 , ncol = 4)
      B7 <- matrix(c(0,0,0,0,2,0,0,0,0,3,0,0,0,0,0,4), ncol=4)
      (A7+B7)
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    4    3    0
    ## [2,]    2    4    9    0
    ## [3,]    3    6    9    0
    ## [4,]    4    8   12    4

``` r
      (A7-B7)
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    0    3    0
    ## [2,]    2    4    3    0
    ## [3,]    3    6    9    0
    ## [4,]    4    8   12   -4

``` r
      (A7*B7)
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    0    4    0    0
    ## [2,]    0    0   18    0
    ## [3,]    0    0    0    0
    ## [4,]    0    0    0    0

``` r
      (3*B7)
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    0    6    0    0
    ## [2,]    0    0    9    0
    ## [3,]    0    0    0    0
    ## [4,]    0    0    0   12

**8. Crea una función para calcular P^6**

``` r
      F8<-function(M,n){S=M;for(i in 2:n){S=S%*%M};print(S)}
      P <- matrix(c(1,-2,1,2,4,0,3,-2,1), ncol=3, nrow=3)
      F8(P,6)
```

    ##       [,1]  [,2]  [,3]
    ## [1,] -1792    24 -2824
    ## [2,]  -464 -2416 -1344
    ## [3,]  -648   440  -912

**9. Resolver el sistema de ecuaciones**

``` r
      A9 = matrix(c(3,9,3,-1,-2,1,1,1,-2), ncol=3,nrow=3)
      x9 <- c(-1,-9,-9)
      solve(A9,x9)
```

    ## [1] -1  2  4

**10. Utilizando la ayuda de R, investigue para qué sirven las funciones
eigen() y det()**

``` r
      #eigen # Computes eigenvalues and eigenvectors of numeric 
            # (double, integer, logical) or complex matrices.
    
      #det   # det calculates the determinant of a matrix. determinant 
            # is a generic function that returns separately the modulus 
            # of the determinant, optionally on the logarithm scale, and 
            # the sign of the determinant.
```

**11. Considerando las matrices, Calcular A⋅B−AB^t**

``` r
      M1 <- c(1:10)
      M2 <- seq(2, 20, by = 2)
      M3 <- seq(3, 30, by = 3)
      M4 <- seq(4, 40, by = 4)
      M5 <- seq(5, 50, by = 5)
      B11 = cbind(M1, M2, M3, M4, M5)
      B11
```

    ##       M1 M2 M3 M4 M5
    ##  [1,]  1  2  3  4  5
    ##  [2,]  2  4  6  8 10
    ##  [3,]  3  6  9 12 15
    ##  [4,]  4  8 12 16 20
    ##  [5,]  5 10 15 20 25
    ##  [6,]  6 12 18 24 30
    ##  [7,]  7 14 21 28 35
    ##  [8,]  8 16 24 32 40
    ##  [9,]  9 18 27 36 45
    ## [10,] 10 20 30 40 50

``` r
      N1 <- c(0,1,0,0,1)
      N2 <- c(1,0,1,1,0)
      N3 <- c(0,1,0,0,1)
      N4 <- c(1,0,1,0,1)
      N5 <- c(0,1,0,1,0)
      A11 = cbind(N1,N2,N3,N4,N5)
      A11
```

    ##      N1 N2 N3 N4 N5
    ## [1,]  0  1  0  1  0
    ## [2,]  1  0  1  0  1
    ## [3,]  0  1  0  1  0
    ## [4,]  0  1  0  0  1
    ## [5,]  1  0  1  1  0

``` r
      B11%*%A11-B11%*%t(A11)
```

    ##       N1  N2 N3 N4  N5
    ##  [1,]  1  -1  1  2  -2
    ##  [2,]  2  -2  2  4  -4
    ##  [3,]  3  -3  3  6  -6
    ##  [4,]  4  -4  4  8  -8
    ##  [5,]  5  -5  5 10 -10
    ##  [6,]  6  -6  6 12 -12
    ##  [7,]  7  -7  7 14 -14
    ##  [8,]  8  -8  8 16 -16
    ##  [9,]  9  -9  9 18 -18
    ## [10,] 10 -10 10 20 -20

**12. Determine la matriz β**

``` r
      x12 <- matrix(c(1,1,1,1,1,1,-1,0,1,2), nrow = 5, ncol = 2)
      y12 <- matrix(c(0,0,1,1,3), nrow = , ncol = 1)
      ((t(x12)%*%x12)^-1)%*%(t(x12)%*%y12)
```

    ##          [,1]
    ## [1,] 3.333333
    ## [2,] 2.666667

**13. Corre el siguiente código para cargar los vectores year y co2 en memoria**

``` r
load(url("https://goo.gl/uDzU8v"))      
      data(co2)
      means = aggregate(co2, FUN=mean)
      year = as.vector(time(means))
      co2 = as.vector(means)
```
**13.a.**
``` r
load(url("https://goo.gl/uDzU8v"))
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)
y <- c(0, diff(co2))
plot(year,y, type = "o", pch = 20, xlab = "Años", ylab = "Diferencia de concentración de CO2", main = "Diferencias de CO2 entre años consecutivos", col = "blue", font = 2)
```
**13.b.** 
``` r
load(url("https://goo.gl/uDzU8v"))
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)
y <- c(0, diff(co2))
plot(year, y, xlim=c(1959, 2020), type = "o", pch = 20, xlab = "Años", ylab = "Diferencia de concentración de CO2", main = "Diferencias de CO2 entre años consecutivos", col = "blue", font = 2)
points(2020, 2.64, pch = 4, col = "red")
```
