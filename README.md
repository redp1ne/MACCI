# MACCI

<!-- badges: start -->
<!-- badges: end -->

The goal of MACCI is to provide a simple toolkit for researchers to manage, analyze, 
and visualize their cell culture inventory data.

## Installation

You can install the development version of MACCI from [GitHub](https://github.com/redp1ne/MACCI) 
with:

``` r
# install.packages("devtools")
devtools::install_github("redp1ne/MACCI")

```
examples:

library(MACCI)

# Assume your data is in a data frame called 'my_cell_data'
sorted_data <- increasing(my_cell_data, sort_by_col = "Viability")

print(head(sorted_data))
