
This repository
Pull requests
Issues
Gist
@shahrzadfeghhi
Sign out
Watch 0
Star 0
Fork 405 info201-s17/m12-apis
forked from INFO-201/m10-apis
Code  Pull requests 0  Projects 0  Wiki  Pulse  Graphs
Branch: complete Find file Copy pathm12-apis/exercise-5/exercise.R
f4a3a0f  6 days ago
@mkfreeman mkfreeman Updated ex4 and ex5 to httr
1 contributor
RawBlameHistory     
41 lines (32 sloc)  1.56 KB
### Exercise 5 ###
library(jsonlite)
library(dplyr)
library(httr)

# Write a function that allows you to specify a movie, then does the following:
GetReview <- function(movie) {
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # Your parameters should include a "query" and an "api_key"
  # Note: the HTTR library will take care of spaces in the arguments
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  api.key <- "42ade55b682b4270883a0ff250446f93"
  query.params <- list(query=movie, api_key = api.key)
  response <- GET(base.url, query = query.params)
  body <- content(response, "text")
  
  # Request data using your search query
  results <- fromJSON(body)
  
  # What type of variable does this return?
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flattened <- flatten(results$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  first.review <- flattened[1,]
  headline <- first.review$headline
  summary <- first.review$summary_short
  link <- first.review$link.url
  
  # Return an list of the three pieces of information from above
  info <- list(headline=headline, summary=summary, link=link)
  return(info)
}

# Test that your function works with a movie of your choice
KillBill <- GetReview('KillBill')
