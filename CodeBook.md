Codebook for Course Project

Purpose: to show ability to access, manipulate and clean data sets into a tidy data set

Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Data source contains files with motion data for a motion tracking device for a study on 30 subjects doing
a variety of activities. Data files and variable label files are all included. Subjects were randomly
assigned to the test or training groups. For the test group, this project used the X_test.txt, Y_test.txt,
and subject_test.txt files. For the training group, this project used the X_train.txt, Y_train.txt, and
subject_train.txt files. The features.txt and activity_labels.txt files were used to provide variable labels.

Method: First, pull datasets into R. Began this step by reading the variable labels (features.txt) into R
as a character vector, then used this with the colNames argument to add the labels. Merge the test files
into one file. Merge the training files into one file. Combine the test and training files. Next, added
the labels for the activities from the activity_labels.txt file. From the combined file, selected the 
variables for the means and standard deviations (i.e. all variables containing ".mean" or ".std"). Combined 
the data files for the mean and standard deviation variables into a single tidy data set. Finally, for the 
last step of the project, the file containing all of the variables with the means was grouped by SubjectID 
and ActivityLabel. The means were calculated on the magnitude variables, renamed, and summarized in a table
which was then written out to the final course project product, a file named "tidyfile.txt".

Final file "tidyfile.txt" contains the following variables:

 $ SubjectID              : int  1 1 1 1 1 1 2 2 2 2 ...
 $ ActivityLabel          : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ TimeBodyAccMagMean     : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ TimeBodyAccJerkMagMean : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ TimeBodyGyroMagMean    : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ TimeBodyGyroJerkMagMean: num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ FFTBodyAccMagMean      : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ FFTBodyAccJerkMagMean  : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ FFTBodyGyroMagMean     : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ FFTBodyGyroJerkMagMean : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...






