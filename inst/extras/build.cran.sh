# Roxygen tips:
# http://r-pkgs.had.co.nz/man.html

/usr/bin/R CMD BATCH document.R
/usr/bin/R CMD build ../../ #--no-build-vignettes --no-tests
/usr/bin/R CMD check --as-cran finpar_0.1.2.tar.gz #--no-tests
/usr/bin/R CMD INSTALL finpar_0.1.2.tar.gz #--no-tests
#/usr/bin/R CMD BATCH document.R

