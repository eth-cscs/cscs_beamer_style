

all: example

example:
	pdflatex example.tex
	pdflatex example.tex

clean:
	rm -f example.pdf example.aux example.dvi example.log example.nav example.out example.snm example.toc
