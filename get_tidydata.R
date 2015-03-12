library(dplyr)
tidydata <- read.table("tidyData", header = TRUE) 
tidydata<- tbl_df(tidydata)
View(tidydata)
