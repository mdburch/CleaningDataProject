library(dplyr)

# Read the tidyData file back into R
tidydata <- read.table("tidyData.txt", header = TRUE) 
# Convert to a data frame
tidydata<- tbl_df(tidydata)
# Display the contents of tidydata to the user
View(tidydata)
