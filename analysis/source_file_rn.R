# Author: Rachael Nicely, Asia Woods, Khaled Hussain, Nick Rea
# Modified from original file authored by Cristian Nuno
# Date: November 22, 2021
# Purpose:  Store relevant objects for neighborhood change report in this source file
#

# load necessary packages ----
`%>%` <- magrittr::`%>%`


# load necessary constants ----

# stargazer settings
S_TYPE <- "html"

# inflation rate
INFLATION_RATE <- 1.28855 

# load custom functions ----

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

# Helper functions for the **pairs()** correlation table 
panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.8/strwidth(txt)
  
  test <- cor.test(x,y)
  # borrowed from printCoefmat
  Signif <- symnum(test$p.value, corr = FALSE, na = FALSE,
                   cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
                   symbols = c("***", "**", "*", ".", " "))
  
  text(0.5, 0.5, txt, cex = 1.5 )
  text(.7, .8, Signif, cex=cex, col=2)
}

panel.smooth <- function (x, y, col = par("col"), bg = NA, pch = par("pch"), 
                          cex = 0.5, col.smooth = "red", span = 2/3, iter = 3, ...) 
{
  points(x, y, pch = 19, col = gray(0.7,0.2), bg = bg, cex = cex)
  ok <- is.finite(x) & is.finite(y)
  if (any(ok)) 
    lines(stats::lowess(x[ok], y[ok], f = span, iter = iter), 
          col = col.smooth, lwd=2, ...)
}

# custom plot
jplot <- function( x1, x2, lab1="", lab2="", draw.line=T, ... )
{
  
  plot( x1, x2,
        pch=19, 
        col=gray(0.6, alpha = 0.2), 
        cex=0.5,  
        bty = "n",
        xlab=lab1, 
        ylab=lab2, cex.lab=1.5,
        ... )
  
  if( draw.line==T ){ 
    ok <- is.finite(x1) & is.finite(x2)
    lines( lowess(x2[ok]~x1[ok]), col="red", lwd=3 ) }
  
}

# load necessary data ----

# remember to use here::here() when importing data
d1 <- readRDS( here::here( "data/rodeo/LTDB-2000.rds" ) )
d2 <- readRDS( here::here( "data/rodeo/LTDB-2010.rds" ) )
md <- readRDS( here::here( "data/rodeo/LTDB-META-DATA.rds" ) )

d1 <- dplyr::select( d1, - year )
d2 <- dplyr::select( d2, - year )

d <- merge( d1, d2, by="tractid" )
d <- merge( d, md, by="tractid" )

# keep only the urban tracts
d <- dplyr::filter( d, urban == "urban" )

# obtain NMTC data
NMTC_URL <- "https://raw.githubusercontent.com/DS4PS/cpp-528-spr-2020/master/labs/data/raw/NMTC/nmtc-sheet-01.csv"
nmtc <- read.csv( NMTC_URL, stringsAsFactors=F )

# obtain LIHTC data
LIHTC_URL <- "https://raw.githubusercontent.com/DS4PS/cpp-528-spr-2020/master/labs/data/raw/LIHTC/LIHTCPUB.csv"
lihtc <- read.csv( LIHTC_URL, stringsAsFactors=F )

# create a key that will allow us to obtain federal data for each tract ----
# remove anything not a number from the string
d$id2 <- gsub( "[^0-9]", "", d$tractid )

# fix IDs so they are match
d$id2 <- as.numeric( d$id2 )

# aggregate federal programs such that there is one record per tract ----
lihtc.dollars <-
  lihtc %>% 
  dplyr::filter( yr_alloc >= 2000 & yr_alloc <= 2010 ) %>%
  dplyr::group_by( fips2010 ) %>%
  dplyr::summarize( num.lihtc = dplyr::n(), lihtc.total = sum( allocamt, na.rm=T ) )

# need to convert from currency to numeric
# current format: 
# head( nmtc$QLICI.Amount )
# [1] "$300,000.00 "   "$1,008,750.00 " "$977,000.00 "

