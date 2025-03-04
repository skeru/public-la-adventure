PAPER = Orgoglio_Ritrovato
TEX = $(wildcard *.tex)
BIB = references.bib
DOT = $(wildcard images/*.dot)
DOTPDFS = $(DOT:.dot=.pdf)
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

all: $(PAPER).pdf

%.pdf: %.dot
	echo dot -Tpdf $< > $@
	dot -Tpdf $< > $@

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) $(DOTPDFS)
	echo $(FIGS)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER)
	bibtex $(PAPER)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf

