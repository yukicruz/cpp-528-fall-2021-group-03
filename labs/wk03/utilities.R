#
# Author:     Group 3
# Credit:     Jesse Lecy and Cristian Nuno for pre-processing steps
# Purpose:    Store processes for Lab 03
#

# load necessary packages ----
library( dplyr )
library( here )
library( knitr )
library( pander )

# create custom cleaning function ----
# convert variables to numeric
# and remove missing values placeholders;
# impute missing values with mean
clean_x <- function( x )
{
  x <- as.numeric( x )
  x[ x == -999 ] <- NA
  mean.x <- mean( x, na.rm=T )
  x[ is.na(x) ] <- mean.x
  return(x)
}

# apply the clean var x function to all columns 
clean_d <- function( d, start_column )
{
  these <- start_column:ncol(d)
  d[ these ] <- lapply( d[ these ], clean_x )
  
  return( d )
}

# FIX VARIABLE NAMES
# input dataframe
# standardize variable names 
# output data frame with fixed names
fix_names <- function( d )
{
  nm <- names( d )
  nm <- tolower( nm )
  
  nm[ nm == "statea"  ] <- "state"
  nm[ nm == "countya" ] <- "county"
  nm[ nm == "tracta"  ] <- "tract"
  nm[ nm == "trtid10" ] <- "tractid"
  nm[ nm == "mar-70"  ] <- "mar70"
  nm[ nm == "mar-80"  ] <- "mar80"
  nm[ nm == "mar-90"  ] <- "mar90"
  nm[ nm == "mar.00"  ] <- "mar00"
  nm[ nm == "x12.mar" ] <- "mar12"  
  nm <- gsub( "sp1$", "", nm )
  nm <- gsub( "sp2$", "", nm )
  nm <- gsub( "sf3$", "", nm )
  nm <- gsub( "sf4$", "", nm )
  
  # nm <- gsub( "[0-9]{2}$", "", nm )
  
  names( d ) <- nm
  return( d )
}

# FIX TRACT IDS
# put into format: SS-CCC-TTTTTT
fix_ids <- function( x )
{
  x <- stringr::str_pad( x, 11, pad = "0" )
  state <- substr( x, 1, 2 )
  county <- substr( x, 3, 5 )
  tract <- substr( x, 6, 11 )
  x <- paste( "fips", state, county, tract, sep="-" )
  return(x)
}


tidy_up_data <- function( file.name )
{
  # store the file path as a character vector
  path <- paste0( "data/raw/", file.name )
  # read in the file path using here::here()
  d <- read.csv( here::here(path), colClasses="character" ) 
  type <- ifelse( grepl( "sample", file.name ), "sample", "full" )
  year <- substr( file.name, 10, 13 )
  
  # fix names 
  d <- fix_names( d )
  
  # fix leading zero problem in tract ids
  d$tractid <- fix_ids( d$tractid )
  
  # drop meta-vars
  drop.these <- c("state", "county", "tract", "placefp10",
                  "cbsa10", "metdiv10", "ccflag10", 
                  "globd10", "globg10","globd00", "globg00",
                  "globd90", "globg90","globd80", "globg80")
  d <- d[ ! names(d) %in% drop.these ]
  
  # column position where variables start after IDs
  d <- clean_d( d, start_column=2 )
  
  # add year and type (sample/full)
  d <- data.frame( year, type, d, stringsAsFactors=F )
  
  return( d )
}

build_year <- function( fn1, fn2, year )
{

  d1 <- tidy_up_data( fn1 )
  d1 <- dplyr::select( d1, - type )

  d2 <- tidy_up_data( fn2 )
  d2 <- dplyr::select( d2, - type )

  d3 <- merge( d1, d2, by=c("year","tractid"), all=T )

  # store the file path as a character vector
  file.name <- paste0( "data/rodeo/LTDB-", year, ".rds" )
  # export the object to the file path from above using here::here()
  saveRDS( d3, here::here( file.name ) )

}

