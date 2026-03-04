# movie-recommendation-system
Movie Recommendation System

# Quantitative Analysis of Cinematic Popularity vs Quality Metrics
### U25AD202: Fundamentals of Data Handling Using R Programming

## Project Overview
This project performs a statistical analysis on the **MovieLens** dataset to explore the relationship between a film's popularity (number of ratings) and its perceived quality (average rating). By implementing a **Quadrant Analysis** framework in R, we categorize films into four distinct segments:
* **Blockbusters**: High popularity and high quality.
* **Hidden Gems**: Low popularity but high quality.
* **Overhyped Hits**: High popularity but low quality.
* **Niche**: Low popularity and low quality.

## Team Members
* **Manish Aravindh S** - 25AD090
* **Miruthula S U** - 25AD092
* **Pradeeka E M** - 25AD123

## Tech Stack & Requirements
* **Language:** R (v4.5.2)
* **IDE:** RStudio
* **Key Libraries:** `tidyverse` (ggplot2, dplyr, readr, stringr, tidyr)

## Project Structure
```text
├── movielens-quality-metrics.Rproj  # RStudio Project file
├── 01_get_data.R                    # Data ingestion and initial loading
├── 02_data_separation.R             # Data wrangling and quadrant categorization
├── 03_density_distribution.R        # Script for the Density Plot (Plot A)
├── 04_top_10_comparison.R           # Script for the Bar Chart (Plot B)
├── README.md                        # Project documentation
├── .gitignore                       # Git ignore file
├── data/                            # Data directory
│   ├── ml-latest-small.zip          # Dataset source
│   ├── movies.csv                   # Movie metadata
│   └── ratings.csv                  # User rating records
└── results/                         # Output directory
    ├── hidden_gems.csv
    ├── overhyped_hits.csv
    ├── popularity_quality_comparison.csv
    ├── plot_a_density_distribution.png
    └── plot_b_top_10_comparison.png