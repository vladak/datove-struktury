#
# makefile pro prepis prednasek z dat. struktur
#
# Vladimir Kotal, 2003
#

all:
	cslatex main
	dvips main

clean:
	@rm -f *
