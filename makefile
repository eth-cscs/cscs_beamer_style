.PHONY: all clean clean-files clean-figs

LATEX = xelatex
LATEX_OPTIONS =
TARGET_EN = example.pdf
TARGET = $(TARGET_EN)
TARGET_BASE = $(basename $(TARGET))
SOURCES_EN = example.tex
INC = $(SOURCES_EN) beamerthemeCSCS.sty

CLEANFILES = $(TARGET_BASE).pdf \
	*.ps *.log *.bak *.bbl *.aux *.blg *.dvi *.toc *.out *.nav *.snm *.vrb \
	*.listing

RM = /bin/rm -f
figs = \
	cscs_images/cscs_entrance_equations.pdf \
	cscs_images/cscs_entrance_painting.pdf \
	cscs_images/cscs_external_glass.jpeg \
	cscs_images/cscs_logo.pdf \
	cscs_images/cscs_logo_fullname.pdf \
	cscs_images/cscs_machine_room.pdf \
	cscs_images/email-icon.png \
	cscs_images/eth_logo.pdf \
	cscs_images/github-icon.png \
	cscs_images/rtd-icon.png \
	cscs_images/reframe_logo-only-transparent.png \
	cscs_images/slack-icon.png

all: $(TARGET)

$(TARGET): $(figs) $(TARGET_BASE).tex $(INC)
	outfile=`mktemp .tex.XXXXXX`; \
	echo 'Rerun' > $$outfile; \
	until ! grep 'Rerun' $$outfile; do \
		$(LATEX) $(LATEX_OPTIONS) $(TARGET_BASE).tex | tee $$outfile; \
	done; \
	$(RM) $$outfile

$(TARGET_BASE).bbl: $(TARGET_BASE).bib
	$(LATEX) $(LATEX_OPTIONS) $(TARGET_BASE).tex && bibtex $(TARGET_BASE); \
	outfile=`mktemp .tex.XXXXXX`; \
	echo 'Rerun' > $$outfile; \
	until ! grep 'Rerun' $$outfile; do \
		$(LATEX) $(LATEX_OPTIONS) $(TARGET_BASE).tex | tee $$outfile; \
	done; \
	$(RM) $$outfile

%.pdf:
		@echo

%.png:
		@echo

clean:
	$(RM) $(CLEANFILES)
