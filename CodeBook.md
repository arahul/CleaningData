a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 

variables used 
fileURL # specify the URL from where the file to be downloaded
features #to hold features data 
test_X #to hold testing recorded observations 
test_Y #to hold testing labels
test_Subject #to hold the subject 
testing_data #combine all the testing data 
train_X # to hold training recorded observations
train_Y # to hold training labels 
train_Subject # to hold the subject
training_data # combine all the training data 
activity # for linking the class labels with activity name 
merge_data # combine testing and training data 

steps of approach :
1. create the training data set from train_X, train_Y and train_Subject 
2. create the testing data set from test_X, test_Y and test_Subject 
3. combine training and testing datasets.
4. replace the activity numbers with labels
5. get mean and standard deviation fields 
6. prepare tidy data set. 

