# 1. list requirements early
# (load libraries at the beginning)
library(here)
library(tidyverse)
library(lubridate)

#----load-inflation----
# 2. use relative locations
# (relative paths instead absolute, names instead of indices)
inflation_raw <-
  readr::read_rds(here("data", "raw", "inflation.rds"))

#----transform-inflation----
# 3. document relevant information
# (variable names + comments)
inflation <- inflation_raw %>%
  mutate(
    # coded according to "Additional Variables in Dataset" in excel file
    age = fct_recode(
      as.ordered(age),
      `15-24` = "1",
      `25-34` = "2",
      `35-44` = "3",
      `45-54` = "4",
      `55-64` = "5",
      `65+`   = "6",
      `NA`    = "7",
      `NA`    = "8"
    ),
    sex = fct_recode(
      as.factor(sex),
      male = "1",
      female = "2",
      other = "3",
      `NA` = "4"
    ),
    education = fct_recode(as.ordered(educ), low = "1", medium = "2", high = "3"),
    perception = ifelse(P_all == 99.0, NA, P_all),
    expectation = ifelse(E1y_all == 99.0, NA, P_all),
    # first four characters are year, convert to date
    year = ymd(str_c(str_sub(yyyyqq, 1, 4), "-01-01")),
    # last two characters are quarters, convert to number
    quarter = as.numeric(str_sub(yyyyqq, 5, 6)),
    # calculate date as first day of the quarter 
    date = date(year + dyears() / quarter),
    # strip year of its date format
    year = year(year)
  ) %>% 
  # only select important variables
  select(age, sex, education, perception, expectation, year, quarter, yyyyqq, date)

#----export-inflation---
inflation_path <- here("data", "processed", "inflation.rds")
fs::dir_create(fs::path_dir(inflation_path))
write_rds(inflation_raw, inflation_path, compress = "gz")
