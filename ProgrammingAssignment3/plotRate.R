## Author: Swadesh Pal. ## Created on: 28-05-2016. ## Last edited: 28-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 3.

# Plot the 30-day mortality rates for heart attack
hospital_data <- read.csv("./rprog-data-ProgAssignment3-data/hospital-data.csv", 
                          colClasses = "character")
outcome <- read.csv("./rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", 
                    colClasses = "character")
outcome[, 11] = as.numeric(outcome[, 11])
hist(outcome[, 11])
