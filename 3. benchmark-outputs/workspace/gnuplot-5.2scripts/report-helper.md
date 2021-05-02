hibench.report files comprise input data size, duration, and throughput outcomes of executed benchmarks. A "raw" report file includes only outputs for specific CSP.

However, in order to compare them visually in our study, we need duration and throughput data of each CSP in one file.

This script helps extracting relevant lines of the three CSPs into one file, so gnuplot can leverage them for plotting

# The following directories 

USE CASE 1 - hibench.report directories
included data scales: huge - gigantic
executed benchmarks: Sort, Terasort, Wordcount, Dfsioe, Scan, Join, Aggregation, Bayes, Kmeans, Pagerank

GCP  
../uc1/gcp/gigantic/HiBench/root/HiBench/report/hibench.report
../uc1/gcp/huge/HiBench/root/HiBench/report/hibench.report

Azure  
../uc1/azu/gigantic/HiBench/root/HiBench/report/hibench.report
../uc1/azu/huge/HiBench/root/HiBench/report/hibench.report

Alibaba Cloud  
../uc1/ali/gigantic/HiBench/root/HiBench/report/hibench.report
../uc1/ali/huge/HiBench/root/HiBench/report/hibench.report

USE CASE 2 - hibench.report directories
included data scales: tiny - small - large - huge - gigantic
executed benchmarks: Sort, Wordcount

GCP  
../uc2/gcp/tiny/HiBench/root/HiBench/report/hibench.report
../uc2/gcp/small/HiBench/root/HiBench/report/hibench.report
../uc2/gcp/large/HiBench/root/HiBench/report/hibench.report
../uc2/gcp/huge/HiBench/root/HiBench/report/hibench.report
../uc2/gcp/gigantic/HiBench/root/HiBench/report/hibench.report

AZURE  
../uc2/azu/tiny/HiBench/root/HiBench/report/hibench.report
../uc2/azu/small/HiBench/root/HiBench/report/hibench.report
../uc2/azu/large/HiBench/root/HiBench/report/hibench.report
../uc2/azu/huge/HiBench/root/HiBench/report/hibench.report
../uc2/azu/gigantic/HiBench/root/HiBench/report/hibench.report

ALIBABA CLOUD  
../uc2/ali/tiny/HiBench/root/HiBench/report/hibench.report
../uc2/ali/small/HiBench/root/HiBench/report/hibench.report
../uc2/ali/large/HiBench/root/HiBench/report/hibench.report
../uc2/ali/huge/HiBench/root/HiBench/report/hibench.report
../uc2/ali/gigantic/HiBench/root/HiBench/report/hibench.report



Given that HiBench report files are stored as above the following script accesses them and saves them in one file. The naming convention for processed report files is like below:

<use_case>-<data_scale>-<benchmark>.report
example:
uc1-g-wrdcnt.report



