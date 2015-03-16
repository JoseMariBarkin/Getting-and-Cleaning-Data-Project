#["Human Activity Recognition Using Smartphones"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) transformation cookbook

(high level description here, for details go to inline comments)

1. Column names for data were loaded from features.txt and where cleaned-up
2. Logical vector was created with columns to keep by parsing column names via regex.
   Only columns with mean() and std() functions remain.
   MeanFreq and Angle functions where omitted
3. Train dataset was loaded, unneeded columns removed.
   Activity and subjects were loaded as well and converted to factors
   Activiy, subjects and function values were binded into single dataset
4. The same was done for test dataset, after that both datasets were merged and ther result exported as final.txt
5. New dataset was created for calculating means of mean() and std() functions from first tidy dataset. To do so
   - first dataset was melted with subject and activity as identifiers
   - melted dataset was casted to dataframe using mean() as cast function to calculate means of variables
   - resulting dataset was exported as final2.txt

More on melting and casting [here](http://tgmstat.wordpress.com/2013/10/31/reshape-and-aggregate-data-with-the-r-package-reshape2/)