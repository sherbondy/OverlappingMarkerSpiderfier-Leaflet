#!/bin/bash

INDIR=../lib/
INPREFIX=oms

OUTDIR=./tmp/
OUTNAME=${INPREFIX}.min.js
OUTFILE=${OUTDIR}${OUTNAME}

coffee --output $OUTDIR --compile ${INDIR}${INPREFIX}.coffee

java -jar /usr/local/closure-compiler/compiler.jar \
  --compilation_level SIMPLE_OPTIMIZATIONS \
  --js ${OUTDIR}${INPREFIX}.js \
  --output_wrapper '(function(){%output%}).call(this);' \
> $OUTFILE

echo '/*' $(date) '*/' >> $OUTFILE

cp $OUTFILE ../../public/$OUTNAME
