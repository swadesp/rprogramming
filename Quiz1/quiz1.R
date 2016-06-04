## Author: Swadesh Pal. ## Created on: 07-05-2016. ## Last edited: 07-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Quiz 1, questions 11 - 20.

cat("\014") # command to clear screen

# read <*.csv> file
data <- read.csv("./quiz1_data/hw1_data.csv")
print(summary(data)) # question 11
print(data[1:2,]) # question 12
print(nrow(data)) # question 13
print(data[(nrow(data)-1):nrow(data),]) # question 14
print(data$Ozone[47]) # question 15
print(summary(data$Ozone)[7]) # question 16
print(mean(data$Ozone, na.rm = TRUE)) # question 17
data_subset <- na.omit(data[(data$Ozone > 31) & (data$Temp > 90),])
print(mean(data_subset$Solar.R, na.rm = TRUE)) # question 18
data_subset <- data[data$Month == 6,]
print(mean(data_subset$Temp, na.rm = TRUE)) # question 19
data_subset <- data[data$Month == 5,]
print(max(data_subset$Ozone, na.rm = TRUE)) # question 20