context("Package internal functions")

test_that("KaMu API request function works", {    

  # Should return a list
  expect_is(query_kamu_api("term"), "list", "Should return a list.")
  
  # Non-existing endpoint
  expect_error(query_kamu_api("foo"), 
               info="Non-existing endpoint should raise an error.")
})

test_that("Cache works", { 
  
  # Cache the response
  suppressMessages(cached_1 <- query_kamu_api("term", cache=TRUE))
  # Ignore the cache
  fresh_data <- query_kamu_api("term", cache=FALSE)
  
  # Load from cache and compare to the previous data
  suppressMessages(cached_2 <-  query_kamu_api("term", cache=TRUE))
  
  expect_identical(cached_1, cached_2,
                   "Cached values should be the same")
  
  # Compare to the fresh data
  expect_identical(cached_1, fresh_data,
                   "Cached and fresh values should be the same")
  
})