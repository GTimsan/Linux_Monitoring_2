#!/bin/bash
# . ./myfuncs.sh
# echo $(pwd)
./checker.sh $1 $2 $3
if ! [ "$?" -gt 0 ]; then
    ./spam_gen.sh $1 $2 $3
    if [ "$?" -eq 5 ]; then
        echo "Осталось меньше 1гб свободной памяти"
    fi
    # echo "all good"
else
    echo "Error"
fi