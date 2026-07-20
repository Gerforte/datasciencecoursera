# ============================================================
# Getting and Cleaning Data - Course Project
# ============================================================

# Packages
library(dplyr)

# ============================================================
# 1. Download and unzip the dataset
# ============================================================

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download.file(url, destfile = "UCI_HAR_Dataset.zip", mode = "wb")

unzip("UCI_HAR_Dataset.zip")

# ============================================================
# 2. Read the data
# ============================================================

# Activity labels
activity_labels <- read.table(
  "UCI HAR Dataset/activity_labels.txt",
  header = FALSE,
  col.names = c("activity_id", "activity_name")
)

# Features
features <- read.table(
  "UCI HAR Dataset/features.txt",
  header = FALSE,
  col.names = c("feature_id", "feature_name")
)

# Training data
X_train <- read.table(
  "UCI HAR Dataset/train/X_train.txt",
  header = FALSE
)

y_train <- read.table(
  "UCI HAR Dataset/train/y_train.txt",
  header = FALSE,
  col.names = "activity_id"
)

subject_train <- read.table(
  "UCI HAR Dataset/train/subject_train.txt",
  header = FALSE,
  col.names = "subject"
)

# Test data
X_test <- read.table(
  "UCI HAR Dataset/test/X_test.txt",
  header = FALSE
)

y_test <- read.table(
  "UCI HAR Dataset/test/y_test.txt",
  header = FALSE,
  col.names = "activity_id"
)

subject_test <- read.table(
  "UCI HAR Dataset/test/subject_test.txt",
  header = FALSE,
  col.names = "subject"
)

# ============================================================
# 3. Merge training and test sets
# ============================================================

X <- rbind(X_train, X_test)

y <- rbind(y_train, y_test)

subject <- rbind(subject_train, subject_test)

# Add feature names
colnames(X) <- features$feature_name

# Combine subject, activity and measurements
data <- cbind(
  subject,
  y,
  X
)

# ============================================================
# 4. Extract only mean and standard deviation measurements
# ============================================================

# Select variables containing mean() or std()
selected_features <- grepl(
  "mean\\(\\)|std\\(\\)",
  features$feature_name
)

# Keep subject, activity and selected measurements
data_selected <- data[, c(
  "subject",
  "activity_id",
  which(selected_features) + 2
)]

# ============================================================
# 5. Use descriptive activity names
# ============================================================

data_selected <- merge(
  data_selected,
  activity_labels,
  by = "activity_id"
)

# Remove activity ID
data_selected$activity_id <- NULL

# Reorder columns
data_selected <- data_selected[, c(
  "subject",
  "activity_name",
  setdiff(
    names(data_selected),
    c("subject", "activity_name")
  )
)]

# ============================================================
# 6. Create independent tidy data set
#    Average of each variable for each activity and subject
# ============================================================

tidy_data <- data_selected %>%
  group_by(subject, activity_name) %>%
  summarise(
    across(
      everything(),
      mean
    ),
    .groups = "drop"
  )

# ============================================================
# 7. Save the tidy dataset
# ============================================================

write.table(
  tidy_data,
  "tidy_data.txt",
  row.names = FALSE
)
