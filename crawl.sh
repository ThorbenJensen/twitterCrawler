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

R --slave --file=twitter_crawler.R --args $tags

