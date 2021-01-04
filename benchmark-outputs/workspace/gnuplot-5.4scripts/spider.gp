unset border
set grid spider 
    #nopolar
set grid noxtics nomxtics noytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid back   linecolor rgb "grey"  linewidth 0.500 dashtype solid,  linecolor rgb "grey"  linewidth 0.500 dashtype solid
set key fixed right top vertical Right reverse enhanced noautotitle nobox
set spiderplot
set style spiderplot  linewidth 1.000 dashtype solid pointtype 6 pointsize 2.000
set style spiderplot fillstyle  transparent solid 0.20 border
set size ratio 1 1,1
set style data spiderplot
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
# array Array1[6] = [0.15,0.75,0.20,0.43,0.90,0.50]
# array Array2[6] = [0.25,0.25,0.50,0.50,0.75,0.50]
# array Array3[6] = [0.54,0.15,0.30,0.70,0.52,0.40]
## Last datafile plotted: "@@"
# plot      keyentry with spiderplot lc "light-blue" lw 1 title "GCP", \
#      for [i=1:|Array1|] Array1 using (Array1[i]) lc "light-blue" lw 1 , \
#             newspiderplot,      keyentry with spiderplot lc "pink" lw 1 title "Azure", \
#      for [j=1:|Array2|] Array2 using (Array2[j]) lc "pink" lw 1 notitle, \
#             newspiderplot,      keyentry with spiderplot lc "light-green" lw 1 title "Alibaba", \
#      for [j=1:|Array3|] Array3 using (Array3[j]) lc "light-green" lw 1 notitle


GCP_TINY = "c:/Users/UluerEmre/Desktop/uc2-gcp-tiny.dat"
AZU_TINY = "c:/Users/UluerEmre/Desktop/uc2-azu-tiny.dat"
ALI_TINY = "c:/Users/UluerEmre/Desktop/uc2-ali-tiny.dat"
## Last datafile plotted: "@@"
plot      keyentry with spiderplot lc "grey" lw 1 title "GCP", \
      for [i=1:6] GCP_TINY using i lc "grey" lw 1 , \
            newspiderplot,      keyentry with spiderplot lc "violet" lw 1 title "Azure", \
      for [i=1:6] AZU_TINY using i lc "violet" lw 1 notitle, \
            newspiderplot,      keyentry with spiderplot lc "orange" lw 1 title "Alibaba", \
      for [i=1:6] ALI_TINY using i lc "orange" lw 1 notitle


