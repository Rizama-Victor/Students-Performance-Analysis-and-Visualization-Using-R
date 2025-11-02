## Task 2

# Based on the Data Downloaded, create a summary statistics for the column race.ethnicity
# a the average of the math score based on the race ethnicity (plot this)
# b calcuate their deviation from mean of each race ethnicity
# c calculate the total score of each student based on the parental level of education 
# d calculate the average of the total score of each parental level of education 
# e calculate the deviation from mean of each parental level of education (i.e total score- average)

# f plot the average of math score by the by parental level of education
# g plot the average of total score of each student by the by parental level of education

## NOTE: 
# 1 Kindly include comments
# 2 Proper exploration of the data
# 3 Use print, head or tail to give the results

# loading of necessary library  (ies) -- tidyverse
library(tidyverse)


student_performance_df <- read.csv("C:/Users/hp/Downloads/StudentsPerformance.csv") # -- reads the dataframe into a variable named "student_performance_df" via path provided to the file

# A

# Exploring the Dataset

head(student_performance_df, 10) # -- displays the first 10 rows of the data

colnames(student_performance_df) # -- displays the name of all columns in the dataset

table(student_performance_df$race.ethnicity) # -- displays the divisions of the race ethnicity column in the dataset

class(student_performance_df$race.ethnicity) # -- confirms teh class of the race.ethnicity column

class(student_performance_df$math.score) # -- confirms that the class of the math.score column is of an arithmetically workable type (i.e integer)

# NOTE: We cannnot confirm the class of both race ethnicity and math.score at the same time due to character precedence

# average of the math score based on the race.ethnicity

average_math_score <- student_performance_df %>%
  group_by(race.ethnicity) %>% # -- ensures that the dataframe is grouped based on the race ethnicity
  summarise(average_score = mean(math.score)) # -- computes the average score (or mean) of each race ethnicity.

head(average_math_score) # -- displays the first 20 rows of the dataframe


# B

# the deviation from mean of EACH student based on the  race ethnicity

ech_stdt_deviation_from_mean <- student_performance_df %>%
  group_by(race.ethnicity) %>% # -- ensures that the dataframe is grouped based on the race ethnicity
  summarise(stdt_mean_dev = math.score - mean(math.score)) # computes the deviation from mean of EACH student based on the race ethnicity

head(ech_stdt_deviation_from_mean, 20) # -- displays the first 20 rows of the dataframe


# the deviation from mean of EACH race ethnicity

deviation_from_mean <- student_performance_df %>%
  group_by(race.ethnicity) %>% # -- ensures that the dataframe is grouped based on the race ethnicity
  summarise(each_race_ttl_scr = sum(math.score)) %>% # -- computes the total math score for each race ethnicity
  mutate(overall_mean = mean(each_race_ttl_scr), # -- computes the overall mean of the total score of all the race ethnicities (i.e sums the total score of of each of the total scores of each of the race ethnicities and divides by number of race ethnicities).
        race_mean_deviation = each_race_ttl_scr - overall_mean) # -- computes the deviation from mean of EACH race ethnicity

# NOTE: The mean here is the average of the math scores of all groups based on race ethnicity.  

head(deviation_from_mean, 20) # -- displays the first 20 rows of the dataframe


# the deviation from mean of EACH race ethnicity -- another way to think of it.

deviation_from_mean <- student_performance_df %>%
  group_by(race.ethnicity) %>% # -- ensures that the dataframe is grouped based on the race ethnicity
  summarise(race_mean_deviation = sum(math.score) - mean(math.score)) # -- computes the deviation from mean of EACH race ethnicity

# NOTE: The mean here is the average of the math scores of all groups based on race ethnicity.  

head(deviation_from_mean, 20) # -- displays the first 20 rows of the dataframe

# C 

## Exploring the Dataset

head(student_performance_df, 10) # -- Displays the first 10 rows of the data

colnames(student_performance_df) # -- displays the name of all columns in the dataset

table(student_performance_df$parental.level.of.education) # -- displays the divisions of  dataset

class(student_performance_df$parental.level.of.education) # -- confirms teh class of the race.ethnicity column

# After exploring the data, I observed that "math.score", "reading.score" and "writing.score" will be relevant to calculating the total score of each student

relevant_columns <- c(student_performance_df$math.score, student_performance_df$reading.score, student_performance_df$writing.score ) # -- creates a list of the relavant columns to calculating the total score for each student

class(relevant_columns) # -- confirms to see if the class of the relevant columns is of an ideal type (i.e integer)

# the total score of each student based on the parental level of education

each_stdt_total_score <- student_performance_df %>%
  group_by(parental.level.of.education) %>% # -- ensures that dataframe is grouped based on the parental level of education
  summarise(total_score = math.score + reading.score + writing.score) # -- computes the score of each student based on the parental level of education

head(each_stdt_total_score, 20) # -- displays the first 20 rows of the dataframe

# D

# NOTE: No need to explore the dataset again since we already know the relevant columns we're using for calculation

# the total score average or average of total score of each parental level of education

tot_scr_avg_for_each_parental_lvl <- student_performance_df %>% 
  mutate(each_student_total_score = math.score + reading.score + writing.score) %>% # -- computes each student total score
  group_by(parental.level.of.education) %>% # -- groups each student's total score based on the parental level of education
  summarise((each_parental_lvl_tot_scr = sum(each_student_total_score)),  # -- performs total score for each parental level of education
            (each_parental_lvl_tot_scr_avg = mean(each_student_total_score)))  # -- performs mean or average of total score for each parental level od education

head(tot_scr_avg_for_each_parental_lvl, 20) # -- displays the first 20 rows of the dataframe


# E

# NOTE: No need to explore the dataset again since we already know the relevant columns we're using for calculation

# deviation from mean or mean deviation of each parental level of education

mean_dev_for_each_parental_lvl <- student_performance_df %>% 
  mutate(each_student_total_score = math.score + reading.score + writing.score) %>% # -- computes each student total score
  group_by(parental.level.of.education) %>% # -- groups each student's total score based on the parental level of education
  summarise((mean_dev = sum(each_student_total_score) - mean(each_student_total_score)))  # -- deviation from mean for each parental level of education

View(mean_dev_for_each_parental_lvl) # -- displays the dataframe


