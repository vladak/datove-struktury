#
# makefile pro prepis prednasek z dat. struktur
#
# Vladimir Kotal, 2003
#

MAIN=main

all:
	latex ${MAIN}
	dvips ${MAIN}

clean:
	@rm -f ${MAIN}.toc *.ps *.pdf
