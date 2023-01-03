#!/bin/bash

for ((i=1; i<6; i++)); do
    echo -n > "day_log$i.log"
    ./log_gen.sh>>"day_log$i.log"
done