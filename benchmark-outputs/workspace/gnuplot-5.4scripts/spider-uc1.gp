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


DATA_SCALE = "g"

GCP_SRT = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-srt.tsv") 
AZU_SRT = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-srt.tsv")
ALI_SRT = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-srt.tsv")

GCP_TERA = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-tera.tsv") 
AZU_TERA = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-tera.tsv")
ALI_TERA = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-tera.tsv")

GCP_WRDCNT = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-wrdcnt.tsv") 
AZU_WRDCNT = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-wrdcnt.tsv")
ALI_WRDCNT = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-wrdcnt.tsv")

GCP_DFSIOER = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-dfsioer.tsv") 
AZU_DFSIOER = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-dfsioer.tsv")
ALI_DFSIOER = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-dfsioer.tsv")

GCP_DFSIOEW = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-dfsioew.tsv") 
AZU_DFSIOEW = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-dfsioew.tsv")
ALI_DFSIOEW = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-dfsioew.tsv")

GCP_SCAN = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-scan.tsv") 
AZU_SCAN = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-scan.tsv")
ALI_SCAN = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-scan.tsv")

GCP_JOIN = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-join.tsv") 
AZU_JOIN = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-join.tsv")
ALI_JOIN = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-join.tsv")

GCP_AGGREG = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-aggreg.tsv") 
AZU_AGGREG = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-aggreg.tsv")
ALI_AGGREG = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-aggreg.tsv")

GCP_BAYES = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-bayes.tsv") 
AZU_BAYES = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-bayes.tsv")
ALI_BAYES = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-bayes.tsv")

GCP_KMEANS = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-kmeans.tsv") 
AZU_KMEANS = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-kmeans.tsv")
ALI_KMEANS = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-kmeans.tsv")

GCP_PAGE = sprintf( "%s%s%s", "reports/processed/uc1-gcp-", DATA_SCALE , "-page.tsv") 
AZU_PAGE = sprintf( "%s%s%s", "reports/processed/uc1-azu-", DATA_SCALE , "-page.tsv")
ALI_PAGE = sprintf( "%s%s%s", "reports/processed/uc1-ali-", DATA_SCALE , "-page.tsv")

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