# remove dollar sign and commas
nmtc$amount <- gsub( "[,$]", "", nmtc$QLICI.Amount )

# head(  nmtc$amount  )
# "300000.00 "  "1008750.00 " "977000.00 "

# convert characters to numeric 
nmtc$amount <- as.numeric( nmtc$amount ) %>% round(0)

# head(  nmtc$amount  )
# [1]  300000 1008750  977000

nmtc.dollars <- 
  nmtc %>% 
  dplyr::filter( Origination.Year >= 2000 & Origination.Year <= 2010 ) %>%
  dplyr::group_by( X2010.Census.Tract ) %>% 
  dplyr::summarize( num.nmtc = dplyr::n(), nmtc.total = sum( amount, na.rm=T ) )

# merge federal data onto census tracts ----
d <- merge( d, nmtc.dollars, by.x="id2", by.y="X2010.Census.Tract", all.x=T )
d <- merge( d, lihtc.dollars, by.x="id2", by.y="fips2010", all.x=T )

# recode tracts that had no grants from NA to 0 ---
d$num.nmtc[ is.na(d$num.nmtc) ] <- 0
d$nmtc.total[ is.na(d$nmtc.total) ] <- 0

d$num.lihtc[ is.na(d$num.lihtc) ] <- 0 
d$lihtc.total[ is.na(d$lihtc.total) ] <- 0


# adjust 2000 home values for inflation 
mhv.00 <- d$mhmval00 * INFLATION_RATE  
mhv.10 <- d$mhmval12

# change in MHV in dollars
mhv.change <- mhv.10 - mhv.00


# drop low year 2000 median home values
# to avoid unrealistic growth rates.
#
# tracts with homes that cost less than
# $10,000 are outliers
# approximately 200 out of 59,000 cases 
sum( mhv.00 < 10000 ) 
mhv.00[ mhv.00 < 10000 ] <- NA

# change in MHV in percent
mhv.growth <- 100 * ( mhv.change / mhv.00 )

# store mini data frame to be used for descriptive statistics ----
df <- data.frame( MedianHomeValue2000=mhv.00, 
                  MedianHomeValue2010=mhv.10, 
                  MHV.Change.00.to.10=mhv.change,
                  MHV.Growth.00.to.12=mhv.growth )

# add variables to the main data frame ----
d$mhv.00 <- mhv.00
d$mhv.10 <- mhv.10
d$mhv.change <- mhv.change
d$mhv.growth <- mhv.growth 


#Omit cases with growth rates above 200% ----
d$mhv.growth[ d$mhv.growth > 200 ] <- NA

# select a few variables ----
d <- dplyr::select( d, 
             
             tractid, cbsa, cbsaname,            # ids / units of analysis
             
             mhv.00, mhv.10, mhv.change, mhv.growth,    # home value 
             
             hinc00, hu00, own00, rent00,        # ses
             hinc12, hu10, own10, rent10,
             
             empclf00, clf00, unemp00, prof00,   # employment 
             empclf12, clf12, unemp12, prof12,
             
             dpov00, npov00,                     # poverty
             dpov12, npov12,
             
             ag25up00, hs00, col00,              # education 
             ag25up12, hs12, col12,
             
             pop00.x, nhwht00, nhblk00, hisp00, asian00,   # race
             pop10, nhwht10, nhblk10, hisp10, asian10,
             
             vac00, hu00,                     # vacancy
             vac10, hu10,
             
             num.nmtc, nmtc.total,              # tax policy data
             num.lihtc, lihtc.total             # aggregated by census tract
             
) # end select


