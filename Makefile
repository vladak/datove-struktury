#
# makefile pro prepis prednasek z dat. struktur
#
# Vladimir Kotal, 2003
#

# name of output file
MAIN=ds

all: pdf 

ps:
	latex ${MAIN}
	dvips ${MAIN}

# you may need to run pdflatex twice to get index properly generated
pdf:
	cd pics; make
	pdflatex ${MAIN} && pdflatex ${MAIN} > /dev/null

clean:
	@rm -f ${MAIN}.toc *.ps *.pdf *.aux *.out *.log *.dvi
	@cd pics; make clean
