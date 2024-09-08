#!/bin/sh
#usage: gen_files.sh <yuel dir> <output id> <yuel target version> [files...]
yuel=$1
shift
display=$1
shift
ver=$1
shift
luaver=$HOME/.luaver/luaver
for file in "$@"
do
  file=$(realpath $file)
  builddir=${file%.*}
  mkdir -p $builddir
  cd $yuel
  $luaver use 5.0.3
  lua luac.lua -o ${builddir}/${display}503_to_${ver}.out $file
  $luaver use 5.1.5
  lua luac.lua -o ${builddir}/${display}515_to_${ver}.out $file
  $luaver use 5.2.4
  lua luac.lua -o ${builddir}/${display}524_to_${ver}.out $file
  $luaver use 5.3.6
  lua luac.lua -o ${builddir}/${display}536_to_${ver}.out $file
  $luaver use 5.4.7
  lua luac.lua -o ${builddir}/${display}547_to_${ver}.out $file
  cd -
done
