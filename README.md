# CleaningDataProject
Tidy Data for Human Activity Using Smartphones Dataset Version 1.0
Matt Burch

---
### Contents of CleaningDataProject
---
The contents of the this repository includes:  

+ **run_analysis.R**: the R script used to simplify the data and perform analysis   
+ **CodeBook.md**: describes the variables, the data, and all transformations  
+ **README.md**: explains how all of the scripts work and are connected (this file)  
+ **tidyData.txt**: the output file of the run_analysis.R script including data and column names  
+ **read\_tidydata.R**: the R script used to import the tidyData.txt produced by run_analysis.R  

---
### Re-running Analysis Code in R
---
+ The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
+ A full description can be found at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
+ To download the data, use the link [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
+ Upon downloading, unzip the folder into your working directory of R
+ The structure of the unzipped folder should be as follows:
  + UCI HAR Dataset
    + test
      + Intertial Signals
        + body\_acc\_x\_test.txt
        + body\_acc\_y\_test.txt
        + body\_acc\_z\_test.txt
        + body\_gyro\_x\_test.txt 	
        + body\_gyro\_y\_test.txt
        + body\_gyro\_z\_test.txt
        + total\_acc\_x\_test.txt
        + total\_acc\_y\_test.txt
        + total\_acc\_z\_test.txt
      + subject\_test.txt
      + X\_test.txt
      + y\_test.txt		
    + train
      + Intertial Signals
        + body\_acc\_x\_train.txt
        + body\_acc\_y\_train.txt
        + body\_acc\_z\_train.txt
        + body\_gyro\_x\_train.txt 	
        + body\_gyro\_y\_train.txt
        + body\_gyro\_z\_train.txt
        + total\_acc\_x\_train.txt
        + total\_acc\_y\_train.txt
        + total\_acc\_z\_train.txt
      + subject\_train.txt
      + X\_train.txt
      + y\_train.txt
  + activity\_labels.txt
  + features.txt
  + features\_info.txt
  + README.txt
+ Copy the run_analysis.R script locally to your computer
+ Run the script by using the source() command ex. source("path_to_file/run_analysis.R")
  + **NOTE:**As long as the UCI HAR Dataset is in the R Working directory, run_analysis.R should be able to find it 
+ The script will run and output tidyData.txt under the same directory as run_analysis.R
+ To view more information about how the tidying process and analysis piece view the CodeBook.md

---
### Using Existing Tidy Data
---
+ To use the existing tidyData in the repo, copy the get_tidydata.R script and the tidyData.txt files locally to your computer in the same directory
  + **NOTE:**If you are re-running the code first, ensure that get_tidydata.R is in the same directory as run_analysis.R
+ Run the script by using the source() command ex. source("path_to_file/get_tidyData.R")
+ When the scripts completes, R will display the contents of tidyData using the View() command
  + This tidy data is stored in the data frame tidydata for your usage
  + For more information on the contents of this data frame, please reference the CodeBook.md
