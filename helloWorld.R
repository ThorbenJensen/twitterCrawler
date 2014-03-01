tags <- commandArgs(TRUE)

for ( tag in tags ) {
  print(paste("running search for tag: ",tag,"..."))
  print("Hello World!") 
  Sys.sleep(1)
}
