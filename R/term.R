#' Get all the terms of the Finnish parliament.
#' 
#' Returns all terms of the Finnish parliament 1907-2011. By default, each
#' term is 4 years long, but for various reasons the length may also be shorter.
#' 
#' @param id ID number to return information only on a given term. If no 
#' \code{id} is provided all terms are returned.
#' @param ... additional argumetns passed on to \code{query_kamu_api}, most
#' notably \code{cache} if needed.
#' 
#' @return data.frame of countries with the following columns:
#' 
#' \tabular{ll}{
#'  \code{begin} \tab Begin date. \cr
#'  \code{end} \tab End date. \cr
#'  \code{name} \tab Term name. \cr
#'  \code{id} \tab Term ID number. \cr
#' }
#' 
#' @importFrom dplyr select
#' 
#' @export
#' 
#' @seealso \link{code{query_kamu_api}}
#' 
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @examples \dontrun{
#' 
#' # Get all terms
#' all_terms <- term()
#'  
#' # Get a specific term defined by ID
#' term_2011 <- term(id=1)  
#' }
#'
term <- function(id=NULL, ...) {
  
  endpoint <- "term"
  # Term ID is not controlled by a query parameter, but rather by appending to
  # the enpoint.
  if (!is.null(id)) {
    endpoint <- paste0(endpoint, "/", id, "/")
  }
  
  # Get the response. Set limit to 40 (20 by default).
  r_term <- query_kamu_api(endpoint, query=list(limit=40), ...)

  # NOTE - this section could probably be refactored for common use ------------
  
  # [fixme] - Didn't figure out how to pass stringsAsFactors=FALSE in 
  # rbind.data.frame to do.call
  options(stringsAsFactors=FALSE)
  terms <- do.call("rbind.data.frame", r_term)
  options(stringsAsFactors=TRUE)
  # For some weird reason, row names need to be fixed manually
  row.names(terms) <- 1:nrow(terms)
  
  # ----------------------------------------------------------------------------
  
  terms <- select(terms, begin, end, name, id)
  
  return(terms)
}