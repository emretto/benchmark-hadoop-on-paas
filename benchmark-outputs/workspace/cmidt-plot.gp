TITLE = ARG1
UC = ARG2
BNCH = ARG3
DATA_SCALE = ARG4

GCP = "gcp"
AZU = "azu"
ALI = "ali"

HIBENCH_REPORT = sprintf("%s%s%s%s%s%s%s", "reports/processed/", UC, "-", DATA_SCALE, "-", BNCH, ".dat")

IMAGENAME = sprintf( "%s%s%s%s%s%s%s%s", "plots/", UC, "-", BNCH, "-", DATA_SCALE, "-cmidt", ".png")
#"test.png"

#LC_CPU_A = "#60F71405"
LC_CPU_W0 = "#601705f7"
LC_CPU_W1 = "#601705f7"
LC_CPU_W2 = "#601705f7"

#60C303DD
LC_RAM_W0 = "#6000FA00"
LC_RAM_W1 = "#6000FA00"
LC_RAM_W2 = "#6000FA00"

#LC_IO = "#60E67E22"
LC_IO_W0_R = "#60FF0000"
LC_IO_W0_W = "#60FF0000"

LC_IO_W1_R = "#60FF0000"
LC_IO_W1_W = "#60FF0000"

LC_IO_W2_R = "#60FF0000"
LC_IO_W2_W = "#60FF0000"

set grid
#set rmargin 10
set key rmargin vertical font "Times New Roman, 12" 
#box
set xdata time
set timefmt "%H:%M:%S"
set yrange [0:100]
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


#if (BNCH eq "dfsioer") \
#    BNCH = "dfsioe"; 
#if (BNCH eq "dfsioew") \
#    BNCH = "dfsioe";

# Put GCP Dataproc system utilization into plot

GCP_W0_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# GCP_W0_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# GCP_W0_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# GCP_W0_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# GCP_W0_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c3", ".dat")
GCP_W1_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# GCP_W1_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# GCP_W1_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# GCP_W1_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# GCP_W1_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c3", ".dat")
GCP_W2_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# GCP_W2_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# GCP_W2_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# GCP_W2_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# GCP_W2_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c3", ".dat")

GCP_W0_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-r", ".dat")
GCP_W1_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-r", ".dat")
GCP_W2_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-r", ".dat")

GCP_W0_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-i", ".dat")
GCP_W1_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-i", ".dat")
GCP_W2_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-i", ".dat")

set title "Google Dataproc" font "Times New Roman, 14"
plot GCP_W0_CPU_ALL u 1:4 w l lc rgb LC_CPU_W0 t "w0-cpu%" axes x1y1, \
	GCP_W1_CPU_ALL u 1:4 w l lc rgb LC_CPU_W1 t "w1-cpu%" axes x1y1, \
	GCP_W2_CPU_ALL u 1:4 w l lc rgb LC_CPU_W2 t "w2-cpu%" axes x1y1, \
	GCP_W0_RAM u 1:5 w l lc rgb LC_RAM_W0 t "w0-mem%" axes x1y1, \
	GCP_W1_RAM u 1:5 w l lc rgb LC_RAM_W1 t "w1-mem%" axes x1y1, \
	GCP_W2_RAM u 1:5 w l lc rgb LC_RAM_W2 t "w2-mem%" axes x1y1, \
    GCP_W0_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W0_R t "w0-io-r" axes x1y2, \
	GCP_W0_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W0_W t "w0-io-w" axes x1y2,\
    GCP_W1_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W1_R t "w1-io-r" axes x1y2, \
	GCP_W1_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W1_W t "w1-io-w" axes x1y2,\
    GCP_W2_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W2_R t "w2-io-r" axes x1y2, \
	GCP_W2_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W2_W t "w2-io-w" axes x1y2


# Put Azure HDInsight system utilization into plot

AZU_W0_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# AZU_W0_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# AZU_W0_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# AZU_W0_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# AZU_W0_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c3", ".dat")
AZU_W1_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# AZU_W1_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# AZU_W1_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# AZU_W1_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# AZU_W1_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c3", ".dat")
AZU_W2_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# AZU_W2_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# AZU_W2_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# AZU_W2_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# AZU_W2_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c3", ".dat")

AZU_W0_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-r", ".dat")
AZU_W1_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-r", ".dat")
AZU_W2_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-r", ".dat")

AZU_W0_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w0/", GCP, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-i", ".dat")
AZU_W1_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w1/", GCP, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-i", ".dat")
AZU_W2_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", GCP, "/", DATA_SCALE, "/sysstat/data-w2/", GCP, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-i", ".dat")


set title "Azure HDInsight" font "Times New Roman, 14"

