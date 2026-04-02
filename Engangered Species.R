# Load required packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(sf)
library(readr)
library(scales)
library(plotly)
# DATA LOADING
species_by_country <- read_csv("/Users/jaydenjohnston/Library/CloudStorage/OneDrive-Personal/SPRING 2026/STAT 408/Project/country_species.csv")
species_trends <- tribble(
  ~Year, ~Mammals, ~Birds, ~Reptiles, ~Amphibians, ~Fishes, ~Molluscs, ~`Other Invertebrates`, ~Plants,
  1996,    169,    182,     NA,        NA,          NA,      NA,         NA,                     NA,
  1998,    169,    182,     NA,        NA,          NA,      NA,         NA,                     NA,
  2000,    177,    182,     NA,        NA,          NA,      NA,         NA,                     NA,
  2002,    177,    182,     NA,        NA,          NA,      NA,         NA,                     NA,
  2003,    177,    182,     NA,        NA,          NA,      NA,         NA,                     NA,
  2004,    184,    188,     NA,        1770,        NA,      NA,         NA,                     NA,
  2006,    698,    1206,    422,       1811,        1173,    975,        1959,                   8390,
  2007,    722,    1217,    423,       1824,        1201,    975,        1959,                   8447,
  2008,    794,    1226,    469,       1900,        1275,    978,        1984,                   8457,
  2009,    790,    1223,    469,       1895,        1414,    979,        2098,                   8538,
  2010,    795,    1240,    594,       1898,        1677,    979,        2102,                   8519,
  2011,    801,    1253,    664,       1905,        2004,    980,        2212,                   8679,
  2012,    811,    1258,    708,       1933,        2058,    981,        2216,                   8795,
  2013,    826,    1313,    791,       1957,        2097,    996,        2390,                   10533,
  2014,    839,    1313,    837,       1981,        2155,    997,        2475,                   10914,
  2015,    858,    1323,    1078,      2006,        2401,    1005,       2603,                   11731,
  2016,    871,    1375,    1147,      2036,        2487,    1072,       2717,                   12522,
  2017,    879,    1469,    1296,      2062,        2652,    1179,       2991,                   14033,
  2018,    902,    1469,    1332,      2100,        2754,    1195,       3044,                   15608,
  2019,    910,    1480,    1389,      2162,        2902,    1185,       3187,                   16306,
  2020,    939,    1492,    1476,      2220,        3102,    1190,       3348,                   17369,
  2021,    953,    1533,    1564,      2305,        3287,    1239,       3441,                   18523,
  2022,    1064,   1557,    1733,      2498,        3538,    1261,       3622,                   20714,
  2023,    1159,   1588,    1793,      2581,        3834,    1321,       3889,                   22442,
  2024,    1364,   1256,    1859,      2930,        4085,    NA,         NA,                     NA
)

# DATA WRANGLING

species_by_country <- species_by_country |>
  rename(
    Country               = Name,
    `Other Invertebrates` = `Other Inverts*`,
    Plants                = `Plants*`,
    Reptiles              = `Reptiles*`,
    Fishes                = `Fishes*`,
    Molluscs              = `Molluscs*`,
    `Fungi & Protists`    = `Fungi*`,
    Chromists             = `Chromists*`
  )

