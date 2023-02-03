# Purpose: Clean data from opendaatoronto about Motor Vehicle Collisions with KSI
# Author: Marcin Jaczynski
# Date: 29 January 2023
# Contact: marcin.jaczynski@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the Motor Vehicle Collisions with KSI Data and saved it to inputs/data


library(tidyverse)
library(dplyr)
# Read in the raw data 
raw_data <- readr::read_csv("inputs/data/raw_data.csv")

# keep only the columns which will be used for my analysis
reduced_data <- 
  raw_data %>% 
  select(YEAR, INJURY, AUTOMOBILE, ALCOHOL)

# remove old data from the environment 
rm(raw_data)

 
# retaining only the entries which involve an automobile and alcohol
selected_data <- filter(reduced_data, AUTOMOBILE == "Yes" & ALCOHOL == "Yes")

# remove unfiltered data from the environment
rm(reduced_data)

write.csv(selected_data, "inputs/data/selected_data.csv")


# TESTS 
nrow(selected_data) == 755

sum(selected_data$AUTOMOBILE == "Yes") == 755

sum(selected_data$ALCOHOL == "Yes") == 755

sum(selected_data$INJURY == "Fatal") == 42



# STATS FOR TABLE
fatal_count <- sum(selected_data$INJURY == "Fatal") # 42 total

major_count <- sum(selected_data$INJURY == "Major") #249 total

minimal_count <- sum(selected_data$INJURY == "Minimal") # 63 total

minor_count <- sum(selected_data$INJURY == "Minor")  # 131 total

none_count <- sum(selected_data$INJURY == "None")  # 270 total

# fatal accounted for 5.56% of accidents 
# meanwhile major accounted for 33% 
# none 35.76 % 