```bash
#################### Collect original CSP HiBench reports and save within naming convention
########## USE CASE 1: 
##### HUGE
cp ../../uc1/gcp/h/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc1-h-gcp.report && cp ../../uc1/azu/h/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc1-h-azu.report && cp ../../uc1/ali/h/HiBench/root/HiBench/report/hibench.report reports/uc1-h-ali.report
##### GIGANTIC
cp ../../uc1/gcp/g/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc1-g-gcp.report && cp ../../uc1/azu/g/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc1-g-azu.report && cp ../../uc1/ali/g/HiBench/root/HiBench/report/hibench.report reports/uc1-g-ali.report
########## USE CASE 2:
##### TINY
cp ../../uc2/gcp/t/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc2-t-gcp.report && cp ../../uc2/azu/t/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc2-t-azu.report && cp ../../uc2/ali/t/HiBench/root/HiBench/report/hibench.report reports/uc2-t-ali.report
##### SMALL
cp ../../uc2/gcp/s/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc2-s-gcp.report && cp ../../uc2/azu/s/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc2-s-azu.report && cp ../../uc2/ali/s/HiBench/root/HiBench/report/hibench.report reports/uc2-s-ali.report
##### LARGE
cp ../../uc2/gcp/l/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc2-l-gcp.report && cp ../../uc2/azu/l/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc2-l-azu.report && cp ../../uc2/ali/l/HiBench/root/HiBench/report/hibench.report reports/uc2-l-ali.report
##### HUGE
cp ../../uc2/gcp/h/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc2-h-gcp.report && cp ../../uc2/azu/h/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc2-h-azu.report && cp ../../uc2/ali/h/HiBench/root/HiBench/report/hibench.report reports/uc2-h-ali.report
##### GIGANTIC
cp ../../uc2/gcp/g/HiBench/home/ulueremre/HiBench/report/hibench.report reports/uc2-g-gcp.report && cp ../../uc2/azu/g/HiBench/home/sshuser/HiBench/report/hibench.report reports/uc2-g-azu.report && cp ../../uc2/ali/g/HiBench/root/HiBench/report/hibench.report reports/uc2-g-ali.report



#################### Granulate HiBench CSP reports by Use Case and Benchmark
########## USE CASE 1:
##### HUGE #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-wrdcnt.dat
## TERASORT
sed -n 's/HadoopTerasort/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-tera.dat && sed -n 's/HadoopTerasort/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-tera.dat && sed -n 's/HadoopTerasort/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-tera.dat
## DFSIOE-R
sed -n 's/HadoopDfsioe-read/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-dfsioer.dat && sed -n 's/HadoopDfsioe-read/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-dfsioer.dat && sed -n 's/HadoopDfsioe-read/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-dfsioer.dat
## DFSIOE-W
sed -n 's/HadoopDfsioe-write/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-dfsioew.dat && sed -n 's/HadoopDfsioe-write/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-dfsioew.dat && sed -n 's/HadoopDfsioe-write/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-dfsioew.dat
## SCAN
sed -n 's/HadoopScan/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-scan.dat && sed -n 's/HadoopScan/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-scan.dat && sed -n 's/HadoopScan/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-scan.dat
## JOIN
sed -n 's/HadoopJoin/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-join.dat && sed -n 's/HadoopJoin/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-join.dat && sed -n 's/HadoopJoin/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-join.dat
## AGGREGATION
sed -n 's/HadoopAggregation/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-aggreg.dat && sed -n 's/HadoopAggregation/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-aggreg.dat && sed -n 's/HadoopAggregation/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-aggreg.dat
## BAYES
sed -n 's/HadoopBayes/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-bayes.dat && sed -n 's/HadoopBayes/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-bayes.dat && sed -n 's/HadoopBayes/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-bayes.dat
## KMEANS
sed -n 's/HadoopKmeans/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-kmeans.dat && sed -n 's/HadoopKmeans/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-kmeans.dat && sed -n 's/HadoopKmeans/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-kmeans.dat
## PAGERANK
sed -n 's/HadoopPagerank/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc1-h-page.dat && sed -n 's/HadoopPagerank/Azure/p' reports/uc1-h-azu.report >> reports/processed/uc1-h-page.dat && sed -n 's/HadoopPagerank/Alibaba/p' reports/uc1-h-ali.report >> reports/processed/uc1-h-page.dat
##### GIGANTIC #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-wrdcnt.dat
## TERASORT
sed -n 's/HadoopTerasort/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-tera.dat && sed -n 's/HadoopTerasort/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-tera.dat && sed -n 's/HadoopTerasort/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-tera.dat
## DFSIOE-R
sed -n 's/HadoopDfsioe-read/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-dfsioer.dat && sed -n 's/HadoopDfsioe-read/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-dfsioer.dat && sed -n 's/HadoopDfsioe-read/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-dfsioer.dat
## DFSIOE-W
sed -n 's/HadoopDfsioe-write/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-dfsioew.dat && sed -n 's/HadoopDfsioe-write/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-dfsioew.dat && sed -n 's/HadoopDfsioe-write/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-dfsioew.dat
## SCAN
sed -n 's/HadoopScan/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-scan.dat && sed -n 's/HadoopScan/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-scan.dat && sed -n 's/HadoopScan/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-scan.dat
## JOIN
sed -n 's/HadoopJoin/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-join.dat && sed -n 's/HadoopJoin/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-join.dat && sed -n 's/HadoopJoin/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-join.dat
## AGGREGATION
sed -n 's/HadoopAggregation/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-aggreg.dat && sed -n 's/HadoopAggregation/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-aggreg.dat && sed -n 's/HadoopAggregation/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-aggreg.dat
## BAYES
sed -n 's/HadoopBayes/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-bayes.dat && sed -n 's/HadoopBayes/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-bayes.dat && sed -n 's/HadoopBayes/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-bayes.dat
## KMEANS
sed -n 's/HadoopKmeans/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-kmeans.dat && sed -n 's/HadoopKmeans/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-kmeans.dat && sed -n 's/HadoopKmeans/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-kmeans.dat
## PAGERANK
sed -n 's/HadoopPagerank/GCP/p' reports/uc1-g-gcp.report >> reports/processed/uc1-g-page.dat && sed -n 's/HadoopPagerank/Azure/p' reports/uc1-g-azu.report >> reports/processed/uc1-g-page.dat && sed -n 's/HadoopPagerank/Alibaba/p' reports/uc1-g-ali.report >> reports/processed/uc1-g-page.dat




########## USE CASE 2:
##### TINY #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc2-t-gcp.report >> reports/processed/uc2-t-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc2-t-azu.report >> reports/processed/uc2-t-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc2-t-ali.report >> reports/processed/uc2-t-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc2-t-gcp.report >> reports/processed/uc2-t-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc2-t-azu.report >> reports/processed/uc2-t-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc2-t-ali.report >> reports/processed/uc2-t-wrdcnt.dat
##### SMALL #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc2-s-gcp.report >> reports/processed/uc2-s-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc2-s-azu.report >> reports/processed/uc2-s-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc2-s-ali.report >> reports/processed/uc2-s-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc2-s-gcp.report >> reports/processed/uc2-s-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc2-s-azu.report >> reports/processed/uc2-s-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc2-s-ali.report >> reports/processed/uc2-s-wrdcnt.dat
##### LARGE #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc2-l-gcp.report >> reports/processed/uc2-l-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc2-l-azu.report >> reports/processed/uc2-l-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc2-l-ali.report >> reports/processed/uc2-l-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc2-l-gcp.report >> reports/processed/uc2-l-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc2-l-azu.report >> reports/processed/uc2-l-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc2-l-ali.report >> reports/processed/uc2-l-wrdcnt.dat
##### HUGE #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc1-h-gcp.report >> reports/processed/uc2-h-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc2-h-azu.report >> reports/processed/uc2-h-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc2-h-ali.report >> reports/processed/uc2-h-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc2-h-gcp.report >> reports/processed/uc2-h-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc2-h-azu.report >> reports/processed/uc2-h-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc2-h-ali.report >> reports/processed/uc2-h-wrdcnt.dat
##### GIGANTIC #####
## SORT
sed -n 's/HadoopSort/GCP/p' reports/uc2-g-gcp.report >> reports/processed/uc2-g-srt.dat && sed -n 's/HadoopSort/Azure/p' reports/uc2-g-azu.report >> reports/processed/uc2-g-srt.dat && sed -n 's/HadoopSort/Alibaba/p' reports/uc2-g-ali.report >> reports/processed/uc2-g-srt.dat
## WORDCOUNT
sed -n 's/HadoopWordcount/GCP/p' reports/uc2-g-gcp.report >> reports/processed/uc2-g-wrdcnt.dat && sed -n 's/HadoopWordcount/Azure/p' reports/uc2-g-azu.report >> reports/processed/uc2-g-wrdcnt.dat && sed -n 's/HadoopWordcount/Alibaba/p' reports/uc2-g-ali.report >> reports/processed/uc2-g-wrdcnt.dat







# PLOTTING SOURCE ACTIVITIES 

########## USE CASE 1:
##### HUGE #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC1 - Sort (Huge; 3.2 GB)" uc1 srt h
## TERASORT
gnuplot -c cmidt-plot.gp "Results: UC1 - Terasort (Huge; 320 MB)" uc1 tera h 
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC1 - Wordcount (Huge; 32 GB)" uc1 wrdcnt h 
## DFSIOE-R
gnuplot -c cmidt-plot.gp "Results: UC1 - Dfsioe-read (Huge; No of Files: 256, File size: 100 MB)" uc1 dfsioer h 
## DFSIOE-W
gnuplot -c cmidt-plot.gp "Results: UC1 - Dfsioe-write (Huge; No of Files: 256, File size: 100 MB)" uc1 dfsioew h 
## SCAN
gnuplot -c cmidt-plot.gp "Results: UC1 - Scan (Huge; USERVISITS: 10,000,000 PAGES: 1,200,000)" uc1 scan h 
## JOIN
gnuplot -c cmidt-plot.gp "Results: UC1 - Join (Huge; USERVISITS: 10,000,000 PAGES: 1,200,000)" uc1 join h 
## AGGREGATION
gnuplot -c cmidt-plot.gp "Results: UC1 - Aggregation (Huge; USERVISITS: 10,000,000 PAGES: 1,200,000)" uc1 aggreg h 
## BAYES
gnuplot -c cmidt-plot.gp "Results: UC1 - Bayes (Huge; PAGES: 500,000 CLASSES: 100 NGRAMS: 2)" uc1 bayes h 
## KMEANS
gnuplot -c cmidt-plot.gp "Results: UC1 - Kmeans (Huge; CLUSTERS: 5 DIMENSIONS: 20 SAMPLES: 100,000,000 SAMP PER INPUT: 20,000,000 MAX IT: 5 K: 10 CONVERGEDIST: 0.5)" uc1 kmeans h 
## PAGERANK
gnuplot -c cmidt-plot.gp "Results: UC1 - Pagerank (Huge; PAGES: 5,000,000 NUM ITERATIONS: 3 BLOCK: 0 BLOCK WIDTH: 16)" uc1 page h 
##### GIGANTIC #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC1 - Sort (Gigantic; 32 GB)" uc1 srt g
## TERASORT
gnuplot -c cmidt-plot.gp "Results: UC1 - Terasort (Gigantic; 3.2 GB)" uc1 tera g
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC1 - Wordcount (Gigantic; 320 GB)" uc1 wrdcnt g
## DFSIOE-R
gnuplot -c cmidt-plot.gp "Results: UC1 - Dfsioe-read (Gigantic; No of Files: 512, File size: 400 MB)" uc1 dfsioer g
## DFSIOE-W
gnuplot -c cmidt-plot.gp "Results: UC1 - Dfsioe-write (Gigantic; No of Files: 512, File size: 400 MB)" uc1 dfsioew g
## SCAN
gnuplot -c cmidt-plot.gp "Results: UC1 - Scan (Gigantic; USERVISITS: 100,000,000 PAGES: 12,000,000)" uc1 scan g
## JOIN
gnuplot -c cmidt-plot.gp "Results: UC1 - Join (Gigantic; USERVISITS: 100,000,000 PAGES: 12,000,000)" uc1 join g
## AGGREGATION
gnuplot -c cmidt-plot.gp "Results: UC1 - Aggregation (Gigantic; USERVISITS: 100,000,000 PAGES: 12,000,000)" uc1 aggreg g
## BAYES
gnuplot -c cmidt-plot.gp "Results: UC1 - Bayes (Gigantic; PAGES: 1,000,000 CLASSES: 100 NGRAMS: 2)" uc1 bayes g
## KMEANS
gnuplot -c cmidt-plot.gp "Results: UC1 - Kmeans (Gigantic; CLUSTERS: 5 DIMENSIONS: 20 SAMPLES: 200,000,000 SAMP PER INPUT: 40,000,000 MAX IT: 5 K: 10 CONVERGEDIST: 0.5)" uc1 kmeans g
## PAGERANK
gnuplot -c cmidt-plot.gp "Results: UC1 - Pagerank (Gigantic; PAGES: 30,000,000 NUM ITERATIONS: 3 BLOCK: 0 BLOCK WIDTH: 16)" uc1 page g

########## USE CASE 2:
##### TINY #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC2 - Sort (Tiny; 32 KB)" uc2 srt t
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC2 - Wordcount (Tiny; 32 KB)" uc2 wrdcnt t
##### SMALL #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC2 - Sort (Small; 3.2 MB)" uc2 srt s
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC2 - Wordcount (Small; 320 MB)" uc2 wrdcnt s
##### LARGE #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC2 - Sort (Large; 320 MB)" uc2 srt l
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC2 - Wordcount (Large; 3.2 GB)" uc2 wrdcnt l
##### HUGE #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC2 - Sort (Huge; 3.2 GB)" uc2 srt h
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC2 - Wordcount (Huge; 32 GB)" uc2 wrdcnt h
##### GIGANTIC #####
## SORT
gnuplot -c cmidt-plot.gp "Results: UC2 - Sort (Gigantic; 32 GB)" uc2 srt g
## WORDCOUNT
gnuplot -c cmidt-plot.gp "Results: UC2 - Wordcount (Gigantic; 320 GB)" uc2 wrdcnt g
```