unset border
set grid spider 
    #nopolar
set grid noxtics nomxtics noytics nomytics noztics nomztics nortics nomrtics nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid back linecolor rgb "grey" linewidth 0.500 dashtype solid, linecolor rgb "grey" linewidth 0.500 dashtype solid
set key horizontal
set key out bottom left
set spiderplot
set style spiderplot linewidth 0.500 dashtype solid pointtype 6 pointsize 2.000
set style spiderplot fillstyle  transparent solid 0.30 border
set size ratio 1 1,1
set style data spiderplot

#set term png size 1000, 1000
#set output "plots/TEST.png"

set size 0.5, 0.5
set multiplot title "" layout 2,3 rowsfirst scale 1.1,0.9


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




GCP_SRT = "reports/processed/uc1-gcp-g-srt.tsv"
AZU_SRT = "reports/processed/uc1-azu-g-srt.tsv"
ALI_SRT = "reports/processed/uc1-ali-g-srt.tsv"

GCP_TERA = "reports/processed/uc1-gcp-g-tera.tsv"
AZU_TERA = "reports/processed/uc1-azu-g-tera.tsv"
ALI_TERA = "reports/processed/uc1-ali-g-tera.tsv"

GCP_WRDCNT= "reports/processed/uc1-gcp-g-wrdcnt.tsv"
AZU_WRDCNT = "reports/processed/uc1-azu-g-wrdcnt.tsv"
ALI_WRDCNT = "reports/processed/uc1-ali-g-wrdcnt.tsv"

GCP_DFSIOER = "reports/processed/uc1-gcp-g-dfsioer.tsv"
AZU_DFSIOER = "reports/processed/uc1-azu-g-dfsioer.tsv"
ALI_DFSIOER = "reports/processed/uc1-ali-g-dfsioer.tsv"

GCP_DFSIOEW = "reports/processed/uc1-gcp-g-dfsioew.tsv"
AZU_DFSIOEW = "reports/processed/uc1-azu-g-dfsioew.tsv"
ALI_DFSIOEW = "reports/processed/uc1-ali-g-dfsioew.tsv"

GCP_SCAN = "reports/processed/uc1-gcp-g-scan.tsv"
AZU_SCAN = "reports/processed/uc1-azu-g-scan.tsv"
ALI_SCAN = "reports/processed/uc1-ali-g-scan.tsv"

GCP_JOIN = "reports/processed/uc1-gcp-g-join.tsv"
AZU_JOIN = "reports/processed/uc1-azu-g-join.tsv"
ALI_JOIN = "reports/processed/uc1-ali-g-join.tsv"

GCP_AGGREG = "reports/processed/uc1-gcp-g-aggreg.tsv"
AZU_AGGREG = "reports/processed/uc1-azu-g-aggreg.tsv"
ALI_AGGREG = "reports/processed/uc1-ali-g-aggreg.tsv"

GCP_BAYES = "reports/processed/uc1-gcp-g-bayes.tsv"
AZU_BAYES = "reports/processed/uc1-azu-g-bayes.tsv"
ALI_BAYES = "reports/processed/uc1-ali-g-bayes.tsv"

GCP_KMEANS = "reports/processed/uc1-gcp-g-kmeans.tsv"
AZU_KMEANS = "reports/processed/uc1-azu-g-kmeans.tsv"
ALI_KMEANS = "reports/processed/uc1-ali-g-kmeans.tsv"

GCP_PAGE = "reports/processed/uc1-gcp-g-page.tsv"
AZU_PAGE = "reports/processed/uc1-azu-g-page.tsv"
ALI_PAGE = "reports/processed/uc1-ali-g-page.tsv"

## Last datafile plotted: "@@"

set title "Sort" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_SRT using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_SRT using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_SRT using i lc "orange" lw 1 notitle


set title "Terasort" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_TERA using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_TERA using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_TERA using i lc "orange" lw 1 notitle


set title "Wordcount" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_WRDCNT using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_WRDCNT using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_WRDCNT using i lc "orange" lw 1 notitle


set title "Dfsioe-read" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_DFSIOER using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_DFSIOER using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_DFSIOER using i lc "orange" lw 1 notitle


set title "Dfsioe-write" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_DFSIOEW using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_DFSIOEW using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_DFSIOEW using i lc "orange" lw 1 notitle


set title "Scan" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_SCAN using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_SCAN using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_SCAN using i lc "orange" lw 1 notitle


set title "Join" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_JOIN using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_JOIN using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_JOIN using i lc "orange" lw 1 notitle


set title "Aggregation" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_AGGREG using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_AGGREG using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_AGGREG using i lc "orange" lw 1 notitle


set title "Bayes" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_BAYES using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_BAYES using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_BAYES using i lc "orange" lw 1 notitle


set title "Kmeans" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_KMEANS using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_KMEANS using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_KMEANS using i lc "orange" lw 1 notitle


set title "Pagerank" font "Times New Roman, 18"

plot keyentry with spiderplot lc "purple" lw 1 title "GCP", \
      for [i=1:6] GCP_PAGE using i lc "purple" lw 1 , \
            newspiderplot, keyentry with spiderplot lc "green" lw 1 title "Azure", \
      for [i=1:6] AZU_PAGE using i lc "green" lw 1 notitle, \
            newspiderplot, keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_PAGE using i lc "orange" lw 1 notitle


unset multiplot

