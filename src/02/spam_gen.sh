#!/bin/bash
. ./my_funcs.sh
# ------------------config-----------------------------------
log_file="../03/logging.txt"

# -----------------------------------------------------------
dir_count=$(($RANDOM % 100)) # вернуть
# dir_count=5
after_div=$(($dir_count / ${#1}))
mod=$(($dir_count % ${#1}))
file_size=$(echo "$3" | awk -F 'Mb' '{print $1}')
# -----------------------------------------------------------

file_count=$(($RANDOM % 500)) # вернуть
# file_count=5
first=$(echo "$2" | awk -F '.' '{print $1}')
second=$(echo "$2" | awk -F '.' '{print $2}')
after_div_file=$(($file_count / ${#first}))
path_array=($(find / -maxdepth 2 -type d -perm /u=w | grep -v 'bin\|sbin\|proc\|sys\|root\|run\|lost\|dev'))
antispam=()
# echo "${path_array[@]}"
while true
do
    val=$(($RANDOM % $((${#path_array[@]} - 1))))
    if [[ " ${antispam[@]} " =~ " ${val} " ]]; then
        echo "Совпадение $val"
        # Эту часть не выполнять
    else
        # Здесь вполняется основная часть кода
        antispam+=($val)
        # echo "${path_array[$val]}"
        # echo "$val"
        for (( i=0; i < $dir_count; i++ ))
        do
            root_size=$(echo $(df / | awk '(NR == 2)' | awk -F ' ' '{print $4}'))
            if [ "$root_size" -le 1000000 ]; then
                echo "kaput"
                exit 5
            fi
        # -----------------------------------------------------------
            # created_dir="/home/student/monitor_2/02/test/"$(name_gen $after_div $i $1)$(date +"_%m%d%y")
            sudo chmod a+w "${path_array[$val]}"
            created_dir="${path_array[$val]}/"$(name_gen $after_div $i $1)$(date +"_%m%d%y")
            # created_dir=$1$(name_gen $after_div $i $3)$(date +"_%m%d%y")
            sudo mkdir $created_dir
            echo "$?"
            if [ "$?" -eq 0 ]; then
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
                    sudo fallocate -l $file_size"MB" $created_file
                    # truncate -s $file_size"M" $created_file
                    echo $created_file $(date "+%d-%m-%Y %H:%M:%S") $file_size"MB">> $log_file


                done
            fi
            # $(date +"_%m%d%y")
            # echo $first $second
        done
    fi
    # sleep 1
done