# create new variables ----
d <- 
  d %>%
  dplyr::mutate( 
    # 2000 variables
    p.white.00 = 100 * nhwht00 / pop00.x,
    p.black.00 = 100 * nhblk00 / pop00.x,
    p.hisp.00 = 100 * hisp00 / pop00.x, 
    p.asian.00 = 100 * asian00 / pop00.x,
    p.hs.edu.00 = 100 * (hs00+col00) / ag25up00,
    p.col.edu.00 = 100 * col00 / ag25up00,
    p.prof.00 = 100 * prof00 / empclf00,
    p.unemp.00 = 100 * unemp00 / clf00,
    pov.rate.00 = 100 * npov00 / dpov00,
    p.vacant.00 = 100 * vac00 / hu00,
    
    # 2010 variables
    p.white.10 = 100 * nhwht10 / pop10,
    p.black.10 = 100 * nhblk10 / pop10,
    p.hisp.10 = 100 * hisp10 / pop10, 
    p.asian.10 = 100 * asian10 / pop10,
    p.hs.edu.10 = 100 * (hs12+col12) / ag25up12,
    p.col.edu.10 = 100 * col12 / ag25up12,
    p.prof.10 = 100 * prof12 / empclf12,
    p.unemp.10 = 100 * unemp12 / clf12,
    pov.rate.10 = 100 * npov12 / dpov12,
    p.vacant.10 = 100 * vac10 / hu10 )%>%
  # remove any NA or Inf values
  na.omit(use = "everything")

# inflation adjust income  ----
d$hinc00 <- INFLATION_RATE * d$hinc00

# create new variables by cbsa ----
d <-
  d %>%
  dplyr::group_by( cbsaname ) %>%
  dplyr::mutate( # metro rank of home value in 2000
    metro.mhv.pct.00 = dplyr::ntile( mhv.00, 100 ),
    # metro rank of home value in 2010
    metro.mhv.pct.10 = dplyr::ntile( mhv.10, 100 ),
    # median pay for metro area 2000
    metro.median.pay.00 = median( hinc00, na.rm=T ),
    # median pay for metro area 2010
    metro.median.pay.10 = median( hinc12, na.rm=T ),
    # tract rank in metro area for diversity (% non-white)
    metro.diversity.rank.00 = dplyr::ntile( (100-p.white.00), 100 ),
    # metro total population 2000
    metro.pop.total.00 = sum( pop00.x, na.rm=T ),
    # metro total population 2010
    metro.pop.total.10 = sum( pop10, na.rm=T ) ) %>%
  dplyr::ungroup() %>%
  dplyr::mutate( # change in relative rank of mhv in metro area 2000-2010
    metro.mhv.pctile.change = metro.mhv.pct.10 - metro.mhv.pct.00,
    # growth in ave pay in metro
    metro.pay.change = metro.median.pay.10 - metro.median.pay.00,
    # metro population growth 2000-2010
    metro.pop.growth = ( metro.pop.total.10 - metro.pop.total.00 ) / metro.pop.total.00,
    # increase in the proportion of whites in tract 
    increase.p.white = p.white.10 - p.white.00  )

# average growth in median home value for the city ----
cbsa_stats_df <- 
  d %>%
  dplyr::group_by( cbsaname ) %>%
  dplyr::summarize( metro.mhv.change = median( mhv.change, na.rm=T ),
                    metro.mhv.growth = 100 * median( mhv.growth, na.rm=T ) ) %>%
  dplyr::ungroup() 

# Create a true/false code for recipient tracts ----
d$LIHTC <- ifelse( d$num.lihtc > 0, "YES", "NO" )
d$NMTC <- ifelse( d$num.nmtc > 0, "YES", "NO" )

