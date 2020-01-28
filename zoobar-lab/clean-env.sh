#!/bin/bash
F="$1"
shift

ulimit -s unlimited

DIR=$(cd -P -- "$(dirname -- "$F")" && pwd -P)
FILE=$(basename -- "$F")
exec env - PWD=$DIR SHLVL=0 $DIR/$FILE "$@"
