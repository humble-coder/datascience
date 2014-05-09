complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- list.files(directory)
  
  nobs <- vector(length = length(id))
  
  for(i in 1:length(id)) {
    table <- read.csv(paste(directory, files[id[i]], sep="/"))
    x <- table[, 2]
    y <- table[, 3]
    ok <- complete.cases(x, y)
    nobs[i] <- sum(ok)
  }
  
  result <- data.frame(id, nobs)
  
  result
}