# store plots in a list for easy access ----
PLOTS <-
  list(
    "pov_rate_2000" = list(
      "nmtc" = ggplot2::ggplot( d, ggplot2::aes(x=pov.rate.00, fill=NMTC )) +
        ggplot2::geom_density(alpha=0.4) + 
        ggplot2::ggtitle("2000 Poverty Rate Comparison of \nRecipient and Non-Recipient Communities"),
      "lihtc" = ggplot2::ggplot( d, ggplot2::aes(x=pov.rate.00, fill=LIHTC)) +
        ggplot2::geom_density(alpha=0.4) +
        ggplot2::ggtitle("2000 Poverty Rate Comparison of \nRecipient and Non-Recipient Communities")
    ),
    "p_prof_2000" = list(
      "nmtc" = ggplot2::ggplot( d, ggplot2::aes(x=p.prof.00, fill=NMTC )) +
        ggplot2::geom_density(alpha=0.4) + 
        ggplot2::ggtitle("2000 Percent Professional Comparison of \nRecipient and Non-Recipient Communities"),
      "lihtc" = ggplot2::ggplot( d, ggplot2::aes(x=p.prof.00, fill=LIHTC)) +
        ggplot2::geom_density(alpha=0.4) +
        ggplot2::ggtitle("2000 Percent Professional Comparison of \nRecipient and Non-Recipient Communities")
    ),
    "p_unemp_2000" = list(
      "nmtc" = ggplot2::ggplot( d, ggplot2::aes(x=p.unemp.00, fill=NMTC )) +
        ggplot2::geom_density(alpha=0.4) + 
        ggplot2::ggtitle("2000 Percent Unemployment Comparison of \nRecipient and Non-Recipient Communities"),
      "lihtc" = ggplot2::ggplot( d, ggplot2::aes(x=p.unemp.00, fill=LIHTC)) +
        ggplot2::geom_density(alpha=0.4) +
        ggplot2::ggtitle("2000 Percent Unemployment Comparison of \nRecipient and Non-Recipient Communities")
    ),
    "mhv_2000" = list(
      "nmtc" = ggplot2::ggplot( d, ggplot2::aes(x=log10(mhv.00), fill=NMTC )) +
        ggplot2::geom_density( alpha=0.4 ) +
        ggplot2::ggtitle("2000 Median Home Value Comparison of \nRecipient and Non-Recipient Communities"),
      "lihtc" = ggplot2::ggplot( d, ggplot2::aes(x=log10(mhv.00), fill=LIHTC )) +
        ggplot2::geom_density( alpha=0.4 )  +
        ggplot2::ggtitle("2000 Median Home Value Comparison of \nRecipient and Non-Recipient Communities")
    ),
    "mhv_growth" = list(
      "nmtc" = ggplot2::ggplot( d, ggplot2::aes(x=mhv.growth, fill=NMTC )) +
        ggplot2::geom_density( alpha=0.4 )  +
        ggplot2::ggtitle("Comparision of MHV Growth 2000 to 2010: \nRecipients vs Non-Recipients"),
      "lihtc" = ggplot2::ggplot( d, ggplot2::aes(x=mhv.growth, fill=LIHTC )) +
        ggplot2::geom_density( alpha=0.4 )  +
        ggplot2::ggtitle("Comparision of MHV Growth 2000 to 2010: \nRecipients vs Non-Recipients")
    )
  )

# create the difference in difference dataset ----

# log the two variables
y1 <- log( d$mhv.00 )
y2 <- log( d$mhv.10 )

# create a variable that identifies if a tract received NMTC funding
treat.nmtc <- as.numeric( d$num.nmtc > 0 )

# create a variable that identifies if a tract received LIHTC funding
treat.lihtc <- as.numeric( d$num.lihtc > 0 )

# create a variable for percent professional
p.prof.00 <- d$p.prof.00
p.prof.10 <- d$p.prof.10

# create a variable for poverty rate
pov.rate.00 <- d$pov.rate.00
pov.rate.10 <- d$pov.rate.10

# create a variable for percent unemployment
p.unemp.00 <- d$p.unemp.00
p.unemp.10 <- d$p.unemp.10

# create a variable for percent unemployment
p.vacant.00 <- d$p.vacant.00
p.vacant.10 <- d$p.vacant.10

# store the year 2000 data
d1 <- data.frame( y = y1, treat.nmtc = treat.nmtc, treat.lihtc = treat.lihtc, p.prof = p.prof.00, pov.rate = pov.rate.00, p.unemp = p.unemp.00, p.vacant = p.vacant.00, post=0 )

# store the year 2010 data
d2 <- data.frame( y = y2, treat.nmtc = treat.nmtc, treat.lihtc = treat.lihtc, p.prof = p.prof.10, pov.rate = pov.rate.10, p.unemp = p.unemp.10, p.vacant = p.vacant.10, post=1 )

# stack the two time periods together
d3 <- rbind( d1, d2 )


