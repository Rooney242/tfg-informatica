load "config.gp"
set term png
set output "../png/memory-usage.png"

set xlabel "Tamaño de traza en GB"
set ylabel "Tamaño de estructuras usadas en KB"
plot "../data/data.dat" using ($1*150/(1024*1024*1024)):($8/(1024)) w linespoints ls 1 lw 3 notitle