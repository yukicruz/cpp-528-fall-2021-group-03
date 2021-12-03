
# CPP528 Foundations of Data Science Part III
[![DOI](https://zenodo.org/badge/415142245.svg)](https://zenodo.org/badge/latestdoi/415142245)


## Evaluating Neighborhood Change  

Arizona State University  
Watts College of Public Service and Community Solutions 


<br>





## Team Members
Khaled Hussain - [@Kahussai](https://github.com/kahussai)  
Rachael Nicely - [@RachNicely](https://github.com/RachNicely)  
Nicholas Rea - [@nerea88](https://github.com/nerea88)  
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

## Instructions & Data Steps

### Required Packages and Installation

To install this package, start R [Download R 4.1.2 for Windows](https://cran.r-project.org/bin/windows/base/) 

>R and RStudio software are required to reproduce the analyses presented in this report. In order to replicate the chapters featured in this report, the necessary packages must be installed using the `renv` package. To restore the project's dependencies from the renv.lock file, run the following code: `renv::restore(here::here())`.

For more information on how to install the `renv` package, please the [`renv` package website](https://rstudio.github.io/renv/).

All data files are stored in [`data`](data) folder on this site's [GitHub repository](https://github.com/R-Class/cpp-528-fall-2021-group-03). This report uses Longitudinal Database (LTDB) data which are found in the [`raw`](data/raw) folder and as .RDS files (native to R) in [`rodeo`](data/rodeo). Federal tax credit program data are also included in the same files.

All data clean up and tranformation steps as well as necessary functions and plots are provided in the [`source_file_rn.R`](analysis/source_file_rn.R) script in the [`analysis`](analysis) folder.

The [`analysis`](analysis) folder consists of the main files with all the procedural code to replicate the entire project. 

<br>

## BibTeX Citation
```yaml

@software{rachnicely_2021_5749095,
  author       = {RachNicely and
                  aawoods97 and
                  kahussai and
                  nerea88 and
                  Courtney Stowers},
  title        = {{R-Class/cpp-528-fall-2021-group-03: Initial 
                   Release}},
  month        = dec,
  year         = 2021,
  publisher    = {Zenodo},
  version      = {0.1.0},
  doi          = {10.5281/zenodo.5749095},
  url          = {https://doi.org/10.5281/zenodo.5749095}
}

```

<br>

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](https://github.com/R-Class/cpp-528-fall-2021-group-03/blob/main/LICENSE) file for details.
