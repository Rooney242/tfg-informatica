#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

set term cairolatex color size 4.7in,3in font ",10" dashed transparent
set output 'gnuplot/multicore-max-rate.tex'

set title 'Capacidad máxima - Múltiples hilos'

set grid x y
set xlabel 'Tamaño de paquete (bytes)'
set ylabel 'Tasa máxima (Gbps)'

set key bottom right

set pointintervalbox 0.5

plot 'data/multicore-max-rate.dat' using 1:($2/1024) w linespoints ls 1 lw 3 title '1 Hilo', \
	'data/multicore-max-rate.dat' using 1:($3/1024) w linespoints ls 2 lw 3 title '2 Hilos', \
	'data/multicore-max-rate.dat' using 1:($4/1024) w linespoints ls 3 lw 3 title '4 Hilos', \
	40 * x / (x + 20) w lines ls 4 lw 2 title 'Capacidad teórica'
