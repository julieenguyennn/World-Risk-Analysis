library(googleAuthR)
library(googleAnalyticsR)
library(jsonlite)
library(tuber)

cred <- fromJSON("inputs/cred.json")
saveRDS(creds, file = "cred.rds")


# Authenticate with your API key
gar_auth("cred.rds")
yt_oauth('AIzaSyBP7-PIG9E3bMY41MbnbnuLO4YLehM__wQ')

# Search for videos related to "data science"
results <- yt_search(term = "financial literacy")
