#######################
### Twitter Crawler ###
#######################


### DEFINE SEARCH TAGS HERE
tags="
katastrophe
massenpanik
hochwasser
wuppertal
soest
"

### EXECUTION OF R CRAWLER

echo 'source("src/twitter_crawler.R", chdir=T)' | R --slave --args $tags
