DATA SET info

The DATA SET contains results from an experiment involving 30 volunteers.
Each person was asked to performe six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.
The obtained dataset has been randomly partitioned into two sets:
- 70% for the training data 
- 30% for the the test data. 
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Code structure

The dataset variable has been created by merging the train, the test and the subject in a single dataframe.
Measurements on the mean and standard deviation for each feature have been extracted.
A column with the activity has been included by matching the y_set.
Column names have been replaced with more descriptive ones(i.e. f=frequency, t=time, activity, subject) and some of them have been cleaned in order to replace symbols, such as brackets, dashes, etc.
The average for each activity and subject has been estimated and the resulting dataframe has been saved in a txt.file named "average_data".

