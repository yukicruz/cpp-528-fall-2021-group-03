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
  

  
  # if(star == "70" | "1970"){
  #   those <-grepl("70$", dd$root, ignore.case = T)
  #   vect <- data.frame(dd[those,]$root)
  # }
  
  
  
  #those <-grepl(star, dd$root, ignore.case = T)
  #vect <- data.frame(dd[those,]$root)
  those <-grepl(fini, dd$root, ignore.case = T)
  # tor <- data.frame(dd[those,]$root)
  # vect_tor <-rbind(vect,tor)
  # #variables <-vect_tor$root
  # return(vect_tor)
}

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
# return(vect_tor)



