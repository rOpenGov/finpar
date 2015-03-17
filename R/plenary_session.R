#' Get all the plenary_sessions of the Finnish parliament, past and present.
#' 
#' Returns all plenary_sessions of the Finnish parliament (MP). 
#' 
#' @param id ID number to return information only on a MP. If no 
#' \code{id} is provided all MPs are returned.
#' @param ... additional arguments passed on to \code{query_kamu_api}, most
#' notably \code{cache} if needed.
#' 
#' @return Plenary session data in long data.frame format with the following fields: 
#'   \itemize{
#'     \item{id}{Plenary session id}
#'     \item{field}{Data field name}
#'     \item{element}{Counter for elements in the given data field. Certain fields contain a list of values. This is used to distinguish between multiple list elements.}
#'     \item{value}{Data field value}
#'   }
#' 
#' @importFrom reshape2 melt
#' @importFrom dplyr rbind_all
#' 
#' @export
#' 
#' @seealso \code{\link{query_kamu_api}}
#' 
#' @author Leo Lahti <leo.lahti@@iki.fi>
#' 
#' @examples \dontrun{
#' 
#' # Get all terms
#' all_plenary_sessions <- plenary_session()
#'  
#' # Get a specific MP defined by ID (Jorn Donner)
#' session <- plenary_session(id=30)  
#' }
#'
plenary_session <- function(id=NULL, ...) {
  
  endpoint <- "plenary_session"

  # Plenary_Session ID is not controlled by a query parameter, but rather by appending to
  # the enpoint.
  if (!is.null(id)) {
    endpoint <- paste0(endpoint, "/", id, "/")
  }
  
  # FIXME: how to automatically determine the correct query limit number?
  # Get the response. Set limit to 440 (20 by default).
  response <- query_kamu_api(endpoint, query=list(limit=1000), ...)
 
  # Replace empty lists by NA
  inds <- sapply(response, function (x) {length(x$plenary_votes)}) == 0
  response[inds] <- lapply(response[inds], function (x) {x$plenary_votes <- NA; x})
 
  # melt each element
  # ensure all elements have the L2 column (for later rbind)
  responses <- lapply(response, function (x) {xx <- melt(x); 
  	       	if (ncol(xx) == 2) {xx$L2 <- 1} else {xx$L2[is.na(xx$L2)] <- 1}; xx})

  # add the id to its own column
  responses <- lapply(responses, function (x) {
  	       			 x$id <- x[x$L1 == "id", "value"]; 
  	       			 x[!x$L1 == "id", ]})

  # bind all elements
  responses <- rbind_all(responses)

  # rename and arrange columns
  names(responses) <- c("value", "field", "element", "id")
  responses <- responses[, c("id", "field", "element", "value")]

  return(responses)
  
}




