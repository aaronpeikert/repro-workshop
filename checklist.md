Log into RStudio Cloud, then:

```r
install.packages("remotes")
remotes::install_github("aaronpeikert/repro")
install.packages(c("tidyverse", "rmarkdown", "markdown", "remotes", "here", "reticulate"))
```

```r
library(fs)
all_files <- dir_ls(all = TRUE)
to_delete <- all_files[!(all_files %in% c("inflation.Rmd", "R", "Makefile", "repro-workshop.Rproj", ".gitignore"))]
file_delete(to_delete)
```

```r
fs::dir_create("data/raw/")
```

 - Delete Github Repro aaronpeikert/project
 - Upload the rds.
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
 
 - set link to public
 - paste link into repo
 - maybe tickle CI to update date on slides

