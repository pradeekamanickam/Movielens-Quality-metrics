# 1. Load Libraries
library(tidyverse)

# 2. Import Data
movies <- read_csv("data/movies.csv")
ratings <- read_csv("data/ratings.csv")

# 3. Data Wrangling & Aggregation
# Calculating the Mean Rating and the Count of Ratings per Movie
movie_stats <- ratings %>%
  group_by(movieId) %>%
  summarize(
    avg_rating = mean(rating),
    vote_count = n()
  ) %>%
  inner_join(movies, by = "movieId") %>%
  filter(vote_count > 20) # Filtering for statistical significance

# 4. Defining the "Quadrants"
# Calculating the median values to split the data into 4 sections
median_pop <- median(movie_stats$vote_count)
median_qual <- median(movie_stats$avg_rating)

movie_stats <- movie_stats %>%
  mutate(category = case_when(
    avg_rating >= median_qual & vote_count >= median_pop ~ "Blockbuster (High Qual/High Pop)",
    avg_rating >= median_qual & vote_count < median_pop ~ "Hidden Gem (High Qual/Low Pop)",
    avg_rating < median_qual & vote_count >= median_pop ~ "Overhyped (Low Qual/High Pop)",
    TRUE ~ "Niche/Low Interest"
  ))

# 5. Create the Visualization
ggplot(movie_stats, aes(x = vote_count, y = avg_rating, color = category)) +
  geom_point(alpha = 0.6) +
  geom_vline(xintercept = median_pop, linetype = "dashed", color = "gray40") +
  geom_hline(yintercept = median_qual, linetype = "dashed", color = "gray40") +
  theme_minimal() +
  labs(
    title = "Quantitative Analysis: Popularity vs. Quality",
    subtitle = "Identifying Hidden Gems and Overhyped Hits",
    x = "Popularity (Number of Ratings)",
    y = "Quality (Average User Rating)",
    color = "Movie Category"
  ) +
  scale_color_brewer(palette = "Set1")