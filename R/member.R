#' Get all the members of the Finnish parliament, past and present.
#' 
#' Returns all members of the Finnish parliament (MP). 
#' 
#' @param id ID number to return information only on a MP. If no 
#' \code{id} is provided all MPs are returned.
#' @param ... additional arguments passed on to \code{query_kamu_api}, most
#' notably \code{cache} if needed.
#' 
#' @return list of MPs
#' 
#' @importFrom dplyr select
#' 
#' @export
#' 
#' @seealso \code{\link{query_kamu_api}}
#' 
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @examples \dontrun{
#' 
#' # Get all terms
#' all_members <- member()
#'  
#' # Get a specific MP defined by ID (Jörn Donner)
#' jörn_donner <- member(id=30)  
#' }
#'
member <- function(id=NULL, ...) {
  
  endpoint <- "member"
  # Member ID is not controlled by a query parameter, but rather by appending to
  # the enpoint.
  if (!is.null(id)) {
    endpoint <- paste0(endpoint, "/", id, "/")
  }
  
  # Get the response. Set limit to 440 (20 by default).
  r_member <- query_kamu_api(endpoint, query=list(limit=440), ...)
  
  # If there's only one mp, get rid of the outmost list structure
  if (length(r_member) == 1) {
    r_member <- r_member[[1]]
  }
  
  return(r_member)
  
}