# store relevant raw data files
relevant_files = list.files(here::here("data/raw"), pattern = "(s|S)td.*.csv")

# store relevant years
YEARS <- as.character(seq(1970, 2010, 10))

# create empty list
RELEVANT_FILES = list()

# for each relevant year
for (year in YEARS) {
  # extract year specific files
  year_condition = stringr::str_detect(relevant_files, year)
  # subset the relevant files
  year_files = relevant_files[year_condition]
  # subset the fullcount filename
  fullcount_file = year_files[stringr::str_detect(year_files, "fullcount")]
  # subset the sample filename
  sample_file = year_files[stringr::str_detect(year_files, "sample")]
  
  # add to the empty list
  RELEVANT_FILES[[year]] = list(
    "year" = year,
    "fullcount" = fullcount_file,
    "sample" = sample_file
  )
}
  
obtain_crosswalk = function() {
  # store crosswalk URL
  URL <- "https://data.nber.org/cbsa-msa-fips-ssa-county-crosswalk/cbsatocountycrosswalk.csv"
  # read in as data frame
  cw <- read.csv( URL, colClasses="character" )
  # note in the data dictionary for CBSA Name (copied below): “blanks are rural”
  cw$urban <- ifelse( cw$cbsaname == "", "rural", "urban" )
  # store relevant columns
  keep.these <- c( "countyname","state","fipscounty", 
                   "msa","msaname", 
                   "cbsa","cbsaname",
                   "urban" )
  # filter the crosswalk
  cw <- dplyr::select( cw, keep.these )
  
  # drop the duplicated fips county codes
  cw <- cw[ ! duplicated(cw$fipscounty) , ]
  
  # save for future use
  saveRDS( cw, here::here( "data/raw/cbsa-crosswalk.rds") )
  
  # return to user
  return(cw)
}

extract_metadata <- function( file.name )
{
  # store the file path as a character vector
  path <- paste0( "data/raw/", file.name )
  # import the file using the file path inside of here::here()
  d <- read.csv( here::here( path ), colClasses="character" )
  type <- ifelse( grepl( "sample", file.name ), "sample", "full" )
  year <- substr( file.name, 10, 13 )

  # fix names
  d <- fix_names( d )

  # fix leading zero problem in tract ids
  d$tractid <- fix_ids( d$tractid )

  # drop meta-vars
  keep.these <- c("tractid","state", "county", "tract", "placefp10",
                  "cbsa10", "metdiv10", "ccflag10",
                  "globd10", "globg10","globd00", "globg00",
                  "globd90", "globg90","globd80", "globg80")
  d <- d[ names(d) %in% keep.these ]
  return( d )
}

# make final metadata file
create_final_metadata_file = function(file_names, crosswalk) {
  # filter the crosswalk
  # note: unique ID still persists through the FIPS column
  cw = dplyr::select(crosswalk, -countyname, -state)
  
  # extract metadata for 1980-2000
  md_2000 <- extract_metadata( file.name=file_names[["2000"]][["fullcount"]] )
  
  md_1990 <- extract_metadata( file.name=file_names[["1990"]][["fullcount"]] )
  md_1990 <- dplyr::select( md_1990, tractid, globd90, globg90 )
  
  md_1980 <- extract_metadata( file.name=file_names[["1980"]][["fullcount"]] )
  md_1980 <- dplyr::select( md_1980, tractid, globd80, globg80 )
  
  # merge metadata into one data frame
  # note: these are outer joins, meaning if a record from 2000 isn't found in
  #       in 1990, those "missing" records are still returned
  md_complete <- merge( md_2000, md_1990, all=T )
  md_complete <- merge( md_complete, md_1980, all=T )
  
  # create the fips county column
  # TODO: avoid hard coding index values
  md_complete$fipscounty <- paste0( substr( md_complete$tractid, 6, 7 ),
                               substr( md_complete$tractid, 9, 11 ) )
  
  # merge fips data onto metadata
  # note: this is a left join, all records from md_complete will be returned
  md_complete_with_cw <- merge( md_complete, 
                                cw, 
                                by="fipscounty", 
                                all.x=T )
  
  # save metadata
  saveRDS( md_complete_with_cw, here::here( "data/rodeo/LTDB-META-DATA.rds" ) )
}

