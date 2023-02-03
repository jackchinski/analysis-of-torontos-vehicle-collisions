
library(ggplot2)
library(tidyverse)
library(dplyr)

#Import Data Set
injury_dataset <- read_csv("inputs/data/selected_data.csv")
#Assign value 'Minimal' from Injury column to 'Minimal & Minor' 
injury_dataset$INJURY[injury_dataset$INJURY == 'Minimal'] <- 'Minimal & Minor' 
#Assign value 'Minor' from Injury column to 'Minimal & Minor' 
injury_dataset$INJURY[injury_dataset$INJURY == 'Minor'] <- 'Minimal & Minor'


#CREATING PLOTS TO DISPLAY YEAR AND INJURY TYPE

#Factor categorical variable from INJURY
injury_dataset$INJURY <- factor(injury_dataset$INJURY,levels = c("None",
                                                                 "Minimal & Minor",
                                                                 "Major",
                                                                 "Fatal"))

#MAKING A NEW ORGANIZED DATA SET
#Use a group-by function to group by all the unique values of YEAR and Injury
#Then count all the occurrences of each pairing
#Summaries is used to count/sum each pair, and create a new column "Count_Accidents"
group_by_year_accident <- injury_dataset %>% group_by(YEAR,INJURY) %>% summarise(Count_Accidents = n())

#First graph displays all counts of accidents, by year, and organizes them by colour
#'fill = INJURY' creates the separation by variable for Injury
ggplot(group_by_year_accident, aes(x = YEAR, y = Count_Accidents, fill = INJURY)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Number of Accidents (Minor, Major, Fatal) by Year") + xlab("Year") + ylab("Number of Accidents")

#Second graph displays the same data as above, however each year as a separate plot
#This technique is done through 'facet_wrap(~YEAR)'
#Inspiration from: https://stats.stackexchange.com/questions/14118/drawing-multiple-barplots-on-a-graph-in-r
ggplot(group_by_year_accident,aes(x=INJURY, y = Count_Accidents, fill=INJURY)) + 
  facet_wrap(~YEAR) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  labs(y = "Number of Accidents", x = "Type of Injury from Accident") 



