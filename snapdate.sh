#!/bin/sh
#
# simple script for refreshing date in main html pages
#
# Vladimir Kotal, 2004
#

if [ $# -ne 1 ]; then
  echo "usage: $0 <htmlfile>"
  exit 1;
fi

HTMLFILE=`expr $1`
# echo "HTMLFILE = $HTMLFILE"

if [ ! -r $HTMLFILE ]; then
  echo "cannot read $HTMLFILE"
  exit 1;
fi

date=`date +"%Y-%m-%d_%H:%M"`; 
TMPF=`mktemp -t snapdate.XXXXXX`

cat $HTMLFILE | \
  sed "s/<tt>\(.*\)<\/tt> snapshot/<tt>$date<\/tt> snapshot/" \
	> $TMPF; \
mv $TMPF $HTMLFILE

