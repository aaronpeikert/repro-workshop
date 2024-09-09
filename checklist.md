- Log into [Posit Cloud](https://posit.cloud/)
- New Project → From Git → <https://github.com/aaronpeikert/repro-workshop>

```r
install.packages(c("tidyverse", "rmarkdown", "markdown", "remotes", "here", "reticulate", "remotes", "shiny"))
remotes::install_github("aaronpeikert/repro")
```

```r
fs::dir_create("data/raw/")
```

```r
# execute this locally, not enough RAM on cloud
install.packages("readxl")
library(readxl)

download.file("https://www.bankofengland.co.uk/-/media/boe/files/inflation-attitudes-survey/individual-responses-xlsx.xlsx", destfile <- tempfile(fileext = ".xlsx"), mode = "wb")
saveRDS(read_excel(destfile, sheet = "Dataset"), "inflation.rds")
```

 - Upload the rds (created in step bevor).
 - Maybe upload the `inflation.rds` as a new github release as well.
 - Scrub the Makefile.
 
```
PROJECT := reproworkshop
WORKDIR := $(CURDIR)

# list below your targets and their recipies
all:

data/raw/inflation.rds: R/download_inflation.R
	Rscript -e "source('$<')"

### Rmd's ###
include .repro/Makefile_Rmds

```

```r
library(fs)
all_files <- dir_ls(all = TRUE)
to_delete <- all_files[!(all_files %in% c("inflation.Rmd", "R", "data", "Makefile", "repro-workshop.Rproj", ".gitignore"))]
file_delete(to_delete)
```
 - set link to public
 - paste link into slides
 - maybe tickle CI to update date on slides
