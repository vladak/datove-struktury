#
# all .eps files need to be converted to .pdf files for pdflatex
#   processing according to
#   http://hajek.stat.ubc.ca/~sysman/pdflatex.html
# 
# by Vladimir Kotal, 2004

EPSFILES= abt.eps	\
	rbt-d.eps	\
	rbt-d1a.eps	\
	rbt-d1b.eps	\
	rbt-d1c.eps	\
	rbt-d1d.eps	\
	rbt-d2.eps	\
	rbt-i.eps	\
	rbt-i1.eps	\
	rbt-i2a.eps	\
	rbt-i2b.eps	\
	tries.eps

all: 
	@echo $(EPSFILES) | xargs -n 1 epstopdf

clean:
	@rm -f *.pdf
