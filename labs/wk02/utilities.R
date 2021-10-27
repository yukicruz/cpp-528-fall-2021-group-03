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
func <-function(dd, star, fini){
  
  library("dplyr")
  
  
  #create the data frame of variables with Time Periods
  
  #1970
  those <-grepl("70$", dd$root, ignore.case = T)
  seventy <- data.frame(dd[those,]$root)
  
  #1980
  those <-grepl("80$", dd$root, ignore.case = T)
  eighty <- data.frame(dd[those,]$root)
  
  #1990
  those <-grepl("90$", dd$root, ignore.case = T)
  ninety <- data.frame(dd[those,]$root)
  
  #2000
  those <-grepl("00$", dd$root, ignore.case = T)
  thousand <- data.frame(dd[those,]$root)
  
  #2010
  those <-grepl("10$", dd$root, ignore.case = T)
  ten <- data.frame(dd[those,]$root)
  
  #Combine the time periods
  vect_tor <- rbind.data.frame(seventy, eighty, ninety, thousand, ten)
  colnames(vect_tor) <- c("variable")
  final <- vect_tor
  
  #True or False statements indicating whether the variables are 
  #in the time period data frames listed above
  final$seventy <- final$variable %in% unlist(seventy)
  final$eighty  <- final$variable %in% unlist(eighty)
  final$ninety  <- final$variable %in% unlist(ninety)
  final$thousand  <- final$variable %in% unlist(thousand)
  final$ten  <- final$variable %in% unlist(ten)
  
  final$year <- ifelse(final$seventy == TRUE, final$year <- 1970, 
                       ifelse(final$eighty == TRUE, final$year <- 1980,
                              ifelse (final$ninety == TRUE, final$year <- 1990,
                                      ifelse(final$thousand == TRUE, final$year <- 2000,
                                             ifelse(final$ten == TRUE, final$year <- 2010, NA)
                                      )
                              )
                       )
  )
  
  #Rename columns for the variables and the years
  final <- final[, c("variable", "year")]
  
  # This code assigns a date1 variable based on the year entered in the 
  #function for starting date
  if((star == 70 )| (star == 1970)){
    date1 <- 1970
  }else if((star == 80 )| (star == 1980)){
    date1 <- 1980 
  }else if((star == 90 )| (star == 1990)){
    date1 <- 1990
  }else if((star == 00 )| (star == 2000)){
    date1 <- 2000
  }else if((star == 10 )| (star == 2010)){
    date1 <- 2010
  }else {
    date1= 0000
  }

  
  # This code assigns a date2 variable based on the year entered in the 
  #function for starting date
  if((fini == 70 )| (fini == 1970)){
    date2 <- 1970
  }else if((fini == 80 )| (fini == 1980)){
    date2 <- 1980 
  }else if((fini == 90 )| (fini == 1990)){
    date2 <- 1990
  }else if((fini == 00 )| (fini == 2000)){
    date2 <- 2000
  }else if((fini == 10 )| (fini == 2010)){
    date2 <- 2010
  }else {
    date2= 0000
  }
  
  # Filter data by start and finishing date, save to out table
  final  <- final %>% # input data set
    
    filter(final$year >= date1 & final$year <= date2)
  
  out <- final
  
  # If variables for dates were found, return table, otherwise return message
  ifelse( nrow(out) > 0, return(as.data.frame(out)), print("Date unavailable") )
  
  
  
  
  
  
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




