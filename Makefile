#
# Build a PDF with all the notebooks
#
all: ipynbrun latexfiles buildpdf

ipynbrun:
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute open_science.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute introduccion.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute git.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute documentando_workflow.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute scipy.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute generacion.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute accesodatos.ipynb
#	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute otros_lenguajes.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ejercicio_dados.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute open_data.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ms_sql.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute python_json.ipynb

latexfiles:
	jupyter nbconvert --to latex open_science.nbconvert.ipynb
	jupyter nbconvert --to latex introduccion.nbconvert.ipynb
	jupyter nbconvert --to latex git.nbconvert.ipynb
	jupyter nbconvert --to latex documentando_workflow.nbconvert.ipynb
	jupyter nbconvert --to latex scipy.nbconvert.ipynb
	jupyter nbconvert --to latex generacion.nbconvert.ipynb
	jupyter nbconvert --to latex accesodatos.nbconvert.ipynb
	jupyter nbconvert --to latex ms_sql.nbconvert.ipynb
#	jupyter nbconvert --to latex otros_lenguajes.ipynb
	jupyter nbconvert --to latex ejercicio_dados.nbconvert.ipynb
	jupyter nbconvert --to latex open_data.nbconvert.ipynb
	jupyter nbconvert --to latex python_json.nbconvert.ipynb

buildpdf:
	pdflatex open_science.nbconvert.tex
	pdflatex introduccion.nbconvert.tex
	pdflatex git.nbconvert.tex
	pdflatex documentando_workflow.nbconvert.tex
	pdflatex scipy.nbconvert.tex
	pdflatex generacion.nbconvert.tex
	pdflatex accesodatos.nbconvert.tex
	pdflatex ms_sql.nbconvert.tex
#	pdflatex otros_lenguajes.tex
	pdflatex ejercicio_dados.nbconvert.tex
	pdflatex open_data.nbconvert.tex
	pdflatex python_json.nbconvert.tex
##	octave --no-gui ./octave_1.m
#	octave ./octave_1.m
#	sleep 5
#	timeout /t 5
#	cp ./matweave/mygaussian.pdf .
#	cp ./matweave/myhistogram.pdf .
#	copy /y .\matweave\*.tex .
#	copy ./matweave/myexample.tex .
#	pdflatex myexample.tex
#	cp ./matweave/myexample.pdf ./myexample.pdf
#	pdfjoin introduccion.pdf git.pdf generacion.pdf accesodatos.pdf otros_lenguajes.pdf ./myexample.pdf ejercicio_dados.pdf
	c:/tools/cpdf open_science.nbconvert.pdf introduccion.nbconvert.pdf git.nbconvert.pdf documentando_workflow.nbconvert.pdf scipy.nbconvert.pdf  generacion.nbconvert.pdf accesodatos.nbconvert.pdf ms_sql.nbconvert.pdf python_json.nbconvert.pdf ejercicio_dados.nbconvert.pdf open_data.nbconvert.pdf -o apuntes.pdf
	copy apuntes.pdf .\doc\.
	evince .\doc\apuntes.pdf

clean:
	del -f *.nbconvert.ipynb
	del -f *.aux
	del -f *.tex
	del -f *.out
	del -f *.log
	del -f *.pdf

.solouno:
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute documentando_workflow.ipynb
	jupyter nbconvert --to latex documentando_workflow.nbconvert.ipynb
	pdflatex documentando_workflow.nbconvert.tex
	evince documentando_workflow.nbconvert.pdf
