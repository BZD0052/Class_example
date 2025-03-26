---
title: "Function and Iteration Homework"
author: "Bibek"
date: "2025-03-26"
output: 
  pdf_document:
            keep_md: yes
---
Iteration and functions

``` r
## Required packages
library(ggplot2)
library(drc) #dose response curve
```

```
## Warning: package 'drc' was built under R version 4.4.3
```

```
## Loading required package: MASS
```

```
## 
## 'drc' has been loaded.
```

```
## Please cite R and 'drc' if used for a publication,
```

```
## for references type 'citation()' and 'citation('drc')'.
```

```
## 
## Attaching package: 'drc'
```

```
## The following objects are masked from 'package:stats':
## 
##     gaussian, getInitial
```

``` r
library(tidyverse)
```

```
## Warning: package 'tidyverse' was built under R version 4.4.2
```

```
## Warning: package 'lubridate' was built under R version 4.4.2
```

```
## -- Attaching core tidyverse packages ------------------------ tidyverse 2.0.0 --
## v dplyr     1.1.4     v readr     2.1.5
## v forcats   1.0.0     v stringr   1.5.1
## v lubridate 1.9.4     v tibble    3.2.1
## v purrr     1.0.2     v tidyr     1.3.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
## x dplyr::select() masks MASS::select()
## i Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```
Function:
Reusable block of code designed to perform a specific task.

``` r
#Without function #(5*(degree_f - 32)/9)
(5*(32 - 32)/9)
```

```
## [1] 0
```

``` r
(5*(39 - 32)/9)
```

```
## [1] 3.888889
```

``` r
(5*(40 - 32)/9)
```

```
## [1] 4.444444
```

``` r
#Converting Fahrenheit to Celcius
F_to_C <- function(f_temp){
  celsius <- (5*(f_temp - 32)/9)
  return(celsius)
}
```
Function structure model:

sample.function.name <- function(.... variable.....){
  .... main code here.... 
   return(... output ...)
}

Example of function

``` r
#Using the fucntion
F_to_C(32)
```

```
## [1] 0
```

``` r
Temp <- c(32, 39, 40, 44, 42, 53, 63)
celcius_scale <- F_to_C(Temp)

#Result 
celcius_scale
```

```
## [1]  0.000000  3.888889  4.444444  6.666667  5.555556 11.666667 17.222222
```
Iteration:
Repeateadly using a block of code such as a loop.
Helps reduce copying and pasting errors.

``` r
#rep : this function allows you to repeat elements easily
rep("A", 3)
```

```
## [1] "A" "A" "A"
```

``` r
rep(c("A", "B"), 20)
```

```
##  [1] "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A"
## [20] "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B"
## [39] "A" "B"
```

``` r
rep(c("Bibek", "Rocks"), 5)
```

```
##  [1] "Bibek" "Rocks" "Bibek" "Rocks" "Bibek" "Rocks" "Bibek" "Rocks" "Bibek"
## [10] "Rocks"
```

``` r
rep(c(1, 2, 3), 3, each =3)
```

```
##  [1] 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3
```

``` r
#seq : this helps to write sequences of numbers easily
1:7
```

```
## [1] 1 2 3 4 5 6 7
```

``` r
seq(from=1, to =7)
```

```
## [1] 1 2 3 4 5 6 7
```

``` r
seq(from=0, to =20)
```

```
##  [1]  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

``` r
seq(from=1, to =30, by=2)
```

```
##  [1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27 29
```

``` r
# combine rep and seq

rep(seq(from=0, to =5, by=2), times=3, each=2)
```

```
##  [1] 0 0 2 2 4 4 0 0 2 2 4 4 0 0 2 2 4 4
```

``` r
#seq_along : this allows to generate a sequence of numbers based on non-integer values. 

LETTERS
```

```
##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
## [20] "T" "U" "V" "W" "X" "Y" "Z"
```

``` r
seq_along(LETTERS)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26
```

``` r
# THE for loop

