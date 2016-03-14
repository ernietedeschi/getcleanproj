# Codebook for run_analysis.R

This codebook describes the variables created by running 'run_analysis.R'. These variables are present in both the 'all' data table (which includes all observations for each measure) and the 'all_summary' data table (which includes just the means of each measure). 

### id 
The subject's id number. Integer from 1 - 30.

### dataset
String indicating the original source of the data, either the 'test' or 'train' datasets.
NOTE: Not present in the 'all_summary' data table.

### activity
String giving the name of the activity being performed. Values are 'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', or 'LAYING'

### measure
String showing the metric being measured. See the original UCI HAR documentation for more details: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### value
Numeric value associated with id, dataset, activity, and measure.
