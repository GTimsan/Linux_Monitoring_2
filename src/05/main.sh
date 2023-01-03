#!/bin/bash

if [ "$#" -eq 1 ]; then
    ./sort.sh $1
else
    echo "1 параметр"
fi