############################################
##### Visualization of Twitter Monitor #####
############################################

library(ggplot2)

load("../data/database.dataframe") # load database from file

## add 'frequency' column to database
freq <- vector(length=length(database$id),mode="numeric")
database <- cbind(database, freq)

## calculate frequency
for (i in 1:length(database$id)) {
  frequence <- database[database$created < database[i,]$created 
                        & database$created > database[i,]$created - 60*60
                        & database$tag == database[i,]$tag,]$id
  frequence <- length(frequence)
  database[i,]$freq <- frequence
}

## PLOTTING

# line plot
ggplot(data=database, aes(x=created)) + 
  geom_line(aes(y=freq, colour=tag)) + 
  scale_x_datetime("Last month", limits=c(Sys.time()-3600*24*30,max(database$created))) + 
  scale_y_continuous("Frequency")

ggsave(file='../plots/line-frequency.png', width=7, height=7, dpi=100)

### DEPRECATED

# bar plot
# ggplot(data=database, aes(x=created)) + 
#   geom_bar(aes(fill=..count..), binwidth=60*minutes) + 
#   scale_x_datetime("Date", limits=c(as.POSIXct('2014/08/01'),max(database$created))) + 
#   scale_y_continuous("Frequency", limits=c(0, max(database$freq)))
# 
# ggsave(file='../plots/bar-frequency.png', width=7, height=7, dpi=100)
