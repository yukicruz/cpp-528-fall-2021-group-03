#Function One: Filter Variables by Theme or Group

cate <- function(category){
  
  return(grep(category, d$category, ignore.case = T))
}

#Function Two: Locate a Specific String
descript <- function(description){
  these <- grepl(description, d$description, ignore.case = T)
  d.vec <- d[these, ]
  return(d.vec)
}


#Function Three: Filter by Time Periods
func <-function(star, fini){
  these <- grepl
}