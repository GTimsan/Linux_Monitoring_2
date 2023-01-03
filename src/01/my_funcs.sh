
# $1 - $after_div
# $2 - $i
# $3 - $3

function name_gen {
    coof=$(($1 * ${#3}))
    if [ "$1" -ge 2 ]; then
        count=2
    else
        count=$1
    fi

    if [ "$2" -le $((${#3} * $1 - 1)) ]; then
        finished=""
        dir_abs=$3
        # Количество букв в генераторе
        for (( j=0; j < ${#3}; j++ ))
        do
            CHR=${dir_abs:$j:1}
            # Генерируем нужное количество букв в слове
            expr2=$(($2 / $1))
            if [ "$expr2" -eq "$j" ]; then
                
                bonus=$(($2 % $1 + 1))
                if [ "${#3}" -eq 1 ]; then
                    bonus=$(($bonus + 1))
                fi
            else
                bonus=0
            fi
            for k in $(seq 1 $(($count + $bonus))); do 
            finished=$finished$(printf '%s' "$CHR") 
            done

        done

        echo $finished
    else 
        finished=""
        dir_abs=$3
        for (( j=0; j < ${#3}; j++ ))
        do
            CHR=${dir_abs:$j:1}
            if [ "$1" -eq 0 ]; then
                expr2=1
            else
                expr2=$(($2 / $1))
            fi
            for k in $(seq 1 $(($count + 1 + $2 - $coof))); do 
            finished=$finished$(printf '%s' "$CHR") 
            done
        done
        # echo $l
        # l=$((l + 1 ))
        echo $finished

    fi

}