# Summary of Run_Analysis.R #

The first part of the file perfoms these actions:

* Reads in the names of the 561 measured variables.
* Reads in the test data for these 561 variables and associates them with their names.
* Reads in the names of the activities for which the variable data was gathered.
* Translates the code for each activity into English (1 == "WALKING", 2 == "WALKING_UPSTAIRS", etc.).
* Binds the list of activities to the test_feature_data dataset.
* Reads in the codes for each subject in the test group.
# Binds the list of codes to the test_feature_data dataset.

The middle part of the file performs these actions:

* Reads in the training dataset and associates the already defined variables names with them.
* Reads in the names of the activities for which the variable data was gathered.
* Again translates the code for each activity into English.
* Binds the list of activities to the training_feature_data dataset.
* Reads in the codes for each subject in the training group.
* Binds the list of codes to the test_feature_data dataset.

The third part of the file performs these actions:

* Merges the test_feature_data and training_feature_data datasets.
* Extracts the means of every variable in the merged_data dataset.
* Extracts the standard deviations of every variable in the merged_data dataset.

The fourth part of the file defines a function called revise_data, which performs these actions:

* Takes a dataset as its parameter, whose value is the merged dataset.
* Creates an empty data frame called result.
* Iterates over every subject (30 in total) and pulls the corresponding data into a variable subject_data.
* Iterates over each activity type.
* Pulls the data for the given subject's activity.
* Calculates the mean of every variable for the given subject and his/her activities.
* Attaches the mean calculation to the data frame called results.
* After the iterations, assigns column names to the result data frame and replaces the NAs in the Activities column with the names of the activities.
* Returns the resulting data frame.

The final part of the file calls the revise_data function on the merged_data dataset and then writes the new dataset to a text file.