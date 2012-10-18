#!/bin/bash
INITFILE=$(pwd)"/init.el"
INITDIR=$(pwd)"/init"

if ! test -d $INITDIR; then
    echo >&2 "Go to sleemacs base path and launch script again!"
    exit 2
fi

cat $INITFILE | grep -v "load-file" | grep -v "^;" > $INITFILE
cat $INITDIR/* | grep -v "^;" >> $INITFILE

emacs -Q --execute "(byte-compile-file \"$INITFILE\")" --execute "(save-buffers-kill-emacs)"

git checkout $INITFILE

echo "Compiled in ${INITFILE}c."
echo "done."
