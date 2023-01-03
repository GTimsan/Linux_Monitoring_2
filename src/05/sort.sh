#!/bin/bash

if [ "$1" -eq 1 ]; then
    sort -k 4 ../04/*.log > sort1.txt
elif [ "$1" -eq 2 ]; then
    awk '{print $1}' ../04/*.log | sort -t '.' -k1,1n -k2,2 -k3,3n -k4,4 -u >sort2.txt
elif [ "$1" -eq 3 ]; then
    awk '($4~"4..")||($4~"5..")' ../04/*.log >sort3.txt
elif [ "$1" -eq 4 ]; then
    awk '($4~"4..")||($4~"5..")' ../04/*.log | sort -t '.' -k1,1n -k2,2 -k3,3n -k4,4 -u >sort4.txt
fi