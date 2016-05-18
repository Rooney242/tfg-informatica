#!/usr/bin/gnuplot

load 'gnuplot/config.gp'

set term cairolatex color size 4.7in,3in font ",10" dashed transparent
set output 'gnuplot/caplen-effects.tex'

set title 'Tasa efectiva con limitación de tamaño de paquete'

set grid x y
set xlabel 'Tamaño de paquete (bytes)'
set ylabel 'Tasa efectiva (Gbps)'

set key at screen 0.97, screen 0.86

set pointintervalbox 0.5

set yrange [0:40]
set xrange [0:1500]

plot \
	(x < 64) ? 1/0 : 40 * x / (x + 20) * min(1, 18 / x) w lines ls 1 lw 3 title '18 bytes (Ethernet)', \
	(x < 64) ? 1/0 : 40 * x / (x + 20) * min(1, 50 / x) w lines ls 2 lw 3 title '50 bytes (TCP/UDP)', \
	(x < 64) ? 1/0 : 40 * x / (x + 20) * min(1, 64 / x) w lines ls 3 lw 3 title '64 bytes', \
	(x < 64) ? 1/0 : 40 * x / (x + 20) * min(1, 100 / x) w lines ls 4 lw 3 title '100 bytes', \
	(x < 64) ? 1/0 : 40 * x / (x + 20) * min(1, 200 / x) w lines ls 5 lw 3 title '200 bytes', \
	(x < 64) ? 1/0 : 40 * x / (x + 20) * min(1, 600 / x) w lines ls 6 lw 3 title '600 bytes', \
	(x < 64) ? 1/0 : 40 * x / (x + 20) w lines ls 7 lw 3 title 'Capacidad teórica'


