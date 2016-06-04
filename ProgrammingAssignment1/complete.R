## Author: Swadesh Pal. ## Created on: 08-05-2016. ## Last edited: 08-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 1.

complete <- function(directory, id = 1:332)

  # 'directory' is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'id' is an integer vector indicating the monitor ID numbers
  # to be used
  
  # Return a data frame of the form:
  # id nobs
  # 1  117
  # 2  1041
  # ...
  # where 'id' is the monitor ID number and 'nobs' is the 
  # number oof complete cases.

{
  file_list <- list.files(directory, pattern="*.csv")
  file_list <- paste(directory, "/", file_list[id], sep = "", collapse = NULL)
  data <- lapply(file_list[1:length(file_list)], read.csv, header = TRUE)
  data.new <- lapply(data[1:length(data)], na.omit)
  nobs <- as.numeric(lapply(data.new[1:length(data.new)], nrow))
  complete.case <- data.frame(id, nobs)
  complete.case
}