for (i in 1:10){
  print(i*2)
}
```

```
## [1] 2
## [1] 4
## [1] 6
## [1] 8
## [1] 10
## [1] 12
## [1] 14
## [1] 16
## [1] 18
## [1] 20
```

``` r
#more complicated
for (i in -10:100){
  result <- F_to_C(i)
  print(result)
}
```

```
## [1] -23.33333
## [1] -22.77778
## [1] -22.22222
## [1] -21.66667
## [1] -21.11111
## [1] -20.55556
## [1] -20
## [1] -19.44444
## [1] -18.88889
## [1] -18.33333
## [1] -17.77778
## [1] -17.22222
## [1] -16.66667
## [1] -16.11111
## [1] -15.55556
## [1] -15
## [1] -14.44444
## [1] -13.88889
## [1] -13.33333
## [1] -12.77778
## [1] -12.22222
## [1] -11.66667
## [1] -11.11111
## [1] -10.55556
## [1] -10
## [1] -9.444444
## [1] -8.888889
## [1] -8.333333
## [1] -7.777778
## [1] -7.222222
## [1] -6.666667
## [1] -6.111111
## [1] -5.555556
## [1] -5
## [1] -4.444444
## [1] -3.888889
## [1] -3.333333
## [1] -2.777778
## [1] -2.222222
## [1] -1.666667
## [1] -1.111111
## [1] -0.5555556
## [1] 0
## [1] 0.5555556
## [1] 1.111111
## [1] 1.666667
## [1] 2.222222
## [1] 2.777778
## [1] 3.333333
## [1] 3.888889
## [1] 4.444444
## [1] 5
## [1] 5.555556
## [1] 6.111111
## [1] 6.666667
## [1] 7.222222
## [1] 7.777778
## [1] 8.333333
## [1] 8.888889
## [1] 9.444444
## [1] 10
## [1] 10.55556
## [1] 11.11111
## [1] 11.66667
## [1] 12.22222
## [1] 12.77778
## [1] 13.33333
## [1] 13.88889
## [1] 14.44444
## [1] 15
## [1] 15.55556
## [1] 16.11111
## [1] 16.66667
## [1] 17.22222
## [1] 17.77778
## [1] 18.33333
## [1] 18.88889
## [1] 19.44444
## [1] 20
## [1] 20.55556
## [1] 21.11111
## [1] 21.66667
## [1] 22.22222
## [1] 22.77778
## [1] 23.33333
## [1] 23.88889
## [1] 24.44444
## [1] 25
## [1] 25.55556
## [1] 26.11111
## [1] 26.66667
## [1] 27.22222
## [1] 27.77778
## [1] 28.33333
## [1] 28.88889
## [1] 29.44444
## [1] 30
## [1] 30.55556
## [1] 31.11111
## [1] 31.66667
## [1] 32.22222
## [1] 32.77778
## [1] 33.33333
## [1] 33.88889
## [1] 34.44444
## [1] 35
## [1] 35.55556
## [1] 36.11111
## [1] 36.66667
## [1] 37.22222
## [1] 37.77778
```

``` r
#to save the value 

celcius.df <- NULL # creat a null object
for (i in -10:100){   
  result <- data.frame(F_to_C(i), i)   #save the result in data frame at each iteration 
  celcius.df <- rbind.data.frame(celcius.df, result) #row bind with celcius.df
}

