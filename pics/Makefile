#
# all .eps files need to be converted to .pdf files for pdflatex
#   processing according to
#   http://hajek.stat.ubc.ca/~sysman/pdflatex.html
# 
# by Vladimir Kotal, 2004

PDFFILES= abt.pdf	\
	rbt-d.pdf	\
	rbt-d1a.pdf	\
	rbt-d1b.pdf	\
	rbt-d1c.pdf	\
	rbt-d1d.pdf	\
	rbt-d2.pdf	\
	rbt-i.pdf	\
	rbt-i1.pdf	\
	rbt-i2a.pdf	\
	rbt-i2b.pdf	\
	tries.pdf

%.pdf: %.eps
	epstopdf $<

all: $(PDFFILES)
#	@echo $(EPSFILES) | xargs -n 1 epstopdf

clean:
	@rm -f *.pdf
