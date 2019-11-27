#!/bin/bash

git log --pretty=format:%s | awk '{ print length }' | gnuplot -p -e 'set terminal postscript eps color enhanced "Helvetica" 18; set output "title-lengths.eps"; set title "Linux Kernel Commit Title Lengths" font ", 25"; n=100; min=8; max=140; width=(max-min)/n; hist(x,width)=width*floor(x/width)+width/2.0; unset ytics; set boxwidth width*0.9; set xrange [min:max]; set style fill solid 0.8; plot "<cat" u (hist($1,width)):(1.0) smooth freq w boxes notitle' && epstopdf title-lengths.eps
