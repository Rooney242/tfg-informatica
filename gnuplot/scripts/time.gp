load "config.gp"
set term png
set output "../png/time.png"

set xrange [0:300]
set yrange [0:25]
set xlabel "Tamaño de traza en MB"
set ylabel "Tiempo en segundos"
plot "../data/data.dat" using ($1*58/(1024*1024)):($3/1000) w linespoints ls 1 lw 3 notitle