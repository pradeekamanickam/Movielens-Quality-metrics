# 1. Create the plot object
plot_b <- ggplot(top_comparison, aes(x = reorder(title, avg_rating), y = avg_rating, fill = label)) +
  geom_col() +
  coord_flip() + 
  facet_wrap(~label, scales = "free_y") +
  theme_minimal() +
  labs(title = "Top 10 Representative Titles per Category",
       subtitle = "Comparison of High-Quality/Low-Volume vs. Low-Quality/High-Volume",
       x = "Movie Title",
       y = "Average Rating") +
  guides(fill = "none")

# 2. Display the plot in RStudio
plot_b

# 3. Save the plot to your results folder
ggsave("results/plot_b_top_10_comparison.png", plot = plot_b, width = 10, height = 6, dpi = 300)