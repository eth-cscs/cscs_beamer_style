

all: example

example:
	pdflatex $@.tex
	pdflatex $@.tex
	bibtex $@
	pdflatex $@.tex

clean:
	rm -f example.pdf example.aux example.dvi example.log example.nav example.out example.snm example.toc example.listing example-blx.bib example.bbl example.blg example.run.xml example.vrb
