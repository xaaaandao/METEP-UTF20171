all:
	pdflatex -synctex=1 -interaction=nonstopmode artigo
	bibtex artigo
	pdflatex artigo.tex
	pdflatex artigo.tex