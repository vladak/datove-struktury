#
# makefile pro prepis prednasek z dat. struktur
#
# generovani PDF: make && make toc
#
# Vladimir Kotal, 2003-2011
#

# name of output file
MAIN=ds
ERRFILE=/tmp/ds.$$
DISTDIR=../Documents/webt/skola/ds
HTMLFILE=$(DISTDIR)/ds.html

SRCFILES= array.tex \
	compr-trie.tex \
	ds.tex \
	dynam.tex \
	hash1.tex \
	hash2.tex \
	heaps.tex \
	intro.tex \
	samoop.tex \
	trees-ab.tex \
	treesbin.tex \
	tries.tex

PICS=	pics/abt.pdf \
	pics/avl-ll.pdf \
	pics/avl-lr.pdf \
	pics/avl.pdf \
	pics/rbt-d.pdf \
	pics/rbt-d1a.pdf \
	pics/rbt-d1b.pdf \
	pics/rbt-d1c.pdf \
	pics/rbt-d1d.pdf \
	pics/rbt-d2.pdf \
	pics/rbt-i.pdf \
	pics/rbt-i1.pdf \
	pics/rbt-i2a.pdf \
	pics/rbt-i2b.pdf \
	pics/splay-insert.pdf \
	pics/splay-join2.pdf \
	pics/splay-join3.pdf \
	pics/splay-rot.pdf \
	pics/splay-dvojrot.pdf \
	pics/tr-markov.pdf \
	pics/tries.pdf

all: $(MAIN).pdf

# no ps (missing pics)
dist: $(MAIN).pdf 
	@if [ ! -d $(DISTDIR) ]; then \
	  echo "cannot copy dist file into $(DISTDIR)"; \
	  exit 1; \
	fi
	cp $(MAIN).pdf $(DISTDIR)
	sh snapdate.sh $(HTMLFILE)
	cd $(DISTDIR)

$(MAIN).ps: $(SRCFILES)
	@echo "generating $(MAIN) PS file"
	pslatex ${MAIN} && pslatex $(MAIN) > /dev/null && \
		dvips ${MAIN}.dvi -o $(MAIN).ps > /dev/null

dopics:
	cd pics; make

# you may need to run pdflatex twice to get index properly generated
debug: dopics $(SRCFILES)
	pdflatex ${MAIN} && pdflatex ${MAIN} > /dev/null

$(MAIN).pdf: $(SRCFILES) $(PICS)
	#@rm -f $(MAIN).pdf
	@pdflatex -interaction=errorstopmode ${MAIN}

toc: $(MAIN).pdf
	echo "generating index"
	@pdflatex ${MAIN}

disabled:
	@if [ $$? -eq 0 ]; then \
	  echo "successfull"; \
	  rm -f $(ERRFILE); \
	else \
	  echo "failed"; \
	fi

pics-clean:
	@cd pics; make clean

# ${MAIN}.toc 
clean: 
	@rm -f *.ps *.pdf *.aux *.out *.log *.dvi