celcius.df
```

```
##       F_to_C.i.   i
## 1   -23.3333333 -10
## 2   -22.7777778  -9
## 3   -22.2222222  -8
## 4   -21.6666667  -7
## 5   -21.1111111  -6
## 6   -20.5555556  -5
## 7   -20.0000000  -4
## 8   -19.4444444  -3
## 9   -18.8888889  -2
## 10  -18.3333333  -1
## 11  -17.7777778   0
## 12  -17.2222222   1
## 13  -16.6666667   2
## 14  -16.1111111   3
## 15  -15.5555556   4
## 16  -15.0000000   5
## 17  -14.4444444   6
## 18  -13.8888889   7
## 19  -13.3333333   8
## 20  -12.7777778   9
## 21  -12.2222222  10
## 22  -11.6666667  11
## 23  -11.1111111  12
## 24  -10.5555556  13
## 25  -10.0000000  14
## 26   -9.4444444  15
## 27   -8.8888889  16
## 28   -8.3333333  17
## 29   -7.7777778  18
## 30   -7.2222222  19
## 31   -6.6666667  20
## 32   -6.1111111  21
## 33   -5.5555556  22
## 34   -5.0000000  23
## 35   -4.4444444  24
## 36   -3.8888889  25
## 37   -3.3333333  26
## 38   -2.7777778  27
## 39   -2.2222222  28
## 40   -1.6666667  29
## 41   -1.1111111  30
## 42   -0.5555556  31
## 43    0.0000000  32
## 44    0.5555556  33
## 45    1.1111111  34
## 46    1.6666667  35
## 47    2.2222222  36
## 48    2.7777778  37
## 49    3.3333333  38
## 50    3.8888889  39
## 51    4.4444444  40
## 52    5.0000000  41
## 53    5.5555556  42
## 54    6.1111111  43
## 55    6.6666667  44
## 56    7.2222222  45
## 57    7.7777778  46
## 58    8.3333333  47
## 59    8.8888889  48
## 60    9.4444444  49
## 61   10.0000000  50
## 62   10.5555556  51
## 63   11.1111111  52
## 64   11.6666667  53
## 65   12.2222222  54
## 66   12.7777778  55
## 67   13.3333333  56
## 68   13.8888889  57
## 69   14.4444444  58
## 70   15.0000000  59
## 71   15.5555556  60
## 72   16.1111111  61
## 73   16.6666667  62
## 74   17.2222222  63
## 75   17.7777778  64
## 76   18.3333333  65
## 77   18.8888889  66
## 78   19.4444444  67
## 79   20.0000000  68
## 80   20.5555556  69
## 81   21.1111111  70
## 82   21.6666667  71
## 83   22.2222222  72
## 84   22.7777778  73
## 85   23.3333333  74
## 86   23.8888889  75
## 87   24.4444444  76
## 88   25.0000000  77
## 89   25.5555556  78
## 90   26.1111111  79
## 91   26.6666667  80
## 92   27.2222222  81
## 93   27.7777778  82
## 94   28.3333333  83
## 95   28.8888889  84
## 96   29.4444444  85
## 97   30.0000000  86
## 98   30.5555556  87
## 99   31.1111111  88
## 100  31.6666667  89
## 101  32.2222222  90
## 102  32.7777778  91
## 103  33.3333333  92
## 104  33.8888889  93
## 105  34.4444444  94
## 106  35.0000000  95
## 107  35.5555556  96
## 108  36.1111111  97
## 109  36.6666667  98
## 110  37.2222222  99
## 111  37.7777778 100
```
Practical example fungicide sensitivity data.

``` r
EC50.data <- read.csv("Sample_data/EC50_all.csv")

isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == "ILSO_5-41c"] ~ 
                  EC50.data$conc[EC50.data$is == "ILSO_5-41c"], 
                fct = LL.4(fixed = c(NA, NA, NA, NA), 
                           names = c("Slope", "Lower", "Upper", "EC50")), 
                na.action = na.omit)
# outputs the summary of the paramters including the estimate, standard
# error, t-value, and p-value outputs it into a data frame called
# summary.mef.fit for 'summary of fit'
summary.fit <- data.frame(summary(isolate1)[[3]])
# outputs the summary of just the EC50 data including the estimate, standard
# error, upper and lower bounds of the 95% confidence intervals around the
# EC50
EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
           interval = "delta")[[1]]
```

```
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
```

``` r
##loop for above code

