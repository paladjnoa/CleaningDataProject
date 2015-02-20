###  ##########
##Study Design
###  ##########

This project uses data derived from a Human Activity Recognition database based 
on the recordings of 30 subjects performing activities of daily Living wearing 
a waist mounted smartphone.  The base dataset records 10299 instances of time and
frequency domain variables with 561 attributes.  A numeric identifier of the
subject and the activity for each observation are also provided.  The study was done 
at the Smartlab-Non Linear Complex Systems Laboratory in Genoa, Italy.

A fuller description and the data exists at:
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data and the descriptor files used in this projectwere downloaded on 
February 9, 2015 at 4:11 PM.

The downloaded data was partitioned into 2 sets 70% training data and 30% test data. 
Extracting provides two subdirectories train and test.  Each contains a directory,
Inertial Signals, which is not relevant to this project.  The train and test
directories are similar :  X_train.txt(X_test.txt) which contains the 10299 observations
of 561 variables, Y_train.txt(Y_test.txt) which includes the activities (1:6 described 
below),subject_train.txt(subject_test.txt) which include the numeric identifier of the
person being monitored.  An additional file activity_labels.txt relates the numeric
identifiers in the Y files to character string descriptions.

The particular variables studied in this analysis were those ending in meanX,meanY,meanZ,
stdX,stdY,stdZ.  The additional vectors obtained by averaging the signals in a signal 
window sample were not included in this study (although modifications to the function 
could easily be made if these were required).

The function run_Analysis() includes two interior funcions getFrame and createTable.
The first step is to read the features.txt file to create headings.  The characters AVG
and an index value of the feature in the original dataset are pasted to the beginning of 
each attribute name with the extraneous characters removed.  Part of this was to provide
column names to use in dplyr and part to desk check that the correct columns were being
used.  At this time, the vector of all names is searched for the names relevant to the
analysis (described in the paragraph above).  These indices are stored in a vector 
colHeadIndices. 

The data files for test and train are processed (in turn)  in getFrame.  The subject and
activity are attached to the wide attributes data set.  The two datasets created by 
getFrame are merged with an rbind.  The createTable function creates a dataset which
includes only the attributes being studied in this analysis.  The data is then grouped
by Subject and Activity and summarized using dplyr to produce the output file of 
180 observations of 50 variables described in CodeBook. 

The wide representation was chosen as it is more familiar to users of Excel.

### ######
##Code Book
### ######


   *Subject                 : int  1:30 volunteers ages 19-48 wearing a waist mounted 
				  smartphone (Samsung Galaxy S II)

   *Activity                : Factor w/ 6 levels 
				  "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS"
				  "SITTING","STANDING","LAYING"

			   The following 50 variables are the means computed from
			   selected means and standard deviations extracted from
			   the original dataset described above.  An Avg as been
			   prefixed to the name as well as the index in the original
                           dataset of the extracted data. 
				
   *Avg1tBodyAccmeanX       : numeric 
   *Avg2tBodyAccmeanY       : numeric  
   *Avg3tBodyAccmeanZ       : numeric  
   *Avg4tBodyAccstdX        : numeric  
   *Avg5tBodyAccstdY        : numeric  
   *Avg6tBodyAccstdZ        : numeric  
   *Avg41tGravityAccmeanX   : numeric 
   *Avg42tGravityAccmeanY   : numeric 
   *Avg43tGravityAccmeanZ   : numeric  
   *Avg44tGravityAccstdX    : numeric 
   *Avg45tGravityAccstdY    : numeric 
   *Avg46tGravityAccstdZ    : numeric  
   *Avg81tBodyAccJerkmeanX  : numeric 
   *Avg82tBodyAccJerkmeanY  : numeric 
   *Avg83tBodyAccJerkmeanZ  : numeric 
   *Avg84tBodyAccJerkstdX   : numeric 
   *Avg85tBodyAccJerkstdY   : numeric 
   *Avg86tBodyAccJerkstdZ   : numeric 
   *Avg121tBodyGyromeanX    : numeric  
   *Avg122tBodyGyromeanY    : numeric  
   *Avg123tBodyGyromeanZ    : numeric  
   *Avg124tBodyGyrostdX     : numeric  
   *Avg125tBodyGyrostdY     : numeric  
   *Avg126tBodyGyrostdZ     : numeric 
   *Avg161tBodyGyroJerkmeanX: numeric  
   *Avg162tBodyGyroJerkmeanY: numeric  
   *Avg163tBodyGyroJerkmeanZ: numeric 
   *Avg164tBodyGyroJerkstdX : numeric 
   *Avg165tBodyGyroJerkstdY : numeric
   *Avg166tBodyGyroJerkstdZ : numeric  
   *Avg266fBodyAccmeanX     : numeric  
   *Avg267fBodyAccmeanY     : numeric  
   *Avg268fBodyAccmeanZ     : numeric  
   *Avg269fBodyAccstdX      : numeric  
   *Avg270fBodyAccstdY      : numeric  
   *Avg271fBodyAccstdZ      : numeric  
   *Avg345fBodyAccJerkmeanX : numeric  
   *Avg346fBodyAccJerkmeanY : numeric  
   *Avg347fBodyAccJerkmeanZ : numeric 
   *Avg348fBodyAccJerkstdX  : numeric  
   *Avg349fBodyAccJerkstdY  : numeric  
   *Avg350fBodyAccJerkstdZ  : numeric 
   *Avg424fBodyGyromeanX    : numeric 
   *Avg425fBodyGyromeanY    : numeric  
   *Avg426fBodyGyromeanZ    : numeric  
   *Avg427fBodyGyrostdX     : numeric  
   *Avg428fBodyGyrostdY     : numeric 
   *Avg429fBodyGyrostdZ     : numeric  





