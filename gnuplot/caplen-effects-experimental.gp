#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

set term cairolatex color size 4.7in,3in font ",10" dashed transparent
set output 'gnuplot/caplen-effects-experimental.tex'

set title 'Tasa máxima con limitación de tamaño de paquete'

set grid x y
set xlabel 'Tamaño de paquete (bytes)'
set ylabel 'Tasa efectiva (Gbps)'

set key bottom right

set pointintervalbox 0.5

set yrange [0:40]
set xrange [0:1500]

plot \
	'data/multicore-max-rate.dat' u 1:($5/1024) w linespoints ls 1 lw 3 title 'Sin limitaciones', \
	'data/caplen-max-rate.dat' u 1:($2/1024) w linespoints ls 2 lw 3 title 'Límite 18 bytes', \
	'data/caplen-max-rate.dat' u 1:($3/1024) w linespoints ls 3 lw 3 title 'Límite 64 bytes', \
	'data/caplen-max-rate.dat' u 1:($4/1024) w linespoints ls 4 lw 3 title 'Límite 200 bytes'


