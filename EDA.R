## Import, merge, and EDA for Sample Congress Data
## Author: Jessie Bustin

# Load Libraries
library(tidyverse)
library(lubridate)

# Import
senate <- read.csv("all_transactions_senate.csv")
house <- read.csv("all_transactions.csv")

# Add column to identify chamber
senate$chamber <- "senate"
house$chamber <- "house"

# Fix columns for bind
house <- house[, c(3, 4, 5, 6, 7, 8, 9, 10, 11, 2, 13)]
house <- house %>%
  rename(congress_member = representative)

senate <- senate %>%
  select(-c(asset_type, comment)) %>%
  rename(congress_member = senator) %>%
  mutate(district = "")
  
# Bind together
full <- rbind(senate, house)

# Lubridate date columns
full <- full %>%
  mutate(transaction_date = as.Date(transaction_date, "%m/%d/%Y")) %>%
  mutate(disclosure_date = as.Date(disclosure_date, "%m/%d/%Y"))

# Parse amount column
full <- full %>%
  separate(col = amount, into = c("min_amount", "max_amount"), sep = "\\ - ")

# Drop all non stock transactions
full <- full %>%
  filter()
























