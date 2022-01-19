PROGRAMACION - TAREA 3
================
GRUPO 10 \|
14/01/2022

**Integrantes:** *ALARCON CANDIOTTE*, Arthur \| *CALDAS MORALES*,
Fernando \| *VARGAS CAMPOS*, Valia

# 9. Ejercicios: tidyverse

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(nycflights13)
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --

    ## v ggplot2 3.3.5     v purrr   0.3.4
    ## v tibble  3.1.5     v stringr 1.4.0
    ## v tidyr   1.1.4     v forcats 0.5.1
    ## v readr   2.1.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
nycflights13::flights
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 9.1 Parte 1: Dplyr - filter

#### 9.1.1. Encuentra todos los vuelos que:

**a. Tuvieron un retraso de llegada de dos o más horas**

``` r
filter(flights,arr_delay >= 120)
```

    ## # A tibble: 10,200 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      811            630       101     1047            830
    ##  2  2013     1     1      848           1835       853     1001           1950
    ##  3  2013     1     1      957            733       144     1056            853
    ##  4  2013     1     1     1114            900       134     1447           1222
    ##  5  2013     1     1     1505           1310       115     1638           1431
    ##  6  2013     1     1     1525           1340       105     1831           1626
    ##  7  2013     1     1     1549           1445        64     1912           1656
    ##  8  2013     1     1     1558           1359       119     1718           1515
    ##  9  2013     1     1     1732           1630        62     2028           1825
    ## 10  2013     1     1     1803           1620       103     2008           1750
    ## # ... with 10,190 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

*la cantidad de vuelos*

``` r
flights %>% 
  filter(arr_delay >= 120) %>% 
  summarise(conteo = n()
            )
```

    ## # A tibble: 1 x 1
    ##   conteo
    ##    <int>
    ## 1  10200

**b. Volaron a Houston (`IAH` o`HOU`)**

*Opcion 1*

``` r
filter(flights, dest %in% c("IAH", "HOU"))
```

    ## # A tibble: 9,313 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      623            627        -4      933            932
    ##  4  2013     1     1      728            732        -4     1041           1038
    ##  5  2013     1     1      739            739         0     1104           1038
    ##  6  2013     1     1      908            908         0     1228           1219
    ##  7  2013     1     1     1028           1026         2     1350           1339
    ##  8  2013     1     1     1044           1045        -1     1352           1351
    ##  9  2013     1     1     1114            900       134     1447           1222
    ## 10  2013     1     1     1205           1200         5     1503           1505
    ## # ... with 9,303 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

*Opcion 2*

``` r
filter(flights, dest == "IAH" | dest == "HOU")
```

    ## # A tibble: 9,313 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      623            627        -4      933            932
    ##  4  2013     1     1      728            732        -4     1041           1038
    ##  5  2013     1     1      739            739         0     1104           1038
    ##  6  2013     1     1      908            908         0     1228           1219
    ##  7  2013     1     1     1028           1026         2     1350           1339
    ##  8  2013     1     1     1044           1045        -1     1352           1351
    ##  9  2013     1     1     1114            900       134     1447           1222
    ## 10  2013     1     1     1205           1200         5     1503           1505
    ## # ... with 9,303 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**c. Fueron operados por United, American o Delta**

*Los códigos de estas aerolíneas son `UA`, `AA` y `DL`.*

*Opcion 1*

``` r
filter(flights, carrier  %in% c("UA", "AA", "DL"))
```

    ## # A tibble: 139,504 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      558            600        -2      753            745
    ##  7  2013     1     1      558            600        -2      924            917
    ##  8  2013     1     1      558            600        -2      923            937
    ##  9  2013     1     1      559            600        -1      941            910
    ## 10  2013     1     1      559            600        -1      854            902
    ## # ... with 139,494 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

*Opcion 2*

``` r
filter(flights, carrier  == "UA" | carrier == "AA" | carrier == "DL")
```

    ## # A tibble: 139,504 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      558            600        -2      753            745
    ##  7  2013     1     1      558            600        -2      924            917
    ##  8  2013     1     1      558            600        -2      923            937
    ##  9  2013     1     1      559            600        -1      941            910
    ## 10  2013     1     1      559            600        -1      854            902
    ## # ... with 139,494 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**d. Partieron en el invierno del hemisferio sur (julio, agosto y
septiembre)**

