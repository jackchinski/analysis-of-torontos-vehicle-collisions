# Purpose: Clean data from opendaatoronto about Motor Vehicle Collisions with KSI
# Author: Marcin Jaczynski
# Date: 29 January 2023
# Contact: marcin.jaczynski@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the Motor Vehicle Collisions with KSI Data and saved it to inputs/data


# library(haven)
library(tidyverse)
# Read in the raw data 
raw_data <- readr::read_csv("inputs/data/raw_data.csv")

# keep only the columns which will be used for my analysis
reduced_data <- 
  raw_data %>% 
  select(YEAR, INJURY, AUTOMOBILE, ALCOHOL)

# remove old data from the environment 
rm(raw_data)

# now i need to filter the data to only include the ones 
# which include an automobile and alcohol 

