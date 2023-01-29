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

write.csv(not_filtered_accidents, "inputs/data/raw_data.csv")


