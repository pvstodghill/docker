#! /bin/bash

ROOT=`realpath $0 | xargs dirname`/..

set -x
java $JVM_FLAGS \
     -jar $ROOT/lib/SearchGUI/SearchGUI-*.jar "$@"

