#!/usr/bin/gnuplot -persist
set terminal qt
set datafile separator ","
plot 'test.csv' using 1:2 with lines, '' using 1:3 with lines#,'-' using 1:3 with lines
