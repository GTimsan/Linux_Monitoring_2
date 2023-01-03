#!/bin/bash
# . ./myfuncs.sh

./checker.sh $1 $2 $3 $4 $5 $6
if ! [ "$?" -gt 0 ]; then
    ./spam_gen.sh $1 $2 $3 $4 $5 $6
    if [ "$?" -eq 5 ]; then
        echo "Осталось меньше 1гб свободной памяти"
    fi
else
    echo "Error"
fi