## Getting and Cleaning Data (getdata-011) - Course Project

The project uses a script to get and clean some human activity recognition data collected from a smartphone.

*Find out more about the original dataset [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).*

```
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
```
* The script used to process the dataset is [run_analysis.R](https://github.com/dimichelec/getdata-011-Course-Project/blob/master/run_analysis.R)
* The codebook for the resulting data is [Codebook.md](https://github.com/dimichelec/getdata-011-Course-Project/blob/master/Codebook.md)


###Theory of Operation

*  [run_analysis.R](https://github.com/dimichelec/getdata-011-Course-Project/blob/master/run_analysis.R) works on the original .zip file, `UCI_HAR_Dataset.zip`
*  Uncomment three lines in the `# Download the dataset:` section to download the original .zip
*  The resultant dataset is saved as `dat2.txt` in the working directory
*  The script uses the `plyr` and `reshape2` libraries

In general, the script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It then writes the output data to the file *dat2.txt* in the working directory.

Throughout the script, it reads the different files from the source data directly from the .zip file using the *unz* command.

First it reads the training data from *subject_train.txt, y_train.txt, and X_train.txt*, combining these three into the data frame by column. It then, does the same thing with the test data, *subject_test.txt, y_test.txt, and X_test.txt*, and merges this set with the training observations using an *rbind* command.

Having all the data in one data frame, the columns are named mostly using the *features.txt* file, from the *.zip*, directly to name the variables. During this pocedure, any parentheses are removed from the variable names read from the file due to parentheses being problematic in using the data frame.

Next, the script creats a logical list denoting which variable columns can be kept due to finding the words "-mean" or "-std" in the column name. It then uses this list to keep only the subject, activity, and mean and standard deviation variable columns.

It then renames the activity values using the *mapvalues* command and the *activity_labels.txt* file from the *.zip*.

Lastly, the script *melt*s the data grouping by subject with activity, and uses *dcast* on the molten data set to produce a data frame of mean values for each variable of a subject|activity grouping, then saves it to *dat2.txt*.

