#######################
### Twitter Crawler ###
#######################


### DEFINE SEARCH TAGS HERE
tags="
obama
flut
katastrophe
panik
gefahr
"

### EXECUTION OF R CRAWLER

echo 'source("src/twitter_crawler.R", chdir=T)' | R --slave
