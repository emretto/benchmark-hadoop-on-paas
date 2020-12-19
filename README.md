# benchmark-hadoop-on-paas
Benchmarking managed Hadoop services of three Cloud Service Providers, namely GCP Dataproc, Azure HDInsight, and Alibaba Cloud e-MapReduce.  

HiBench 7.1.1  

In Warm-ups the followings has been done:
1. Install of a local VM instance (ubuntu 18.04) 
2. Install OpenJDK 1.8
3. Install Hadoop
4. Install Hive
5. Install Apache Maven
6. Install python2
7. Download and compile HiBench 7.1 for HadoopBench
8. Run all Hadoop related benchmarks
9. List the report

Within 2 use cases benchmarks for different data scales have been executed.  

USE CASE 1  
For data scales Huge and Gigantic these benchmarks have been executed: 
micro - sort  
micro - terasort  
micro - wordcount  
micro - dfsioe  
sql - scan  
sql - join  
sql - aggregation  
ml - bayes  
ml - kmeans  
websearch - pagerank   
  
USE CASE 2    
One CPU bound and one IO bound benchmark have been executed for data scales tiny, small, large, huge, and gigantic these benchmarks have been executed. Reasoning for this use case lies in observing performance bahvaior changes of three different CSPs@ managed Hadoop services.  
  
micro - sort (IO bound)  
micro - wordcount (CPU bound)  
  
Results of the benchmarks are located within "Benchmark Outputs" folder. "HiBench" stores outputted reports and selected configurations for each executed benchmark. The folder sysstat contains raw data files of captured system resource utilization data during benchmark execution.  

