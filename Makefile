PAPER1 = Orgoglio_Ritrovato
PAPER2 = Quinto_Confratello
TEX = $(wildcard *.tex)
BIB = references.bib
DOT = $(wildcard images/*.dot)
DOTPDFS = $(DOT:.dot=.pdf)
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

all: $(PAPER1).pdf $(PAPER2).pdf

%.pdf: %.dot
	echo dot -Tpdf $< > $@
	dot -Tpdf $< > $@

$(PAPER1).pdf: $(TEX) $(BIB) $(FIGS) $(DOTPDFS)
	echo $(FIGS)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER1)
	bibtex $(PAPER1)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER1)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER1)

$(PAPER2).pdf: $(TEX) $(BIB) $(FIGS) $(DOTPDFS)
	echo $(FIGS)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER2)
	bibtex $(PAPER2)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER2)
	pdflatex -interaction nonstopmode -halt-on-error $(PAPER2)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER1).pdf $(PAPER2).pdf

