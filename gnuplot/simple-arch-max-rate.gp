#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

set term cairolatex color size 4.7in,3in font ",10" dashed transparent
set output 'gnuplot/simple-arch-max-rate.tex'

set title 'Capacidad máxima - Hilo único'

set multiplot

set grid x y
set xlabel 'Tamaño de paquete'
set ylabel 'Tasa máxima (Gbps)'

set key top left

set pointintervalbox 0.5

set object 2 rectangle from first 50, first 7 to first 210, first 19 fc rgb 'white' fs transparent solid 0.5 border lc '#E6AB02' lw 2 behind

set arrow 3 from first 210, first 19 to screen 0.45, screen 0.65 nohead lw 2 lc rgb '#E6AB02'
set arrow 4 from first 210, first 7 to screen 0.45, screen 0.13 nohead lw 2 lc rgb '#E6AB02'

plot 'data/simple-arch-max-rate.dat' using 1:($2/1024) w linespoints ls 1 lw 3 title 'Timestamp hardware', \
	'data/simple-arch-max-rate.dat' using 1:($3/1024) w linespoints ls 2 lw 3 title 'Timestamp software'

set object 1 rectangle from screen 0.45, screen 0.13 to screen 0.95, screen 0.65 fc rgb 'white' fs transparent solid 1 border lc '#E6AB02' lw 2 behind

unset object 2
unset arrow 3
unset arrow 4

set size 0.5,0.52
set origin 0.45,0.13
set title ''
set key off

set rmargin 2

set grid front

set xlabel ''
set ylabel ''

set mytics 2

set xrange [60:210]

plot 'data/simple-arch-max-rate.dat' using 1:($2/1024) w linespoints ls 1 lw 3 title 'Timestamp hardware', \
	'data/simple-arch-max-rate.dat' using 1:($3/1024) w linespoints ls 2 lw 3 title 'Timestamp software'
