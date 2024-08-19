# Load necessary libraries
library(tidyr)  # For data manipulation
library(ggplot2)  # For creating visualizations

# Load and view the iris dataset
data(iris)
View(iris)

# Convert the iris data from wide to long format for easier plotting
long_iris <- gather(iris, parameter, measure, Sepal.Length:Petal.Width, factor_key = TRUE)
View(long_iris)

# Create a base ggplot object
base_graph <- ggplot(long_iris, aes(x = Species, y = measure)) +
  labs(x = "Species", y = "Length in cm", title = "Variation in Petal and Sepal of Iris species") +
  theme_bw() +
  facet_grid(~parameter) +
  aes(fill = Species)

# Print the base graph
print(base_graph)

# Add violin plot to the base graph
graph2 <- base_graph + geom_violin()
print(graph2)

# Add boxplot to the violin plot
final_graph <- base_graph +
  geom_violin(color = "black", fill = "Pink") +
  geom_boxplot(width = 0.1, color = "black", alpha = 0.5) +
  theme(
    axis.text.x = element_text(colour = "brown", size = 15, angle = 90, hjust = 0.5, vjust = 0.5),
    axis.text.y = element_text(colour = "grey20", size = 15),
    text = element_text(size = 20)
  )
print(final_graph)

# Add boxplot to the base graph
graph1 <- base_graph + geom_boxplot()
print(graph1)
