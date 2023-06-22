library(here)

#----download----
inflation_raw_path <- here("data", "raw", "inflation.xlsx")
fs::dir_create(fs::path_dir(inflation_raw_path))
if(FALSE){
  download.file(
    "https://www.bankofengland.co.uk/-/media/boe/files/inflation-attitudes-survey/individual-responses-xlsx.xlsx",
    inflation_raw_path
  )
  inflation_raw <-
    readxl::read_xlsx(here("data", "raw", "inflation.xlsx"), sheet = 1)
  readr::write_rds(inflation_raw,
                   fs::path_ext_set(inflation_raw_path, "rds"),
                   compress = "gz")
} else {
  download.file(
    "https://drive.google.com/uc?export=download&id=1czE3r1UEF21XvRGkXna0SE7yVvvrSiG3",
    fs::path_ext_set(inflation_raw_path, "rds")
  )
}
