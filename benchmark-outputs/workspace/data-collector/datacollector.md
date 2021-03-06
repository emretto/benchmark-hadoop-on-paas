Credits for the original codes in this scripts go to Julio Sanz, who created the repository [**_sarviewer_**](https://github.com/juliojsb/sarviewer) for capturing and visualizing sar data. We only took the data collecting part and adapted it to the data collecting needs of the study as shown in the code below.  
  
The script captures general CPU (for up to 8 cores), Memory, and I/O resource utilization as `.txt` files, and extracts granulated parts as `.dat` files, based on visualisation requirements of [**_gnuplot_**](http://gnuplot.sourceforge.net/).
  
The Instructions below are implemented on each worker node and all three are started prior to the benchmark execution. After completed benchmark execution they are terminated manually from the command line.

How to run:
  
Create a file with proper name (like `datacollector.sh`) on the worker node and place the content below in it.
  
```bash
#!/bin/bash
#
# Script        :data_collector.sh
# Author        :Julio Sanz
# Website       :www.elarraydejota.com
# Email         :juliojosesb@gmail.com
# Description   :Script to collect resources data using sar and 
#                put it in data/ folder of this repository.
#                Note this script is intended to collect data 
#                in real time (useful for stress tests) but
#                not to analyse the overall performance of a 
#                machine during a long time frame.
#                If you want to check historic data of the 
#                server, better use system_data_reader.sh 
#                script.
# Dependencies  :sysstat,gnuplot,mutt(optional)
# License       :GPLv3
#

# Initialize in sarviewer folder
cd $(dirname $0)

# ======================
# VARIABLES
# ======================

# Read sarviewer.properties file
#. sarviewer.properties

# ======================
# FUNCTIONS
# ======================

sar_collectors(){
	# CAPTURE CPU UTILIZATION DATA
	sar -P ALL 1 86400 > data/$naming-c.txt && \
		sed -n -e '/ all /p' data/$naming-c.txt > data/$naming-ca.dat && sed -i '/Average/d' data/$naming-ca.dat && \
		sed -n -e '/ 0 /p' data/$naming-c.txt > data/$naming-c0.dat && sed -i '/Average/d' data/$naming-c0.dat && \
		sed -n -e '/ 1 /p' data/$naming-c.txt > data/$naming-c1.dat && sed -i '/Average/d' data/$naming-c1.dat && \
        sed -n -e '/ 2 /p' data/$naming-c.txt > data/$naming-c2.dat && sed -i '/Average/d' data/$naming-c2.dat && \
        sed -n -e '/ 3 /p' data/$naming-c.txt > data/$naming-c3.dat && sed -i '/Average/d' data/$naming-c3.dat && \
        sed -n -e '/ 4 /p' data/$naming-c.txt > data/$naming-c4.dat && sed -i '/Average/d' data/$naming-c4.dat && \
        sed -n -e '/ 5 /p' data/$naming-c.txt > data/$naming-c5.dat && sed -i '/Average/d' data/$naming-c5.dat && \
        sed -n -e '/ 6 /p' data/$naming-c.txt > data/$naming-c6.dat && sed -i '/Average/d' data/$naming-c6.dat && \
        sed -n -e '/ 7 /p' data/$naming-c.txt > data/$naming-c7.dat && sed -i '/Average/d' data/$naming-c7.dat &

	# CAPTURE RAM UTILIZATION DATA
	sar -r 1 86400 > data/$naming-r.txt && \
		cp data/$naming-r.txt data/$naming-r.dat && \
		sed -i '/Linux/d' data/$naming-r.dat && \
		sed -i '/kbmemfree/d' data/$naming-r.dat && \
		sed -i '/Average/d' data/$naming-r.dat && \
		sed -i '1d' data/$naming-r.dat &


	# CAPTURE IO UTILIZATION DATA
	sar -b 1 86400 > data/$naming-i.txt && \
		cp data/$naming-i.txt data/$naming-i.dat && \
		sed -i '/Linux/d' data/$naming-i.dat && \
		sed -i '/tps/d' data/$naming-i.dat && \
		sed -i '/Average/d' data/$naming-i.dat && \
		sed -i '1d' data/$naming-i.dat


	total_time=86400
    echo "Done!"
}

howtouse(){
	cat <<-'EOF'
	This script can work with or without parameters.
	Without parameters, just execute it --> ./data_collector.sh
	If you use parameters, this is the correct format:
		-n [samples]          number of samples to take
		-i [interval]         interval (in seconds) between each sample
		-m [mail]             mail address to send the graphs to
		-h                    help

	Examples:
		# Send by email statistics from 10 samples, taken each one 
		# every 1 second
		./data_collector.sh -n 10 -i 1 -m example@example.com
		# Generate statistics from 20 samples, taken each one 
		# very 2 seconds
		./data_collector.sh -n 20 -i 2 
	EOF
}

# ======================
# MAIN
# ======================

if [ "$#" -eq 0 ];then
	#echo -n "Please specify the number of samples to take-> "
	#read number_of_samples
	#echo -n "Please specify the sample interval (take sample 
	# every X seconds)-> "
	#read sample_interval

	# example: gcp-uc1-b-srt
	#echo -n "csp-ucNo-datascale-wrkload:"
	#read $naming

	# Begin collecting data with sar
	sar_collectors

	# Call plotter.sh to generate the graphs
	#./plotter.sh

elif [ "$#" -ne 0 ];then
    while getopts ":p:n:i:m:h" opt; do
        case $opt in
            "p")
                naming="$OPTARG"
                ;;
            "n")
                number_of_samples="$OPTARG"
                ;;
            "i")
                sample_interval="$OPTARG"
                ;;
            "m")
                mail_to="$OPTARG"
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                howtouse
                exit 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                howtouse
                exit 1
                ;;
            "h"|*)
                howtouse
                exit 1
                ;;
        esac
    done
    # Begin collecting data with sar
    sar_collectors

    # Call plotter.sh to generate the graphs
    #./plotter.sh

    # Send mail if specified
    #if [[ $mail_to ]];then
    #	echo "SARVIEWER - data_collector.sh sysstat statistics for 
    #   $(hostname)" | mutt -a graphs/*.png -s "SARVIEWER - 
    #   data_collector.sh sysstat statistics for $(hostname)" 
    #   -- $mail_to
    #fi
fi

```
Make the file executable with following command:
  
```bash
$ sudo chmod +x datacollector.sh
```  
Create a folder to store captured data files

```bash
$ mkdir data
```
Running below command will start capturing system resource utilization on the respective machine. The parameter `gcp-uc1-w0-g-tera` specifies the file name that's going to be saved.  
To provide uniqueness in the filenames, following naming approach has been leveraged: 
`<csp>-<usecase>-<workernode>-<datascale>-<benchmark>`  

**`<csp>`**: Cloud Service Provider's shortname (**gcp** for Google Cloud Platform, **azu** for Azure, **ali** for Alibaba)  
**`<usecase>`**: Use Case number (uc1, uc2)  
**`<workernode>`**: Number of the worker node where the script runs (wo, w1, w2)  
**`<datascale>`**: data scale (**t**iny, **s**mall, **l**arge, **h**uge, **g**igantic)  
**`<benchmark>`**: Executed benchmark 

```bash
$ ./datacollector.sh -p gcp-uc1-w0-g-tera
```
How to stop the execution: `Ctrl+C` will terminate the data capturing process, raw files and their granulated `.dat` files will be saved to the specified `data` folder.
  
Notes: 
1. Since there are three worker nodes, given instructions are implemented on all worker nodes of the cluster, which is three nodes in our case.
2. In some cases, typing `Ctrl+C` did not save granulated `dat` files as expected, but only the raw (`.txt`) file. This is not a big issue, the raw file can be granulated manually by playing around with the codes in the script.