plot AZU_W0_CPU_ALL u 1:4 w l lc rgb LC_CPU_W0 t "w0-cpu%" axes x1y1, \
	AZU_W1_CPU_ALL u 1:4 w l lc rgb LC_CPU_W1 t "w1-cpu%" axes x1y1, \
	AZU_W2_CPU_ALL u 1:4 w l lc rgb LC_CPU_W2 t "w2-cpu%" axes x1y1, \
	AZU_W0_RAM u 1:5 w l lc rgb LC_RAM_W0 t "w0-mem%" axes x1y1, \
	AZU_W1_RAM u 1:5 w l lc rgb LC_RAM_W1 t "w1-mem%" axes x1y1, \
	AZU_W2_RAM u 1:5 w l lc rgb LC_RAM_W2 t "w2-mem%" axes x1y1, \
    AZU_W0_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W0_R t "w0-io-r" axes x1y2, \
	AZU_W0_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W0_W t "w0-io-w" axes x1y2,\
    AZU_W1_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W1_R t "w1-io-r" axes x1y2, \
	AZU_W1_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W1_W t "w1-io-w" axes x1y2,\
    AZU_W2_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W2_R t "w2-io-r" axes x1y2, \
	AZU_W2_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W2_W t "w2-io-w" axes x1y2


# Put Alibaba Cloud e-MapReduce system utilization into plot

ALI_W0_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# ALI_W0_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# ALI_W0_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# ALI_W0_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# ALI_W0_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-c3", ".dat")
ALI_W1_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# ALI_W1_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# ALI_W1_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# ALI_W1_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# ALI_W1_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-c3", ".dat")
ALI_W2_CPU_ALL = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-ca", ".dat")
# ALI_W2_CPU_0 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c0", ".dat")
# ALI_W2_CPU_1 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c1", ".dat")
# ALI_W2_CPU_2 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c2", ".dat")
# ALI_W2_CPU_3 = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-c3", ".dat")

ALI_W0_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-r", ".dat")
ALI_W1_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-r", ".dat")
ALI_W2_RAM = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-r", ".dat")
    
ALI_W0_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w0/", ALI, "-", UC, "-w0-", DATA_SCALE, "-", BNCH, "-i", ".dat")
ALI_W1_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w1/", ALI, "-", UC, "-w1-", DATA_SCALE, "-", BNCH, "-i", ".dat")
ALI_W2_IO = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", "../", UC, "/", ALI, "/", DATA_SCALE, "/sysstat/data-w2/", ALI, "-", UC, "-w2-", DATA_SCALE, "-", BNCH, "-i", ".dat")


set title "Alibaba Cloud e-MapReduce" font "Times New Roman, 14"

plot ALI_W0_CPU_ALL u 1:3 w l lc rgb LC_CPU_W0 t "w0-cpu%" axes x1y1, \
	ALI_W1_CPU_ALL u 1:3 w l lc rgb LC_CPU_W1 t "w1-cpu%" axes x1y1, \
	ALI_W2_CPU_ALL u 1:3 w l lc rgb LC_CPU_W2 t "w2-cpu%" axes x1y1, \
	ALI_W0_RAM u 1:4 w l lc rgb LC_RAM_W0 t "w0-mem%" axes x1y1, \
	ALI_W1_RAM u 1:4 w l lc rgb LC_RAM_W1 t "w1-mem%" axes x1y1, \
	ALI_W2_RAM u 1:4 w l lc rgb LC_RAM_W2 t "w2-mem%" axes x1y1, \
    ALI_W0_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W0_R t "io-rtps" axes x1y2, \
	ALI_W0_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W0_W t "io-wtps" axes x1y2,\
    ALI_W1_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W1_R t "w1-io-r" axes x1y2, \
	ALI_W1_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W1_W t "w1-io-w" axes x1y2,\
    ALI_W2_IO u 1:3 w impulses lw 1 lc rgb LC_IO_W2_R t "w2-io-r" axes x1y2, \
	ALI_W2_IO u 1:4 w impulses lw 1 lc rgb LC_IO_W2_W t "w2-io-w" axes x1y2


# PUT DURATION & THROUGHPUT COMPARISON FOR CSPs INTO PLOT

set title "Duration - Throughput" font "Times New Roman, 14"

set style data histograms
set style fill solid
set style histogram cluster gap 1

set xlabel "GCPs"
set ylabel "Duration (sec)" offset 2, 0, 0
set y2label "Throughput (bytes)" offset -3, 0, 0
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
plot HIBENCH_REPORT using 5:xtic(1) lc rgb "#E67E22" title 'Duration' axes x1y1, \
	HIBENCH_REPORT using 6:xtic(1) lc rgb "#086d01" t "Throughput" axes x1y2
#
unset multiplot
#
