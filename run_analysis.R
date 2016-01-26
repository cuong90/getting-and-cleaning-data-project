library(plyr)

# Step 1: Merge the training and test sets to create one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
new_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, new_features]

# name columns
names(x_data) <- features[new_features,2]

# Step 3: Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# name the column
names(y_data) <- "activities"

# Step 4: Appropriately label the data set with descriptive variable names

# name the column for subject data
names(subject_data) <- "subjects"

# combine datasets
final_data <- cbind(subject_data,y_data,x_data)

# Step 5: Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

average_data <- ddply(final_data, .(subjects, activities), function(x) colMeans(x[, 3:68]))

write.table(average_data, "tidy_data.txt", row.name=FALSE)