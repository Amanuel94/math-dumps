# Makefile for LaTeX documents

# Variables
TEX = pdflatex
BIB = bibtex
TEXFILES = 'main.tex'
PDFFILES = $(TEXFILES:.tex=.pdf)

# Default target
all: $(PDFFILES)

# Rule to convert .tex to .pdf
%.pdf: %.tex
    $(TEX) $<
    $(BIB) $(basename $<) || true
    $(TEX) $<
    $(TEX) $<

# Clean up auxiliary files
clean:
    rm -f *.aux *.log *.bbl *.blg *.toc *.out *.lof *.lot

# Clean up all generated files
distclean: clean
    rm -f $(PDFFILES)

.PHONY: all clean distclean