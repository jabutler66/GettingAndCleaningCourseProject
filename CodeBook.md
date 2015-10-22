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

 $ SubjectID              : int  1-30 for each of the subjects in the study
 $ ActivityLabel          : Factor w/ 6 levels "LAYING","SITTING","WALKING","WALKING_UPSTAIRS",
                            "WALKING_DOWNSTAIRS","STANDING"  
 $ TimeBodyAccMagMean     : num  
 $ TimeBodyAccJerkMagMean : num  
 $ TimeBodyGyroMagMean    : num  
 $ TimeBodyGyroJerkMagMean: num  
 $ FFTBodyAccMagMean      : num  
 $ FFTBodyAccJerkMagMean  : num  
 $ FFTBodyGyroMagMean     : num  
 $ FFTBodyGyroJerkMagMean : num  






