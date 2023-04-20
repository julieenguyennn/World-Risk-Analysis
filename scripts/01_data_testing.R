#### Preamble ####
# Purpose: Test the code if it's working
# Author: Julie Nguyen
# Date: 20 April 2023
# Contact: hongan.nguyen@utoronto.ca
# Pre-requisites: 
# - Generate code
# - Finish cleaning and generating graphs

library(testthat)

test_that("check if the three types of cybercrime is a factor", {expect_s3_class(internet_risk$online_bullying,"factor")
  expect_s3_class(internet_risk$false_info, "factor")
  expect_s3_class(internet_risk$fraud, "factor")
})

# Check if the three types of cybercrime has two binary values
unique(internet_risk$online_bullying)
unique(internet_risk$false_info)
unique(internet_risk$fraud)

test_that("check if the education and children variable are factors", {expect_s3_class(internet_risk$education,"factor")
  expect_s3_class(internet_risk$children_in_household, "factor")
})