nm <- unique(EC50.data$is)
nm
```

```
##  [1] "ILSO_5-41c"      "ILSO_5-42c"      "ILSO_5-49b"      "ILSO_6-1"       
##  [5] "ILSO_6-12B"      "ILSO_6-2b"       "ILSO_6-33C"      "ILSO_6-39C"     
##  [9] "ILSO_6-15b"      "ILSO_6-28C"      "ILSO_6-34c"      "ILSO_6-35b"     
## [13] "ILSO_6-36b"      "INSO_1-13D"      "INSO_1-17C"      "INSO_1-17D"     
## [17] "INSO_1-23-C"     "INSO_1-28-C"     "INSO_1-28-D"     "INSO_1-52-B"    
## [21] "INSO_1-53A"      "INSO_2-57"       "INSO_3-45"       "INSO_3-49"      
## [25] "IASO_1-16.1h"    "IASO_1-16.2r"    "IASO_1-20.44rt"  "IASO_10-28.24rt"
## [29] "IASO_2-11.8"     "IASO_6-10.15h"   "IASO_6-34.31r"   "IASO_9-10.4h"   
## [33] "IASO_9-11.1h"    "IASO_9-24.27rd"  "IASO_9-29.33h"   "IASO_9-31.37h"  
## [37] "IASO_9-36.42rd"  "IASO_9-4.8h"     "KSSO_3-34"       "KSSO_5-21"      
## [41] "C-MISO2_1-19"    "MISO_5-9"        "MISO_8-23"       "C-MNSO_6-4"     
## [45] "C-MNSO2_1-1"     "C-MNSO2_1-19"    "C-MNSO2_2-10"    "MNSO_2-11"      
## [49] "MNSO_2-31"       "MNSO_2-52"       "MNSO_5-20"       "NESO_1-27"      
## [53] "NESO_3-20"       "NESO_4-20"       "NESO_4-38"       "NESO_4-40"      
## [57] "NESO_4-42"       "NESO_4-47"       "NDSO_4-1"        "NDSO_4-18"      
## [61] "NDSO_4-2"        "NDSO_4-43"       "NDSO_4-45"       "NDSO_5-22"      
## [65] "NDSO_5-36"       "NDSO_5-46"       "NDSO_5-49"       "NDSO_5-9"       
## [69] "C-SDSO2_5-16"    "C-SDSO2_5-17"    "C-SDSO2_5-29"    "C-SDSO2_5-8"    
## [73] "C-SDSO2_5-9"     "C-SDSO2_6-33"    "V-SDSO2_5-41"
```

``` r
for (i in seq_along(nm)) {
  isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == nm[[i]]] ~ 
                    EC50.data$conc[EC50.data$is == nm[[i]]], 
                  fct = LL.4(fixed = c(NA, NA, NA, NA), 
                             names = c("Slope", "Lower", "Upper", "EC50")), 
                  na.action = na.omit)
  print(nm[[i]])
  summary.fit <- data.frame(summary(isolate1)[[3]])
  EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
             interval = "delta")[[1]]
  EC50
}
```

```
## [1] "ILSO_5-41c"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
## [1] "ILSO_5-42c"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.248655   0.028485 0.190633 0.306678
## [1] "ILSO_5-49b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.167592   0.010197 0.146821 0.188362
## [1] "ILSO_6-1"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
## [1] "ILSO_6-12B"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.184271   0.036047 0.110846 0.257695
## [1] "ILSO_6-2b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.227432   0.040614 0.144704 0.310160
## [1] "ILSO_6-33C"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.101863   0.003487 0.094760 0.108965
## [1] "ILSO_6-39C"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
## [1] "ILSO_6-15b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.123288   0.014018 0.094735 0.151841
## [1] "ILSO_6-28C"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
## [1] "ILSO_6-34c"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.69465    0.39164 -0.10310  1.49240
## [1] "ILSO_6-35b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.113975   0.012773 0.087958 0.139993
## [1] "ILSO_6-36b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.217436   0.027934 0.160536 0.274335
## [1] "INSO_1-13D"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
## [1] "INSO_1-17C"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.18336    0.01293 0.15695 0.20977
## [1] "INSO_1-17D"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.186929   0.034023 0.117626 0.256232
## [1] "INSO_1-23-C"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
## [1] "INSO_1-28-C"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.200379   0.020104 0.159429 0.241329
## [1] "INSO_1-28-D"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.30812    0.24033 -0.18142  0.79765
## [1] "INSO_1-52-B"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.227103   0.019697 0.186983 0.267224
## [1] "INSO_1-53A"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.20009    0.01448 0.17059 0.22958
## [1] "INSO_2-57"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.223966   0.058089 0.105642 0.342290
## [1] "INSO_3-45"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.288001   0.074597 0.136052 0.439951
## [1] "INSO_3-49"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.369422   0.077015 0.212549 0.526296
## [1] "IASO_1-16.1h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.118335   0.011733 0.094404 0.142265
## [1] "IASO_1-16.2r"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.189945   0.013146 0.163097 0.216793
## [1] "IASO_1-20.44rt"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
## [1] "IASO_10-28.24rt"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.190146   0.027182 0.134779 0.245514
## [1] "IASO_2-11.8"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.16580    0.01082 0.14376 0.18784
## [1] "IASO_6-10.15h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.183297   0.017237 0.148187 0.218407
## [1] "IASO_6-34.31r"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.130147   0.010705 0.108342 0.151951
## [1] "IASO_9-10.4h"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
## [1] "IASO_9-11.1h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.123034   0.006696 0.109395 0.136673
## [1] "IASO_9-24.27rd"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
## [1] "IASO_9-29.33h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.198000   0.019219 0.158853 0.237148
## [1] "IASO_9-31.37h"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
## [1] "IASO_9-36.42rd"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.159440   0.010423 0.138209 0.180671
## [1] "IASO_9-4.8h"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
## [1] "KSSO_3-34"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50  0.427766   0.230327 -0.041395  0.896927
## [1] "KSSO_5-21"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
## [1] "C-MISO2_1-19"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.106855   0.022010 0.062022 0.151687
## [1] "MISO_5-9"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.156127   0.021551 0.112229 0.200025
## [1] "MISO_8-23"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.308127   0.019233 0.268951 0.347304
## [1] "C-MNSO_6-4"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.117014   0.012255 0.092052 0.141977
## [1] "C-MNSO2_1-1"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.177036   0.011915 0.152767 0.201305
## [1] "C-MNSO2_1-19"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.234268   0.017095 0.199447 0.269088
## [1] "C-MNSO2_2-10"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
## [1] "MNSO_2-11"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.201737   0.012113 0.176998 0.226476
## [1] "MNSO_2-31"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.306968   0.078617 0.146831 0.467105
## [1] "MNSO_2-52"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.289597   0.081347 0.123464 0.455730
## [1] "MNSO_5-20"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.213191   0.024013 0.164278 0.262104
## [1] "NESO_1-27"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.42728    0.28840 -0.16016  1.01472
## [1] "NESO_3-20"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
## [1] "NESO_4-20"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
## [1] "NESO_4-38"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.16319    0.01761 0.12732 0.19906
## [1] "NESO_4-40"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.20914    0.01403 0.18056 0.23772
## [1] "NESO_4-42"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.17905    0.00849 0.16171 0.19639
## [1] "NESO_4-47"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
## [1] "NDSO_4-1"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
## [1] "NDSO_4-18"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.247784   0.036714 0.173000 0.322567
## [1] "NDSO_4-2"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.235268   0.026532 0.181223 0.289313
## [1] "NDSO_4-43"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.066926   0.010213 0.046123 0.087728
## [1] "NDSO_4-45"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.174492   0.010501 0.153102 0.195882
## [1] "NDSO_5-22"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.181951   0.028336 0.124233 0.239669
## [1] "NDSO_5-36"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.195576   0.013476 0.168125 0.223027
## [1] "NDSO_5-46"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.168410   0.010795 0.146421 0.190399
## [1] "NDSO_5-49"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
## [1] "NDSO_5-9"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.162666   0.011066 0.140126 0.185206
## [1] "C-SDSO2_5-16"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.147113   0.008233 0.130343 0.163883
## [1] "C-SDSO2_5-17"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
## [1] "C-SDSO2_5-29"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.118886   0.004502 0.109716 0.128057
## [1] "C-SDSO2_5-8"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.206342   0.016866 0.171988 0.240696
## [1] "C-SDSO2_5-9"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.175509   0.013954 0.147086 0.203932
## [1] "C-SDSO2_6-33"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.65376    0.63282 -0.63525  1.94277
## [1] "V-SDSO2_5-41"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.211026   0.012571 0.185419 0.236633
```
Saving each iteration output for above code

``` r
EC50.ll4 <- NULL # create a null object 
for (i in seq_along(nm)) {
  isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == nm[[i]]] ~ 
                    EC50.data$conc[EC50.data$is == nm[[i]]], 
                  fct = LL.4(fixed = c(NA, NA, NA, NA), 
                             names = c("Slope", "Lower", "Upper", "EC50")), 
                  na.action = na.omit)
  print(nm[[i]])
  summary.fit <- data.frame(summary(isolate1)[[3]])
   EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
             interval = "delta")[[1]]
  EC50
  isolate.ec_i <- data.frame(nm[[i]], EC50) # create a one row dataframe containing just the isolate name and the EC50
  colnames(isolate.ec_i) <- c("Isolate", "EC50") # change the column names
  # Then we need to append our one row dataframe to our null dataframe we created before
  # and save it as EC50.ll4. 
  EC50.ll4 <- rbind.data.frame(EC50.ll4, isolate.ec_i)
}
```

```
## [1] "ILSO_5-41c"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
## [1] "ILSO_5-42c"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.248655   0.028485 0.190633 0.306678
## [1] "ILSO_5-49b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.167592   0.010197 0.146821 0.188362
## [1] "ILSO_6-1"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
## [1] "ILSO_6-12B"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.184271   0.036047 0.110846 0.257695
## [1] "ILSO_6-2b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.227432   0.040614 0.144704 0.310160
## [1] "ILSO_6-33C"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.101863   0.003487 0.094760 0.108965
## [1] "ILSO_6-39C"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
## [1] "ILSO_6-15b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.123288   0.014018 0.094735 0.151841
## [1] "ILSO_6-28C"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
## [1] "ILSO_6-34c"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.69465    0.39164 -0.10310  1.49240
## [1] "ILSO_6-35b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.113975   0.012773 0.087958 0.139993
## [1] "ILSO_6-36b"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.217436   0.027934 0.160536 0.274335
## [1] "INSO_1-13D"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
## [1] "INSO_1-17C"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.18336    0.01293 0.15695 0.20977
## [1] "INSO_1-17D"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.186929   0.034023 0.117626 0.256232
## [1] "INSO_1-23-C"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
## [1] "INSO_1-28-C"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.200379   0.020104 0.159429 0.241329
## [1] "INSO_1-28-D"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.30812    0.24033 -0.18142  0.79765
## [1] "INSO_1-52-B"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.227103   0.019697 0.186983 0.267224
## [1] "INSO_1-53A"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.20009    0.01448 0.17059 0.22958
## [1] "INSO_2-57"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.223966   0.058089 0.105642 0.342290
## [1] "INSO_3-45"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.288001   0.074597 0.136052 0.439951
## [1] "INSO_3-49"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.369422   0.077015 0.212549 0.526296
## [1] "IASO_1-16.1h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.118335   0.011733 0.094404 0.142265
## [1] "IASO_1-16.2r"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.189945   0.013146 0.163097 0.216793
## [1] "IASO_1-20.44rt"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
## [1] "IASO_10-28.24rt"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.190146   0.027182 0.134779 0.245514
## [1] "IASO_2-11.8"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.16580    0.01082 0.14376 0.18784
## [1] "IASO_6-10.15h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.183297   0.017237 0.148187 0.218407
## [1] "IASO_6-34.31r"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.130147   0.010705 0.108342 0.151951
## [1] "IASO_9-10.4h"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
## [1] "IASO_9-11.1h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.123034   0.006696 0.109395 0.136673
## [1] "IASO_9-24.27rd"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
## [1] "IASO_9-29.33h"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.198000   0.019219 0.158853 0.237148
## [1] "IASO_9-31.37h"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
## [1] "IASO_9-36.42rd"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.159440   0.010423 0.138209 0.180671
## [1] "IASO_9-4.8h"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
## [1] "KSSO_3-34"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50  0.427766   0.230327 -0.041395  0.896927
## [1] "KSSO_5-21"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
## [1] "C-MISO2_1-19"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.106855   0.022010 0.062022 0.151687
## [1] "MISO_5-9"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.156127   0.021551 0.112229 0.200025
## [1] "MISO_8-23"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.308127   0.019233 0.268951 0.347304
## [1] "C-MNSO_6-4"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.117014   0.012255 0.092052 0.141977
## [1] "C-MNSO2_1-1"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.177036   0.011915 0.152767 0.201305
## [1] "C-MNSO2_1-19"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.234268   0.017095 0.199447 0.269088
## [1] "C-MNSO2_2-10"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
## [1] "MNSO_2-11"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.201737   0.012113 0.176998 0.226476
## [1] "MNSO_2-31"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.306968   0.078617 0.146831 0.467105
## [1] "MNSO_2-52"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.289597   0.081347 0.123464 0.455730
## [1] "MNSO_5-20"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.213191   0.024013 0.164278 0.262104
## [1] "NESO_1-27"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.42728    0.28840 -0.16016  1.01472
## [1] "NESO_3-20"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
## [1] "NESO_4-20"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
## [1] "NESO_4-38"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.16319    0.01761 0.12732 0.19906
## [1] "NESO_4-40"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.20914    0.01403 0.18056 0.23772
## [1] "NESO_4-42"
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.17905    0.00849 0.16171 0.19639
## [1] "NESO_4-47"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
## [1] "NDSO_4-1"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
## [1] "NDSO_4-18"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.247784   0.036714 0.173000 0.322567
## [1] "NDSO_4-2"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.235268   0.026532 0.181223 0.289313
## [1] "NDSO_4-43"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.066926   0.010213 0.046123 0.087728
## [1] "NDSO_4-45"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.174492   0.010501 0.153102 0.195882
## [1] "NDSO_5-22"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.181951   0.028336 0.124233 0.239669
## [1] "NDSO_5-36"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.195576   0.013476 0.168125 0.223027
## [1] "NDSO_5-46"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.168410   0.010795 0.146421 0.190399
## [1] "NDSO_5-49"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
## [1] "NDSO_5-9"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.162666   0.011066 0.140126 0.185206
## [1] "C-SDSO2_5-16"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.147113   0.008233 0.130343 0.163883
## [1] "C-SDSO2_5-17"
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
## [1] "C-SDSO2_5-29"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.118886   0.004502 0.109716 0.128057
## [1] "C-SDSO2_5-8"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.206342   0.016866 0.171988 0.240696
## [1] "C-SDSO2_5-9"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.175509   0.013954 0.147086 0.203932
## [1] "C-SDSO2_6-33"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.65376    0.63282 -0.63525  1.94277
## [1] "V-SDSO2_5-41"
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.211026   0.012571 0.185419 0.236633
```

``` r
EC50.ll4
```

```
##            Isolate       EC50
## 1       ILSO_5-41c 0.10703185
## 2       ILSO_5-42c 0.24865540
## 3       ILSO_5-49b 0.16759162
## 4         ILSO_6-1 0.10826767
## 5       ILSO_6-12B 0.18427088
## 6        ILSO_6-2b 0.22743219
## 7       ILSO_6-33C 0.10186268
## 8       ILSO_6-39C 0.11027208
## 9       ILSO_6-15b 0.12328848
## 10      ILSO_6-28C 0.09987271
## 11      ILSO_6-34c 0.69464915
## 12      ILSO_6-35b 0.11397531
## 13      ILSO_6-36b 0.21743559
## 14      INSO_1-13D 0.14323325
## 15      INSO_1-17C 0.18335968
## 16      INSO_1-17D 0.18692904
## 17     INSO_1-23-C 0.02992881
## 18     INSO_1-28-C 0.20037911
## 19     INSO_1-28-D 0.30811657
## 20     INSO_1-52-B 0.22710347
## 21      INSO_1-53A 0.20008613
## 22       INSO_2-57 0.22396630
## 23       INSO_3-45 0.28800125
## 24       INSO_3-49 0.36942218
## 25    IASO_1-16.1h 0.11833479
## 26    IASO_1-16.2r 0.18994506
## 27  IASO_1-20.44rt 0.04832956
## 28 IASO_10-28.24rt 0.19014621
## 29     IASO_2-11.8 0.16580086
## 30   IASO_6-10.15h 0.18329731
## 31   IASO_6-34.31r 0.13014679
## 32    IASO_9-10.4h 0.19152001
## 33    IASO_9-11.1h 0.12303394
## 34  IASO_9-24.27rd 0.19355935
## 35   IASO_9-29.33h 0.19800048
## 36   IASO_9-31.37h 0.11144825
## 37  IASO_9-36.42rd 0.15944012
## 38     IASO_9-4.8h 0.13726542
## 39       KSSO_3-34 0.42776565
## 40       KSSO_5-21 0.09917381
## 41    C-MISO2_1-19 0.10685464
## 42        MISO_5-9 0.15612701
## 43       MISO_8-23 0.30812750
## 44      C-MNSO_6-4 0.11701436
## 45     C-MNSO2_1-1 0.17703620
## 46    C-MNSO2_1-19 0.23426773
## 47    C-MNSO2_2-10 0.01726587
## 48       MNSO_2-11 0.20173727
## 49       MNSO_2-31 0.30696808
## 50       MNSO_2-52 0.28959682
## 51       MNSO_5-20 0.21319109
## 52       NESO_1-27 0.42727958
## 53       NESO_3-20 0.09008340
## 54       NESO_4-20 0.15730773
## 55       NESO_4-38 0.16318698
## 56       NESO_4-40 0.20913713
## 57       NESO_4-42 0.17904661
## 58       NESO_4-47 0.15875693
## 59        NDSO_4-1 0.13526673
## 60       NDSO_4-18 0.24778376
## 61        NDSO_4-2 0.23526824
## 62       NDSO_4-43 0.06692569
## 63       NDSO_4-45 0.17449202
## 64       NDSO_5-22 0.18195115
## 65       NDSO_5-36 0.19557585
## 66       NDSO_5-46 0.16841047
## 67       NDSO_5-49 0.15469803
## 68        NDSO_5-9 0.16266600
## 69    C-SDSO2_5-16 0.14711258
## 70    C-SDSO2_5-17 0.13769070
## 71    C-SDSO2_5-29 0.11888637
## 72     C-SDSO2_5-8 0.20634225
## 73     C-SDSO2_5-9 0.17550901
## 74    C-SDSO2_6-33 0.65376130
## 75    V-SDSO2_5-41 0.21102570
```

Using tidyverse

``` r
EC50.data %>%
  group_by(is) %>%
  nest() %>%  # allow for sub dataframe within a dataframe
  mutate(ll.4.mod = map(data, ~drm(.$relgrowth ~ .$conc,  # create a ll4 model column equal to summary output of drm function over data
                                   fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                              names = c("Slope", "Lower", "Upper", "EC50"))))) %>%
  mutate(ec50 = map(ll.4.mod, ~ED(., 
                                  respLev = c(50), 
                                  type = "relative",
                                  interval = "delta")[[1]])) %>%
  unnest(ec50) ##see the output for ec50
