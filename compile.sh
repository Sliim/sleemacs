#!/bin/bash
INITFILE=$(pwd)"/init.el"
INITDIR=$(pwd)"/init"
TMPFILE=$(pwd)"/init.el.tmp"

if ! test -d $INITDIR; then
    echo >&2 "Go to sleemacs base path and launch script again!"
    exit 2
fi

grep -vE "load-file|^;" $INITFILE > $TMPFILE

for file in $(sed -n 's|^(load-file "~\(.*\)")|\1|p' $INITFILE); do
    file=$HOME/$file
    if ! test -f $file; then
        echo >&2 "W: File $file not found"
        continue;
    fi

    grep -hv "^;" $file >> $TMPFILE
done

mv $TMPFILE $INITFILE

emacs \
    --load $INITFILE \
    --execute "(byte-compile-file \"$INITFILE\")" \
    --execute "(setq confirm-kill-emacs nil)" \
    --execute "(save-buffers-kill-emacs)"
git checkout $INITFILE

echo "Compiled in ${INITFILE}c."
echo "done."
