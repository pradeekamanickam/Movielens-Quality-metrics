# 1. Create the plot object
plot_a <- ggplot(comparison_data, aes(x = avg_rating, fill = label)) +
  geom_density(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Rating Density: Hidden Gems vs. Overhyped Hits",
       subtitle = "Quantitative Analysis of User Rating Distributions",
       x = "Average User Rating",
       y = "Density",
       fill = "Category") +
  scale_fill_manual(values = c("Hidden Gem" = "#2ecc71", "Overhyped" = "#e74c3c"))

# 2. Display the plot in RStudio
plot_a

# 3. Save the plot to your results folder
ggsave("results/plot_a_density_distribution.png", plot = plot_a, width = 8, height = 5, dpi = 300)