```

```
## Warning: There were 19 warnings in `mutate()`.
## The first warning was:
## i In argument: `ll.4.mod = map(...)`.
## i In group 4: `is = "C-MNSO2_2-10"`.
## Caused by warning in `log()`:
## ! NaNs produced
## i Run `dplyr::last_dplyr_warnings()` to see the 18 remaining warnings.
```

```
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.106855   0.022010 0.062022 0.151687
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.177036   0.011915 0.152767 0.201305
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.234268   0.017095 0.199447 0.269088
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.117014   0.012255 0.092052 0.141977
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.147113   0.008233 0.130343 0.163883
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.118886   0.004502 0.109716 0.128057
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.206342   0.016866 0.171988 0.240696
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.175509   0.013954 0.147086 0.203932
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.65376    0.63282 -0.63525  1.94277
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.118335   0.011733 0.094404 0.142265
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.189945   0.013146 0.163097 0.216793
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.190146   0.027182 0.134779 0.245514
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.16580    0.01082 0.14376 0.18784
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.183297   0.017237 0.148187 0.218407
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.130147   0.010705 0.108342 0.151951
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.123034   0.006696 0.109395 0.136673
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.198000   0.019219 0.158853 0.237148
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.159440   0.010423 0.138209 0.180671
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.248655   0.028485 0.190633 0.306678
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.167592   0.010197 0.146821 0.188362
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.184271   0.036047 0.110846 0.257695
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.123288   0.014018 0.094735 0.151841
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.227432   0.040614 0.144704 0.310160
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.101863   0.003487 0.094760 0.108965
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.69465    0.39164 -0.10310  1.49240
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.113975   0.012773 0.087958 0.139993
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.217436   0.027934 0.160536 0.274335
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.18336    0.01293 0.15695 0.20977
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.186929   0.034023 0.117626 0.256232
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.200379   0.020104 0.159429 0.241329
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.30812    0.24033 -0.18142  0.79765
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.227103   0.019697 0.186983 0.267224
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.20009    0.01448 0.17059 0.22958
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.223966   0.058089 0.105642 0.342290
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.288001   0.074597 0.136052 0.439951
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.369422   0.077015 0.212549 0.526296
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50  0.427766   0.230327 -0.041395  0.896927
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.156127   0.021551 0.112229 0.200025
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.308127   0.019233 0.268951 0.347304
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.201737   0.012113 0.176998 0.226476
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.306968   0.078617 0.146831 0.467105
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.289597   0.081347 0.123464 0.455730
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.213191   0.024013 0.164278 0.262104
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.247784   0.036714 0.173000 0.322567
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.235268   0.026532 0.181223 0.289313
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.066926   0.010213 0.046123 0.087728
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.174492   0.010501 0.153102 0.195882
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.181951   0.028336 0.124233 0.239669
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.195576   0.013476 0.168125 0.223027
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.168410   0.010795 0.146421 0.190399
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.162666   0.011066 0.140126 0.185206
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50  0.42728    0.28840 -0.16017  1.01472
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.16319    0.01761 0.12732 0.19906
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.20914    0.01403 0.18056 0.23772
## 
## Estimated effective doses
## 
##        Estimate Std. Error   Lower   Upper
## e:1:50  0.17905    0.00849 0.16171 0.19639
## 
## Estimated effective doses
## 
##         Estimate Std. Error     Lower     Upper
## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
## 
## Estimated effective doses
## 
##        Estimate Std. Error    Lower    Upper
## e:1:50 0.211026   0.012571 0.185419 0.236633
```

```
## # A tibble: 75 x 4
## # Groups:   is [75]
##    is         data               ll.4.mod   ec50
##    <chr>      <list>             <list>    <dbl>
##  1 ILSO_5-41c <tibble [36 x 11]> <drc>    0.107 
##  2 ILSO_5-42c <tibble [36 x 11]> <drc>    0.249 
##  3 ILSO_5-49b <tibble [36 x 11]> <drc>    0.168 
##  4 ILSO_6-1   <tibble [36 x 11]> <drc>    0.108 
##  5 ILSO_6-12B <tibble [36 x 11]> <drc>    0.184 
##  6 ILSO_6-2b  <tibble [36 x 11]> <drc>    0.227 
##  7 ILSO_6-33C <tibble [36 x 11]> <drc>    0.102 
##  8 ILSO_6-39C <tibble [36 x 11]> <drc>    0.110 
##  9 ILSO_6-15b <tibble [36 x 11]> <drc>    0.123 
## 10 ILSO_6-28C <tibble [36 x 11]> <drc>    0.0999
## # i 65 more rows
```

