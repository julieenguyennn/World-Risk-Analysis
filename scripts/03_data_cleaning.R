library(tidyverse)
library(janitor)
library(readr)
library(haven)

raw_data <- read_dta("inputs/lrf_public_file_review.dta")

cleaned_data <- raw_data %>% 
  clean_names()

cleaned_data <- cleaned_data %>% select(global_region, gender, education, urbanicity, children_in_household, l26, l27a, l27b, l27c)
  

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

write_csv(cleaned_data, "inputs/cleaned_data.csv")

