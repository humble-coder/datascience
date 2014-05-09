variablemean <- function(directory, variable, id) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'variable' is a character vector of length 1 indicating
  ## the name of the variable for which the function will calculate
  ## the mean.
  
  ## 'id' is an integer vector indicating the file ID numbers
  ## to be used
  
  ## Return the mean of the variable across all files listed
  ## in the 'id' vector (ignoring NA values)
  
  files <- list.files(directory)[id]
  data.list <- lapply(paste(directory, files, sep="/"), read.csv)
  data.cat <- do.call(rbind, data.list)
  
  mean(data.cat[variable][!is.na(data.cat[variable])])
  
}