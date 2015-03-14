library(dplyr)

dir <- paste0(getwd(), "/UCI HAR Dataset")

# Read the tidyData file back into R
tidydata <- read.table(paste0(dir,"/tidyData.txt"), header = TRUE) 
# Convert to a data frame
tidydata<- tbl_df(tidydata)
# Display the contents of tidydata to the user
View(tidydata)
