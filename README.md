# COMPARATIVE PERFORMANCE EVALUATION OF HADOOP ON PAAS PROPOSALS BY LEVERAGING HIBENCH

We are benchmarking managed Hadoop services of three Cloud Service Providers, namely GCP Dataproc, Azure HDInsight, and Alibaba Cloud e-MapReduce. This repository documenting the steps taken in our study. 

## ROADMAP

Instead of diving directly into Hadoop on PaaS benchmarking, we set up first a virtual environment to install Hadoop manually and execute HiBench on it. The reason for this approach is to understand HiBench's functioning and face eventual issues before they appear during the benchmark on the cloud, which could dramatically rise costs on the cloud.

Structure:  

**1. warmup-sessions:** comprises documentation of the preparational work before conducting the benchmarks on the cloud. 

**2. Setting up the clusters and HiBench:** Contains a file documenting the implementation processes of starting Hadoop-on PaaS services on Google Cloud Platform, Microsoft Azure, and Alibaba Cloud; it also comtains the instructions to compile and run HiBench on the respective clusters.  

**3. benchmark-outputs:** contains HiBench benchmark reports in uc1 and uc2

In warmup-sessions the followings has been done in virtual environment:
1. Installing a single-node Hadoop in a virtual environment (ubuntu18.04 on VirtualBox)
2. Building and running HiBench

We constructed the study in two use cases which are executed on all three managed Hadoop services (GCP Dataproc, Azure HDInsight, and Alibaba Cloud e-MapReduce) 

**USE CASE 1**  
The following benchmarks are applied for HiBench's default data scales Huge and Gigantic:  
Micro - _Sort, Terasort, Wordcount, Dfsioe_  
SQL - _Scan, Join, Aggregation_  
ML - _Bayes, Kmeans_  
Websearch - _Pagerank_   
  
**USE CASE 2**    
CPU bound _Sort_ and IO bound _Wordcount_ benchmarks have been executed for data scales tiny, small, large, huge, and gigantic. 
  
Results of the benchmarks are located within `benchmark-outputs` folder. `HiBench` stores outputted reports and selected configurations for each executed benchmark. The folder `sysstat` contains raw data files of captured system resource utilization data during benchmark execution.  

