# README for run_analysis.R
This script downloads the Human Activity Recognition Using Smartphones data set, unzips the files, merges the "test" and "train" data sets, extracts measures of the mean and standard deviation, tidys the data, and creates a summary dataset with only the means by subject id, activity, and measure.

The tidied raw data is present as a data table named 'all', while the tidied summary data with means only is named 'all_summary', which is also saved as a text file called 'all_summary.txt'

To test, simply run 'run_analysis.R' in R.
