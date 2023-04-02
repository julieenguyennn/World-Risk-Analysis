library(opendatatoronto)
library(dplyr)
library(janitor)

# get package
package <- show_package("42315239-36a8-4b7f-b2ab-6ab60fb0b935")
package

# get resource
resources <- list_package_resources("42315239-36a8-4b7f-b2ab-6ab60fb0b935")

all_data <- filter(resources, row_number()==1) %>% get_resource()

library(haven)

raw_data <- read_dta("inputs/lrf_public_file_review.dta")
write_csv(raw_data, "inputs/raw_data.csv")

cleaned_data <- clean_names(raw_data)

# Defining risk
risk_define <- cleaned_data %>% 
  group_by(global_region) %>% 
  count(l3_a)