test_feature_labels <- read.table("./UCI_HAR_Dataset/features.txt")
test_feature_labels <- test_feature_labels[, 2]
test_feature_data <- read.table("./UCI_HAR_Dataset/test/X_test.txt", col.names = test_feature_labels)
Activities <- read.table("./UCI_HAR_Dataset/test/y_test.txt", col.names = c("Activities"))
Activities <- factor(Activities$Activities, levels = c(1, 2, 3, 4, 5, 6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
test_feature_data <- cbind(test_feature_data, Activities)
test_subject_labels <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", col.names = c("Subject"))
test_feature_data <- cbind(test_feature_data, test_subject_labels)

training_feature_data <- read.table("./UCI_HAR_Dataset/train/X_train.txt", col.names = test_feature_labels)
Activities <- read.table("./UCI_HAR_Dataset/train/y_train.txt", col.names = c("Activities"))
Activities <- factor(Activities$Activities, levels = c(1, 2, 3, 4, 5, 6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
training_feature_data <- cbind(training_feature_data, Activities)
training_subject_labels <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", col.names = c("Subject"))
training_feature_data <- cbind(training_feature_data, training_subject_labels)

merged_data <- rbind(test_feature_data, training_feature_data)
all_means <- sapply(merged_data, mean)
all_sds <- sapply(merged_data, sd)

revise_data <- function(data) {
  result <- data.frame()
  for(i in 1:30) {
    subject_data <- data[data$Subject == i, ]
    for(item in c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")) {
      activity_data <- subject_data[subject_data$Activities == item, ]
      revised_activity_data <- sapply(activity_data, mean)
      result <- rbind(result, revised_activity_data)
      if(i == 30 && item == "LAYING") {
        names(result) <- names(data)
        result$Activities <- rep(c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"), 30)
        return(result)
      }
    }
  }
}

tidy_data_set <- revise_data(merged_data)
write.table(tidy_data_set, "tidy_data_set.txt")

