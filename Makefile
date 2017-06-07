all:
	pdflatex -synctex=1 -interaction=nonstopmode artigo
	bibtex artigo
	pdflatex artigo.tex
	pdflatex artigo.tex
up:
	git checkout master
	git pull origin master
	git merge xandao
	git push origin master
	git checkout xandao
