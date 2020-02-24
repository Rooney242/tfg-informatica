load "config.gp"
set term png
set output "../png/time_ordering.png"

set xlabel "Tamaño de traza en GB"
set ylabel "Tiempo en segundos"
plot "../data/data.dat" using ($1*150/(1024*1024*1024)):($3/1000) w linespoints ls 1 lw 3 notitle