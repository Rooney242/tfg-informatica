#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

# set term cairolatex color size 4.7in,3in font ",10" dashed transparent
# set output 'gnuplot/memory-usage.tex'

set title 'Capacidad máxima - Múltiples hilos'

set grid x y
set xlabel 'Tamaño de paquete (bytes)'
set ylabel 'Tasa máxima (Gbps)'

set key bottom right

set yrange [0:40]

set pointintervalbox 0.5

plot 'data/memory-usage.dat' using 1:($2/1024) w linespoints ls 1 lw 3 title '1 Hilo', \