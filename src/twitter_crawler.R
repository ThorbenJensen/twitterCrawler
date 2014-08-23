#################################
### GET TWEETS WITH HASH TAGS ###
#################################

### load packages and database
library(twitteR)
load("../data/database.dataframe")

### register with twitter
load("twitter_credentials")
registerTwitterOAuth(twitCred)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", 
                                                 "cacert.pem",              
                                                 package = "RCurl")))

### search twitter for 'searchterm' and add to 'database'
search <- function( searchterm, database ) {
  # get search results
  tweets <- list()
  tweets <- searchTwitter(paste("#",searchterm,sep=""), 
                          n=1500, lang="de", retryOnRateLimit=2)
  tweets <- twListToDF(tweets)
  length(tweets$text)
  
  # add new searchterm column 'tag'
  tweets <- cbind( rep(searchterm,length(tweets$text)), tweets)
  colnames(tweets)[1] <- "tag"
  
  # write new tweets to database
  database <- rbind(tweets, database)
  
  # delete redundant lines
  database <- unique(database)
  
  return(database)
}

### MAIN PROCEDURE

# retrieve search tags from command line arguments
tags <- commandArgs(TRUE)
print("Recieved search tags:")
print(tags)

# for all tags: do search and update database
for ( tag in tags ) {  
  print(paste("running search for tag: ",tag,"..."))
  database <- search(tag, database) 
}

print("finished search. saving database ...")

#sort database by id and save
database <- database[order(database$id, decreasing=TRUE), ]
save(database,file="../data/database.dataframe")

print("saved database.")