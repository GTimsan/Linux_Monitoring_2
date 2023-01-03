#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Введите 3 параметрa"
    exit 3
fi

if [[ "$1" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Первый параметр должен быть строкой ${#1}"
    exit 3
else 
    if ! [ "${#1}" -le 7 ]; then
        echo "Первый параметр: не более 7 символов"
        exit 3
    fi
fi

if ! [[ "$2" =~ ^[a-zA-Z]{2,7}[.][a-z]{2,3}$ ]]; then
    echo "Второй параметр должен быть формата asdfghj.sdf"
    exit 3
fi

if ! [[ "$3" =~ ^[0-9]{1,3}Mb$ ]]; then
    echo "Третий параметр должен быть формата 100Mb"
    exit 3
else
    var=$(echo "$3" | awk -F 'Mb' '{print $1}')
    if ! [ "$var" -le 100 ]; then
    echo "Третий параметр <= 100Mb"
        exit 3
    fi
    # echo $var
fi

