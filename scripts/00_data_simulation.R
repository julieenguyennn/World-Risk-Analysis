#### Preamble ####
# Purpose: Simulate the dataset to be solved
# Author: Julie Nguyen
# Date: 20 April 2023
# Contact: hongan.nguyen@utoronto.ca
# Pre-requisites: 
# - Have questions to be solved for the data

set.seed(102)

# Define variables and their categories
simulated_data <- tibble("Gender" = sample(c("Male","Female"), 100, replace = TRUE),
       "Education" = sample(c("High School", "Post_secondary", "Graduate"), 100, replace = TRUE),
       "Region" = sample(c("Asia", "Africa", "Europe","North America","South America"), 100, replace = TRUE),
       "Presence of Anxiety" = sample(c("Worried","Not Worried"), 100, replace = TRUE))