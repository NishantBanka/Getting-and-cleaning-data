First store all the data from each table to a variable with the same name(say X_train.txt is read to variable x_train and so on).
Next we read features and activity_lists.
Column Names are given to each of the variables from each data sets.
The training datasets are then merged using the cbind().
The testing datasets are then merged using the cbind().
Both the datasets are merged using the rbind() and is stored to variable reqd_subset.
Descrptive activity names are given to the activites in the data set.
A data set is generated  with the average of each variable for each activity and each subject.