*Opcion 1*

``` r
filter(flights, month %in% c(7, 8, 9))
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

*Opcion 2*

``` r
filter(flights, month == 7 |  month == 8 | month == 9)
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**e. Llegaron más de dos horas tarde, pero no salieron tarde**

``` r
filter(flights, dep_delay <= 0 & arr_delay > 120)
```

    ## # A tibble: 29 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1    27     1419           1420        -1     1754           1550
    ##  2  2013    10     7     1350           1350         0     1736           1526
    ##  3  2013    10     7     1357           1359        -2     1858           1654
    ##  4  2013    10    16      657            700        -3     1258           1056
    ##  5  2013    11     1      658            700        -2     1329           1015
    ##  6  2013     3    18     1844           1847        -3       39           2219
    ##  7  2013     4    17     1635           1640        -5     2049           1845
    ##  8  2013     4    18      558            600        -2     1149            850
    ##  9  2013     4    18      655            700        -5     1213            950
    ## 10  2013     5    22     1827           1830        -3     2217           2010
    ## # ... with 19 more rows, and 11 more variables: arr_delay <dbl>, carrier <chr>,
    ## #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>,
    ## #   distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**f. Se retrasaron por lo menos una hora, pero repusieron más de 30
minutos en vuelo**

``` r
filter(flights, dep_delay >= 60, arr_delay < 30)
```

    ## # A tibble: 206 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     3     1850           1745        65     2148           2120
    ##  2  2013     1     3     1950           1845        65     2228           2227
    ##  3  2013     1     3     2015           1915        60     2135           2111
    ##  4  2013     1     6     1019            900        79     1558           1530
    ##  5  2013     1     7     1543           1430        73     1758           1735
    ##  6  2013     1    11     1020            920        60     1311           1245
    ##  7  2013     1    12     1706           1600        66     1949           1927
    ##  8  2013     1    12     1953           1845        68     2154           2137
    ##  9  2013     1    19     1456           1355        61     1636           1615
    ## 10  2013     1    21     1531           1430        61     1843           1815
    ## # ... with 196 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**g. Partieron entre la medianoche y las 6 a.m. (incluyente)**

``` r
filter(flights, dep_time >= 0 & dep_time <= 600)
```

    ## # A tibble: 9,344 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 9,334 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### 9.1.2. Otra función de dplyr que es útil para usar filtros es between(). ¿Qué hace? ¿Puedes usarla para simplificar el código necesario para responder a los desafíos anteriores?

*Esta función permite abreviar y/o simplificar la escritura de código
que tiene esta estructura `x >= dere & x <= izq` por
`between(x, dere, izq)`*

*Podemos reescribir el código para la pregunta 9.1.d. como ejemplo*

