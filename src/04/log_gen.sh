#!/bin/bash

random_date=$(date +'%Y-%m-%d' -d "-$(($RANDOM % 365 + 1)) day")
function date_gen {
    func_date=$(date +'%d/%b/%Y:%T %z' -d "$random_date +$1 min")
}
r_count=$(shuf -i 100-1000 -n1)
for ((i=0; i<r_count; i++)); do
    echo -n "$(($RANDOM % 255)).$(($RANDOM % 255)).$(($RANDOM % 255)).$(($RANDOM % 255)) - - "
    date_gen $i; echo -n "[$func_date] "
    method=(GET POST PUT PATCH DELETE)
    echo -n "\"${method[$RANDOM % 5]} "
    echo -n "/main/projects\" "
    response_code=(200 201 400 401 403 404 500 501 502 503)
    echo -n "${response_code[$RANDOM % 10]}"
    agent=("Mozilla" "Google" "Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
    echo " \"-\" \"${agent[$RANDOM % 9]}\" "

done

#                                           Коды ответов
# 200 - Запрос успешен
# 201 - Успешен, создан ресурс
# 400 - Плохой Запрос
# 401 - Неавторизированно
# 403 - Запрещенно, нет прав
# 404 - Не найден
# 500 - Внутренняя ошибка сервера
# 501 - Не выполнено. Метод запроса не поддерживается сервером
# 502 - Плохой шлюз
# 503 - Сервис не доступен