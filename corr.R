corr <- function(directory, threshold = 0, variable1, variable2) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## factor1 and factor2; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- list.files(directory)
  correlations <- vector(mode = "numeric")
  
  for(i in 1:length(files)) {
    path <- paste(directory, files[i], sep="/")
    data <- read.csv(path)
    caseresults <- complete.cases(data)
    if(sum(caseresults) > threshold) {
      cleandata <- data[caseresults, ]
      x <- cleandata$variable1
      y <- cleandata$variable2
      correlations[length(correlations) + 1] <- cor(x, y)
    }
  }
  
  correlations
}