``` r
filter(flights, between(month, 7, 9))
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### 9.1.3. ¿Cuántos vuelos tienen datos faltantes en horario_salida? ¿Qué otras variables tienen valores faltantes? ¿Qué representan estas filas?

***a. Podemos buscar datos faltantes con la función `is.na`.***

``` r
count(filter(flights, is.na(dep_time)))
```

    ## # A tibble: 1 x 1
    ##       n
    ##   <int>
    ## 1  8255

***b.***

``` r
filter(flights, is.na(dep_time)) ## arr_delay, tailnum, air_time, dep_delay, arr_time
```

    ## # A tibble: 8,255 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1       NA           1630        NA       NA           1815
    ##  2  2013     1     1       NA           1935        NA       NA           2240
    ##  3  2013     1     1       NA           1500        NA       NA           1825
    ##  4  2013     1     1       NA            600        NA       NA            901
    ##  5  2013     1     2       NA           1540        NA       NA           1747
    ##  6  2013     1     2       NA           1620        NA       NA           1746
    ##  7  2013     1     2       NA           1355        NA       NA           1459
    ##  8  2013     1     2       NA           1420        NA       NA           1644
    ##  9  2013     1     2       NA           1321        NA       NA           1536
    ## 10  2013     1     2       NA           1545        NA       NA           1910
    ## # ... with 8,245 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

***c.*** *En estas filas se ven que los vuelos que tienen `NA` en su
horario de salida, también lo tienen en el horario de llegada, llegando
a inferir que son vuelos que fueron cancelados.*

#### 9.1.4. ¿Por qué NA^0 no es faltante? ¿Por qué NA \| TRUE no es faltante? ¿Por qué FALSE & NA no es faltante? ¿Puedes descubrir la regla general? (¡NA \* 0 es un contraejemplo complicado!)

***a.***

``` r
x <- c(NA) 
is.na(x) 
```

    ## [1] TRUE

*Porque el `NA` podría tomar cualquier valor por lo que podria ser
cualquier número y a la potencia cero es igual a 1.*

*Por otro lado `is.na()` determina si falta un valor y devuelve un valor
lógico `TRUE` en los casos en que es NA*

***b.***

``` r
x | TRUE 
```

    ## [1] TRUE

*Va a ser TRUE porque el “NA” se entiende como un valor lógico y por
lógica proposicional `TRUE` \| `TRUE` y `FALSE` \| `TRUE` es siempre
igual a `TRUE`.*

***c.***

``` r
x & FALSE 
```

    ## [1] FALSE

*Va a ser TRUE porque el “NA” se entiende como un valor lógico y por
lógica proposicional `TRUE`&`FALSE` y `FALSE`&`FALSE` es siempre
`FALSE`.*

***d. El contraejemplo a la regla general.***

``` r
x * 0
```

    ## [1] NA

``` r
Inf*0
```

    ## [1] NaN

**Con este contraejemplo el `NA` que puede tomar cualquier valor, al
multiplicarse por cero nos da una indeterminación que `R` define como
`NaN`. Por otro lado, si el `NA` fuese un valor entonces `NA*0` sería
igual a cero. Luego, es mejor pensar en `x*0` como un `NA` porque no
sabemos en cual de los dos casos anteriores estamos.**

## 9.2. Parte 2: Dplyr - arrange

#### 9.2.1. ¿Cómo podrías usar arrange() para ordenar todos los valores faltantes al comienzo? (Sugerencia: usa is.na()).

``` r
arrange(flights,is.na(air_time))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### 9.2.2. Ordena vuelos para encontrar los vuelos más retrasados. Encuentra los vuelos que salieron más temprano.

***a. Vuelos que salieron con más retraso***

``` r
arrange(flights, desc(dep_delay))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     9      641            900      1301     1242           1530
    ##  2  2013     6    15     1432           1935      1137     1607           2120
    ##  3  2013     1    10     1121           1635      1126     1239           1810
    ##  4  2013     9    20     1139           1845      1014     1457           2210
    ##  5  2013     7    22      845           1600      1005     1044           1815
    ##  6  2013     4    10     1100           1900       960     1342           2211
    ##  7  2013     3    17     2321            810       911      135           1020
    ##  8  2013     6    27      959           1900       899     1236           2226
    ##  9  2013     7    22     2257            759       898      121           1026
    ## 10  2013    12     5      756           1700       896     1058           2020
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

***b. Vuelos que salieron más temprano***

``` r
arrange(flights, dep_delay > 0)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      544            545        -1     1004           1022
    ##  2  2013     1     1      554            600        -6      812            837
    ##  3  2013     1     1      554            558        -4      740            728
    ##  4  2013     1     1      555            600        -5      913            854
    ##  5  2013     1     1      557            600        -3      709            723
    ##  6  2013     1     1      557            600        -3      838            846
    ##  7  2013     1     1      558            600        -2      753            745
    ##  8  2013     1     1      558            600        -2      849            851
    ##  9  2013     1     1      558            600        -2      853            856
    ## 10  2013     1     1      558            600        -2      924            917
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### 9.2.3. Ordena vuelos para encontrar los vuelos más rápidos (que viajaron a mayor velocidad).

``` r
vuelos02 <- arrange( flights, desc(distance / air_time))
head(vuelos02)
```

    ## # A tibble: 6 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     5    25     1709           1700         9     1923           1937
    ## 2  2013     7     2     1558           1513        45     1745           1719
    ## 3  2013     5    13     2040           2025        15     2225           2226
    ## 4  2013     3    23     1914           1910         4     2045           2043
    ## 5  2013     1    12     1559           1600        -1     1849           1917
    ## 6  2013    11    17      650            655        -5     1059           1150
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

#### 9.2.4. ¿Cuáles vuelos viajaron más lejos? ¿Cuál viajó más cerca?

***a. Vuelos que viajaron más lejos (en millas)***