# find variables that are in both files
compare_dfs <- function( df1, df2 )
{
  # use regular expressions to remove numeric suffixes 
  var.names.1 <- names( df1 )
  var.names.1 <- gsub( "[.][xy]$", "", var.names.1 )
  var.names.1 <- gsub( "[0-9]{2}$", "", var.names.1 )
  
  var.names.2 <- names( df2 )
  var.names.2 <- gsub( "[.][xy]$", "", var.names.2 )
  var.names.2 <- gsub( "[0-9]{2}$", "", var.names.2 )
  
  shared <- intersect( var.names.1, var.names.2 ) %>% sort()
  print( "SHARED VARIABLES:")
  print( shared )
  
  not.shared <- c( setdiff( var.names.1, var.names.2 ),
                   setdiff( var.names.2, var.names.1 ) ) %>% sort()
  
  print( "NOT SHARED:" )
  print( not.shared )
  
  d.vars1 <- data.frame( type="shared", variables=shared, stringsAsFactors=F )
  d.vars2 <- data.frame( type="not shared", variables=not.shared, stringsAsFactors=F )
  dd <- rbind( d.vars1, d.vars2 )
  
  return( dd )
}

#Create subset
d_sub <- function(d)
{
  d <- select( d, tractid, mhmval90, mhmval00, hinc90, 
               hu90, own90, rent90,  
               empclf90, clf90, unemp90, prof90,  
               dpov90, npov90,
               ag25up90, hs90, col90, 
               pop90.x, nhwht90, nhblk90, hisp90, asian90,
               cbsa, cbsaname )
  d <- 
    d %>%
    mutate( p.white = 100 * nhwht90 / pop90.x,
            p.black = 100 * nhblk90 / pop90.x,
            p.hisp = 100 * hisp90 / pop90.x, 
            p.asian = 100 * asian90 / pop90.x,
            p.hs = 100 * (hs90+col90) / ag25up90,
            p.col = 100 * col90 / ag25up90,
            p.prof = 100 * prof90 / empclf90,
            p.unemp = 100 * unemp90 / clf90,
            pov.rate = 100 * npov90 / dpov90 )
  
  return(d)
}

#Homes Values Histogram
MVH.Hist <- function()
{
 hist( mhv.change/1000, breaks=500, 
         xlim=c(-100,500), yaxt="n", xaxt="n",
         xlab="Thousand of US Dollars (adjusted to 2000)", cex.lab=1.5,
         ylab="", main="Change in Median Home Value 1990 to 2000",
         col="gray20", border="white" )

 axis( side=1, at=seq( from=-100, to=500, by=100 ), 
       labels=paste0( "$", seq( from=-100, to=500, by=100 ), "k" ) )

 mean.x <- mean( mhv.change/1000, na.rm=T )
 abline( v=mean.x, col="darkorange", lwd=2, lty=2 )
 text( x=200, y=1500, 
       labels=paste0( "Mean = ", dollar( round(1000*mean.x,0)) ), 
       col="darkorange", cex=1.8, pos=3 )

 median.x <- median( mhv.change/1000, na.rm=T )
 abline( v=median.x, col="dodgerblue", lwd=2, lty=2 )
 text( x=200, y=2000, 
       labels=paste0( "Median = ", dollar( round(1000*median.x,0)) ), 
       col="dodgerblue", cex=1.8, pos=3 )
}


