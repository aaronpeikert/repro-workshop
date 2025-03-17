library(here)
library(tidyverse)
library(fs)
library(readxl)

#----download----
inflation_raw_path <- here("data", "raw", "inflation.xlsx")
inflation_rds_path <- fs::path_ext_set(inflation_raw_path, "rds")
fs::dir_create(fs::path_dir(inflation_raw_path))

# Function to attempt Bank of England download and then process it
download_from_bank_of_england <- function() {
  temp_file <- tempfile(fileext = ".xlsx")
  download.file(
    "https://www.bankofengland.co.uk/-/media/boe/files/inflation-attitudes-survey/individual-responses-xlsx.xlsx",
    destfile = temp_file,
    mode = "wb"
  )
  inflation_raw <- read_excel(temp_file, sheet = "Dataset")
  saveRDS(inflation_raw, inflation_rds_path)
}

# Function to attempt GitHub download as failsafe
download_from_github <- function() {
  download.file(
    "https://github.com/aaronpeikert/repro-workshop/releases/latest/download/inflation.rds",
    destfile = inflation_rds_path,
    mode = "wb"
  )
}

# Use tryCatch to first attempt Bank of England download and if that fails, attempt GitHub download (the failsafe)
tryCatch({
  download_from_bank_of_england()
}, error = function(e) {
  download_from_github()
})
