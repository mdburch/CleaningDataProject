### Raw Data/Variable Descriptions [1]
---
* 70% of the volunteers were selected for generating the training data and 30% the test data. 
* A 561-feature vector with time and frequency domain variables.
* Features are normalized and bounded within [-1,1].
* Features selected come from the accelerometer and gyroscope 3-axial raw signals (ex. tAcc-XYZ and tGyro-XYZ)
* Prefix of **t** denotes time domain signals captured at a constant rate of 50 hz then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise (ex. tBodyAcc-XYZ and tGravityAcc-XYZ)
* Prefix of **f** denotes frequency domain signals derived by using a Fast Fourier Transform (FFT) (ex. fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ)
* Acceleration signals were separated in **Body** and **Gravity** acceleration signala using another low pass Butterworth filter with a corner frequency of 0.3 Hz
* Ending of **-X** **-Y** or **-Z** denotes which axis of the accelerometer/gyroscope the value is for
* **Jerk** represents signals of Jerk Body linear acceleration and angular velocity were derived in time (ex. tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
* **Mag** represents signals of the magnitude of the three-dimensional signals calculated using the Euclidean norm (ex. tBodyAccMag, tGravityAccMag, tBodyAccJerkMag) 
 * Variables of the these different features include:
   * mean(): Mean value
   * std(): Standard deviation
   * mad(): Median absolute deviation 
   * max(): Largest value in array
   * min(): Smallest value in array
   * sma(): Signal magnitude area
   * energy(): Energy measure. Sum of the squares divided by the number of values. 
   * iqr(): Interquartile range 
   * entropy(): Signal entropy
   * arCoeff(): Autorregresion coefficients with Burg order equal to 4
   * correlation(): correlation coefficient between two signals
   * maxInds(): index of the frequency component with largest magnitude
   * meanFreq(): Weighted average of the frequency components to obtain a mean frequency
   * skewness(): skewness of the frequency domain signal 
   * kurtosis(): kurtosis of the frequency domain signal 
   * bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
   * angle(): Angle between to vectors.
   * Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
     * gravityMean
     * tBodyAccMean
     * tBodyAccJerkMean
     * tBodyGyroMean
     * tBodyGyroJerkMean
   
* For more information on the raw data visit the README file or features_info found in UCI HAR Dataset directory 
* If you need access to the UCI HAR Dataset please reference the README file from this repository

---
### Tidying Data Process
---
This tidying process was performed on a Windows 7 computer using 64 bit version of R 3.1.2 using the dplyr library

1. Read the X_test.txt file into a data frame. This file represents the features of the experiment for the test subjects
2. Read the Y_test.txt into a data frame. This file represents the activity performed assocaited with each record of the X_test.txt data set.
3. Read the subject_test.txt into a data frame. This file represents the subject associated with each record of the X_test.txt data set
4. Bind the columns of the data frames from steps 1-3 where the subject column(3) is first, followed by the activity column (2), then the features(1)
5. Read the X_train.txt file into a data frame. This file represents the features of the experiment for the training subjects
6. Read the Y_train.txt into a data frame. This file represents the activity performed assocaited with each record of the X_train.txt data set.
7. Read the subject_train.txt into a data frame. This file represents the subject associated with each record of the X_train.txt data set
8. Bind the columns of the data frames from steps 5-7 where the subject column(7) is first, followed by the activity column(6), then the features(5)
9. Bind the rows of the the test data frame(4) with the train data frame(8). The final result is one data frame that contains 100% of the subjects data
10. Read in the features.txt file into a chracter vector. This file represents the name of all of the features associated with the data found in X_test.txt and X_train.txt
11. Modified the character vector by replacing '-' with '_' and replacing '()' with 'Val'. This transformation is done to make the column extraction process in step XX
12. Set the column names of the data frame created in step 9 to 'subject' for the subject column, 'activity' for the activity column, and the modified feature names from step 11 as the feature columns.
13. Read in the activity_labels.txt values into a factor. This file is set up as key (numeric 1-6) and value (character acitivty type). Only the character strings representing activities were stored in the factor. NOTE: If this file were to change where the labels were not listed from numeric 1-6, this step would have to be modified.
14. Convert the activity column of the data frame created in step 9 as a factor
15. Set the levels of the activity factor the activity labels created in step 13. This replaces the values 1-6 with the activity values (WALKING, SITTING,...etc)
16. From the full data set originally created in step 9 the columns with the terms 'meanVal' and 'stdVal' were selected and stored in a separate data frame along with the subject and activity columns. This new data frame consists of only features that from the original data set were labeled as mean() or std(). This does not include features from the original data set with names labeled as meanFreq() or features which averaged signals denotes by featureNameMean
17. Group the data set constructed in step 16 by the subject followed by the activity. 
18. Summarize the grouped data set in step 17 into the mean values of the grouping.  
19. Rename the 'meanVal' columns to 'AvgMeans' and the 'stdVal' columns to 'AvgStd' to better represent the data
20. Write the resultant data frame in step 19 to a file called tidyData.txt

---
### Tidy Data/Variable Descriptions
---
* The resulting tidy data is a data frame of size 180 x 68
  * Each record in the data frame is unique representing a subject performing one of the activities
  * Each column represents an average of the feature for that subject for the given activity
* Column Structure
  * subject - ordinal - Range:1-30
  * activity - categorical - Range:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  * Features - continuous - Range: Values normalized from -1 to 1 
    * Naming convention follows the raw data convention
      * t is a time domain signal
      * f is a frequency domain signal
      * Gravity is a gavity acceleration signal
      * Body is a body acceleration signal
      * -XYZ represents the axis the data was read from
      * For more details read the raw data description above
    *   AvgMeans - the average mean value of all samples for a subject performing a given activity
    *   AvgStd - the average standard deviation value of all samples for a subject performing a given activity
 
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

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
