#!/bin/bash

INPUT=$@
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

sed 1d $INPUT | while read -r username password
do 
    user=$username
    hpw=$(grep "^$user:" /etc/shadow | cut -d ':' -f 2)
    result=$(grep -q "^$user:$(mkpasswd --method=sha-512 -S ${hpw:3:8} $password)" /etc/shadow && echo Correct || echo 'Wrong!')
    if [ "Correct" = $result ]; then
        echo "User $username has been set with the correct password"
    else
        echo "User $username has a wrong password"
    fi
done
