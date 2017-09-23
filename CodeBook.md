# Code Book
This code book pertains to the final data contained in the tidy_data.txt file in this repository.

### Data
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable on the Coursera project page. A link to the original data is in the README.md file in this repository.

The raw data was read in from the following files:

    1. subject_train.txt
    2. X_train.txt
    3. Y_train.txt
    4. subject_test.txt
    5. X_test.txt
    6. y_test.txt
    7. features.txt
    8. activity_labels.txt

This data was merged together and only the mean and standard deviation variables were extracted (disregarding all other data) 
for further transformation.

### Variables
This merged dataset contains 81 variables (subject, activity, and 79 signal measurements).

#### Identifiers
  Subject
  
    * Integer value from 1-30
    
  Activity
  
    * String with the following six possible values   
        1. WALKING: subject was walking
        2. WALKING_UPSTAIRS: subject was walking upstairs
        3. WALKING_DOWNSTAIRS: subject was walking downstairs
        4. SITTING: subject was sitting
        5. STANDING: subject was standing
        6. LAYING: subject was laying

  Signal Measurements

    * All measurements are floating-point values, normalised and bounded within [-1,1]
    * Sample of Measurements
        1. timeDomainBodyAccelerometerMeanX
        2. timeDomainBodyAccelerometerStandardDeviationX
        3. timeDomainBodyGyroscopeMeanY
        4. frequencyDomainBodyAccelerometerMeanZ
        5. frequencyDomainBodyGyroscopeStandardDeviationX
    
### Transformations
The following additional transformations were applied to the source data after merging and extracting mean & std variables:

    1. The activity identifiers (originally coded as integers between 1 and 6) were replaced with 
        descriptive activity names (see Identifiers section)
    2. The variable names were replaced with descriptive variable names (e.g. tBodyAcc-mean()-X was 
        expanded to timeDomainBodyAccelerometerMeanX), using the following set of rules:
          * Special characters (i.e. (, ), and -) were removed
          * The initial f and t were expanded to frequencyDomain and timeDomain respectively
          * Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, 
            Frequency, Mean, and StandardDeviation respectively
          * Replaced BodyBody with Body
    3. A final data set was created with the average of each variable grouped by subject and activity
