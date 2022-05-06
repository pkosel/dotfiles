#!/bin/bash

tmp=$(mktemp -d)

# resize each pdf before merging
# https://stackoverflow.com/a/7507511
for file in $@; do
    gs \
        -o "$tmp/$file" \
        -dCompatibilityLevel=1.4 \
        -dFIXEDMEDIA \
        -dPDFFitPage \
        -dPDFSETTINGS=/prepress \
        -sDEVICE=pdfwrite \
        -sPAPERSIZE=a5 \
        "$file"

    files+=("$tmp/$file")
done

gs \
    -o "merged.pdf" \
    -dCompatibilityLevel=1.4 \
    -dPDFSETTINGS=/prepress \
    -sDEVICE=pdfwrite \
    ${files[*]}

rm -rf $tmp

