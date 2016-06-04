## Author: Swadesh Pal. ## Created on: 29-05-2016. ## Last edited: 29-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 3.

# Ranking hospitals in all states
rankall <- function(outcome, num = "best") 
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
  if(!outcome %in% validOutcome)
  { stop("invalid outcome") }
  # For each state, find the hospital of the given rank
  else
  {
    if(outcome == "heart attack")
    {
      MR <- na.omit(outcome_data[, c(2,7,11)])
      MR <- MR[order(MR[,3],MR[,1]),]
      state <- levels(factor(MR[,2]))
      m <- length(levels(factor(MR[,2])))
      hospital <- array()
      for (i in 1:m)
      {
        MR_temp <- MR[MR[,2]==state[i],]
        if(num == "best")
        { hospital[i] <- MR_temp[1,1] }
        else if(num == "worst")
        { hospital[i] <- MR_temp[nrow(MR_temp),1] }
        else if(nrow(MR) < num)
        { hospital[i] <- NA }      
        else
        { hospital[i] <- MR_temp[num,1] }
      }
      output <- data.frame(hospital=hospital, state=state)
    }
    else if(outcome == "heart failure")
    {
      MR <- na.omit(outcome_data[, c(2,7,17)])
      MR <- MR[order(MR[,3],MR[,1]),]
      state <- levels(factor(MR[,2]))
      m <- length(levels(factor(MR[,2])))
      hospital <- array()
      for (i in 1:m)
      {
        MR_temp <- MR[MR[,2]==state[i],]
        if(num == "best")
        { hospital[i] <- MR_temp[1,1] }
        else if(num == "worst")
        { hospital[i] <- MR_temp[nrow(MR_temp),1] }
        else if(nrow(MR) < num)
        { hospital[i] <- NA }      
        else
        { hospital[i] <- MR_temp[num,1] }
      }
      output <- data.frame(hospital=hospital, state=state)
    }
    else
    {
      MR <- na.omit(outcome_data[, c(2,7,23)])
      MR <- MR[order(MR[,3],MR[,1]),]
      state <- levels(factor(MR[,2]))
      m <- length(levels(factor(MR[,2])))
      hospital <- array()
      for (i in 1:m)
      {
        MR_temp <- MR[MR[,2]==state[i],]
        if(num == "best")
        { hospital[i] <- MR_temp[1,1] }
        else if(num == "worst")
        { hospital[i] <- MR_temp[nrow(MR_temp),1] }
        else if(nrow(MR) < num)
        { hospital[i] <- NA }      
        else
        { hospital[i] <- MR_temp[num,1] }
      }
      output <- data.frame(hospital=hospital, state=state)
    }
  }
  return(output)
}
