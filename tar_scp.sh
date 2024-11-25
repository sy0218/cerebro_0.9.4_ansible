#!/usr/bin/bash

system_file="/data/work/system_download.txt"

cerebro_array=($(cat ${system_file} | grep cerebro_ip | awk -F '|' '{for(i=2; i<=NF; i++) print $i}'))
len_array=${#cerebro_array[@]}

ansible_dir=$1
tar_dir=$2

for ((i=0; i<len_array; i++));
do
        current_ip=${cerebro_array[$i]}
	scp ${ansible_dir}/*cerebro-?.?.?.* root@${current_ip}:${tar_dir}/
done
