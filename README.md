
# CPP528 Foundations of Data Science Part III
## Evaluating Neighborhood Change  
Arizona State University  
Watts College of Public Service and Community Solutions 
 


## Abstract 
>In this project, we are interested in building models to explain neighborhood change between 1990 and 2010. To accomplish this, census data from the Longitudinal Tracts Data Base was analyzed. Two models were made to determine if the New Market Tax Credit (NMTC) program or Low-Income Housing Tax Credit (LIHTC) program resulted in the greatest neighborhood improvement. The impact of the poverty rate, percent unemployment, and percent professional variables was evaluated in relation to both models. In both programs, the variable evaluating the growth rate of the treatment group above the control growth rate was found to be significant. The NMTC program had a larger, significant growth rate in comparison to the LIHTC program when both the no control variable and the poverty rate control were examined. It was found that the poverty rate was a good predictor of Median House Value growth as the variable value was closest to that of the no control variable model for both programs.




## Team Members
Khaled Hussain - [@Kahussai](https://github.com/kahussai)  
Rachael Nicely - [@RachNicely](https://github.com/RachNicely)  
Nick Rea - [@nerea88](https://github.com/nerea88)  
Asia Woods - [@aawoods97](https://github.com/aawoods97) 



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
## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](https://github.com/R-Class/cpp-528-fall-2021-group-03/blob/main/LICENSE) file for details.
