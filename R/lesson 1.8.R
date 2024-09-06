# Function that multiply by 234
multiply_by_234 <- function(number) {
  return(number * 234)
}
multiply_by_234(311)

# Function that sum two numbers together
sum_two_number <- function(n1, n2) {
  return(n1 + n2)
}
sum_two_number(3256, 8934)

# Function that create scatterplot between bill length and depth
# targeting specific island or species.
data <- readxl::read_excel(here::here("input", "data.xlsx"), na = "NA")

create_plots_bill <- function(island_choice, species_choice) {

  # Import data and remove missing values
  penguins_clean <- na.omit(data)

  # Plot the xy graph
  plot(
    penguins_clean$bill_length_mm,
    penguins_clean$bill_depth_mm,
    type = "n",
    xlab = "Bill Length (mm)",
    ylab = "Bill Depth (mm)",
    main = "Penguin Bill Dimensions"
  )

  # Plot the scatterplots
  points(
    penguins_clean$bill_length_mm[
      penguins_clean$species == species_choice &
      penguins_clean$island == island_choice
    ],
    penguins_clean$bill_depth_mm[
      penguins_clean$species == species_choice &
      penguins_clean$island == island_choice
    ],
    col = "blue", pch = 16
  )

}

create_plots_bill("Torgersen", "Adelie")

# Solutions from the course
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

create_scatterplot(data, "Adelie", "Torgersen")