``` r
mas.lejos <- arrange(flights, desc(distance))
mas.lejos
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      857            900        -3     1516           1530
    ##  2  2013     1     2      909            900         9     1525           1530
    ##  3  2013     1     3      914            900        14     1504           1530
    ##  4  2013     1     4      900            900         0     1516           1530
    ##  5  2013     1     5      858            900        -2     1519           1530
    ##  6  2013     1     6     1019            900        79     1558           1530
    ##  7  2013     1     7     1042            900       102     1620           1530
    ##  8  2013     1     8      901            900         1     1504           1530
    ##  9  2013     1     9      641            900      1301     1242           1530
    ## 10  2013     1    10      859            900        -1     1449           1530
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

***b. Vuelos que viajaron más cerca (en millas)***

``` r
mas.cerca <- arrange(flights, distance)
mas.cerca
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7    27       NA            106        NA       NA            245
    ##  2  2013     1     3     2127           2129        -2     2222           2224
    ##  3  2013     1     4     1240           1200        40     1333           1306
    ##  4  2013     1     4     1829           1615       134     1937           1721
    ##  5  2013     1     4     2128           2129        -1     2218           2224
    ##  6  2013     1     5     1155           1200        -5     1241           1306
    ##  7  2013     1     6     2125           2129        -4     2224           2224
    ##  8  2013     1     7     2124           2129        -5     2212           2224
    ##  9  2013     1     8     2127           2130        -3     2304           2225
    ## 10  2013     1     9     2126           2129        -3     2217           2224
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 9.3. Parte 3: Dplyr - select

#### 9.3.1. Haz una lluvia de ideas sobre tantas maneras como sea posible para seleccionar dep_time, dep_delay, arr_time, y arr_delay de flights.

``` r
select(flights, dep_time, dep_delay, arr_time, arr_delay)
```

    ## # A tibble: 336,776 x 4
    ##    dep_time dep_delay arr_time arr_delay
    ##       <int>     <dbl>    <int>     <dbl>
    ##  1      517         2      830        11
    ##  2      533         4      850        20
    ##  3      542         2      923        33
    ##  4      544        -1     1004       -18
    ##  5      554        -6      812       -25
    ##  6      554        -4      740        12
    ##  7      555        -5      913        19
    ##  8      557        -3      709       -14
    ##  9      557        -3      838        -8
    ## 10      558        -2      753         8
    ## # ... with 336,766 more rows

``` r
select(flights, starts_with("carrier"), starts_with("time"))
```

    ## # A tibble: 336,776 x 2
    ##    carrier time_hour          
    ##    <chr>   <dttm>             
    ##  1 UA      2013-01-01 05:00:00
    ##  2 UA      2013-01-01 05:00:00
    ##  3 AA      2013-01-01 05:00:00
    ##  4 B6      2013-01-01 05:00:00
    ##  5 DL      2013-01-01 06:00:00
    ##  6 UA      2013-01-01 05:00:00
    ##  7 B6      2013-01-01 06:00:00
    ##  8 EV      2013-01-01 06:00:00
    ##  9 B6      2013-01-01 06:00:00
    ## 10 AA      2013-01-01 06:00:00
    ## # ... with 336,766 more rows

#### 9.3.2. ¿Qué sucede si incluyes el nombre de una variable varias veces en una llamada a select()?

``` r
select(flights, dep_delay, dep_delay, carrier, carrier) 
```

    ## # A tibble: 336,776 x 2
    ##    dep_delay carrier
    ##        <dbl> <chr>  
    ##  1         2 UA     
    ##  2         4 UA     
    ##  3         2 AA     
    ##  4        -1 B6     
    ##  5        -6 DL     
    ##  6        -4 UA     
    ##  7        -5 B6     
    ##  8        -3 EV     
    ##  9        -3 B6     
    ## 10        -2 AA     
    ## # ... with 336,766 more rows

*Aunque se incluya más de una vez una variable al utilizar `select()`
esta solo se considerará una vez*

#### 9.3.3. ¿Qué hace la función any_of()? ¡¿Por qué podría ser útil en conjunto con este vector?

``` r
vec3 <- c ("year", "month", "day", "dep delay", "arr delay")
```

*Con la función `one_of()` podemos indicar las variables que queremos
seleccionar con el nombre del vector que las contiene. *

*Con `one_of()` selecciona todas las variables que están en el vector
`vec3`:*

