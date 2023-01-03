#!/bin/bash

report="metrics.html"
function info() {

    echo -e "# HELP system cpu\n# TYPE system_cpu gauge"
    echo "system_cpu "$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    echo -e "\n# HELP ram total \n# TYPE ram_total gauge"
    echo $(free -m | awk '/Mem:/ {printf "ram_total %d", $2}')

    echo -e "\n# HELP ram used \n# TYPE ram_used gauge"
    echo $(free -m | awk /Mem:/'{printf "ram_used %d", $3}') 

    echo -e "\n# HELP ram free \n# TYPE ram_free gauge"
    echo $(free -m | awk /Mem:/'{printf "ram_free %d", $4}')

    echo -e "\n# HELP ram available \n# TYPE ram_available gauge"
    echo $(free -m | awk /Mem:/'{printf "ram_available %d", $7}')

    echo -e "\n# HELP available space \n# TYPE available_space gauge"
    echo $(df / | tail -1 | awk '{printf "available_space %d", $4}' )

}

while true; do
    info > $report
    sleep 5
done
