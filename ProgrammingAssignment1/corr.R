## Author: Swadesh Pal. ## Created on: 08-05-2016. ## Last edited: 08-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 1.

corr <- function(directory, threshold = 0)
  
  # 'directory' is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'threshold' is a numeric vector of length l indicating the
  # number of completely observed observations (on all 
  # variables) required to compute the correlation between
  # nitrate and sulfate; the default is 0
  
  # Return a numeric vector of correlations 
  # NOTE: Do not round the result!

{
  file_list <- list.files(directory, pattern="*.csv")
  file_list <- paste(directory, "/", file_list[1:length(file_list)], sep = "", collapse = NULL)
  data <- lapply(file_list[1:length(file_list)], read.csv, header = TRUE)
  data.new <- lapply(data[1:length(data)], na.omit)
  nobs <- as.numeric(lapply(data.new[1:length(data.new)], nrow))
  complete.case <- data.frame(1:length(file_list), nobs)
  corr.output <- list()
  for (i in 1:length(file_list))
  {
    if(complete.case[i,2] > threshold)
    {
      temp.data <- cor(data.new[[i]][2], data.new[[i]][3])
      corr.output <- rbind(corr.output, temp.data)
    }
  }
  corr.output <- as.numeric(corr.output)
  corr.output
}
