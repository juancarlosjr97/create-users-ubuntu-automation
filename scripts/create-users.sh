#!/bin/bash

INPUT=$@
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

sed 1d $INPUT | while read -r username password
do 
	echo creating user: $username
    sudo adduser --quiet --no-create-home --gecos "" --disabled-password $username
    sudo mkdir -p /home/$username
    sudo chown $username:$username /home/$username
    sudo chmod 750 /home/*
    echo "$username:$password" | chpasswd
    echo "User $username created successfully :)"
done

sudo chmod o-x /home/*
