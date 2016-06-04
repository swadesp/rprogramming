## Author: Swadesh Pal. ## Created on: 21-05-2016. ## Last edited: 21-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Quiz 3, questions 11 - 20.

cat("\014") # command to clear screen

library(datasets)
data(iris)
data_subset <- iris[iris$Species == 'virginica',]
print(round(mean(data_subset$Sepal.Length, na.rm = TRUE)), digits = 0) # question 1
print(apply(iris[, 1:4], 2, mean)) # question 2

library(datasets)
data(mtcars)
print(mean(data_subset1))
print(mean(data_subset2))
print(mean(data_subset3))
print(with(mtcars, tapply(mpg, cyl, mean))) # question 3
print(sapply(split(mtcars$mpg, mtcars$cyl), mean)) # question 3
print(tapply(mtcars$mpg, mtcars$cyl, mean)) # question 3
data_subset <- split(mtcars$hp, mtcars$cyl)
print(round(abs((mean(data_subset$`8`, na.rm = TRUE)) - 
                  (mean(data_subset$`4`, na.rm = TRUE)))), digits = 0) # question 4

