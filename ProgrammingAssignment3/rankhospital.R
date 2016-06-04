## Author: Swadesh Pal. ## Created on: 28-05-2016. ## Last edited: 29-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 3.

# Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, num = "best") 
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
  # Return hospital name in that state with the given rank 30-day death rate
  else
  {
    if(outcome == "heart attack")
    {
      MR <- na.omit(outcome_data[outcome_data[, 7]==state, c(2,11)])
      MR <- MR[order(MR[,2],MR[,1]), ]
      if(num == "best")
      { hospital <- MR[1,1] }
      else if(num == "worst")
      { hospital <- MR[nrow(MR),1] }
      else if(nrow(MR) < num)
      { hospital <- NA }      
      else
      { hospital <- MR[num,1] }
    }
    else if(outcome == "heart failure")
    {
      MR <- na.omit(outcome_data[outcome_data[, 7]==state, c(2,17)])
      MR <- MR[order(MR[,2],MR[,1]), ]
      if(num == "best")
      { hospital <- MR[1,1] }
      else if(num == "worst")
      { hospital <- MR[nrow(MR),1] }
      else if(nrow(MR) < num)
      { hospital <- NA }      
      else
      { hospital <- MR[num,1] }
    }
    else
    {
      MR <- na.omit(outcome_data[outcome_data[, 7]==state, c(2,23)])
      MR <- MR[order(MR[,2],MR[,1]), ]
      if(num == "best")
      { hospital <- MR[1,1] }
      else if(num == "worst")
      { hospital <- MR[nrow(MR),1] }
      else if(nrow(MR) < num)
      { hospital <- NA }      
      else
      { hospital <- MR[num,1] }
    }
    
  }
  return(hospital)
}
