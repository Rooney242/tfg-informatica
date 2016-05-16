#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

set term cairolatex color size 4.7in,3in font ",10" dashed transparent
set output 'gnuplot/multicore-ordering.tex'

set title 'Porcentaje de desorden'

set grid x y
set xlabel 'Tráfico (Mpps)'
set ylabel 'Porcentaje de paquetes desordenados'

set key bottom right

set pointintervalbox 0.5

plot \
	'data/multicore-ordering.dat' using 1:2:3 w yerrorbars ls 3 lw 2 notitle, \
	'data/multicore-ordering.dat' using 1:2 w linespoints ls 3 lw 3 title '4 Hilos'
