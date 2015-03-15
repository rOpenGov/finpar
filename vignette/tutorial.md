---
title: "finpar tutorial"
author: rOpenGov
date: "2015-03-15"
output:
  html_document:
    theme: flatly
---
<!--
%\VignetteEngine{knitr::rmarkdown}
%\VignetteIndexEntry{finpar Markdown Vignette}
%\usepackage[utf8]{inputenc}
-->


Parliament of Finland: unofficial API client
===========

This R package provides tools to access Parliament of Finland data
from the unofficial [Kansan Muisti](http://kansanmuisti.fi) API. 

## Available data sources and tools

[Installation](#installation) (Installation)
[Usage](#usage) (Examples)  



## <a name="installation"></a>Installation

Install the development version:


```r
library(devtools)
install_github("ropengov/finpar")
```

Load the library:


```r
library(finpar)
```

Set UTF-8 encoding:


```r
Sys.setlocale(locale="UTF-8") 
```

## <a name="usage"></a>Usage

Get all the terms of the Finnish parliament in 1907-2011. 


```r
# Get all terms
all_terms <- term()
  
# Get a specific term defined by ID
term_2011 <- term(id=1)  
```

## Licensing and Citations

This work can be freely used, modified and distributed under the 
[MIT license](http://en.wikipedia.org/wiki/MIT_License).


```r
citation("finpar")
```

```
## 
## Kindly cite the finpar R package as follows:
## 
##   (C) Joona Lehtomaki 2014-2015).  finpar: R tools for Finnish
##   Parliament Data from the unofficial Kansan Muisti API URL:
##   http://ropengov.github.com/finpar
## 
## A BibTeX entry for LaTeX users is
## 
##   @Misc{,
##     title = {finpar: R tools for Finnish Parliament Data from the unofficial Kansan Muisti API},
##     author = {Joona Lehtomaki},
##     year = {2014-2015},
##   }
## 
## Many thanks to http://kansanmuisti.fi !
```

## Session info

This vignette was created with


```r
sessionInfo()
```

```
## R version 3.1.2 (2014-10-31)
## Platform: x86_64-pc-linux-gnu (64-bit)
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] finpar_0.0.2 httr_0.6.1   knitr_1.9   
## 
## loaded via a namespace (and not attached):
##  [1] assertthat_0.1    bitops_1.0-6      DBI_0.3.1        
##  [4] dplyr_0.4.1       evaluate_0.5.5    formatR_1.0      
##  [7] jsonlite_0.9.14   lazyeval_0.1.10   magrittr_1.5     
## [10] parallel_3.1.2    R.cache_0.10.0    Rcpp_0.11.5      
## [13] RCurl_1.95-4.5    R.methodsS3_1.7.0 R.oo_1.19.0      
## [16] R.utils_2.0.0     stringr_0.6.2     tools_3.1.2
```




