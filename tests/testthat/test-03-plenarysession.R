context("Plenary sessions of the Finnish Parliament")

test_that("Response is in correct form and dimensions", {    
  
  # Should return a list
  expect_is(plenary_session(), "data.frame", "Should return a data.frame.")
  
  # All members, n=..
  #all <- plenary_session()
  #expect_equal(length(all), ... , info="There should be ... elements")

})

test_that("API values are sane", {    
  # Get a single element, 
  

  
  expect_equal(as.vector(unlist(plenary_session(id='30'))), "/api/v1/plenary_session/30/", 
                   info="Plenary session data with id=30 not correct.")
  
  # Id does not exist
  expect_error(plenary_session(id=-1), info="Non-existing ID should cause an error.")
})