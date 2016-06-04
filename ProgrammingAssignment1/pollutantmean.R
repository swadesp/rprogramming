## Author: Swadesh Pal. ## Created on: 08-05-2016. ## Last edited: 08-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 1.

pollutantmean <- function(directory, pollutant, id = 1:332)
  
  # 'directory' is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'pollutant' is a character vector of length 1 indicating
  # the name of the pollutant for which we will calculate the
  # mean; either "sulfate" or "nitrate"
  
  # 'id' is an integer vector indicating the monitor ID numbers
  # to be used
  
  # Return the mean of the pollutant across all monitors list
  # in the 'id' vector (ignoring NA values)

{
  file_list <- list.files(directory, pattern="*.csv")
  file_list <- paste(directory, "/", file_list[id], sep = "", collapse = NULL)
  data <- do.call(rbind, lapply(file_list[1:length(file_list)], read.csv, header = TRUE))
  pollutant.mean <- mean(data[, pollutant], na.rm = TRUE)
  pollutant.mean
}
