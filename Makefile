#
# Build a PDF with all the notebooks 
#
#TEMPLATE=chapter
NOTEBOOKS=introduccion.ipynb \
	  accesodatos.ipynb \
          otros_lenguajes.ipynb \
          ejercicio_dados.ipynb

LATEXFILES=$(NOTEBOOKS:.ipynb=.tex)

CLEANFILES=$(.aux=.tex=.out=.log=.pdf)

#.ipynb.tex:
#	ipython nbconvert --to latex --template $(TEMPLATE) $<
#    ipython nbconvert --to latex $<

#all: $(LATEXFILES) buildpdf
all: ipynbrun latexfiles buildpdf 

ipynbrun:
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute introduccion.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute git.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute generacion.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute accesodatos.ipynb
#	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute otros_lenguajes.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ejercicio_dados.ipynb	
#	jupyter notebook run introduccion.ipynb --output=01.ipynb
	

latexfiles:
	jupyter nbconvert --to latex introduccion.nbconvert.ipynb
	jupyter nbconvert --to latex git.nbconvert.ipynb
	jupyter nbconvert --to latex generacion.nbconvert.ipynb
	jupyter nbconvert --to latex accesodatos.nbconvert.ipynb
	jupyter nbconvert --to latex otros_lenguajes.ipynb
	jupyter nbconvert --to latex ejercicio_dados.nbconvert.ipynb
	

buildpdf: latexfiles
	pdflatex introduccion.nbconvert.tex
	pdflatex git.nbconvert.tex
	pdflatex generacion.nbconvert.tex
	pdflatex accesodatos.nbconvert.tex
	pdflatex otros_lenguajes.tex
	pdflatex ejercicio_dados.nbconvert.tex
	octave --no-gui ./octave_1.m
	sleep 5
#	cp ./matweave/mygaussian.pdf .
#	cp ./matweave/myhistogram.pdf .
	cp ./matweave/*.tex .
	cp ./matweave/myexample.tex .
	pdflatex myexample.tex		
#	cp ./matweave/myexample.pdf ./myexample.pdf
#	pdfjoin introduccion.pdf git.pdf generacion.pdf accesodatos.pdf otros_lenguajes.pdf ./myexample.pdf ejercicio_dados.pdf 
	c:/tools/cpdf introduccion.nbconvert.pdf git.nbconvert.pdf generacion.nbconvert.pdf accesodatos.nbconvert.pdf otros_lenguajes.pdf myexample.pdf ejercicio_dados.nbconvert.pdf -o apuntes.pdf
	cp apuntes.pdf ./doc/.
	evince ./doc/apuntes.pdf
	
clean:
	rm -f *.nbconvert.ipynb
	rm -f *.aux
	rm -f *.tex
	rm -f *.out
	rm -f *.log
	rm -f *.pdf

