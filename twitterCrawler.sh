#######################
### Twitter Crawler ###
#######################


### DEFINE SEARCH TAGS HERE
tags="
FLUT
KATASTROPHE
PANIK
GEFAHR
"

### EXECUTION OF R CRAWLER

R --slave --file=helloWorld.R --args $tags

