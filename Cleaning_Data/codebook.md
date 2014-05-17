# Codebook for run_analysis.R #

The data come from experiments involving 30 people, each of whom were observed performing six activities: walking, walking upstairs, walking downstairs, sitting, standing, and lying down. A Samsung Galaxy SII did the observations on each person, and it was attached to his/her waist. The phone captured 3-axial liner acceleration and 3-axial angular velocity measurements, and 70% of the data was randomly selected to be in the training data and the remaining 30% in the test data.

The time and frequency domain variables were included in a 561-feature vector. Additionally, every subject was identified by a number between 1 and 30 (inclusive).

For both the training and the test data sets, the run_analysis.R script connects the 561-feature vector to the activity and subject-id vectors. Then it attaches the two modified datasets into one large dataset containing 563 columns and 10299 rows (the total number of instances in the data). The two extra columns, again, are just the activity and subject-id columns. All the data are simply integrated; none of the records are changed.

The rest of the script simply extracts subsets of the merged dataset. See the README for more details.
