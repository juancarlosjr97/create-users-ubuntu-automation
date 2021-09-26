#!/bin/bash

# Install dependencies
apt-get update
apt-get install sudo -y
apt-get install whois -y

#Add user 'root' as 'root' group
usermod -aG sudo root

export LC_ALL=C

# Execute user creation automatically on docker start-up
./root/create-users.sh /root/users.csv

# Execute automatically a test to check users password
./root/test-users.sh /root/users.csv

#Docker entrypoint
/usr/sbin/sshd -D


