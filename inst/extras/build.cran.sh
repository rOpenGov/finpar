# Roxygen tips:
# http://r-pkgs.had.co.nz/man.html

/usr/bin/R CMD BATCH document.R
#/usr/bin/R CMD build ../../ --no-build-vignettes
/usr/bin/R CMD build ../../
#/usr/bin/R CMD build ../../ 
/usr/bin/R CMD check --as-cran finpar_0.0.2.tar.gz
/usr/bin/R CMD INSTALL finpar_0.0.2.tar.gz
#/usr/bin/R CMD BATCH document.R

