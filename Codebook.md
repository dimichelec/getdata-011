## Codebook

This codebook describes the data resulting from the [run_analysis.R](https://github.com/dimichelec/getdata-011-Course-Project/blob/master/run_analysis.R) script in this repository. See [README.md](https://github.com/dimichelec/getdata-011-Course-Project/blob/master/README.md) for additional information.

Go [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) for more information about the original dataset.

### Mean Activity Data (dat2)

The `dat2` data table contains 66 of the original 561 features. Of the original list, any feature not labeled with a `-mean` or `-std` was left behind and the resulting data was aggregated (mean) based on *subject/activity* grouping.

The new *subject* column has a range of 1 thru 30 denoting the test subject the measurement (row) was logged from. The new *activity* column denotes the activity performed by the subject during the measurement. This column has values:  

| Activities          |
|---------------------|
| LAYING              |
| SITTING             |
| STANDING            |
| WALKING             |
| WALKING_DOWNSTAIRS  |
| WALKING_UPSTAIRS    |

The 66 measured features were renamed to remove parentheses, making it easier to call them out in R. For example, `tBodyAcc-mean()-X` becomes `tBodyAcc-mean-X`. Also, of the 561 original features, the following were maintained which were the mean and standard deviation features:

| | | |
|---|---|---|
|tBodyAcc-mean-X|tBodyAcc-mean-Y|tBodyAcc-mean-Z|
|tBodyAcc-std-X|tBodyAcc-std-Y|tBodyAcc-std-Z|
|tGravityAcc-mean-X|tGravityAcc-mean-Y|tGravityAcc-mean-Z|
|tGravityAcc-std-X|tGravityAcc-std-Y|tGravityAcc-std-Z|
|tBodyAccJerk-mean-X|tBodyAccJerk-mean-Y|tBodyAccJerk-mean-Z|
|tBodyAccJerk-std-X|tBodyAccJerk-std-Y|tBodyAccJerk-std-Z|
|tBodyGyro-mean-X|tBodyGyro-mean-Y|tBodyGyro-mean-Z|
|tBodyGyro-std-X|tBodyGyro-std-Y|tBodyGyro-std-Z|
|tBodyGyroJerk-mean-X|tBodyGyroJerk-mean-Y|tBodyGyroJerk-mean-Z|
|tBodyGyroJerk-std-X|tBodyGyroJerk-std-Y|tBodyGyroJerk-std-Z|
|tBodyAccMag-mean|tBodyAccMag-std||
|tGravityAccMag-mean|tGravityAccMag-std||
|tBodyAccJerkMag-mean|tBodyAccJerkMag-std||
|tBodyGyroMag-mean|tBodyGyroMag-std||
|tBodyGyroJerkMag-mean|tBodyGyroJerkMag-std||
|fBodyAcc-mean-X|fBodyAcc-mean-Y|fBodyAcc-mean-Z|
|fBodyAcc-std-X|fBodyAcc-std-Y|fBodyAcc-std-Z|
|fBodyAccJerk-mean-X|fBodyAccJerk-mean-Y|fBodyAccJerk-mean-Z|
|fBodyAccJerk-std-X|fBodyAccJerk-std-Y|fBodyAccJerk-std-Z|
|fBodyGyro-mean-X|fBodyGyro-mean-Y|fBodyGyro-mean-Z|
|fBodyGyro-std-X|fBodyGyro-std-Y|fBodyGyro-std-Z|
|fBodyAccMag-mean|fBodyAccMag-std||
|fBodyBodyAccJerkMag-mean|fBodyBodyAccJerkMag-std||
|fBodyBodyGyroMag-mean|fBodyBodyGyroMag-std||
|fBodyBodyGyroJerkMag-mean|fBodyBodyGyroJerkMag-std||


### Notes

If I take a deeper look at this data, it looks like the *features.txt* file probably has issues. Feature names like `fBodyBodyAccJerkMag-mean()` and `fBodyBodyAccJerkMag-std()` should probably be `fBodyAccJerkMag-mean()` and `fBodyAccJerkMag-std()`.

Basically, the resulting data of the script gives us this dataset:

| | | | | |
|---|---|---|---|---|
|**Accelerometer Features**|||||
|Base vector|BodyAcc|X,Y,Z,Magnitude|mean,std|time,freq|
|Jerk vector|BodyAccJerk|X,Y,Z,Magnitude|mean,std|time,freq|
||||||
|**Gyroscope Features**|||||
|Base vector|BodyGyro|X,Y,Z,Magnitude|mean,std|time,freq|
|Jerk vector|BodyGyroJerk|X,Y,Z,Magnitude|mean,std|time|
||||||
|**Gravity Features**|||||
|Acceleration|GravityAcc|X,Y,Z,Magnitude|mean,std|time|


