load "config.gp"
set term png
set output "../png/memory-usage.png"

set xrange [0:550]
set yrange [0:90]
set xlabel "Tamaño de traza en MB"
set ylabel "Tamaño de estructuras usadas en KB"
plot "../data/data.dat" using ($1*58/(1024*1024)):($2/(1024)) w lines ls 1 lw 3 notitle