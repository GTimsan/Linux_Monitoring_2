#!/bin/bash

# for word in $(cat logging.txt)
# do
#     echo $word
# done
if [ "$1" -eq 1 ]; then
    IFS=$'\n'
    for line in $(cat logging.txt)
    do
        dir_path=$(echo $line | awk -F ' ' '{print $4}')
        if [ "$dir_path" = "DIR" ]; then
            path_for_del=$(echo $line | awk -F ' ' '{print $1}')
            sudo rm -rf $path_for_del
            echo -n > logging.txt # не удалять !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            # echo $? "1"
        fi
        # echo $line | grep "DIR"


    done
elif [ "$1" -eq 2 ]; then

    array=($(sudo find / -type d -perm /u=w -newerct "$2 $3" ! -newerct "$4 $5" -regex "[/a-zA-Z0-9_\.\-]*[a-z]*[_]+[0-9][0-9][0-9][0-9][0-9][0-9]$" | grep -v 'bin\|sbin\|proc\|sys\|root\|run\|lost\|dev'))
    for path in ${array[@]}
    do
        sudo rm -rf "$path"
        echo "$path/"
        echo -n > logging.txt # не удалять !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


    done

    echo "${array[@]}"
    echo $2
    echo $3
    echo $4
    echo $5
        

    # echo "2"
elif [ "$1" -eq 3 ]; then
    # path_array=($(find / -maxdepth 2 -type d -perm /u=w | grep -v 'bin\|sbin\|proc\|sys\|root\|run\|lost\|dev'))
    array=($(sudo find / -type d -regex "[/a-zA-Z0-9_\.\-]*[a-z]*[_]+[0-9][0-9][0-9][0-9][0-9][0-9]$" | grep -v '\//'))
    for path in ${array[@]}
    do
        # sudo find "$path/" -type d -regex "[/a-z\.]*[a-z]*[_]+[0-9][0-9][0-9][0-9][0-9][0-9]$" | grep -v '\//'
    #     echo "$?"
        sudo rm -rf "$path"
        echo "$path/"
        echo -n > logging.txt # не удалять !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    # #     # sudo find "$path/" -type d -regex "[/a-z]*[a-z]*[_][0-9]*$"

    done

        # sudo find /var/ -type d -regex "[/a-z\.]*[a-z]*[_]+[0-9]*$"
        # sudo find /var/mail/ -type d 
        # ls -la /var/mail/
    # echo "3"

fi