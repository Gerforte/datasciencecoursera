# Getting and Cleaning Data - Course Project

## Description

This repository contains the files for the Getting and Cleaning Data
course project.

The objective is to collect, clean, and transform the Human Activity
Recognition Using Smartphones dataset into a tidy dataset.

## Files

### run_analysis.R

This script performs all required data preparation steps:

1. Downloads the original dataset.
2. Unzips the dataset.
3. Reads the training and test datasets.
4. Merges the training and test data.
5. Extracts measurements related to the mean and standard deviation.
6. Replaces activity identifiers with descriptive activity names.
7. Creates a tidy dataset containing the average of each measurement for
   each subject and activity.
8. Saves the final dataset as `tidy_data.txt`.

### CodeBook.md

Describes the variables contained in the final tidy dataset and explains
the transformations performed by `run_analysis.R`.

### tidy_data.txt

Contains the final independent tidy dataset.

## How to Run

1. Clone or download this repository.
2. Open R or RStudio.
3. Set the working directory to the repository directory.
4. Run:

```r
source("run_analysis.R")
