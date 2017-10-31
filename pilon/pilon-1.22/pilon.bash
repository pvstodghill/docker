#! /bin/bash

PROGNAME=$(basename $0 .bash)
PROGDIR=$(dirname $0)
exec java -jar ${PROGDIR}/${PROGNAME}.jar "$@"

