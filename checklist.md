# Setup

This is the required setup.

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
saveRDS(read_excel(destfile, sheet = "Dataset", guess_max = 1e6), "inflation.rds")
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
 - update link to project in [links.yml](https://github.com/aaronpeikert/repro-workshop/blob/main/self-paced-source/links.yml)
 - maybe update the pad link
 - maybe tickle CI to update date on slides

# Minimal Test

This is the minimal amount of commands to test the workshop.
Setup has to be repeated.

- Change to `pdf_document` in `inflation.Rmd`.

```
usethis::use_git_config(
  user.name = "Aaron Peikert", # <-- change to your name
  user.email = "peikert@mpib-berlin.mpg.de", # <-- and your email
  init.defaultBranch = "main") # <-- not necessary but kinder than 'master'
usethis::use_git()
usethis::create_github_token(description = "Token for Repro Workshop 2024")
gitcreds::gitcreds_set()
usethis::use_github() # !!!this does not work!!! if you ever did the workshop from your account. The repo name must be unique (even for repos you deleted)
# head to https://github.com/new and follow commands for "push an existing repository from the command line"
repro::automate()
repro::use_gha_docker()
repro::use_make_publish()
repro::use_gha_publish()
```

Paste the following into the Makefile:

```
publish/: inflation.pdf
include .repro/Makefile_publish
```

```
git add .
git commit -m "full workshop"
git push
```

Second action will fail, it reuquires the first.
Simply wait for the first to finish and restart the second.


