#' Query KaMu API against a given endpoint.
#' 
#' Function provides a single function to query KaMU API and an cache 
#' implementation. It also defines the base URL scheme for the API. API resource
#' parameters are provided a
#' 
#' @note All NULL values from JSON responses are replaced by NAs.
#' 
#' @param endpoint A character URL defining the queried endpoint.
#' @param query list of query parameters.
#' @param cache  Sets the cache mode: \code{TRUE} = Use cache if available and 
#' save to cache, \code{FALSE} = Ignore cache if available and do not save to 
#' cache, \code{"flush"} = Ignore cache if available and save to cache.
#' 
#' @return httr response object (JSON parsed to a list). 
#' 
#' @note Currently response meta data is not used for anything.
#' 
#' @importFrom httr GET
#' @importFrom R.cache loadCache
#' @importFrom R.cache saveCache
#' @importFrom httr status_code
#' @importFrom httr content
#' @keywords internal
#' 
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @examples \dontrun{
#' # Example using members
#' members <- query_kamu_api("member")
#' # Change query limit (default = 20)
#' members <- query_kamu_api("member", query=list(limit=30))
#' }
#' 
query_kamu_api <- function(endpoint, query=NULL, cache=FALSE) {
  
  # Base URL for KaMu API
  base_url <- "http://dev.kansanmuisti.fi"
  # Construct the full endpoint
  endpoint <- paste0("api/v1/", endpoint)
  
  r_content <- NULL
  # Generate a key that is used with the cache
  key <- list(endpoint, query)
  
  if (cache == TRUE) {
    r_content <- loadCache(key, suffix="finpar.Rcache")
  }
  if (!is.null(r_content)) {
    message("Loaded cached data")
  } else {
      r <- GET(base_url, path = endpoint, query = query)

      # Check the request succeeded
      if (status_code(r) == 400) {
        stop("Bad request, check the query parameters.")
      } else if (status_code(r) == 404) {
        stop("Endpoint URI ", paste0(base_url, "/", endpoint), " not found.")
      } else if (status_code(r) >= 500) {
        stop("Request caused server side error or timeout.")
      } else if (status_code(r) != 200) {
        stop("Unspecified error occured.")
      }
      
      r_content <- content(r)
      
      if (cache == TRUE || cache == 'flush') {
        saveCache(r_content, key=key, suffix="finpar.Rcache")
      }
  }
  # Due to some inconsistencies in the how different endpoints are handled,
  # the response might be a list with "meta" and "objects" sections, or then
  # just the data. Check for this.
  
  if ("objects" %in% names(r_content)) {
    dat <- r_content[["objects"]]
  } else {
    # Create a list so the response has the same structure as in the case of
    # multiple response items.
    dat <- list(r_content)
  }
  
  # Replace NULLs with NAs
  dat <- lapply(dat, null_to_NA)
  
  return(dat)
}
