ROOT = root
PDFLATEX_OPTS=-file-line-error-style -interaction=nonstopmode

all: clean $(ROOT).pdf

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOT)

clean:
	rm -f *.log *.aux *.toc *.dvi *.bbl *.blg *.*~* examples/*.*~* *.lof *.ilg *.gls *.glo *.backup *.bak.* *.nav *.out *.snm *.gif *.backup *.dat *.vrb *.brf *.fls root.pdf
	find . -name "*.aux" -delete
	find . -name "*.*~" -delete
	find . -name "*.backup" -delete

%.pdf: %.tex
	pdflatex -draftmode $(PDFLATEX_OPTS) $(ROOT)
	-bibtex -min-crossrefs=60 $(ROOT); iconv --from-code=ISO-8859-1 --to-code=UTF-8 $(ROOT).bbl > $(ROOT).bbl.new; 	mv $(ROOT).bbl.new $(ROOT).bbl
	pdflatex -draftmode $(PDFLATEX_OPTS) $(ROOT)
	pdflatex -draftmode $(PDFLATEX_OPTS) $(ROOT)
	pdflatex $(PDFLATEX_OPTS) $(ROOT)
