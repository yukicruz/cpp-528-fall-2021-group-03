
# CPP528 Foundations of Data Science Part III
[![DOI](https://zenodo.org/badge/415142245.svg)](https://zenodo.org/badge/latestdoi/415142245)


## Evaluating Neighborhood Change  

Arizona State University  
Watts College of Public Service and Community Solutions 


<br>





## Team Members
Khaled Hussain - [@Kahussai](https://github.com/kahussai)  
Rachael Nicely - [@RachNicely](https://github.com/RachNicely)  
Nick Rea - [@nerea88](https://github.com/nerea88)  
Asia Woods - [@aawoods97](https://github.com/aawoods97) 

<br>




## Table of Contents

- Part I: Neighborhood Change:
  - [Chapter 1: Data Wrangling](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-10-27-ch01-data-wrangling/)
  - [Chapter 2: Descriptive Analysis](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-06-ch02-descriptive/)
  - [Chapter 3: Predicting MHV Change](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-13-ch03-predicting/)
- Part II: Evaluation of Tax Credits:
  - [Chapter 4: Overview of Tax Credit Programs](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-26-ch04-overview/) 
  - [Chapter 5: Predictive Models After Adding Tax Credit Programs](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-27-ch05-model/)
- [Executive Summary](https://docs.google.com/file/d/1EEBnXShAJeq75OBWVLHUvA9srGB6jlxo/edit?filetype=msword)
- [Results and Conculsion](https://r-class.github.io/cpp-528-fall-2021-group-03/results/)

<br>

## Executive Summary

>In this project, we are interested in building models to explain neighborhood change between
1990 and 2010. To accomplish this, census data from the Longitudinal Tracts Data Base was
analyzed. Two models were made to determine if the New Market Tax Credit (NMTC) program
or Low-Income Housing Tax Credit (LIHTC) program resulted in the greatest neighborhood
improvement. The impact of the poverty rate, percent unemployment, and percent professional
variables was evaluated in relation to both models. In both programs, the variable evaluating the
growth rate of the treatment group above the control growth rate was found to be significant. The
NMTC program had a larger, significant growth rate in comparison to the LIHTC program when
both the no control variable and the poverty rate control were examined. It was found that the
poverty rate was a good predictor of Median House Value growth as the variable value was
closest to that of the no control variable model for both programs.

<br>

## Results

>A study of the impact of gentrification on a neighborhood occurred. Between the 1990-2000
period and 2000-2010, there were 17, 670 candidates for gentrification, and of those 871
transitioned into the advanced stages of gentrification. Gentrification typically occurred on the
outskirts of the city and either adjacent to or surrounded by tracts with a higher initial home
value. Candidates of gentrification were determined if there was a lower than average home
value and higher than average diversity. Of the candidates, the number that was determined to
have transitioned into the advanced stages of gentrification had three experiences. The first was
an abnormal rise in home value. Home values in urban areas experienced a 0.58% increase
between the 1990-2000 period and 2000-2010 which equates to a median dollar increase of
$592. Secondly, the growth rate would follow a similar trend to home values as development is
more likely in a less impoverished area. Finally, a loss of diversity would indicate the
marginalized groups that previously lived there were displaced by whites who have become the
more predominant ethnic group.

>The relationship between the Median Home Value (MHV) and three independent variables:
poverty rate, percent unemployment, and percent professional was examined. Multicollinearity
was found between all variables as they are all factors of the neighborhood home value construct.
While all variables significantly affect MHV growth, the poverty rate has the largest effect. The
relationship was further explored in two models the New Market Tax Credit (NMTC) program
and Low-Income Housing Tax Credit (LIHTC) program to determine the greatest neighborhood
improvement.

<br>

## Conclusion

>The developed models determined if the New Market Tax Credit (NMTC) program or Low-
Income Housing Tax Credit (LIHTC) program resulted in the greatest neighborhood
improvement. The impact of the poverty rate, percent unemployment, and percent professional
variables was evaluated in relation to both models. The New Market Tax Credit (NMTC)
program imparts federal tax credit upon investors within communities that are experiencing
economic distress to leverage private investment capital. While the Low-Income Housing Tax
Credit (LIHTC) program, which tracks projects and affordable housing units created since 1987,
publicizes its data to keep track of the progress made in Low-Income Housing. The NMTC
program had a larger, significant growth rate than the LIHTC program in both the no control
variable and poverty rate control. The variable evaluating the growth rate of the treatment group
above the secular growth rate was found to be significant for both the NMTC and LIHTC
programs. The poverty rate was found to be a good predictor of MHV growth as the variable
value was closest to that of the no control variable model for both programs. A linear difference-
in-difference approach measures the slopes from a one-unit change in the independent variable to
a change in the median house value. Given that growth rates change significantly between time
periods for this evaluation, a log-linear approach where a one-unit change in the independent
variable is associated with the growth rate of median house values.


<br>


## Instructions & Data Steps

### Required Packages and Installation

To install this package, start R [Download R 4.1.2 for Windows](https://cran.r-project.org/bin/windows/base/) 

>R and RStudio software are required to reproduce the analyses presented in this report. In order to replicate the chapters featured in this report, the necessary packages must be installed using the `renv` package. To restore the project's dependencies from the renv.lock file, run the following code: `renv::restore(here::here())`.

For more information on how to install the `renv` package, please the [`renv` package website](https://rstudio.github.io/renv/).

All data files are stored in [`data`](data) folder on this site's [GitHub repository](https://github.com/R-Class/cpp-528-fall-2021-group-03). This report uses Longitudinal Database (LTDB) data which are found in the [`raw`](data/raw) folder and as .RDS files (native to R) in [`rodeo`](data/rodeo). Federal tax credit program data are also included in the same files.

All data clean up and tranformation steps as well as necessary functions and plots are provided in the [`source_file_rn.R`](analysis/source_file_rn.R) script in the [`analysis`](analysis) folder.


<br>

## Citations

```yaml
---
title: CPP528 Foundations of Data Science Part III
subtitle: Evaluating Neighborhood Change
team:
  - name: Khaled Hussain , Rachael Nicely , Nick Rea & Asia Woods
    img: 
    desc: 
    url: 
    website: 
    github: 
    twitter: 
---
```

As your team grows, be sure to update this file accordingly, specifically the `team` sub-section.



<br>

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](https://github.com/R-Class/cpp-528-fall-2021-group-03/blob/main/LICENSE) file for details.
