TITLE = ARG1
CSP = ARG2
BNCH = ARG3
DATA_SCALE = ARG4

DATAFILE_CPU_ALL = sprintf("%s%s%s%s%s%s%s", CSP, ".", DATA_SCALE, ".", BNCH, "-ca", ".dat")
DATAFILE_CPU_0 = sprintf("%s%s%s%s%s%s%s", CSP, ".", DATA_SCALE, ".", BNCH, "-c0", ".dat")
DATAFILE_CPU_1 = sprintf("%s%s%s%s%s%s%s", CSP, ".", DATA_SCALE, ".", BNCH, "-c1", ".dat")

DATAFILE_RAM = sprintf("%s%s%s%s%s%s%s", CSP, ".", DATA_SCALE, ".", BNCH, "-r", ".dat")
DATAFILE_IO = sprintf("%s%s%s%s%s%s%s", CSP, ".", DATA_SCALE, ".", BNCH, "-i", ".dat")

REPORTFILE = sprintf("%s%s%s", "report.", BNCH, ".dat")

IMAGENAME = sprintf( "%s%s%s%s%s%s%s", CSP, ".", DATA_SCALE, ".", BNCH, "-cmidt", ".png")
#"test.png"

#LC_CPU_A = "#60F71405"
LC_CPU_A = "#6000FA00"
LC_CPU_0 = "#60015f08"
LC_CPU_1 = "#601705f7"

LC_RAM = "#60C303DD"
#LC_IO = "#60E67E22"
LC_IO = "#60FF0000"

set grid
#set rmargin 10
set key rmargin vertical font "Times New Roman, 12" 
#box
set xdata time
set timefmt "%H:%M:%S"
#set yrange [0:100]
set xlabel "Time (MM:SS)" font "Times New Roman, 12"
set ylabel "CPU-Mem (%)" font "Times New Roman, 12" offset 2, 0, 0
set y2label "IO - r / w tps" font "Times New Roman, 12" offset -3, 0, 0
set xtics rotate by -45 font "Times New Roman, 8"
set ytics font "Times New Roman, 10"
set y2tics nomirror font "Times New Roman, 8"
#set xtics font "Sans, 8"
set tics out
set autoscale y2
set term png size 1600, 1000
set output IMAGENAME
set multiplot title TITLE layout 2, 2 font "Times New Roman, 16"

set title "GCP Dataproc" font "Times New Roman, 14"
plot DATAFILE_CPU_ALL u 1:3 t "cpuAll%" w l lw 1 lc rgb LC_CPU_A axes x1y1, \
	DATAFILE_CPU_0 u 1:3 w l lw 0.5 lc rgb LC_CPU_0  t "cpu0%" axes x1y1, \
	DATAFILE_CPU_1 u 1:3 w l lw 0.5 lc rgb LC_CPU_1  t "cpu1%" axes x1y1, \
	DATAFILE_RAM u 1:5 w l lw 0.5 lc rgb LC_RAM t "mem%" axes x1y1, \
        DATAFILE_IO u 1:3 w impulses lw 1 lc rgb LC_IO t "io-rtps" axes x1y2, \
	DATAFILE_IO u 1:4 w impulses lw 1 lc rgb "#60086D01" t "io-wtps" axes x1y2

set title "Azure HDInsight" font "Times New Roman, 14"

plot DATAFILE_CPU_ALL u 1:3 t "cpuAll%" w l lw 1 lc rgb LC_CPU_A axes x1y1, \
	DATAFILE_CPU_0 u 1:3 w l lc rgb LC_CPU_0  t "cpu0%" axes x1y1, \
	DATAFILE_CPU_1 u 1:3 w l lc rgb LC_CPU_1  t "cpu1%" axes x1y1, \
	DATAFILE_RAM u 1:5 w l lw 1 lc rgb LC_RAM t "mem%" axes x1y1, \
	DATAFILE_IO u 1:3 w impulses lw 1 lc rgb LC_IO t "io-rtps" axes x1y2, \
        DATAFILE_IO u 1:4 w impulses lw 1 lc rgb "#60086D01" t "io-wtps" axes x1y2

set title "AlibabaCloud e-MapReduce" font "Times New Roman, 14"

plot DATAFILE_CPU_ALL u 1:3 t "cpuAll%" w l lw 1 lc rgb LC_CPU_A axes x1y1, \
	DATAFILE_CPU_0 u 1:3 w l lc rgb LC_CPU_0  t "cpu0%" axes x1y1, \
	DATAFILE_CPU_1 u 1:3 w l lc rgb LC_CPU_1  t "cpu1%" axes x1y1, \
	DATAFILE_RAM u 1:5 w l lw 1 lc rgb LC_RAM t "mem%" axes x1y1, \
	DATAFILE_IO u 1:3 w impulses lw 1 lc rgb LC_IO t "io-rtps" axes x1y2, \
        DATAFILE_IO u 1:4 w impulses lw 1 lc rgb "#60086D01" t "io-wtps" axes x1y2

set title "Duration - Throughput" font "Times New Roman, 14"

set style data histograms
set style fill solid
set style histogram cluster gap 1

set xlabel "CSPs"
set ylabel "Duration (sec)" offset 2, 0, 0
set y2label "Throughput" offset -3, 0, 0
set y2tics font "Times New Roman, 10"
set tics out

set yrange [0:*]
set y2range [0:*]
set tics scale 0.0
#set ytics
set xtics font "Times New Roman, 12"
unset xdata
set xtics norotate nomirror
set boxwidth 0.5
plot REPORTFILE using 5:xtic(1) lc rgb "#E67E22" title 'Duration' axes x1y1, \
	REPORTFILE using 6:xtic(1) lc rgb "#086d01" t "Throughput" axes x1y2
#
unset multiplot
#