``` r
select(flights, one_of(vec3))
```

    ## Warning: Unknown columns: `dep delay`, `arr delay`

    ## # A tibble: 336,776 x 3
    ##     year month   day
    ##    <int> <int> <int>
    ##  1  2013     1     1
    ##  2  2013     1     1
    ##  3  2013     1     1
    ##  4  2013     1     1
    ##  5  2013     1     1
    ##  6  2013     1     1
    ##  7  2013     1     1
    ##  8  2013     1     1
    ##  9  2013     1     1
    ## 10  2013     1     1
    ## # ... with 336,766 more rows

## 9.4. Parte 4: Dplyr - mutate

#### 9.4.1.

#### 9.4.2. Compara tiempo_vuelo con horario_llegada - horario_salida. ¿Qué esperas ver? ¿Qué ves? ¿Qué necesitas hacer para arreglarlo?

``` r
select(flights, dep_time, arr_time)
```

    ## # A tibble: 336,776 x 2
    ##    dep_time arr_time
    ##       <int>    <int>
    ##  1      517      830
    ##  2      533      850
    ##  3      542      923
    ##  4      544     1004
    ##  5      554      812
    ##  6      554      740
    ##  7      555      913
    ##  8      557      709
    ##  9      557      838
    ## 10      558      753
    ## # ... with 336,766 more rows

``` r
mutate(flights, tiempo_vuelo = arr_time - dep_time)
```

    ## # A tibble: 336,776 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   tiempo_vuelo <int>

#### 9.4.3. Compara horario_salida, salida_programada, y atraso_salida. ¿Cómo esperarías que esos tres números estén relacionados?

*Podemos indicar que el atraso_salida = horario_salida -
salida_programada*

``` r
select(flights, dep_time, sched_dep_time, dep_delay)
```

    ## # A tibble: 336,776 x 3
    ##    dep_time sched_dep_time dep_delay
    ##       <int>          <int>     <dbl>
    ##  1      517            515         2
    ##  2      533            529         4
    ##  3      542            540         2
    ##  4      544            545        -1
    ##  5      554            600        -6
    ##  6      554            558        -4
    ##  7      555            600        -5
    ##  8      557            600        -3
    ##  9      557            600        -3
    ## 10      558            600        -2
    ## # ... with 336,766 more rows

``` r
transmute(flights, tiempo_vuel0 = dep_time - sched_dep_time)
```

    ## # A tibble: 336,776 x 1
    ##    tiempo_vuel0
    ##           <int>
    ##  1            2
    ##  2            4
    ##  3            2
    ##  4           -1
    ##  5          -46
    ##  6           -4
    ##  7          -45
    ##  8          -43
    ##  9          -43
    ## 10          -42
    ## # ... with 336,766 more rows

#### 9.4.4. Encuentra los 10 vuelos más retrasados utilizando una función de ordenamiento. ¿Cómo quieres manejar los empates? Lee atentamente la documentación de min_rank().

``` r
vuelos_retraso <- head(arrange(flights, desc(arr_delay)), 10)
vuelos.10 <- vuelos_retraso$arr_delay
min_rank(vuelos.10)
```

    ##  [1] 10  9  8  7  6  5  4  3  2  1

#### \*9.4.5. ¿Qué devuelve 1:3 + 1:10? ¿Por qué?

``` r
1:3 + 1:10 # Warning in 1:3 + 1:10: longitud de objeto mayor no es múltiplo de la longitud de uno menor
```

    ## Warning in 1:3 + 1:10: longitud de objeto mayor no es múltiplo de la longitud de
    ## uno menor

    ##  [1]  2  4  6  5  7  9  8 10 12 11

*Devuelve que la longitud del objeto más largo (1:10) no es un múltiplo
de la longitud del objeto más corto (1:3)*

#### 9.4.6 ¿Qué funciones trigonométricas proporciona R?

*R proporciona las funciones coseno, tangente y cotangente al igual que
sus inversas*

``` r
sin(pi/2) # seno
```

    ## [1] 1

``` r
cos(pi) # coseno
```

    ## [1] -1

``` r
tan(pi/4) # tangente
```

    ## [1] 1

``` r
asin(0.5)  # Arco seno
```

    ## [1] 0.5235988

``` r
acos(0.5)  # Arco coseno
```

    ## [1] 1.047198

``` r
atan(0.5)  # Arco tangente
```

    ## [1] 0.4636476
