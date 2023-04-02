library(tidyverse)

cleaned_data <- clean_names(raw_data)

# Defining risk
risk_define <- cleaned_data %>% 
  group_by(global_region) %>% 
  count(l3_a)