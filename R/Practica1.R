# Cargar librerías necesarias
library(ggplot2)
library(dplyr)
library(datasauRus)
library(gridExtra)  # Para mostrar múltiples gráficos juntos

# Función para graficar con regresión lineal
graficar_con_regresion <- function(data, titulo, color_puntos = "steelblue") {
  ggplot(data, aes(x = x, y = y)) +
    geom_point(color = color_puntos, alpha = 0.8) +
    geom_smooth(method = "lm", color = "black", se = FALSE) +
    theme_minimal() +
    ggtitle(titulo)
}

# Dataset 1: wide_lines
wide_lines_data <- datasaurus_dozen %>% filter(dataset == "wide_lines")
plot_wide <- graficar_con_regresion(wide_lines_data, "Regresión lineal - wide_lines", "deeppink")

# Dataset 2: dino
dino_data <- datasaurus_dozen %>% filter(dataset == "dino")
plot_dino <- graficar_con_regresion(dino_data, "Regresión lineal - dino", "mediumblue")

# Dataset 3: x_shape
x_shape_data <- datasaurus_dozen %>% filter(dataset == "x_shape")
plot_xshape <- graficar_con_regresion(x_shape_data, "Regresión lineal - x_shape", "seagreen")

# Mostrar los 3 gráficos juntos
grid.arrange(plot_wide, plot_dino, plot_xshape, ncol = 3)
