library(here)
library(tidyverse)

#----download----
inflation_raw_path <- here("data", "raw", "inflation.xlsx")
fs::dir_create(fs::path_dir(inflation_raw_path))

# Using Google Drive or the source because it requires to much RAM for posit cloud or GitHub
# Function to attempt Google Drive download
download_from_google <- function() {
  download.file(
    "https://drive.google.com/uc?id=1irXtt_1vgDuIBmj4t5LpReEutpIDv4z4&export=download",
    fs::path_ext_set(inflation_raw_path, "rds")
  )
}

# Function to attempt Bank of England download and then process it
download_from_bank_of_england <- function() {
  system(paste("curl -o", inflation_raw_path, "https://www.bankofengland.co.uk/-/media/boe/files/inflation-attitudes-survey/individual-responses-xlsx.xlsx"))
  inflation_raw <- readxl::read_excel(here("data", "raw", "inflation.xlsx"), sheet = 4)
  readr::write_rds(inflation_raw, fs::path_ext_set(inflation_raw_path, "rds"), compress = "gz")
}

# Use tryCatch to first attempt Google Drive download and if that fails, attempt Bank of England download (The source)
tryCatch({
  download_from_google()
}, error = function(e) {
  download_from_bank_of_england()
})
