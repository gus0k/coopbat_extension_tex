.PHONY: clean

LATEX_SRC=$(wildcard *.tex)
REFS=$(wildcard *.bib)

all: basis.pdf tags

%.pdf: %.tex $(LATEX_SRC) $(REFS)
	mkdir -p build/aux
	mkdir -p build/chapters
	mkdir -p build/images
	rubber -f -s --pdf --into build $<
	rubber-info --check --into build $<

tags:
	ctags -R basis.tex acmart.bib

clean:
	rm -rf build

show: build/basis.pdf
	zathura build/basis.pdf &
