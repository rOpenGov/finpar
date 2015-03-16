context("Members of the Finnish Parliament")

test_that("Response is in correct form and dimensions", {    
  
  # Should return a list
  expect_is(member(), "list", "Should return a list.")
  
  # All members, n=432.
  all_members <- member()
  expect_equal(length(all_members), 432, info="There should be 432 memebers.")
})

test_that("API values are sane", {    
  # Get a single MP, Jörn Donner
  jörn_donner <- list(
      "activity_days_included"=1425,
      "activity_score"=NA,
      "age"=82,
      "all_posts"=NA,
      "birth_date"="1933-02-05",
      "birth_place"="Helsinki",
      "district_name"="Helsingin",
      "email"="jorn.donner@eduskunta.fi",
      "gender"="m",
      "given_names"="Jörn Johan",
      "homepage_link"=NA,
      "id"=30,
      "info_link"="http://www.eduskunta.fi/triphome/bin/hex5000.sh?hnro=109&kieli=su",
      "last_checked_time"=NA,
      "last_modified_time"="2015-03-15T04:27:59.185701",
      "name"="Donner Jörn",
      "origin_id"="109",
      "party"="/api/v1/party/r/",
      "party_associations"= list(
        list("begin"="1987-03-21",
             "end"="1995-03-23",
             "party"="r"),
        list("begin"="2007-01-05",
             "end"="2007-03-20",
             "party"="r"),
        list("begin"="2013-09-05",
             "end"= NULL,
             "party"="r")
        ),
      "phone"="(09) 432 3100",
      "photo"="/media/images/members/donner-jorn.jpg",
      "posts"=list("committee"=
                     list(
                      list("begin"="2013-11-07",
                            "committee"="Ulkoasiainvaliokunta",
                            "end"=NULL,
                            "role"="member")),
                   "ministry"=list(),
                   "speaker"=list()
      ),
      "print_name"="Jörn Donner",
      "resource_uri"="/api/v1/member/30/",
      "stats"=NA,
      "summary"="",
      "surname"="Donner",
      "terms"= list("1987", "1991", "2003", "2011"),
      "url_name"="donner-jorn",
      "wikipedia_link"=NA)
  
  expect_equal(member(id='30'), jörn_donner, 
                   info="Member data with id=30 not correct.")
  
  # Id does not exist
  expect_error(member(id=-1), info="Non-existing ID should cause an error.")
})