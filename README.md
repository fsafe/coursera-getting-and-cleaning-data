# coursera-getting-and-cleaning-data
Data Science Specialization (Johns Hopkins University) - Getting and Cleaning Data - Week 4 Project

The purpose of this project is to collect, work with, and clean a data set.

To run correctly you just need to run the R script "run_analysis.R". All file downloading, setting the correct working directory
, data analysis and writing the output tidy data to a file are done by the script.

Below is an explanation of the steps taken by the script run_analysis.R:

1. The working directory is set to the "download" folder and raw data ( in compressed form ) is downloaded. The data is then uncompressed.
2. The uncompressed raw test and training data which exists in multiple files are loaded into different dataframes and those dataframes are then merged
3. Mean and standard deviation columns are then extracted from the merged dataframe
4. The combined dataframe is merged with the activity dataframe in order to to match activity labels with activity descriptions
5. Column labels are renamed to confirm with tidy data standards. The following changes are made:
    * parentheses "()" and dashes "-" are removed from the column names
    * columns begining with "t" or "f" are renamed to begin with "time" and "frequency" respectively.
    * first letter of "mean" and "std" are capitalized to conform with lowerCamelCase standard
    * the word "Body" was duplicated in some column names and this was corrected
6. The resulting tidy dataframe was then averaged on columns "activity" and "subjectId" and the result was output to a local file.
