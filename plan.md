Roadmap for a two day advanced reproducibility workshop
================
Aaron Peikert

# The four pillars of reproducible research (30min)

  - the goal: reproduction that fits into a tweet *P*
  - hands on reproduction *I*
  - getting to know each other *I*
  - understanding the role of:
      - dynamic document creation *P*
      - version control *P*
      - software management *P*
      - dependency tracking *P*

# RProjects (30 min)

  - Create a Project *I*
  - Choose a license *P*
  - add a Contributer Covenant *I*
  - add a README.Rmd *I*

# RMarkdown (45 min)

  - handy chunk options *P*
      - include
      - cache
      - error
      - dev
  - the setup chunk *P*
  - externalization *I*
      - R code
      - RMarkdown childs
  - output options *G*
      - [prettydoc](https://github.com/yixuan/prettydoc)
      - [vignette](https://bookdown.org/yihui/rmarkdown/r-package-vignette.html)
      - [xaringan](https://github.com/yihui/xaringan)
      - [ioslides](https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html)
      - [Tufte Handout](https://rstudio.github.io/tufte/)
      - [rmdformats](https://github.com/juba/rmdformats)

# Git + GitHub 1/2 (2h)

  - fork a repository *G*
  - invite collaborators *G*
  - create an issues *G*
  - assign an issue *G*
  - create a branch *G*
  - push changes *G*
  - open a pull request (PR) *G*
  - assign a PR *G*
  - comment on a PR *G*
  - merge and close a PR *G*

# Git + GitHub 2/2 (90min)

  - create and solve a merge conflict *G*
  - interactive rebase (optional) *G*
  - expand an existing PR (optional) *G*
  - request a PR review *G*
  - fulfill a PR review *G*
  - suggest changes in a PR review *G*
  - project management with issues via canban automation (optional) *G*

# Docker (60min)

  - pull a Docker image *I*
  - run a shell in a Docker container *I*
  - run a temporary container (optional) *I*
  - run an RStudio Server in a Docker container *I*
  - link volumes in a Docker container *I*
  - write a simple Dockerfile (optional) *I*
  - build a Docker image (optional) *I*
  - use `repro` to automatically write Dockerfiles *I*

# Make (60min)

  - read a basic Makefile recipe *P*
  - write a basic Makefile recipe *I*
  - understand Make variables *I*
  - use autovars (optional) *I*
  - use `repro` to automatically write Makefiles *I*
  - combine Make with Docker *I*
