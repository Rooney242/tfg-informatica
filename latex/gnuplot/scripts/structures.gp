load "config.gp"
set term png
set output "../png/structures.png"

set key top left

set xrange [0:550]
set yrange [0:300000]

set xlabel "Tamaño de traza en MB"
set ylabel "Cantidad de estructuras usadas"

plot "../data/data.dat" using ($1*58/(1024*1024)):4 w lines ls 1 lw 3, \
	"../data/data.dat" using ($1*58/(1024*1024)):5 w lines ls 2 lw 3, \
	"../data/data.dat" using ($1*58/(1024*1024)):6 w lines ls 3 lw 3, \
	"../data/data.dat" using ($1*58/(1024*1024)):7 w lines ls 4 lw 3, \
	"../data/data.dat" using ($1*58/(1024*1024)):8 w lines ls 5 lw 3, \