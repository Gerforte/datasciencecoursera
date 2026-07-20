# CodeBook

## Overview

This code book describes the variables, the data, and the transformations
performed on the Human Activity Recognition Using Smartphones dataset.

The original dataset was collected from the accelerometers and gyroscopes
of Samsung Galaxy S smartphones worn by 30 subjects performing six
different activities.

## Source

Original dataset:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables

### subject

Identifier of the subject who performed the activity.

Values range from 1 to 30.

### activity_name

Descriptive name of the activity performed by the subject.

Possible values:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Measurement variables

The remaining variables contain measurements extracted from the original
dataset.

Only variables corresponding to measurements of the mean and standard
deviation were retained.

The selected measurements include:

- Time-domain measurements
- Frequency-domain measurements
- Body acceleration
- Gravity acceleration
- Body gyroscope measurements
- Jerk signals
- Magnitude measurements

The measurements are normalized and bounded within [-1, 1] in the original
dataset.

## Transformations

The following transformations were performed:

1. The training and test datasets were downloaded and read into R.
2. The training and test measurements were merged using `rbind()`.
3. The activity identifiers and subject identifiers were merged with the
   measurement data.
4. Only measurements containing `mean()` or `std()` were retained.
5. Numeric activity identifiers were replaced with descriptive activity
   names using `activity_labels.txt`.
6. Variable names were assigned using `features.txt`.
7. The data was grouped by subject and activity.
8. The mean of each measurement was calculated for each subject and activity.
9. The resulting tidy dataset was written to `tidy_data.txt`.

## Final Dataset

The final dataset contains:

- 180 observations
- 68 variables

The 180 observations correspond to:

30 subjects × 6 activities.

Each row represents the average measurements for one subject performing
one activity.

Each column represents one variable.
