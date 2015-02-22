
## run_Analysis.R

* Contains :  r function -  run_Analysis().  No parameters required.

* Requires the following files in the same directory as run_Analysis.

		run_Analysis.R
		features.txt
		activity_labels.txt
		X_test.txt
		y_test.txt
		subject_test.txt
		X_train.txt
		y_train.txt
		subject_train.txt

* Output:  a file ActivityTracking.txt created by the following:

 	  write.table (temp,  file = "ActivityTracking.txt", 
                 sep = "\t",col.names=TRUE, row.names=FALSE)  

	  To read in and view:

		df <- read.table("ActivityTracking.txt",header=TRUE)
                View(df)
		
* Note	  The output file contains 180 rows and 50 columns.  Only the
	  columns labeled mean or std and ending in X, Y or Z were
	  extracted from the original data set.

* Description  See CodeBook Study Design for a description of what
	       the R script accomplishes.
	 
