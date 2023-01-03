#!/bin/bash
. ./my_funcs.sh
# ------------------config-----------------------------------
log_file="../03/logging.txt"

# -----------------------------------------------------------
dir_count=$2
after_div=$(($dir_count / ${#3}))
mod=$(($dir_count % ${#3}))
file_size=$(echo "$6" | awk -F 'kb' '{print $1}')
# -----------------------------------------------------------

file_count=$4
first=$(echo "$5" | awk -F '.' '{print $1}')
second=$(echo "$5" | awk -F '.' '{print $2}')
after_div_file=$(($file_count / ${#first}))

for (( i=0; i < $dir_count; i++ ))
do
    root_size=$(echo $(df / | awk '(NR == 2)' | awk -F ' ' '{print $4}'))
    if [ "$root_size" -le 1000000 ]; then
        echo "kaput"
        exit 5
    fi
# -----------------------------------------------------------
    # name_gen $after_div $i $3
    created_dir=$1$(name_gen $after_div $i $3)$(date +"_%m%d%y")
    mkdir $created_dir
    echo $created_dir $(date "+%d-%m-%Y %H:%M:%S")" DIR" >> $log_file
# -----------------------------------------------------------
    for (( j=0; j < $file_count; j++ ))
    do
        root_size=$(echo $(df / | awk '(NR == 2)' | awk -F ' ' '{print $4}'))
        if [ "$root_size" -le 1000000 ]; then
            echo "kaput"
            exit 5
        fi
# -----------------------------------------------------------
        # mkdir $created_dir"/"$(name_gen $after_div_file $j $first)$(date +"_%m%d%y")
        # echo $created_dir"/"$(name_gen $after_div_file $j $first)$(date +"_%m%d%y")
        # file_saize
        created_file=$created_dir"/"$(name_gen $after_div_file $j $first)$(date +"_%m%d%y")"."$second
        fallocate -l $file_size"KB" $created_file
        # truncate -s $file_size"M" $created_file
        echo $created_file $(date "+%d-%m-%Y %H:%M:%S") $file_size"KB">> $log_file


    done
    # $(date +"_%m%d%y")
    # echo $first $second
done
