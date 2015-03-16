context("Members of the Finnish Parliament")

test_that("Response is in correct form and dimensions", {    
  
  # Should return a list
  expect_is(member(), "list", "Should return a list.")
  
  # All members, n=432.
  all_members <- member()
  expect_equal(length(all_members), 432, info="There should be 432 memebers.")
})
