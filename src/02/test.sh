#/bin/bash
# myArray=(1 2 "three" 4 "five")
# type="article"
# echo "Found 42 ${type}s"
# echo "Found 42 ${myArray[2]}"
path_array=($(find / -maxdepth 2 -type d -perm /u=w | grep -v 'bin\|sbin\|proc\|sys\|root\|run\|lost'))
antispam=()
echo "${path_array[@]}"
# while true
# do
#     val=$(($RANDOM % $((${#path_array[@]} - 1))))
#     if [[ " ${antispam[@]} " =~ " ${val} " ]]; then
#         echo "Совпадение $val"
#         # echo "${path_array[$val]}"
#         # Эту часть не выполнять
#     else
#         # Здесь вполняется основная часть кода
#         antispam+=($val)
#         # echo "${path_array[$val]}"
#         # echo "$val"
#     fi
#     # sleep 1
# done
# echo "${!testarr[$val]}"
# IFS=$'\n' array=( $(ls -l) )
# for rec in ${array[@]}; do 
    # echo ${array[1]} 
# done