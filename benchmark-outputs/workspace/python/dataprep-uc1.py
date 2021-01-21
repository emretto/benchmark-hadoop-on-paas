#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan  5 00:15:35 2021

What this script does

1. Normalizes CPU, Memory, IO-read and IO-write
2. Computes average CPU, Mem, and IO for each worker node, Mem, and IO using respective outputs in step 1
3. Compute average for Cluster scale CPU, Mem, and IO
4. Normalize HiBench's Duration and Troughput values
5. Save all normalized values in a file for further use in gnuplot-5.4

@author: ulueremre
"""

import pandas as pd
from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler()

CSPs = ['gcp', 'azu', 'ali']
csp_names = ['GCP', 'Azure', 'Alibaba']
data_scales = ['h', 'g']
benchmarks = ['srt', 'tera', 'wrdcnt', 'dfsioer', 'dfsioew', 'scan', 'join', 'aggreg', 'bayes', 'kmeans', 'page']

for data_scale in data_scales:
    for benchmark in benchmarks:
        for (csp, long_csp) in zip(CSPs, csp_names):
            # Exclude Azure Terasort in Gigantic scale since it failed to run on HiBench
            if(data_scale == "g" and csp == 'azu' and benchmark == "tera"):
                pass
            
            else:
                csp_cpu_avg = 0.0
                csp_mem_avg = 0.0
                csp_ior_avg = 0.0
                csp_iow_avg = 0.0

                for worker in range(0, 3):
                    # CPU
                    df_cpu = pd.read_csv('../../uc1/'+csp+'/'+data_scale+'/sysstat/data-w' + str(worker) + '/'+csp+'-uc1-w' + str(worker) + '-'+data_scale+'-'+benchmark+'-c0.dat', decimal=",", delim_whitespace=True, header=None)
                    df_cpu = pd.DataFrame(df_cpu)
                    df_cpu.columns = ['time', 'cpu', '(%)user', '(%)nice', '(%)system', '(%)iowait', '(%)steal', '(%)idle']
                    if (csp == 'gcp'):
                        x_cpu = df_cpu[['(%)nice']].values.astype(float)
                    else:
                        x_cpu = df_cpu[['(%)user']].values.astype(float)
                    x_cpu_scaled = scaler.fit_transform(x_cpu)
                    df_cpu_normalized = pd.DataFrame(x_cpu_scaled)

                    # Memory
                    df_mem = pd.read_csv('../../uc1/'+csp+'/'+data_scale+'/sysstat/data-w' + str(worker) + '/'+csp+'-uc1-w' + str(worker) + '-'+data_scale+'-'+benchmark+'-r.dat', decimal=",", delim_whitespace=True, header=None)
                    df_mem = pd.DataFrame(df_mem)
                    if (csp == 'gcp'):
                        df_mem.columns = ['time', 'kbmemfree', 'kbavail', 'kbmemused', '(%)memused', 'kbbuffers', 'kbcached', 'kbcommit', '(%)commit', 'kbactive', 'kbinact', 'kbdirty']
                    else:
                        df_mem.columns = ['time', 'kbmemfree', 'kbmemused', '(%)memused', 'kbbuffers', 'kbcached', 'kbcommit', '(%)commit', 'kbactive', 'kbinact', 'kbdirty'] 
                    x_mem = df_mem[['(%)memused']].values.astype(float)
                    x_mem_scaled = scaler.fit_transform(x_mem)
                    df_mem_normalized = pd.DataFrame(x_mem_scaled)

                    # IO
                    df_io = pd.read_csv('../../uc1/'+csp+'/'+data_scale+'/sysstat/data-w' + str(worker) + '/'+csp+'-uc1-w' + str(worker) + '-'+data_scale+'-'+benchmark+'-i.dat', decimal=",", delim_whitespace=True, header=None)
                    df_io = pd.DataFrame(df_io)
                    df_io.columns = ['time', 'tps', 'rtps', 'wtps', 'bread/s', 'bwrtn/s']
                    #x_ioread = df_io[['rtps']].values.astype(float)
                    x_ioread = df_io[['bread/s']].values.astype(float)
                    x_ioread_scaled = scaler.fit_transform(x_ioread)
                    df_ioread_normalized = pd.DataFrame(x_ioread_scaled)
                    #x_iowrite = df_io[['wtps']].values.astype(float)
                    x_iowrite = df_io[['bwrtn/s']].values.astype(float)
                    x_iowrite_scaled = scaler.fit_transform(x_iowrite)
                    df_iowrite_normalized = pd.DataFrame(x_iowrite_scaled)

                    # Calculate normalized averages
                    csp_cpu_avg += df_cpu_normalized.mean()
                    csp_mem_avg += df_mem_normalized.mean()
                    csp_ior_avg += df_ioread_normalized.mean()
                    csp_iow_avg += df_iowrite_normalized.mean()

                    #print('CSP: '+csp+', WORKER ' + str(worker + 1) + ' normalized CPU average:' + str(df_cpu_normalized.mean()))
                    #print('CSP: '+csp+', WORKER ' + str(worker + 1) + ' normalized MEM average:' + str(df_mem_normalized.mean())
                
                # Calculate cluster average
                csp_cpu_avg = csp_cpu_avg / 3
                csp_mem_avg = csp_mem_avg / 3
                csp_ior_avg = csp_ior_avg / 3
                csp_iow_avg = csp_iow_avg / 3
                # print(csp + ', '+data_scale+', '+benchmark+', avg CPU: ', csp_cpu_avg.values[0])
                # print(csp + ', '+data_scale+', '+benchmark+', avg Mem: ', csp_mem_avg.values[0])
                # print(csp + ', '+data_scale+', '+benchmark+', avg IO-read: ', csp_ior_avg.values[0])
                # print(csp + ', '+data_scale+', '+benchmark+', avg IO-write: ', csp_iow_avg.values[0])

                # print(csp_ior_avg)
                # print(csp_iow_avg)


                # HiBench data processing
                df_hibench = pd.read_csv('../gnuplot-5.2scripts/reports/processed/uc1-'+data_scale+'-'+benchmark+'.dat', decimal=".", delim_whitespace=True, header=None)
                df_hibench = pd.DataFrame(df_hibench)
                df_hibench.columns = ['csp', 'date', 'time', 'ids', 'dur', 'thrb', 'thrn']
                # normalize and reverse Duration
                x = df_hibench[['dur']].values.astype(float)
                x_scaled = scaler.fit_transform(x)
                df_normalized = pd.DataFrame(x_scaled)
                df_normalized = abs(round(df_normalized.sub(1.0), 2))
                df_hibench['dur'] = df_normalized
                # Normalize Throughput/bytes
                x = df_hibench[['thrb']].values.astype(float)
                x_scaled = scaler.fit_transform(x)
                df_normalized = pd.DataFrame(x_scaled)
                df_hibench['thrb'] = df_normalized


                # Save processed data as tsv

                df_spider_data = pd.DataFrame(columns=['cpu', 'mem', 'ior', 'iow', 'dur', 'thrb'])
                df_spider_data = df_spider_data.append({
                    'cpu': csp_cpu_avg.values[0], 
                    'mem': csp_mem_avg.values[0], 
                    'ior': csp_ior_avg.values[0], 
                    'iow': csp_iow_avg.values[0], 
                    'dur': df_hibench.loc[df_hibench['csp'] == long_csp, 'dur'].values[0],  
                    'thrb': df_hibench.loc[df_hibench['csp'] == long_csp, 'thrb'].values[0] 
                }, ignore_index=True)
                #print(df_spider_data.head(5))
                df_spider_data.to_csv(
                    '../gnuplot-5.4scripts/reports/processed/uc1-'+csp+'-'+data_scale+'-'+benchmark+'.tsv',
                    sep = '\t', index = False, header=None)


