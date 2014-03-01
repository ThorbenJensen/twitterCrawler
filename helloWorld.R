setwd("/Users/thorbenje/r/")

# read .txt file on search tags

tags <- commandArgs(TRUE)

  
# tags <- read.csv("searchTerms.txt")

for ( tag in tags ) {
  
  print(paste("running search for tag: ",tag,"..."))
  print("Hello World!") 
  Sys.sleep(1)
}
