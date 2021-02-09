
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Ensuring Reproducibility of complex data analytic projects

<!-- badges: start -->

<!-- badges: end -->

Can I trust these results \[to reproduce\]? In this workshop (2 x 4h)
participants learn to spot threats to reproducibility and develop the
skills to avoid them. These skills stem from hard learned lessons of the
software engineering community, which developed tools the research
community can utilize. The employed tools, namely RMarkdown, Git, Make,
and Docker, do not merely increase the shelf life of an analysis, they
help researchers to be more productive and collaborate easier.
Researchers who routinely use R will benefit most, however all presented
principles (and most tools) work well with other programming languages.

# Requirements

### Computer Set Up

  - OS: Linux, Mac OS, Windows 10 Pro/Enterprise/Education (no Windows
    10 Home)
  - Admin Rights
  - R + RStudio + Git + Make + Docker installed (you’ll get
    instructions\!)
  - Having two displays will bring you joy (then you can follow and try
    out at the same time\!).

### Can you answer the following Questions?

  - How will two asterisks (`**like this**`) change the formatting in
    Markdown?
  - How do you add an R code chunk to a RMarkdown?
  - What is a commit?
  - Name a place that is great to host Git repositories.
  - How do you open a terminal/shell/cmd on you computer?

If you struggle to answer these questions, it is probably ok to attend
the workshop. However, if you have no idea what I am talking about it
will bring you no fun to attend.

# Roadmap

  - *P* implies emphasis on presentation
  - *I* implies emphasis on interaction/hands on/try out
  - *G* means work in groups \<= 4
  - (optional) depending on time this topic will be skipped

### The four pillars of reproducible research (30min)

  - the goal: reproduction that fits into a tweet *P*
  - hands on reproduction *I*
  - getting to know each other *I*
  - understanding the role of:
      - dynamic document creation *P*
      - version control *P*
      - software management *P*
      - dependency tracking *P*

### RProjects (30 min)

  - Create a Project *I*
  - Choose a license *P*
  - add a Contributer Covenant *I*
  - add a README.Rmd *I*

### RMarkdown (45 min)

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

### Git + GitHub 1/2 (2h)

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

### Git + GitHub 2/2 (90min)

  - create and solve a merge conflict *G*
  - interactive rebase (optional) *G*
  - expand an existing PR (optional) *G*
  - request a PR review *G*
  - fulfill a PR review *G*
  - suggest changes in a PR review *G*
  - project management with issues via canban automation (optional) *G*

### Docker (60min)

  - pull a Docker image *I*
  - run a shell in a Docker container *I*
  - run a temporary container (optional) *I*
  - run an RStudio Server in a Docker container *I*
  - link volumes in a Docker container *I*
  - write a simple Dockerfile (optional) *I*
  - build a Docker image (optional) *I*
  - use `repro` to automatically write Dockerfiles *I*

### Make (60min)

  - read a basic Makefile recipe *P*
  - write a basic Makefile recipe *I*
  - understand Make variables *I*
  - use autovars (optional) *I*
  - use `repro` to automatically write Makefiles *I*
  - combine Make with Docker *I*
