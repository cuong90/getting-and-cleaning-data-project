# Run_analysis.R
Manh Cuong  
January 26, 2016  

### Data sources

- A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Steps

1. Merges the training and the test sets to create one data set. Using the rbind() function to merge data sets.

- reading data from "x_train.txt", "y_train.txt", "subject_train.txt", "x_test.txt", "y_test.txt", "subject_test.txt" to varibles "x_train", "y_train", "subject_train", "x_test.txt", "y_test", "subject_test".
- combining traing and test data sets by using rbind() function, we get variables "x_data", "y_data", "subject_data".

2. Extracts only the measurements on the mean and standard deviation for each measurement. Taking the column names relating to mean and standard deviation.

- reading all variables from "features.txt" and keep only variables which are related to mean, and standard deviation.
- extracting measurments in the mean and standard deviation from "x_data".
- naming columns for new "x_data".

3. Uses descriptive activity names to name the activities in the data set. Replacing activity values by acitivity names.

- reading activity labels from "activity_labels.txt".
- replacing activity values by activity names in "y_data".
- naming column for "y_data"

4. Appropriately labels the data set with descriptive variable names.Adding the column name "subject" then combine all data.

- naming column for "subject_data"
- combining all "x_data", "y_data", "subject_data"

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Calculating the averge and write to a file.

- using ddply() function to calculate the average of each variable for each activity and each subject.
- using write.table() to create new tidy data set.
