#Function One: Filter Variables by Theme or Group

similar_categories <- function(string){
  num <- grep(string, dd$category, ignore.case = T)
  tabl <- data.frame(dd[num,])
  return(tabl)
}

#Function Two: Locate a Specific String
descript <- function(description){
  these <- grepl(description, dd$description, ignore.case = T)
  dd.vec <- dd[these, ]
  return(dd.vec)
}


#Function Three: Filter by Time Periods
func <-function(star, fini){
  these <- grepl
}