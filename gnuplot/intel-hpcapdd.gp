#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

set term cairolatex color size 4.7in,3in font ",10" dashed transparent
set output 'gnuplot/intel-hpcapdd.tex'

set title 'Capacidad máxima - Intel XL710'

set grid x y
set xlabel 'Tamaño de paquete (bytes)'
set ylabel 'Tasa máxima (Gbps)'

set key bottom right

set yrange [0:40]

set pointintervalbox 0.5

plot 'data/intel-hpcapdd.dat' using 1:($2/1024) w linespoints ls 1 lw 3 title 'Guardado en RAM - 1 hilo', \
	'data/intel-hpcapdd.dat' using 1:($3/1024) w linespoints ls 2 lw 3 title 'Guardado en RAM - 2 hilos', \
	40 * x / (x + 20) w lines ls 4 lw 2 title 'Capacidad teórica'
