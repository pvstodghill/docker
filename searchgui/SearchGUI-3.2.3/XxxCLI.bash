#! /bin/bash

ROOT=`realpath $0 | xargs dirname`/..
CMDNAME=`basename $0 | sed -e 's/^.*-//'`

set -x
java -Djava.awt.headless=true $JVM_FLAGS \
     -cp $ROOT/lib/SearchGUI/SearchGUI-*.jar \
     eu.isas.searchgui.cmd.$CMDNAME "$@"
