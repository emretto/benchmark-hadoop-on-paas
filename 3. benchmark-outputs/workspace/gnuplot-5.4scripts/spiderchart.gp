set spiderplot
set style spiderplot fs transparent solid 0.2 border 
set for [p=1:5] paxis p range [0:100] 
set for [p=2:5] paxis p tics format "" 
set             paxis 1 tics font ",9" 
set for [p=1:5] paxis p label sprintf("Score %d",p) 
set grid spiderplot 
plot for [i=1:5] $DATA using i:key(1) 