# function to control plot() formatting 
jplot <- function( x1, x2, lab1="", lab2="", draw.line=T, ... )
{
  
  plot( x1, x2,
        pch=19, 
        col=gray(0.6, alpha = 0.2), 
        cex=2.5,  
        bty = "n",
        xlab=lab1, 
        ylab=lab2, cex.lab=1.5,
        ... )
  
  if( draw.line==T ){ 
    ok <- is.finite(x1) & is.finite(x2)
    lines( lowess(x2[ok]~x1[ok]), col="red", lwd=3 ) }
  
}

#Compare mhv distributions
mvh_compare <- function()
{
  
 layout.matrix <- matrix( c( 1,3,
                             2,3 ), 
                          nrow=2, ncol=2, byrow=T )

 layout( mat = layout.matrix,
         heights = c(2,2), # Heights of the two rows
         widths =  c(3,4)) # Widths of the two columns

# layout.show(3)

 par( mar=c(4,0,0,2) )

 hist( mhv.90/1000, breaks=50, 
       xlim=c(-200,800), yaxt="n", xaxt="n",
       xlab="", cex.lab=1,
       ylab="", main="",
       col="darkslateblue", border="white" )

 axis( side=1, at=seq( from=0, to=1000, by=100 ), 
       labels=paste0( "$", seq( from=0, to=1000, by=100 ), "k" ) )

 abline( v=seq(0,1000,100), lty=2, col="gray80" )

 text( 550, 4000, labels="Median Home \nValue in 1990", 
       col="darkslateblue", cex=1.8 )



 hist( mhv.00/1000, breaks=50, 
       xlim=c(-200,800), yaxt="n", xaxt="n",
       xlab="", cex.lab=1,
       ylab="", main="",
       col="darkslateblue", border="white" )

 abline( v=seq(0,1000, 100 ), lty=2, col="gray80" )

 text( 550, 3500, labels="Median Home \nValue in 2000", 
       col="darkslateblue", cex=1.8 )
 
 axis( side=1, at=seq( from=0, to=1000, by=100 ), 
       labels=paste0( "$", seq( from=0, to=1000, by=100 ), "k" ) )


# data reduction - filter 1,000 observations

 df <- data.frame( v90=mhv.90/1000, v00=mhv.00/1000 )
 df <- sample_n( df, 1000 )

 par( mar=c(4,5,3,2) )

 jplot( df$v90, df$v00, 
        lab1="MHV in 1990", lab2="MHV in 2000",
        xlim=c(0,1000), ylim=c(0,1000),
        axes=F )

 abline( a=0, b=1, lty=2, col="gray" )
 axis( side=1, at=seq( from=0, to=1000, by=200 ), 
       labels=paste0( "$", seq( from=0, to=1000, by=200 ), "k" ) )
 axis( side=2, at=seq( from=0, to=1000, by=200 ), 
       labels=paste0( "$", seq( from=0, to=1000, by=200 ), "k" ) )

}

#Plot the percent change variable
hg <- function()
{  
  hist( pct.change, breaks=2000, 
         xlim=c(-1,2), yaxt="n", xaxt="n",
         xlab="", cex.main=1.5,
         ylab="", main="Growth in Home Value by Census Tract 1990 to 2000",
         col="gray40", border="white" )
  
  axis( side=1, at=seq( from=-1, to=2, by=0.5 ), 
        labels=paste0( seq( from=-100, to=200, by=50 ), "%" ) )
  
  ymax <- max( 73000 )
  
  mean.x <- mean( pct.change, na.rm=T )
  abline( v=mean.x, col="darkorange", lwd=2, lty=2 )
  text( x=1, y=(0.5*ymax), 
        labels=paste0( "Mean = ", round(100*mean.x,0), "%"), 
        col="darkorange", cex=1.8, pos=4 )
  
  median.x <- median( pct.change, na.rm=T )
  abline( v=median.x, col="dodgerblue", lwd=2, lty=2 )
  text( x=1, y=(0.6*ymax), 
        labels=paste0( "Median = ", round(100*median.x,0), "%"), 
        col="dodgerblue", cex=1.8, pos=4 )
  
}


