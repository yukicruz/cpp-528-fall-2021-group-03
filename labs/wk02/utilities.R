#
# Author: Asia Woods & Rachael Nicely
# Date: 10/26/2021
# Purpose: Store functions for Lab 02 

# Filter Variables by Theme or Group ----

filter_category <- function( data, search )
{
  num <- grep(search, data$category, ignore.case = T) # use grep to find all categories with search term in data 
  dat.cat <- data.frame(data[num,]) # select only rows with a match as a dataframe
  return( dat.cat )
}

# Locate a Specific String ----
var_description <- function( data, string )
{
  these <- grepl(string, data$definition, ignore.case = T) #use grepls to find all definitions that contain specific string
  results <- data[these,] # select only data with a match 
  return(results$root)
}


# Filter by Time Periods ----

#library( dplyr )

filter_time <- function( data, years )
{
  data$'1970' <- coalesce(data$'X1970.f', data$'X1970.s' ) # combine all 1970 data
  data$'1980' <- coalesce(data$'X1980.f', data$'X1980.s' ) # combine all 1980 data
  data$'1990' <- coalesce(data$'X1990.f', data$'X1990.s' ) # combine all 1990 data
  data$'2000' <- coalesce(data$'X2000.f', data$'X2000.s' ) # combine all 2000 data
  data$'2010' <- coalesce(data$'X2010.f', data$'X2010.s' ) # combine all 2010 data
  
  col_select <- c("root", "category", "definition", time_period) #select relevant columns from data to display
  
  col_num <- length(col_select)
  
  time.df <- data[ col_select ] #select data based on time period and selected columns
  
  time.df <- time.df %>%
    filter(if_all( c(4:all_of(col_num)) , ~ . != "" )) #filter out rows with where variables are not shared
  
  return( time.df )

}
