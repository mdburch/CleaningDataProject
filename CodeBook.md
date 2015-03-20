### Raw Data/Variable Descriptions [1]
---
* Data Set 
  * 70% of the volunteers were selected for generating the training data and 30% the test data
    * The data was separated into the test and training data
    * The full data set includes the training set, training labels, test set, and test labels.
      * Additionally, the feature names and activity labels are available in separate files 
      * Inertial signals test and train data are available but were not used for this tidying process
  * A 561-feature vector with time and frequency domain variables.
  * Features are normalized and bounded within [-1,1].
* Column Structure (features)
  * Prefix of **t** denotes time domain signals captured at a constant rate of 50 hz then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise (ex. tBodyAcc-XYZ and tGravityAcc-XYZ)
  * Prefix of **f** denotes frequency domain signals derived by using a Fast Fourier Transform (FFT) (ex. fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ)
  * **Acc** represents accelerometer 3-axial raw signals (ex. tGyro-XYZ)
  * **Gyro** represents gyroscope 3-axial raw signals (ex. tAcc-XYZ)
  * Acceleration signals were separated in **Body** and **Gravity** acceleration signals using a low pass Butterworth filter with a corner frequency of 0.3 Hz
  * Ending of **-X** **-Y** or **-Z** denotes which axis of the accelerometer/gyroscope the value
  * **Jerk** represents Jerk signals obtained by body linear acceleration and angular velocity derived in time (ex. tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
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
This tidying process was performed on a Windows 7 computer using 64 bit version of R 3.1.2 using the dplyr library version 0.4.1

1. Read the X_test.txt file into a data frame. This file represents the feature values of the experiment for the test subjects
2. Read the Y_test.txt into a data frame. This file represents the activity performed associated with each record of the X_test.txt data set.
3. Read the subject_test.txt into a data frame. This file represents the subject associated with each record of the X_test.txt data set
4. Bind the columns of the data frames from steps 1-3 where the subject column(step 3) is first, followed by the activity column(step 2), then the features(step 1)
5. Read the X_train.txt file into a data frame. This file represents the feature values of the experiment for the training subjects
6. Read the Y_train.txt into a data frame. This file represents the activity performed associated with each record of the X_train.txt data set.
7. Read the subject_train.txt into a data frame. This file represents the subject associated with each record of the X_train.txt data set
8. Bind the columns of the data frames from steps 5-7 where the subject column(step 7) is first, followed by the activity column(step 6), then the features(step 5)
9. Bind the rows of the the test data frame(step 4) with the train data frame(step 8). The final result is one data frame that contains 100% of the subject data
10. Read in the features.txt file into a chracter vector. This file represents the name of all of the features associated with the data found in X_test.txt and X_train.txt
11. Modify the character vector by replacing '-' with '_' and replacing '()' with 'Val'. This transformation is done to make the column extraction process easier(step 16)
12. Set the column names of the data frame created in step 9 to 'subject' for the subject column, 'activity' for the activity column, and the modified feature names from step 11 as the feature columns.
13. Read in the activity_labels.txt values into a factor. This file is set up as a key (numeric 1-6) and value (character activity type) pair. Only the character strings representing activities (values) were stored in the factor. NOTE: If this file were to change where the labels were not listed from numeric 1-6, this step would have to be modified.
14. Convert the 'activity' column of the data frame created in step 9 to a factor
15. Set the levels of the activity factor column from step 14 to the activity labels created in step 13. This replaces the values 1-6 with the activity values (WALKING, WALKING_UPSTAIRS,...etc)
16. From the full data set originally created in step 9, select the columns with the terms 'meanVal' and 'stdVal' and store those columns in a separate data frame along with the 'subject' and 'activity' columns. This new data frame consists of only features that from the original data set labeled as mean() or std(). This does not include features from the original data set with names labeled as meanFreq() or features which averaged signals denoted by featureNameMean
17. Group the data set constructed in step 16 by the subject followed by the activity. 
18. Summarize the grouped data set in step 17 by solving for the mean values of the features for each subject performing each activity (example: solve the mean for the features where the subject is 1 and the activity is WALKING, then solve where the subject is 1 and the activity is SITTING, etc.).  
19. Rename the 'meanVal' columns to 'AvgMeans' and the 'stdVal' columns to 'AvgStd' to better represent the data
20. Write the resultant data frame in step 19 to a file called tidyData.txt

---
### Tidy Data/Variable Descriptions
---
* Data Set
  * The resulting tidy data is a data frame of size 180 x 68
  * Each record in the data frame is unique, representing a subject performing one of the activities
  * Each column represents an average of the feature for a subject performing a given activity
* Column Structure (features)
  * subject - ordinal - Range:1-30
  * activity - categorical - Range:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  * Features - continuous - Range: average normalized value from -1 to 1 
    * Naming convention follows the raw data convention
      * t is a time domain signal
      * f is a frequency domain signal
      * Gravity is a gavity acceleration signal
      * Body is a body acceleration signal
      * Jerk is  jerk Body linear acceleration
      * Mag is signals of the magnitude of the three-dimensional signals
      * _XYZ represents the axis the data was read from
      * For more details read the raw data description above
    *   AvgMeans - the average mean value of all samples of a feature for a subject performing a given activity
    *   AvgStd - the average standard deviation value of all samples of a feature for a subject performing a given activity

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
