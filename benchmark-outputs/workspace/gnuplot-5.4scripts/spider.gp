unset border
set grid spider 
    #nopolar
set grid noxtics nomxtics noytics nomytics noztics nomztics nortics nomrtics nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid back linecolor rgb "grey" linewidth 0.500 dashtype solid, linecolor rgb "grey" linewidth 0.500 dashtype solid
set key horizontal
set key bottom left
set spiderplot
set style spiderplot linewidth 1.000 dashtype solid pointtype 6 pointsize 2.000
set style spiderplot fillstyle  transparent solid 0.20 border
set size ratio 1 1,1
set style data spiderplot

#set term png size 1000, 1000
#set output "plots/TEST.png"

set size 0.5, 0.5
set multiplot title "UC2 - Sort" layout 2,3 rowsfirst scale 1.1,0.9


unset xtics
unset ytics
unset ztics
unset cbtics
unset rtics
set paxis 1 tics axis in scale 1,0.5 nomirror norotate  autojustify
set paxis 1 tics  norangelimit autofreq  font ",9"
set paxis 2 tics axis in scale 1,0.5 nomirror norotate  autojustify
set paxis 2 tics  norangelimit autofreq  font ",9"
set paxis 3 tics axis in scale 1,0.5 nomirror norotate  autojustify
set paxis 3 tics  norangelimit autofreq  font ",9"
set paxis 4 tics axis in scale 1,0.5 nomirror norotate  autojustify
set paxis 4 tics  norangelimit autofreq  font ",9"

set paxis 5 tics axis in scale 1,0.5 nomirror norotate  autojustify
set paxis 5 tics  norangelimit autofreq  font ",9"
set paxis 6 tics axis in scale 1,0.5 nomirror norotate  autojustify
set paxis 6 tics  norangelimit autofreq 
unset paxis 7 tics
unset paxis 8 tics
unset paxis 9 tics
unset paxis 10 tics
set title "" 
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ * : * ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
set paxis 1 range [ 0.00000 : 1.000 ]  noextend
set paxis 1 label "CPU" 
set paxis 1 label  font "" textcolor lt -1 norotate
set paxis 2 range [ 0.00000 : 1.000 ]  noextend
set paxis 2 label "MEM" 
set paxis 2 label  font "" textcolor lt -1 norotate
set paxis 3 range [ 0.00000 : 1.000 ]  noextend
set paxis 3 label "IO-R" 
set paxis 3 label  font "" textcolor lt -1 norotate
set paxis 4 range [ 0.00000 : 1.000 ]  noextend
set paxis 4 label "IO-W" 
set paxis 4 label  font "" textcolor lt -1 norotate
set paxis 5 range [ 0.00000 : 1.000 ]  noextend
set paxis 5 label "DUR" 
set paxis 5 label  font "" textcolor lt -1 norotate
set paxis 6 range [ 0.00000 : 1.000 ]  noextend
set paxis 6 label "TPT" 
set paxis 6 label  font "" textcolor lt -1 norotate
set paxis 7 range [ 0.00000 : 100.000 ]  noextend
set paxis 8 range [ 0.00000 : 100.000 ]  noextend
set paxis 9 range [ 0.00000 : 100.000 ]  noextend
set paxis 10 range [ 0.00000 : 100.000 ]  noextend
NO_ANIMATION = 1




GCP_TINY = "reports/processed/uc2-gcp-t-srt.tsv"
AZU_TINY = "reports/processed/uc2-azu-t-srt.tsv"
ALI_TINY = "reports/processed/uc2-ali-t-srt.tsv"

GCP_SMALL = "reports/processed/uc2-gcp-s-srt.tsv"
AZU_SMALL = "reports/processed/uc2-azu-s-srt.tsv"
ALI_SMALL = "reports/processed/uc2-ali-s-srt.tsv"

GCP_LARGE= "reports/processed/uc2-gcp-l-srt.tsv"
AZU_LARGE = "reports/processed/uc2-azu-l-srt.tsv"
ALI_LARGE = "reports/processed/uc2-ali-l-srt.tsv"

GCP_HUGE = "reports/processed/uc2-gcp-h-srt.tsv"
AZU_HUGE = "reports/processed/uc2-azu-h-srt.tsv"
ALI_HUGE = "reports/processed/uc2-ali-h-srt.tsv"

GCP_GIGANTIC = "reports/processed/uc2-gcp-g-srt.tsv"
AZU_GIGANTIC = "reports/processed/uc2-azu-g-srt.tsv"
ALI_GIGANTIC = "reports/processed/uc2-ali-g-srt.tsv"

## Last datafile plotted: "@@"

set title "tiny" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_TINY using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_TINY using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_TINY using i lc "orange" lw 1 notitle


set title "small" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_SMALL using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_SMALL using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_SMALL using i lc "orange" lw 1 notitle


set title "large" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_LARGE using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_LARGE using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_LARGE using i lc "orange" lw 1 notitle


set title "huge" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_HUGE using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_HUGE using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_HUGE using i lc "orange" lw 1 notitle


set title "gigantic" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_GIGANTIC using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_GIGANTIC using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_GIGANTIC using i lc "orange" lw 1 notitle


unset multiplot

