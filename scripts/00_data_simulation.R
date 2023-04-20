

set.seed(102)

# Define variables and their categories
gender <- c("Male", "Female")
education_level <- c("High School", "College", "Graduate")
region <- c("North", "South", "East", "West")
worried <- c("Worried", "Not Worried")

# Define the size of the dataset
n <- 1000

# Create an empty matrix to store the data
simulated_data <- matrix(ncol = 4, nrow = n)

# Generate data for each row of the dataset
for (i in 1:n) {
  simulated_data[i,] <- c(
    sample(gender, 1),
    sample(education_level, 1),
    sample(region, 1),
    sample(worried, 1)
  )
}

# Convert the matrix to a data frame
simulated_data <- as.data.frame(simulated_data)

# Rename the columns
colnames(simulated_data) <- c("Gender", "Education Level", "Region", "Worried about Cybercrime")
