context("Terms of the Finnish Parliament")

test_that("Response is in correct form and dimensions", {    
  
  # Should return a data.frame
  expect_is(term(), "data.frame", "Should return a data frame.")
  
  # All terms, n=36.
  all_terms <- term()
  expect_equal(nrow(all_terms), 36, info="There should be 36 terms.")
  expect_equal(ncol(all_terms), 4, info="There should be 4 fields.")
  expect_equal(names(all_terms), c("begin", "end", "name", "id"), 
               info="Data frame name not correct")
})

test_that("API values are sane", {    
  # Latest 2011 -> term
  latest_term <- data.frame(begin="2011-04-20", end=NA, name='2011', id=1,
                            stringsAsFactors=FALSE)
  expect_equal(term(id='1'), latest_term, 
                   info="Term data with id=1 not correct.")
  
  # Id does not exist
  expect_error(term(id=-1), info="Non-existing ID should cause an error.")
})