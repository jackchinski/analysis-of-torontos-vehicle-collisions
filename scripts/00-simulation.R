# Purpose: Simulate what data will look like once cleaned from opendaatoronto 
# about Motor Vehicle Collisions with KSI
# Author: Marcin Jaczynski
# Date: 30 January 2023
# Contact: marcin.jaczynski@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - None 

# df is the data frame that. I will be simulating 
# id <- number of the case 
# year <- what year the accident took place 
# alcohol <- was alcohol involved in the accident 
# injury_type <- the severity of the accident: none, minor, major, fatal 
df <- data.frame ( id = c("1", "2", "3", "4"),
                  year  = c("2010", "2011", "2011", "2012"),
                  alcohol = c("yes", "no", "no", "yes"),
                  injury_type = c("major", "minor", "none", "major")
)
