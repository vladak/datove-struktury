#
# makefile pro prepis prednasek z dat. struktur
#
# Vladimir Kotal, 2003
#

# name of output file
MAIN=ds
ERRFILE=/tmp/ds.$$
DISTDIR=../webt/skola/ds

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

all: $(MAIN).pdf

dist: $(MAIN).pdf $(MAIN).ps
	@if [ ! -d $(DISTDIR) ]; then \
	  echo "cannot copy dist file into $(DISTDIR)"; \
	  exit 1; \
	fi
	cp $(MAIN).pdf $(MAIN).ps $(DISTDIR)
	cd $(DISTDIR) && cvs commit

src-dist:
	@echo "nothing yet"
	# XXX FIXME tar

commit:
	cvs commit

$(MAIN).ps: $(SRCFILES)
	@echo "generating $(MAIN) PS file"
	@latex ${MAIN} > /dev/null && \
		dvips ${MAIN}.dvi -o $(MAIN).ps > /dev/null
	@echo "successfull"

dopics:
	cd pics; make

# you may need to run pdflatex twice to get index properly generated
debug: dopics $(SRCFILES)
	pdflatex ${MAIN} && pdflatex ${MAIN} > /dev/null

$(MAIN).pdf: pics $(SRCFILES)
	@echo "generating PDF from $(MAIN)"
	@pdflatex ${MAIN} > $(ERRFILE) \
		&& pdflatex ${MAIN} > /dev/null
	@if [ $$? -eq 0 ]; then \
	  echo "successfull"; \
	  rm -f $(ERRFILE); \
	else \
	  echo "failed, log is in $(ERRFILE)"; \
	fi

pics-clean:
	@cd pics; make clean

clean: pics-clean
	@rm -f ${MAIN}.toc *.ps *.pdf *.aux *.out *.log *.dvi