#Select Gentrification Variables

gent_var <- function()
{
  d3 <- select(d.full,  
               
               tractid, cbsa, cbsaname,            # ids / units of analysis
               
               mhv.90, mhv.00, mhv.change, pct.change,    # home value 
               
               hinc90, hu90, own90, rent90,        # ses
               hinc00, hu00, own00, rent00,
               
               empclf90, clf90, unemp90, prof90,   # employment 
               empclf00, clf00, unemp00, prof00,
               
               dpov90, npov90,                     # poverty
               dpov00, npov00,
               
               ag25up90, hs90, col90,              # education 
               ag25up00, hs00, col00,
               
               pop90.x, nhwht90, nhblk90, hisp90, asian90,   # race
               pop00.x, nhwht00, nhblk00, hisp00, asian00
               
) # end select


d3 <- 
  d3 %>%
  mutate( 
    # 1990 variables
    p.white.90 = 100 * nhwht90 / pop90.x,
    p.black.90 = 100 * nhblk90 / pop90.x,
    p.hisp.90 = 100 * hisp90 / pop90.x, 
    p.asian.90 = 100 * asian90 / pop90.x,
    p.hs.edu.90 = 100 * (hs90+col90) / ag25up90,
    p.col.edu.90 = 100 * col90 / ag25up90,
    p.prof.90 = 100 * prof90 / empclf90,
    p.unemp.90 = 100 * unemp90 / clf90,
    pov.rate.90 = 100 * npov90 / dpov90,
    
    # 2000 variables
    p.white.00 = 100 * nhwht00 / pop00.x,
    p.black.00 = 100 * nhblk00 / pop00.x,
    p.hisp.00 = 100 * hisp00 / pop00.x, 
    p.asian.00 = 100 * asian00 / pop00.x,
    p.hs.edu.00 = 100 * (hs00+col00) / ag25up00,
    p.col.edu.00 = 100 * col00 / ag25up00,
    p.prof.00 = 100 * prof00 / empclf00,
    p.unemp.00 = 100 * unemp00 / clf00,
    pov.rate.00 = 100 * npov00 / dpov00 )
  

d3 <-
  d3 %>%
  group_by( cbsaname ) %>%
  mutate( metro.mhv.pct.90 = ntile( mhv.90, 100 ),
          metro.mhv.pct.00 = ntile( mhv.00, 100 ),
          metro.median.pay.90 = median( hinc90, na.rm=T ),
          metro.median.pay.00 = median( hinc00, na.rm=T ),
          metro.race.rank.90 = ntile( (100-p.white.90), 100 ) ) %>%
  ungroup() %>%
  mutate( metro.mhv.pct.change = metro.mhv.pct.00 - metro.mhv.pct.90,
          pay.change = metro.median.pay.00 - metro.median.pay.90,
          race.change = p.white.00 - p.white.90,
          mhv.change = mhv.00 - mhv.90 )


d3 <-           
  d3 %>%
  select( c( "tractid", "cbsa", "cbsaname",
             "mhv.90", "mhv.00", "mhv.change","pct.change",
             "p.white.90", "p.black.90", "p.hisp.90", "p.asian.90", 
             "p.hs.edu.90", "p.col.edu.90", "p.prof.90",  "p.unemp.90", 
             "pov.rate.90", "p.white.00", "p.black.00", "p.hisp.00", 
             "p.asian.00", "p.hs.edu.00", "p.col.edu.00", "p.prof.00", 
             "p.unemp.00", "pov.rate.00", "metro.mhv.pct.90", 
             "metro.mhv.pct.00", "metro.median.pay.90", "metro.median.pay.00", 
             "metro.mhv.pct.change", "pay.change", "race.change",
             "metro.race.rank.90") )

return(d3)

}


