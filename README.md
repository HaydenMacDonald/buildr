# FARS

[![Build Status](https://travis-ci.org/HaydenMacDonald/buildr.svg?branch=master)](https://travis-ci.org/HaydenMacDonald/buildr)

My package for the Building R Packages course final project.

## Overview

This package imports, summarizes and visualizes traffic accident data from the US National Highway Traffic Safety Administration's **Fatality Analysis Reporting System**.  
This data contains yearly nationwide records describing fatal injuries from motor vehicle accidents across the United States.  

## Installation

Github:  
``` r
# install.packages("devtools")
devtools::install_github("HaydenMacDonald/buildr")
```  
  
## Usage Example

``` r
library(buildr)


# Read in data file in csv format and convert to tibble 
fars_read("data.csv")

# Create a filename given a provided year(s)
make_filename(2018)

#Return a list of tibbles from a list of specified years
years <- list(2013, 2014, 2015)
fars_read_years(years = years)

# Summarize a list of tibbles by observation counts
years <- list(2013, 2014, 2015)
fars_summarize_years(years = years)

# Map all recorded accidents of a specified year on a map graphic of a specified state
fars_map_state(1, 2013)

```  
  
## Help

Submit issues here on GitHub.  

If you are interested in extending the functionality of this package, fork this repository, make your changes and submit them as a pull request.  
