#!/bin/bash
# . ./myfuncs.sh
# echo $(pwd)
if ! [[ "$1" =~ ^[1-3]?$ ]]; then
    echo "От 1 до 3"
    exit
fi 
if [ "$1" -eq 2 ]; then
    echo "Введите дату начала YYYY-MM-DD"
    read start_date
    echo "Введите время начала HH:MM"
    read start_time
    echo "Введите дату конца YYYY-MM-DD"
    read fin_date
    echo "Введите время конца HH:MM"
    read fin_time
    ./del.sh $1 $start_date $start_time $fin_date $fin_time
else
    ./del.sh $1
fi
# if ! [ "$?" -gt 0 ]; then
#     ./spam_gen.sh $1 $2 $3
#     if [ "$?" -eq 5 ]; then
#         echo "Осталось меньше 1гб свободной памяти"
#     fi
#     # echo "all good"
# else
#     echo "Error"
# fi