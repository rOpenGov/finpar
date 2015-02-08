#' Replace all NULLs with NAs in a data frame.
#' 
#' @param x input data frame.
#' s
#' @return a data frame with all NULLs replaced with NAs.
#' 
#' @keywords internal
#' 
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
null_to_NA <- function(x) {
  x[sapply(x, is.null)] <- NA
  return(x)
}
