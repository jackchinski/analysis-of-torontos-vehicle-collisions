# Purpose: Download data from opendatatoronto
# Author: Marcin Jaczynski
# Date: 29 January 2023
# Contact: marcin.jaczynski@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the Motor Vehicle Collisions with KSI Data and saved it to inputs/data

# importing libraries
library(tidyverse)
library(opendatatoronto)

# finding data set from open data Toronto 
data_url <- "https://open.toronto.ca/dataset/motor-vehicle-collisions-involving-killed-or-seriously-injured-persons/"

# pulling in the various versions of the data set 
packages_data <- data_url %>% list_package_resources()

# filtering for the desired one 
fatal_data <- filter(packages_data, id == "fdb2834f-3a92-41dd-b098-fbd84acb9cfe")

# naming desired data set 
not_filtered_accidents <- fatal_data %>% get_resource()

# saving data set in inputs/data/raw_data.csv
write.csv(not_filtered_accidents, "inputs/data/raw_data.csv")


