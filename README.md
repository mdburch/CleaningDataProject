# CleaningDataProject
Course Project for Getting and Cleaning Data Coursera course

---
##### Matt Burch
##### Tidy Data for Human Activity Using Smartphones Dataset Version 1.0
---

---
### Contents of CleaningDataProject
---
##### The contents of the this repository includes:
#####	run_analysis.R   : the R script used to simplify the data and perform analysis 
#####	CodeBook.md      : describes the variables, the data, and all transformations
#####	README.md        : explains how all of the scripts work and are connected (this file)
#####	tidyData         : the output file of the run_analysis.R script including data and column names
#####	read\_tidydata.R   : the R script used to import the tidyData (tidyData.txt) produced by run_analysis.R

---
### Re-running Analysis Code in R
---
*The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
*A full description can be found at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
*To download the data, use the link [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
*Upon downloading and unzipping the data the structure should be as follows:
**UCI HAR Dataset
***test
****Intertial Signals
*****body\_acc\_x\_test.txt
*****body\_acc\_y\_test.txt
*****body\_acc\_z\_test.txt
*****body\_gyro\_x\_test.txt 	
*****body\_gyro\_y\_test.txt
*****body\_gyro\_z\_test.txt
*****total\_acc\_x\_test.txt
*****total\_acc\_y\_test.txt
*****total\_acc\_z\_test.txt
***subject\_test.txt
****X\_test.txt
****y\_test.txt		
***train
*****body\_acc\_x\_train.txt
*****body\_acc\_y\_train.txt
*****body\_acc\_z\_train.txt
*****body\_gyro\_x\_train.txt 	
*****body\_gyro\_y\_train.txt
*****body\_gyro\_z\_train.txt
*****total\_acc\_x\_train.txt
*****total\_acc\_y\_train.txt
*****total\_acc\_z\_train.txt
***subject\_train.txt
****X\_train.txt
****y\_train.txt	
**activity\_labels.txt
**features.txt
**features\_info.txt
**README.txt
*Upon extracting the data copy the run_analysis.R script into the main directory (UCI HAR Dataset) so the data files can be found
*Run the script by using the source() command ex. source("path_to_file/run_analysis.R")
*The script will run and output tidyData.txt back our main directory (UCI HAR Dataset)
*To view more information about how the tidying process and analysis piece view the CodeBook.md

---
### Using Existing Tidy Data
---
*The 
---
### Tidying Data Process (MAYBE README FILE)
---

---
### Raw Data/Variable Descriptions (CODEBOOK)
---
*DESCRIBE the raw data a little bit
*For more information on the raw data visit the README file found in UCI HAR Dataset directory 
**If you need access to the UCI HAR Dataset please reference the README file from this repository
---
### Tidy Data/Variable Descriptions (CODEBOOK)
---
*SORT THE DATA BEFORE WRITING IT OUT!!!
The tidy data set
The general principles of tidy data are laid out by Hadley Wickham in this paper and this video. The paper and the video are both focused on the R package, which you may or may not know how to use. Regardless the four general principles you should pay attention to are:

    Each variable you measure should be in one column
    Each different observation of that variable should be in a different row
    There should be one table for each "kind" of variable
    If you have multiple tables, they should include a column in the table that allows them to be linked

While these are the hard and fast rules, there are a number of other things that will make your data set much easier to handle. First is to include a row at the top of each data table/spreadsheet that contains full row names. So if you measured age at diagnosis for patients, you would head that column with the name AgeAtDiagnosis instead of something like ADx or another abbreviation that may be hard for another person to understand.

Here is an example of how this would work from genomics. Suppose that for 20 people you have collected gene expression measurements with RNA-sequencing. You have also collected demographic and clinical information about the patients including their age, treatment, and diagnosis. You would have one table/spreadsheet that contains the clinical/demographic information. It would have four columns (patient id, age, treatment, diagnosis) and 21 rows (a row with variable names, then one row for every patient). You would also have one spreadsheet for the summarized genomic data. Usually this type of data is summarized at the level of the number of counts per exon. Suppose you have 100,000 exons, then you would have a table/spreadsheet that had 21 rows (a row for gene names, and one row for each patient) and 100,001 columns (one row for patient ids and one row for each data type).

If you are sharing your data with the collaborator in Excel, the tidy data should be in one Excel file per table. They should not have multiple worksheets, no macros should be applied to the data, and no columns/cells should be highlighted. Alternatively share the data in a CSV or TAB-delimited text file.
The code book

For almost any data set, the measurements you calculate will need to be described in more detail than you will sneak into the spreadsheet. The code book contains this information. At minimum it should contain:

    Information about the variables (including units!) in the data set not contained in the tidy data
    Information about the summary choices you made
    Information about the experimental study design you used

In our genomics example, the analyst would want to know what the unit of measurement for each clinical/demographic variable is (age in years, treatment by name/dose, level of diagnosis and how heterogeneous). They would also want to know how you picked the exons you used for summarizing the genomic data (UCSC/Ensembl, etc.). They would also want to know any other information about how you did the data collection/study design. For example, are these the first 20 patients that walked into the clinic? Are they 20 highly selected patients by some characteristic like age? Are they randomized to treatments?

A common format for this document is a Word file. There should be a section called "Study design" that has a thorough description of how you collected the data. There is a section called "Code book" that describes each variable and its units.
How to code variables

When you put variables into a spreadsheet there are several main categories you will run into depending on their data type:

    Continuous
    Ordinal
    Categorical
    Missing
    Censored

Continuous variables are anything measured on a quantitative scale that could be any fractional number. An example would be something like weight measured in kg. Ordinal data are data that have a fixed, small (< 100) number of levels but are ordered. This could be for example survey responses where the choices are: poor, fair, good. Categorical data are data where there are multiple categories, but they aren't ordered. One example would be sex: male or female. Missing data are data that are missing and you don't know the mechanism. You should code missing values as NA. Censored data/make up/ throw away missing observations.

In general, try to avoid coding categorical or ordinal variables as numbers. When you enter the value for sex in the tidy data, it should be "male" or "female". The ordinal values in the data set should be "poor", "fair", and "good" not 1, 2 ,3. This will avoid potential mixups about which direction effects go and will help identify coding errors.

Always encode every piece of information about your observations using text. For example, if you are storing data in Excel and use a form of colored text or cell background formatting to indicate information about an observation ("red variable entries were observed in experiment 1.") then this information will not be exported (and will be lost!) when the data is exported as raw text. Every piece of data should be encoded as actual text that can be exported.
The instruction list/script

You may have heard this before, but reproducibility is kind of a big deal in computational science. That means, when you submit your paper, the reviewers and the rest of the world should be able to exactly replicate the analyses from raw data all the way to final results. If you are trying to be efficient, you will likely perform some summarization/data analysis steps before the data can be considered tidy.

The ideal thing for you to do when performing summarization is to create a computer script (in R, Python, or something else) that takes the raw data as input and produces the tidy data you are sharing as output. You can try running your script a couple of times and see if the code produces the same output.

In many cases, the person who collected the data has incentive to make it tidy for a statistician to speed the process of collaboration. They may not know how to code in a scripting language. In that case, what you should provide the statistician is something called pseudocode. It should look something like:

    Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
    Step 2 - run the software separately for each sample
    Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set

You should also include information about which system (Mac/Windows/Linux) you used the software on and whether you tried it more than once to confirm it gave the same results. Ideally, you will run this by a fellow student/labmate to confirm that they can obtain the same output file you did. 
