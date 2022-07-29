library(here)

#----download----
inflation_raw_path <- here("data", "raw", "inflation.xlsx")
fs::dir_create(fs::path_dir(inflation_raw_path))
download.file("https://www.bankofengland.co.uk/-/media/boe/files/inflation-attitudes-survey/individual-responses-xlsx.xlsx", inflation_raw_path)
