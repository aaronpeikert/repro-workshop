PROJECT := reproworkshop
WORKDIR := $(CURDIR)

# list below your targets and their recipies
all: $(PROJECT).pdf $(PROJECT)_withnotes.pdf $(PROJECT)_bright.pdf
clean:
	Ruby/clean.rb

$(PROJECT).pdf: $(PROJECT).tex header.tex
	xelatex $<

$(PROJECT)_withnotes.pdf: $(PROJECT)_withnotes.tex header.tex Figs
	xelatex $(PROJECT)_withnotes
	pdfnup $(PROJECT)_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv $(PROJECT)_withnotes-nup.pdf $(PROJECT)_withnotes.pdf

$(PROJECT)_withnotes.tex: $(PROJECT).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(PROJECT).tex $(PROJECT)_withnotes.tex

$(PROJECT)_bright.pdf: $(PROJECT)_bright.tex header.tex Figs
	xelatex $<

$(PROJECT)_bright.tex: $(PROJECT).tex Ruby/createVersionInBright.rb
	Ruby/createVersionInBright.rb $(PROJECT).tex $(PROJECT)_bright.tex
### Wrap Commands ###
# if a command is to be send to another process e.g. a container/scheduler use:
# $(RUN1) mycommand --myflag $(RUN2)
RUN1 = $(QRUN1) $(SRUN) $(DRUN)
RUN2 = $(QRUN2)

### Rmd's ###
include .repro/Makefile_Rmds

### Docker ###
# this is a workaround for windows users
# please set WINDOWS=TRUE and adapt WINPATH if you are a windows user
# note the unusual way to specify the path
WINPATH = //c/Users/someuser/Documents/myproject/
include .repro/Makefile_Docker
