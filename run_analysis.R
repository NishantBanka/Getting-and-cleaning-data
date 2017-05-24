x_train <- read.table("F:/data sets/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("F:/data sets/UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("F:/data sets/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("F:/data sets/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("F:/data sets/UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("F:/data sets/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('F:/data sets/UCI HAR Dataset/features.txt')
activityLabels = read.table('F:/data sets/UCI HAR Dataset/activity_labels.txt')

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(sub_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(sub_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

merge_train <- cbind(x_train,y_train,sub_train)


merge_test <- cbind(x_test,y_test,sub_test)


merge_all <- rbind(merge_train,merge_test)



mean_and_std <- (grepl("activityId" , colnames(merge_all)) | 
                   grepl("subjectId" , colnames(merge_all)) | 
                   grepl("mean.." , colnames(merge_all)) | 
                   grepl("std.." , colnames(merge_all))) 

reqd_subset <- merge_all[,mean_and_std]

subsetWithActivityNames <- merge(reqd_subset, activityLabels,
                              by='activityId',
                              all.x=TRUE)

TidySet <- aggregate(. ~subjectId + activityId, subsetWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

write.table(TidySet, "F:/data sets/UCI HAR Dataset/TidySet.txt", row.name=FALSE)