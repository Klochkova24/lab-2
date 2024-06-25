#!/bin/bash

ip_address=$1

#Разбиваем IP-адрес на отдельные октеты
IFS='.' read -r -a octets <<< "$ip_address"

#Переводим каждый октет в двоичнуб систему счисления
binary_ip=""
for octet in "${octets[@]}"; do
    binary_octet=$(printf "%08d" $(bc <<< "obase=2; $octet"))
    binary_ip="${binary_ip}${binary_octet}."
done

#Выводим двоичное представление, удалив точку после последнего октета
echo ${binary_ip%?}
