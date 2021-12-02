
# CPP528 Foundations of Data Science Part III
## Evaluating Neighborhood Change  
Arizona State University  
Watts College of Public Service and Community Solutions 
 
<br>

## Abstract 
>In this project, we are interested in building models to explain neighborhood change between 1990 and 2010. To accomplish this, census data from the Longitudinal Tracts Data Base was analyzed. Two models were made to determine if the New Market Tax Credit (NMTC) program or Low-Income Housing Tax Credit (LIHTC) program resulted in the greatest neighborhood improvement. The impact of the poverty rate, percent unemployment, and percent professional variables was evaluated in relation to both models. In both programs, the variable evaluating the growth rate of the treatment group above the control growth rate was found to be significant. The NMTC program had a larger, significant growth rate in comparison to the LIHTC program when both the no control variable and the poverty rate control were examined. It was found that the poverty rate was a good predictor of Median House Value growth as the variable value was closest to that of the no control variable model for both programs.


<br>


## Team Members
Khaled Hussain - [@Kahussai](https://github.com/kahussai)  
Rachael Nicely - [@RachNicely](https://github.com/RachNicely)  
Nick Rea - [@nerea88](https://github.com/nerea88)  
Asia Woods - [@aawoods97](https://github.com/aawoods97) 

<br>


## Instructions & Data Steps

### Required Packages and Installation

To install this package, start R (version "4.1") and enter: 

`– renv` helps manage library paths (and other project-specific state) to help isolate your project’s R dependencies, and the existing tools you’ve used for managing R packages (e.g. `install.packages()`, `remove.packages()`) should work as they did before.

>R and RStudio software are required to reproduce the analyses presented in this report. In order to replicate the chapters featured in this report, the necessary packages must be installed using the `renv` package. To restore the project's dependencies from the renv.lock file, run the following code: `renv::restore(here::here())`.

For more information on how to install the `renv` package, please the [`renv` package website](https://rstudio.github.io/renv/).

All data files are stored in [`data`](data) folder on this site's [GitHub repository](https://github.com/R-Class/cpp-528-fall-2021-group-03). This report uses Longitudinal Database (LTDB) data which are found in the [`raw`](data/raw) folder and as .RDS files (native to R) in [`rodeo`](data/rodeo). Federal tax credit program data are also included in the same files.

All data clean up and tranformation steps as well as necessary functions and plots are provided in the [`source_file_rn.R`](analysis/source_file_rn.R) script in the [`analysis`](analysis) folder.

<br>

## Table of Contents

- Overview 
- Part I: Neighborhood Change:
  - [Chapter 1: Data Wrangling](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-10-27-ch01-data-wrangling/)
  - [Chapter 2: Descriptive Analysis](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-06-ch02-descriptive/)
  - [Chapter 3: Predicting MHV Change](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-13-ch03-predicting/)
- Part II: Evaluation of Tax Credits:
  - [Chapter 4: Overview of Tax Credit Programs](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-26-ch04-overview/) 
  - [Chapter 5: Predictive Models After Adding Tax Credit Programs](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-27-ch05-model/)
- [Results and Conculsion](https://r-class.github.io/cpp-528-fall-2021-group-03/results/)

<br>


## Overview

The project for this course is designed as an opportunity to practice project management skills by showing your research on a static website hosted on GitHub Pages. Overall, this project is worth 100 points and makes up the bulk of your final grade.


It is broken into six steps, leaving one week at the end of the semester for a final round of revisions, documenting the process, and house-cleaning in your GitHub repo.
   - Week 01: Introduction to project management
   - Week 02: Introduction to data management
   - Week 03: Descriptive analysis of neighborhood change
   - Week 04: Predicting median home value change, 2000 to 2010
   - Week 05: Adding federal program data to your predictive models
   - Week 06: Test reproducible work flow with a parameter change
   - Week 07: Finalize project website and project requirements

Each week you will work on one step of the analysis as a lab. These labs should be completed and submitted individually (you are still allowed to collaborate on labs but submit your labs individually).

As a team, you’ll collaborate to synthesize the work from each other into one concrete project. Together, you will primarily focus on the integration of content into a static website which makes all of the steps in your research transparent and easily reproducible.

<br>

## Executive Summary

In this project, we are interested in building models to explain neighborhood change between
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

A study of the impact of gentrification on a neighborhood occurred. Between the 1990-2000
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

The relationship between the Median Home Value (MHV) and three independent variables:
poverty rate, percent unemployment, and percent professional was examined. Multicollinearity
was found between all variables as they are all factors of the neighborhood home value construct.
While all variables significantly affect MHV growth, the poverty rate has the largest effect. The
relationship was further explored in two models the New Market Tax Credit (NMTC) program
and Low-Income Housing Tax Credit (LIHTC) program to determine the greatest neighborhood
improvement.

<br>

## Conclusion

The developed models determined if the New Market Tax Credit (NMTC) program or Low-
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

[Documentation](https://docs.google.com/file/d/1EEBnXShAJeq75OBWVLHUvA9srGB6jlxo/edit?filetype=msword)

<br>

## Context

The [`index.html`](index.html) file serves a purpose which is to ensure that the `README.md` file does not get displayed back to the user on the home page of the website.

## About page

The [about page](about.md) is a markdown file that relies on a data stored within the YAML header to populate photos, a brief bio, and hyperlinked icons about each team member. 

```yaml
---
title: About
subtitle: The humans behind this project
team:
  - name: Romi and Phoebe
    img: ../assets/img/about/romi_and_phoebe.jpg
    desc: Two excellent rescue hounds who bring much joy to our family.
    url: https://www.aspca.org/adopt-pet/adoptable-dogs-your-local-shelter
    website: https://www.aspca.org/adopt-pet/adoptable-dogs-your-local-shelter
    github: https://github.com/cenuno
    twitter: https://twitter.com/cenuno_
---
```

As your team grows, be sure to update this file accordingly, specifically the `team` sub-section.

## Potential problems

Some Mac user may experience problems building their website using this custom Jekyll theme. The following steps are needed to overcome this problem:

1. Download the Ruby 2.7 version via [homebrew](https://brew.sh/)

```bash
brew install ruby@2.7
```

2. Download the Jekyll bundler which contains the "remote" theme

```bash
sudo gem install jekyll bundler
```
<br>

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](https://github.com/R-Class/cpp-528-fall-2021-group-03/blob/main/LICENSE) file for details.
