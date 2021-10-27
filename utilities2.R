#Function One: Filter Variables by Theme or Group

similar_categories <- function(string){
  num <- grep(string, dd$category, ignore.case = T)
  tabl <- data.frame(dd[num,])
  return(tabl)
}

#Function Two: Locate a Specific String
descript <- function(statement){
  these <- grepl(statement, dd$definition, ignore.case = T)
  vec <- dd[these,]
  return(vec$root)
}


#Function Three: Filter by Time Periods
func <-function(star,fini){
  #create the data frame of variables with Time Periods
  those <-grepl("70$", dd$root, ignore.case = T)
  seventy <- data.frame(dd[those,]$root)
  those <-grepl("80$", dd$root, ignore.case = T)
  eighty <- data.frame(dd[those,]$root)
  those <-grepl("90$", dd$root, ignore.case = T)
  ninety <- data.frame(dd[those,]$root)
  those <-grepl("00$", dd$root, ignore.case = T)
  thousand <- data.frame(dd[those,]$root)
  those <-grepl("10$", dd$root, ignore.case = T)
  ten <- data.frame(dd[those,]$root)
  
  vect_tor <- rbind(seventy, eighty, ninety, thousand, ten)
  final <- vect_tor
  #Remove the years prior to the start year
  if((star == 80 )| (star == 1980)){
    final <- vect_tor[3:8,]
  } else if((star == 90 )| (star == 1990)){
    final <- vect_tor[5:8,]
  }else if((star == 00 )| (star == 2000)){
    final <- vect_tor[7:8,]
  }
  
  
  #Remove the years after to the final year
}


# i <- NULL
# for(i in 1:length(final)){
#   out <- final[,i]
#   
#    if(final[,i] == "ohu00"){
#      return(data.frame(out))
#    }
# if((fini == 90 )| (fini == 1990)){
#  these <- vect_tor[!grep(90, vect_tor),]
#  final <- vect_tor[these]
# }


#those <-grepl(star, dd$root, ignore.case = T)
#vect <- data.frame(dd[those,]$root)
#those <-grepl(fini, dd$root, ignore.case = T)
# tor <- data.frame(dd[those,]$root)
# vect_tor <-rbind(vect,tor)
# #variables <-vect_tor$root
# return(vect_tor)





# 
# if(star == (70 | 1970)){
#   those <-grepl("70$", dd$root, ignore.case = T)
#   vect_7 <- data.frame(dd[those,]$root)
# }else if ((star | fini) == (80 | 1980)){
#   those <-grepl("80$", dd$root, ignore.case = T)
#   vect_8 <- data.frame(dd[those,]$root)
#   if(fini == (80 | 1980)){ break}
# }else if ((star | fini) == (90 | 1990)){
#   those <-grepl("90$", dd$root, ignore.case = T)
#   vect_9 <- data.frame(dd[those,]$root)
#   if(fini == (90 | 1990)){ break}
# }else if ((star | fini) == (00 | 2000)){
#   those <-grepl("00$", dd$root, ignore.case = T)
#   vect_0 <- data.frame(dd[those,]$root)
#   if(fini == (00 | 2000)){ break}
# }else if ((star | fini) == (10 | 2010)){
#   those <-grepl("10$", dd$root, ignore.case = T)
#   vect_1 <- data.frame(dd[those,]$root)
#   if(fini == (10 | 2010)){ break}
# }
# vect_tor <-rbind(vect_7, vect_8, vect_9, vect_0, vect_1)




