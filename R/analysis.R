# Load library
library(dplyr)
library(ggplot2)
library(readxl)

# Import data
data <- read_xlsx(here::here("input/data.xlsx"), na = "NA")
summary(data)

# The average bill length of Adelie Penguin (base R)
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Torgersen")$bill_length_mm), 2))
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Biscoe")$bill_length_mm), 2))
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Dream")$bill_length_mm), 2))

# The average bill length of Adelie Penguin (tidyverse)
data %>%
  mutate(bill_length_mm = as.numeric(bill_length_mm)) %>%
  filter(!is.na(bill_length_mm),
         species == "Adelie",
         island %in% c("Torgersen", "Biscoe", "Dream")) %>%
  group_by(island) %>%
  summarise(mean_bill_length = round(mean(bill_length_mm), 2)) %>%
  pull(mean_bill_length) %>%
  print()

# Plot using ggplot2
data %>%
  filter(complete.cases(.)) %>%
  mutate(bill_length_mm = as.numeric(bill_length_mm),
         bill_depth_mm = as.numeric(bill_depth_mm)) %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, group = species)) +
  geom_point(aes(color = species, shape = species)) +
  scale_color_manual(values = c("red", "green", "blue")) +
  scale_shape_manual(values = c(16, 17, 18)) +
  theme_classic()

# Plot
penguins_clean <- na.omit(data)
plot(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm, type = "n", xlab = "Bill Length (mm)", ylab = "Bill Depth (mm)", main = "Penguin Bill Dimensions")
points(
  penguins_clean$bill_length_mm[penguins_clean$species == "Adelie"],
  penguins_clean$bill_depth_mm[penguins_clean$species == "Adelie"],
  col = "red", pch = 16
)
points(
  penguins_clean$bill_length_mm[penguins_clean$species == "Chinstrap"],
  penguins_clean$bill_depth_mm[penguins_clean$species == "Chinstrap"],
  col = "green", pch = 17)
points(
  penguins_clean$bill_length_mm[penguins_clean$species == "Gentoo"],
  penguins_clean$bill_depth_mm[penguins_clean$species == "Gentoo"],
  col = "blue", pch = 18
)
legend("topright",
  legend = unique(penguins_clean$species),
  col = c(
    "red",
    "green",
    "blue"
  ), pch = c(16, 17, 18)
)# plot function
create_scatterplot <- function(data, selected_species, selected_island) {
  # Filter the data for the specified species and island
  filtered_data <- data %>%
    na.omit() %>%
    filter(species == selected_species, island == selected_island)

  # Create the scatterplot
  plot <- ggplot(
    filtered_data,
    aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)
  ) +
    geom_point() +
    labs(
      x = "Bill Length (mm)",
      y = "Bill Depth (mm)",
      title = paste("Penguin Bill Dimensions -", selected_species, "-", selected_island)
    )

  return(plot)
}

# Use the function
create_scatterplot(data, "Adelie", "Torgersen")
