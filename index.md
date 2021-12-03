---
layout: page
title: Table of Contents
subtitle: Final Project for CPP 528 Fall 2021
use-site-title: true
---

- [Executive Summary](https://r-class.github.io/cpp-528-fall-2021-group-03/exec/)
- Part I: Neighborhood Change:
  - [Chapter 1: Data Wrangling](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-10-27-ch01-data-wrangling/)
  - [Chapter 2: Descriptive Analysis](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-06-ch02-descriptive/)
  - [Chapter 3: Predicting MHV Change](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-13-ch03-predicting/)
- Part II: Evaluation of Tax Credits:
  - [Chapter 4: Overview of Tax Credit Programs](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-26-ch04-overview/) 
  - [Chapter 5: Predictive Models After Adding Tax Credit Programs](https://r-class.github.io/cpp-528-fall-2021-group-03/analysis/2021-11-27-ch05-model/)
- [Results and Conculsion](https://r-class.github.io/cpp-528-fall-2021-group-03/results/)

# GitHub Repository

All the chapters in this report, along with data cleanup and necessary functions, can be be accessed on the [GitHub repository](https://github.com/R-Class/cpp-528-fall-2021-group-03) for this site. 

# Replication Instructions & Data Steps

R and RStudio software are required to reproduce the analyses presented in this report. In order to replicate the chapters featured in this report, the necessary packages must be installed using the `renv` package. To restore the project's dependencies from the renv.lock file, run the following code: `renv::restore(here::here())`.

For more information on how to install the `renv` package, please the [`renv` package website](https://rstudio.github.io/renv/).

All data files are stored in [`data`](data) folder on this site's [GitHub repository](https://github.com/R-Class/cpp-528-fall-2021-group-03). This report uses Longitudinal Database (LTDB) data which are found in the [`raw`](data/raw) folder and as .RDS files (native to R) in [`rodeo`](data/rodeo). Federal tax credit program data are also included in the same files.

All data clean up and tranformation steps as well as necessary functions and plots are provided in the [`source_file_rn.R`](analysis/source_file_rn.R) script in the [`analysis`](analysis) folder.

The [`analysis`](analysis) folder consists of the main files with all the procedural code to replicate the entire project. 

# License Information

R-Class/cpp-528-fall-2021-group-03 is licensed under the
GNU General Public License v3.0

Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.
