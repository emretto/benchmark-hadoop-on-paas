TITLE = ARG1
CSP_BNCH = ARG2
DATA_SCALE = ARG3

DATAFILE_CPU = sprintf("%s%s%s%s", ARG2, "-c-", DATA_SCALE, ".dat")
DATAFILE_RAM = sprintf("%s%s%s%s", ARG2, "-r-", DATA_SCALE, ".dat")
DATAFILE_IO = sprintf("%s%s%s%s", ARG2, "-i-", DATA_SCALE, ".dat")

IMAGENAME = sprintf( "%s%s%s%s", ARG2, "-cmi-", DATA_SCALE, ".png") 

LC_CPU = "#07AD02"
LC_RAM = "#C303DD"
LC_IO = "#E67E22"

set grid
set rmargin 10
set key bmargin horizontal font "Sans,8" #box
set xdata time
set timefmt "%H:%M:%S"
set title TITLE font "Sans,10"
#set yrange [0:100]
set xlabel "Time (MM:SS)" font "Sans,8"
set ylabel "CPU-Mem (%)" font "Sans,8"
set y2label "IO - tps" font "Sans,8"
set xtics rotate by -45 font "Sans,6"
set ytics font "Sans,6"
set y2tics nomirror font "Sans,6"
set tics out
#set autoscale  y
set autoscale y2
set term png 
#size 460, 310
set output IMAGENAME
# plot DATAFILE_RAM u 1:2 w l lw 2 t "kbmemfree", DATAFILE u 1:4 w l lw 2 t "kbmemused"
#plot DATAFILE_CPU u 1:3 t "cpu %" w l lc rgb "purple",  23 t "avg-cpu" w l lc rgb "red", DATAFILE_RAM u 1:5 w l lc rgb "orange" t "mem %", 61.51 t "a$
plot DATAFILE_CPU u 1:3 t "cpu %" w l lc rgb LC_CPU axes x1y1, DATAFILE_RAM u 1:5 w l lc rgb LC_RAM t "mem %" axes x1y1, DATAFILE_IO u 1:2 w impulses lc rgb LC_IO t "I/O" axes x1y2


