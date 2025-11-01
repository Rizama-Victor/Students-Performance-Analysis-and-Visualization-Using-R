# Task 1

# OBJECTIVES
## Create a datframe of 9 columns and 20 rows
## columns are name(char), age(num), gender(char), height(num), weight(num)  math_score(num), eng_score(num), phy_score(num), chem_score(num)

## Task 2

## Create a calculated column "Jamb_score" = math_score + eng_score + phy_score + chem_score

## Task 3
## Create a calculated column "Average" which will be the average or mean of all 4 scores calculated above.


# loading of necessary library  (ies) -- tidyverse
library(tidyverse)

### ANSWER TO Task 1

# creates the dataframe

dataframe_ <- data.frame(
    Name = c("Victor","Mark","Faith", "Anthonia", "Samuel", "Jamil", "Adebayo","Adetayo", "Joyce", "Emmanuel", "Ruth", "Toluwani", "AbdulMuiz", "Sharon", "Shalom", "Mattew", "Israel", "Jesse", "Jack", "Abdul"),
    Age = as.integer(c(22, 18, 13, 14, 24, 27, 30, 42, 67, 12, 17, 33, 29, 30, 37, 25, 24, 19, 16, 8)),
    Gender = c("Male","Male", "Female", "Female", "Male", "Male", "Male", "Male", "Female", "Male", "Female", "Male", "Male", "Female", "Male", "Male", "Male", "Male", "Male", "Male"),
    Height  = c(150.56, 181.67, 173.45, 164.29, 154.13, 127.32, 130.91, 142.49, 167.60, 112.15, 117.52, 133.20, 129.30, 130.43, 137.87, 125.81, 124.23, 119.37, 116.71, 18.75),
    Weight = c(21.72, 43.58, 70.33, 31.44, 78.64, 32.97, 60.70, 90.82, 30.37, 39.52, 65.72, 93.30, 99.15, 90.92, 87.49, 75.15, 34.38, 59.57, 56.37, 88.85),
    Math_Score = as.integer(c(98, 23, 15, 17, 19, 88, 53, 75, 47, 59, 89, 32, 51, 71, 91, 78, 22, 41, 61, 81)),
    English_Score = as.integer(c(23, 11, 43, 27, 79, 65, 34, 74, 89, 38, 19, 21, 54, 98, 65, 34, 29, 34, 32, 87)),
    Physics_Score = as.integer(c(13, 18, 17, 14, 17, 23, 86, 54, 29, 90, 17, 62, 37, 39, 20, 27, 24, 26, 25, 15)),
    Chemistry_Score = as.integer(c(47, 76, 29, 30, 20, 30, 70, 40, 21, 43, 45, 57, 20, 37, 21, 81, 39, 51, 12, 15))
)

print(dataframe_) # -- displays the whole dataframe
print(head(dataframe_)) # -- shows first 6 elements (0th -5th index) or first 6 rows / observations of the dataframe 

# Exploring the Dataframe

## Number of Columns and Rows Confirmation

total_col_no <- ncol(dataframe_) # -- gets the number of columns of the dataframe and assigns it to "total_col_no" variable
total_row_no <- nrow(dataframe_) # -- gets the number of rows of the dataframe and assigns it to "total_row_no" variable

# displays the total number of observations/rows and columns in the dataframe

print(paste("Total number of Columns is :", total_col_no)) # -- displays the total number of columns in the dataframe
print(paste("Total number of Rows is : ", total_row_no)) # -- displays the total number of rows in the dataframe

# confrims the class type for each column

print(paste("The Class of the Name Column is :", class(dataframe_$Name))) # -- confirms "Name" column class in the dataframe

print(paste("The Class of the Age Column is :", class(dataframe_$Age))) # -- confirms "Age" column class in the dataframe

print(paste("The Class of the Gender Column is :", class(dataframe_$Gender))) # -- confirms "Gender" column class in the dataframe

print(paste("The Class of the Height Column is :", class(dataframe_$Height))) # -- confirms "Height" column class in the dataframe

print(paste("The Class of the Weight Column is :", class(dataframe_$Weight))) # -- confirms "Weight" column class in the dataframe

print(paste("The Class of the Math_Score Column is :", class(dataframe_$Math_Score))) # -- confirms "Math_Score" column class in the dataframe

print(paste("The Class of the English_Score Column is :", class(dataframe_$English_Score))) # -- confirms "English_Score" column class in the dataframe

print(paste("The Class of the Physics_Score Column is :", class(dataframe_$Physics_Score))) # -- confirms "Physics_Score" column class in the dataframe

print(paste("The Class of the CHemistry_Score Column is :", class(dataframe_$Chemistry_Score))) # -- confirms "Chemistry_Score" column class in the dataframe



### ANSWER TO Task 2

## column class confirmation

# After exploring the data, I observed that "Math_Score", "English_Score", "Physics_Score" and "Chemistry_Score" will be relevant columns to create a calculated Jamb Score Column

relevant_columns <- c(dataframe_$Math_Score, dataframe_$English_Score, dataframe_$Physics_Score, dataframe_$Chemistry_Score ) # -- creates a list of the relavant columns to calculating the total score for each student
print(class(relevant_columns)) # -- displays the class of all the relevant columns

# -- creates a calculated column for Jamb Score which is the aggregate of a student's Math, English, Physics and Chemistry Score

dataframe_$Jamb_Score <- dataframe_$Math_Score + dataframe_$English_Score + dataframe_$Physics_Score + dataframe_$Chemistry_Score


print(dataframe_$Jamb_Score) # -- prints the calculated scores in the "Jamb_Score" column

print(head(dataframe_)) # -- prints the first 6 elements (0th -5th index) or first 6 rows of the dataframe with the new column "Jamb_score"


### ANSWER TO Task 3



relevant_columns <- names(dataframe_)[6:9] # -- gets the names of the relevant columns and stores them in a list
relevant_col_no <- length(relevant_columns) # -- gets the number of elements in the "relevant_columns" list
print(relevant_col_no) # -- displays the number of relevant columns

# creates a calculated column for the Average which is the mean of all subject scores of each student's Math, English, Physics and Chemistry Score
dataframe_$Average <- (dataframe_$Math_Score + dataframe_$English_Score + dataframe_$Physics_Score + dataframe_$Chemistry_Score) / relevant_col_no


print(dataframe_$Average) # -- prints the calculated scores in the "Average" column

print(head(dataframe_))# -- prints the first 6 elements (0th -5th index) or first 6 rows of the dataframe with the new column "Average"

