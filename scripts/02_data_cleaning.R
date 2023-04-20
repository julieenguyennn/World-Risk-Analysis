#### Preamble ####
# Purpose: Clean the data downloaded from World Risk Poll
# Author: Julie Nguyen
# Date: 20 April 2023
# Contact: hongan.nguyen@utoronto.ca
# Pre-requisites: 
# - Need to have downloaded the data on the World Risk Poll and saved it to inputs/data 


library(tidyverse)
library(janitor)
library(readr)
library(haven)

raw_data <- read_dta("inputs/lrf_public_file_review.dta")

cleaned_data <- raw_data %>% 
  clean_names()

cleaned_data <- cleaned_data %>% select(global_region, gender, education, children_in_household, l26, l27a, l27b, l27c)

# Rename labels
cleaned_data <- cleaned_data %>%
  rename("internet_use" = l26, "online_bullying" = l27a, "false_info" = l27b, "fraud" = l27c)

# Filter and remove NA values
cleaned_data <- cleaned_data %>% 
  filter(internet_use == 1) %>% 
  filter(online_bullying == 1 | online_bullying == 2) %>% 
  filter(false_info == 1 | false_info == 2) %>% 
  filter(fraud == 1 | fraud == 2) %>% 
  filter(education == 1 | education == 2 | education == 3) %>% 
  filter(!children_in_household == 9)

# Recode values
cleaned_data$gender <- ifelse(test=cleaned_data$gender == 1, yes= "Male", no = "Female")

cleaned_data$online_bullying <- ifelse(test=cleaned_data$online_bullying == 1, yes="Worried", no="Not worried")

cleaned_data$education <- as.factor(cleaned_data$education)

cleaned_data$false_info <- ifelse(test=cleaned_data$false_info == 1, yes="Worried", no="Not worried")

cleaned_data$fraud <- ifelse(test=cleaned_data$fraud == 1, yes="Worried", no="Not worried")

cleaned_data <- cleaned_data %>% mutate(education = case_when(
  education == 1 ~ "Up to 8 years",
  education == 2 ~ "9-15 years",
  education == 3 ~ "Completed 4 years beyond high-school",
))

# Label each region with their corresponding meaning
cleaned_data <- cleaned_data %>% mutate(global_region = case_when(
  global_region == 1 ~ "Eastern Africa",
  global_region == 2 ~ "Central/Western Africa",
  global_region == 3 ~ "North Africa",
  global_region == 4 ~ "Southern Africa",
  global_region == 5 ~ "Latin America & Caribbean",
  global_region == 6 ~ "Northern America",
  global_region == 7 ~ "Central Asia",
  global_region == 8 ~ "East Asia",
  global_region == 9 ~ "South-eastern Asia",
  global_region == 10 ~ "South Asia",
  global_region == 11 ~ "Middle East",
  global_region == 12 ~ "Eastern Europe",
  global_region == 13 ~ "Northern/Western Europe",
  global_region == 14 ~ "Southern Europe",
  global_region == 15 ~ "Australia and New Zealand"
))

# Save cleaned file
write_csv(cleaned_data, "inputs/cleaned_data.csv")

