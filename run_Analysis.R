run_Analysis <- function(){
    ##read in files, select fields for analysis
    ##group by subject and activity
    ##write output to file
    library(data.table)
    library(dplyr)
    library(stringr)
    #####
    getFrame <- function (Xfile,Yfile,subjectFile) {
    #####    
        
        dtx <- read.table(Xfile,quote="",stringsAsFactors = FALSE)
        colnames(dtx) = colHeads
        dty <-  read.table(Yfile,quote="",stringsAsFactors = FALSE)
        subject <- read.table(subjectFile,quote="",stringsAsFactors = FALSE)
        dtx$subject <- subject[[1]]
        
        filePathAct  <- "activity_labels.txt"
        activityLabels <- read.table(filePathAct,quote="",stringsAsFactors = TRUE)   
        dtx$activity  <- factor(dty[[1]],labels= activityLabels[[2]])
        
        return(dtx)
        
    }
    #####
    createTable <- function(indata,headingIndices,colHeads){
    #####
        size <- nrow(indata) 
        outdata  <- data.frame(matrix(NA,nrow = size ,ncol=1))
        outdata[[1]] <- indata[[headingIndices[1]]]
        for (i in 2:length(headingIndices)) {
            outdata <- cbind(outdata,indata[[headingIndices[i]]])
        }
        colnames(outdata) <- colHeads[headingIndices]
        outdata <- cbind(Subject = indata$subject,
                         Activity = indata$activity,outdata)
        return(outdata)
    }
    
    #create a data frame that holds the names of the columns for the table
    fileFeaturesPath <- "features.txt"
    features <- read.table(fileFeaturesPath,quote="",
                           stringsAsFactors = FALSE)
    colHeads <- paste("Avg",features[[1]],
                      str_replace_all(features[[2]],pattern = "[,()-]",""),
                      sep="")
    
    pat<- c("meanX","meanY","meanZ","stdX","stdY","stdZ")
    colHeadIndices <- grep(paste(pat,collapse="|"),colHeads)
    
    #read in the files for text and train
    testX <- getFrame("X_test.txt", "y_test.txt","subject_test.txt")
    trainX <- getFrame("X_train.txt","y_train.txt","subject_train.txt")
    
    #merge the testing and training data 
    completeData <- data.table(rbind(testX,trainX))
    
    #create a data table with the required columns (mean and std)
    revisedData <- createTable(completeData,colHeadIndices,colHeads)
    
    #summarize by subject and activity
    dplyr_data <- tbl_df(revisedData)
    group_by_data <- group_by(dplyr_data,Subject,Activity)
    funs <- "mean (.,na.rm = TRUE)"    
    temp <- summarise_each(group_by_data,funs)
    write.table (temp,  file = "ActivityTracking.txt",
                 sep = "\t",col.names=TRUE, row.names=FALSE)  
  
}

