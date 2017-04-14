#!/bin/bash
gs \
  -sOutputFile=$1 \
  -sDEVICE=pdfwrite \
  -sColorConversionStrategy=Gray \
  -dProcessColorModel=/DeviceGray \
  -dAutoRotatePages=/None \
  -dCompatibiltyLevel=1.4 \
  -dNOPAUSE \
  -dBATCH \
  $@
