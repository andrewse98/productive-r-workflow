library(readxl)
library(dplyr)

# Read data using readxl
data <- read_excel(here::here("input/data.xlsx"), na = "NA")

# Remove 2 rows that are known to be wrong
clean_data <- data %>%
  slice(-c(23, 48))

# Save in RDS format
saveRDS(clean_data, file = here::here("input/clean_data.rds"))

