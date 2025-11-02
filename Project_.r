#Task 3 Assigment

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


# installs the gridextra to manage multiple plots within a grid layout.

# install.packages("gridExtra")

# loading of necessary library  (ies) -- tidyverse and gridExtra
library(tidyverse)
library(gridExtra)


student_performance_df <- read.csv("C:/Users/hp/Downloads/StudentsPerformance.csv") # -- reads the dataframe into a variable named "student_performance_df" via path provided to the file

# A. To plot the average math score by race and ethnicity, the average scores are first computed for each race and ethnicity category.

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


# Plot of the average math score based on race.ethnicity
average_math_score_plt <- ggplot(average_math_score, aes(x = race.ethnicity, y = average_score, fill = race.ethnicity)) +
  geom_col(fill = "orange", color = "white") +
  labs(title = "Plot of the Average Math Score Based on the Race Ethnicity", y = "average math score", x = "race ethnicity")

# Saves  the plot as a PNG file
ggsave("race ethcty average math score plot.png", plot = average_math_score_plt, width = 8, height = 6)


# B. To plot the average math score by parental level of education, the average scores are first computed for each parent level category.

# Exploring the Dataset

head(student_performance_df, 10) # -- displays the first 10 rows of the data

colnames(student_performance_df) # -- displays the name of all columns in the dataset

table(student_performance_df$parental.level.of.education) # -- displays the divisions of the race ethnicity column in the dataset

class(student_performance_df$parental.level.of.education) # -- confirms teh class of the race.ethnicity column

class(student_performance_df$math.score) # -- confirms that the class of the math.score column is of an arithmetically workable type (i.e integer)

# NOTE: We cannnot confirm the class of both race ethnicity and math.score at the same time due to character precedence

# average of the math score based on the parental level of education

parent_edulvl_average_math_score <- student_performance_df %>%
  group_by(parental.level.of.education) %>% # -- ensures that the dataframe is grouped based on the race ethnicity
  summarise(parent_edulvl_average_score = mean(math.score)) # -- computes the average score (or mean) of each race ethnicity.

head(parent_edulvl_average_math_score) # -- displays the first 20 rows of the dataframe


# Plot of the average math score based on the parental level of education
parent_edulvl_average_math_score_plot <- ggplot(parent_edulvl_average_math_score, aes(x = parental.level.of.education, y = parent_edulvl_average_score, fill = parental.level.of.education)) +
  geom_col(fill = "navy", color = "white") +
  labs(title = "Plot of the Average Math Score Based on the Parental Level of Education", y = "average math score", x = "parental level of education")

# Saves  the plot as a PNG file
ggsave("parent edulvl average math score plot.png", plot = parent_edulvl_average_math_score_plot, width = 8, height = 6)



# C. To plot the total math score by parental level of education, the total scores are first computed for each parent level category.

# total of the math score based on the parental level of education

parent_edulvl_ttl_math_score <- student_performance_df %>%
  group_by(parental.level.of.education) %>% # -- ensures that the dataframe is grouped based on the parental level of education.
  summarise(parent_edulvl_ttl_score = sum(math.score)) # -- computes the total score of each parental level of education.

head(parent_edulvl_ttl_math_score) # -- displays the first 20 rows of the dataframe


# Plot of the total math score based on the parental level of education
parent_edulvl_ttl_math_score_plot <- ggplot(parent_edulvl_ttl_math_score, aes(x = parental.level.of.education, y = parent_edulvl_ttl_score, fill = parental.level.of.education)) +
  geom_col(fill = "royalblue", color = "white") +
  labs(title = "Plot of the Total Math Score Based on the Parental Level of Education", y = "total math score", x = "parental level of education")

# Saves  the plot as a PNG file
ggsave("parent edulvl total math score plot.png", plot = parent_edulvl_ttl_math_score_plot, width = 8, height = 6)



# D

# Compute total scores for each student based on parental level of education
each_stdt_ttl_scr <- student_performance_df %>%
  mutate(total_score = math.score + reading.score + writing.score) # calulates the total score of each student 

# Plot the data with different colors for each category

# specifies the colors for each parent level category
custom_colors <- c(
  "associate's degree" = "skyblue", # sets skyblue for associate degree level
  "bachelor's degree" = "tomato", # sets tomato for associate degree level
  "high school" = "seagreen", # sets seagreen for associate degree level
  "master's degree" = "orchid", # sets orchid for associate degree level
  "some college" = "goldenrod", # sets goldenrod for associate degree level
  "some high school" = "lightcoral" # sets lightcoal for associate degree level
)

each_stdt_ttl_scr_plt <- ggplot(each_stdt_ttl_scr, aes(x = parental.level.of.education, y = total_score)) +
  geom_jitter(aes(color = parental.level.of.education, alpha = total_score), size = 3) +  # Using geom_jitter to avoid overlap
  scale_color_manual(values =  custom_colors) +  # Gradient color based on total score
  labs(title = "Plot of the Total Score of Each Student based on the Parental Level of Education", 
       x = "Parental Level of Education", 
       y = "Total Score") +
  theme_minimal() +  # Clean background style
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
  panel.background = element_rect(fill = "white"),    # Set panel background to white
    plot.background = element_rect(fill = "gray"),     # Set plot background to white
    legend.background = element_rect(fill = "white")    # Set legend background to white
  
  )  

# Displays the plot
ggsave("each_stdt_ttl_scr_plt.png", plot = each_stdt_ttl_scr_plt, width = 8, height = 6)


# E

# Compute total scores for each student based on parental level of education
each_stdt_ttl_scr_avg <- student_performance_df %>%
  mutate(total_score = math.score + reading.score + writing.score, 
  average_score = total_score / 3) # calulates the total score of each student and then computes the average


# Plot the data with different colors for each category

# specifies the colors for each parent level category
custom_colors <- c(
  "bachelor's degree" = "lightblue", # sets skyblue for associate degree level
  "master's degree" = "salmon", # sets tomato for associate degree level
  "some college" = "lightgreen", # sets seagreen for associate degree level
  "associate's degree" = "plum", # sets orchid for associate degree level
  "some high school" = "gold", # sets goldenrod for associate degree level
  "high school" = "lightcoral" # sets lightcoal for associate degree level
)

each_stdt_ttl_scr_avg_plt <- ggplot(each_stdt_ttl_scr_avg, aes(x = parental.level.of.education, y = average_score)) +
  geom_jitter(aes(color = parental.level.of.education, alpha = average_score), size = 3) +  # Using geom_jitter to avoid overlap
  scale_color_manual(values =  custom_colors) +  # Gradient color based on average score
  labs(title = "Plot of the Total Score Average of Each Student based on the Parental Level of Education", 
       x = "Parental Level of Education", 
       y = "Each Student Total Score Average") +
  theme_minimal() +  # Clean background style
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
  panel.background = element_rect(fill = "white"),    # Sets panel background to white
    plot.background = element_rect(fill = "gray"),     # Sets plot background to white
    legend.background = element_rect(fill = "white")    # Sets legend background to white
  
  )  

# Displays the plot
ggsave("each_stdt_ttl_scr_avg_plt.png", plot = each_stdt_ttl_scr_avg_plt, width = 8, height = 6)
