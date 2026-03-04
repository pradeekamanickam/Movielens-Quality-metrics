# 1. Isolate the Hidden Gems (High Quality, Low Popularity)
hidden_gems <- movie_stats %>%
  filter(category == "Hidden Gem (High Qual/Low Pop)") %>%
  arrange(desc(avg_rating))

# 2. Isolate the Overhyped Hits (Low Quality, High Popularity)
overhyped_hits <- movie_stats %>%
  filter(category == "Overhyped (Low Qual/High Pop)") %>%
  arrange(avg_rating)

# 3. Combine them into a 'Comparison Dataset' for visualization
comparison_data <- bind_rows(
  hidden_gems %>% mutate(label = "Hidden Gem"),
  overhyped_hits %>% mutate(label = "Overhyped")
)

# for Plot B
top_comparison <- comparison_data %>%
  group_by(label) %>%
  slice_max(order_by = if_else(label == "Hidden Gem", avg_rating, -avg_rating), n = 10)

if (!dir.exists("results")) {
  dir.create("results")
}

# 4. Save the 'Hidden Gems' dataset
write_csv(hidden_gems, "results/hidden_gems.csv")

# 5. Save the 'Overhyped Hits' dataset
write_csv(overhyped_hits, "results/overhyped_hits.csv")

# 6. Save the full comparison dataset for future plotting
write_csv(comparison_data, "results/popularity_quality_comparison.csv")

# Confirming the save
message("Success: Datasets have been saved to the /results folder.")