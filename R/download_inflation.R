library(here)
library(tidyverse)

#----download----
inflation_raw_path <- here("data", "raw", "inflation.xlsx")
fs::dir_create(fs::path_dir(inflation_raw_path))

# Function to attempt Google Drive download
download_from_google <- function() {
  download.file(
    "https://drive.google.com/uc?export=download&id=1czE3r1UEF21XvRGkXna0SE7yVvvrSiG3",
    fs::path_ext_set(inflation_raw_path, "rds")
  )
}

# Function to attempt Bank of England download and then process it
download_from_bank_of_england <- function() {
  system(paste("curl -o", inflation_raw_path, "https://www.bankofengland.co.uk/-/media/boe/files/inflation-attitudes-survey/individual-responses-xlsx.xlsx"))
  inflation_raw <- readxl::read_xlsx(here("data", "raw", "inflation.xlsx"), sheet = 1)
  readr::write_rds(inflation_raw, fs::path_ext_set(inflation_raw_path, "rds"), compress = "gz")
}

# Use tryCatch to first attempt Google Drive download and if that fails, attempt Bank of England download
tryCatch({
  download_from_google()
}, error = function(e) {
  download_from_bank_of_england()
})
