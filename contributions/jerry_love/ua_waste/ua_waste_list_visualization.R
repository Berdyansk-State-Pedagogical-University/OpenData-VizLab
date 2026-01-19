# ------------------------------------------------------------
# Title: Complexity of Ukraine National Waste List Visualization
# Author: Jerry Love
# Date: 2025-12-07
# Dataset: https://data.gov.ua/en/dataset/2169b5a5-7255-4631-89c0-7bfc859e283b/resource/26735f3e-02c8-48ba-932d-e4e8962dae63
# Description:
#   This script reads the prepared CSV file (ua_waste_list_table.csv),
#   sorts chapters by number of subchapters, and generates
#   a horizontal bar chart showing the complexity of the
#   Ukrainian National Waste List.
#
# Tools/Libraries:
#   - dplyr (data manipulation)
#   - readr (CSV import)
#   - ggplot2 (plotting)
#   - viridis (color scales)
#
# License:
#   Code: MIT License
#   Visualizations: CC BY 4.0
# ------------------------------------------------------------

library(dplyr)
library(readr)
library(ggplot2)
library(viridis)

# read prepared CSV file
waste <- read_csv("ua_waste_list_table.csv")

# sort by descending number of subchapters
waste_sorted <- arrange(waste, desc(num_of_subchapters))

# make chapter_desc a factor with levels in the arranged order
waste_sorted$chapter_desc <- factor(waste_sorted$chapter_desc, levels = waste_sorted$chapter_desc)

# plot
ggplot(data = waste_sorted, aes(x = num_of_subchapters, y = chapter_desc, fill = chapter_desc)) +
  geom_col() +
  scale_x_continuous(breaks = seq(0, max(waste_sorted$num_of_subchapters), by = 2)) +
  scale_fill_viridis(discrete = TRUE, option = "D") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(legend.position = "none") +
  labs(title = "Complexity of UA Nat'l Waste List: Number of Subchapters per Chapter",
       x = "Number of Subchapters",
       y = "Chapter Group Name")
