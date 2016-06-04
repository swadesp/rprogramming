## Author: Swadesh Pal. ## Created on: 28-05-2016. ## Last edited: 28-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 3.

# Function for finding the best hospital in a state
best <- function(state, outcome)
{
  # Read outcome data
  outcome_data <- read.csv("./rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", 
                           colClasses = "character")
  
  # Changing data type to numeric
  options(warn=-1)
  outcome_data[, 11] <- as.numeric(outcome_data[, 11])
  outcome_data[, 17] <- as.numeric(outcome_data[, 17])
  outcome_data[, 23] <- as.numeric(outcome_data[, 23])
  options(warn=0)
  
  # Check that state and outcome are valid
  validOutcome <- c("heart attack", "heart failure", "pneumonia")
  if(!state %in% outcome_data$State)
  { stop("invalid state") }
  else if(!outcome %in% validOutcome)
  { stop("invalid outcome") }
  # Return hospital name in that state with lowest 30-day death rate
  else
  {
    if(outcome == "heart attack")
    {
      minMR <- min(outcome_data[outcome_data[, 7]==state, 11], na.rm = TRUE)
      hospitalName <- sort(outcome_data[(outcome_data[, 7] == state) & 
                                     (outcome_data[, 11] == minMR), 2])[1]
    }
    else if(outcome == "heart failure")
    {
      minMR <- min(outcome_data[outcome_data[, 7]==state, 17], na.rm = TRUE)
      hospitalName <- sort(outcome_data[(outcome_data[, 7] == state) & 
                                     (outcome_data[, 17] == minMR), 2])[1]
    }
    else
    {
      minMR <- min(outcome_data[outcome_data[, 7]==state, 23], na.rm = TRUE)
      hospitalName <- sort(outcome_data[(outcome_data[, 7] == state) & 
                                     (outcome_data[, 23] == minMR), 2])[1]
    }
    
  }
    output <- hospitalName
    return(output)
}
