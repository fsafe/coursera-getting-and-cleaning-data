# Human Activity Recognition Using Smartphones Dataset
# Data report overview

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccXYZ and timeGyroXYZ. These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccXYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerkXYZ and timeBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccXYZ, frequencyBodyAccJerkXYZ, frequencyBodyGyroXYZ, frequencyBodyAccJerkMag, frequencyBodyGyroMag, frequencyBodyGyroJerkMag. (Note the 'frequency' for frequency domain signals). 

The set of variables that were estimated from these signals are: 

Mean: Mean value

Std: Standard deviation

All variables were grouped and averaged over activity and subjectId

The dataset examined has the following dimensions:

Feature                 |  Result
------------------------|--------
Number of observations  |     180
Number of variables     |      68

# Codebook summary table

Variable | Class | Unique values | Missing 
---------|-------|---------------|---------
activity | factor | 6| 0.00 %
subjectId | integer | 30 | 0.00%
timeBodyAccMeanX | numeric|180|0.00 %
timeBodyAccMeanY | numeric|180|0.00 %
timeBodyAccMeanZ | numeric|180|0.00 %
timeBodyAccStdX | numeric|180|0.00 %
timeBodyAccStdY | numeric|180|0.00 %
timeBodyAccStdZ | numeric|180|0.00 %
timeGravityAccMeanX | numeric|180|0.00 %
timeGravityAccMeanY | numeric|180|0.00 %
timeGravityAccMeanZ | numeric|180|0.00 %
timeGravityAccStdX | numeric|180|0.00 %
timeGravityAccStdY | numeric|180|0.00 %
timeGravityAccStdZ | numeric|180|0.00 %
timeBodyAccJerkMeanX | numeric|180|0.00 %
timeBodyAccJerkMeanY | numeric|180|0.00 %
timeBodyAccJerkMeanZ | numeric|180|0.00 %
timeBodyAccJerkStdX | numeric|180|0.00 %
timeBodyAccJerkStdY | numeric|180|0.00 %
timeBodyAccJerkStdZ | numeric|180|0.00 %
timeBodyGyroMeanX | numeric|180|0.00 %
timeBodyGyroMeanY | numeric|180|0.00 %
timeBodyGyroMeanZ | numeric|180|0.00 %
timeBodyGyroStdX | numeric|180|0.00 %
timeBodyGyroStdY | numeric|180|0.00 %
timeBodyGyroStdZ | numeric|180|0.00 %
timeBodyGyroJerkMeanX | numeric|180|0.00 %
timeBodyGyroJerkMeanY | numeric|180|0.00 %
timeBodyGyroJerkMeanZ | numeric|180|0.00 %
timeBodyGyroJerkStdX | numeric|180|0.00 %
timeBodyGyroJerkStdY | numeric|180|0.00 %
timeBodyGyroJerkStdZ | numeric|180|0.00 %
timeBodyAccMagMean | numeric|180|0.00 %
timeBodyAccMagStd | numeric|180|0.00 %
timeGravityAccMagMean | numeric|180|0.00 %
timeGravityAccMagStd | numeric|180|0.00 %
timeBodyAccJerkMagMean | numeric|180|0.00 %
timeBodyAccJerkMagStd | numeric|180|0.00 %
timeBodyGyroMagMean | numeric|180|0.00 %
timeBodyGyroMagStd | numeric|180|0.00 %
timeBodyGyroJerkMagMean | numeric|180|0.00 %
timeBodyGyroJerkMagStd | numeric|180|0.00 %
frequencyBodyAccMeanX | numeric|180|0.00 %
frequencyBodyAccMeanY | numeric|180|0.00 %
frequencyBodyAccMeanZ | numeric|180|0.00 %
frequencyBodyAccStdX | numeric|180|0.00 %
frequencyBodyAccStdY | numeric|180|0.00 %
frequencyBodyAccStdZ | numeric|180|0.00 %
frequencyBodyAccJerkMeanX | numeric|180|0.00 %
frequeyBodyAccJerkMeanY | numeric|180|0.00 %
frequencodyAccJerkMeanZ | numeric|180|0.00 %
frequencyByAccJerkStdX | numeric|180|0.00 %
frequencyBodyAJerkStdY | numeric|180|0.00 %
frequencyBodyAccrkStdZ | numeric|180|0.00 %
frequencyBodyGyroMnX | numeric|180|0.00 %
frequencyBodyGyroMea | numeric|180|0.00 %
frequencyBodyGyroMeanZre | numeric|180|0.00 %
fquencyBodyGyroStdX | numeric|180|0.00 %
frequencyBodyGyroStdY | numeric|180|0.00 %
frequencyBodyGyroStdZ | numeric|180|0.00 %
frequencyBodyAccMagMean | numeric|180|0.00 %
frequencyBodyAccMagStd | numeric|180|0.00 %
frequencyBodyAccJerkMagMean | numeric|180|0.00 %
frequencyBodyAccJerkMagd | numeric|180|0.00 %
frequencyBodyGyroMagMean | numeric|180|0.00 %
frequencyBodyGyroMagStd | numeric|180|0.00 %
frequencyBodyGyroJerkMagMean | numeric|180|0.00 %
frequencyBodyGyroJerkMagStd | numeric|180|0.00 %
