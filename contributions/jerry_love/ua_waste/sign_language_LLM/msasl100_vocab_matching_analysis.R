# ------------------------------------------------------------
# Title: Language Model Coverage of MS-ASL Dataset Vocabulary
# Author: Jerry Love
# Date: 2026-01-18
# Dataset: MS-ASL training set (MS-ASL-100 subset)
# Description:
#   This script reads the MS-ASL training JSON file, filters the
#   MS-ASL-100 vocabulary subset, extracts cleaned gloss words,
#   and compares them to words matched by ChatGPT. It calculates
#   the number of matches and generates a waffle chart visualizing
#   ChatGPT's coverage of the ASL dataset vocabulary.
#
# Tools/Libraries:
#   - jsonlite (JSON parsing for MS-ASL metadata)
#   - dplyr (data wrangling utilities)
#
# License:
#   Code: MIT License
#   Visualizations: CC BY 4.0
# ------------------------------------------------------------

# install.packages("jsonlite") # JSON parsing for MS-ASL metadata
# install.packages("dplyr")    # data wrangling utilities
library(jsonlite)
library(dplyr)

# load MS-ASL training dataset
train_df <- fromJSON("MSASL_train.json")

## filter subset MS-ASL100 ##
# labels < 101 correspond to the MS-ASL-100 training vocabulary
filtered <- train_df %>% 
  filter(label < 101)

# extract cleaned gloss text and remove duplicates
train_words_filtered <- filtered %>% 
  select(clean_text) %>%
  distinct()

# normalize Unicode ligatures that affect string matching
# converts ﬁ (U+FB01) into "fi"
train_words_filtered$clean_text <- gsub(
  "\uFB01",
  "fi",
  train_words_filtered$clean_text
)

## output text file of filtered words ##
# writeLines avoids adding column headers
# writeLines(
#   train_words_filtered$clean_text,
#   "word_list.txt",
#   useBytes = TRUE
# )

# read in word list text file for comparison
word_list <- readLines("word_list.txt")

## readLines warns because the file has no final newline; safe to ignore ##
# read in matched_words.txt produced by ChatGPT
matched_words <- readLines("matched_words.txt")

# keep words that appear in both lists
validate_matches <- intersect(word_list, matched_words)

# check whether ChatGPT's output exactly matches the intersection (usually FALSE)
#length(validate_matches) == length(matched_words)

# count matched words relative to original list
x <- length(validate_matches)
y <- length(word_list)

# display number of matches relative to total
cat(sprintf("%d out of %d matches.\n", x, y))

# ------------------------------------------------------------
# Visualization: Waffle Chart of ChatGPT Coverage of MS-ASL Vocabulary
# Description:
#   This section generates a waffle chart showing the number of MS-ASL-100
#   vocabulary words matched by ChatGPT versus unmatched words.
#   The chart visually represents coverage metrics and the proportion
#   of vocabulary captured.
# Tools/Libraries:
#   - waffle (waffle chart creation)
#   - ggplot2 (chart customization)
# ------------------------------------------------------------

# install 'remotes' if not already installed (needed for dev version of waffle)
if (!require("remotes")) install.packages("remotes")

# install the development version of waffle from GitHub
remotes::install_github("hrbrmstr/waffle")

# load the waffle package
library(waffle)

# load ggplot2 for chart customization
library(ggplot2)

# calculate the number of unmatched words
unmatched <- y - x

# create a named vector for the chart
# the names will appear in the legend
chart_data <- c(
  "Matched" = x, 
  "Unmatched" = unmatched
)

# generate the waffle chart
# using 10 rows so the chart approximates a 10x10 grid
# colors: teal for matches, sandy gold for unmatched
waffle_plot <- waffle(
  chart_data, 
  rows = 10, 
  size = 0.5, 
  colors = c("#2A9D8F", "#E9C46A"),
  title = "Vocabulary Gloss Coverage in LLM-Assisted Matching",
  xlab = paste0("Total words: ", y, " (Each square = 1 word)")
) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    legend.position = "bottom"
  )

# display the waffle chart
print(waffle_plot)