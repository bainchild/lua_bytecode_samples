#!/bin/bash
#usage: gen_files_luac.sh [files...]
luaver=$HOME/.luaver/luaver
for file in "$@"
do
  file=$(realpath $file)
  builddir=${file%.*}
  mkdir -p $builddir
  $luaver use 5.0.3
  luac -o $builddir/luac503.out $file
  luac32-5.0 -o $builddir/luac32-50.out $file
  $luaver use 5.1.5
  luac -o $builddir/luac515.out $file
  luac32-5.1 -o $builddir/luac32-51.out $file
  $luaver use 5.2.4
  luac -o $builddir/luac524.out $file
  luac32-5.2 -o $builddir/luac32-52.out $file
  $luaver use 5.3.6
  luac -o $builddir/luac536.out $file
  luac32-5.3 -o $builddir/luac32-53.out $file
  $luaver use 5.4.7
  luac -o $builddir/luac547.out $file
  luac32-5.4 -o $builddir/luac32-54.out $file
done
