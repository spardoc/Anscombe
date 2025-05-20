# Install required packages if they are missing
packages <- c("ggplot2", "tidyverse", "datasauRus", "dplyr")
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
}
lapply(packages, install_if_missing)

# Load libraries
library(ggplot2)
library(tidyverse)  # Includes dplyr
library(datasauRus)
library(dplyr)

print("Inicio del código")

# Summarize dataset
summary_stats <- datasaurus_dozen %>%
  group_by(dataset) %>%
  summarize(
    mean_x = mean(x),
    mean_y = mean(y),
    std_dev_x = sd(x),
    std_dev_y = sd(y),
    corr_x_y = cor(x, y)
  )

# Print summary stats
print(summary_stats)

# Plot data
ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset)) +
  geom_point() +
  theme_void() +
  theme(legend.position = "none") +
  facet_wrap(~dataset, ncol = 3)



# Filtrar solo el dataset "wide_lines"
wide_lines_data <- datasaurus_dozen %>% filter(dataset == "wide_lines")

# Graficar con línea de regresión
ggplot(wide_lines_data, aes(x = x, y = y)) +
  geom_point(color = "deeppink", alpha = 0.8) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_minimal() +
  ggtitle("Regresión lineal - wide_lines")
