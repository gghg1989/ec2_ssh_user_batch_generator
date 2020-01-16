#!/bin/bash

# Purge function
purge () {
    echo "Purging $1..."
    userdel -r "$1"
    rm "keypairs/$1.pem"
    rm "keypairs/$1.pub"
    rm "keypairs/$1.info"
}

echo "Start purging..."

USER_NAME="group"

for i in {10..10}
do
    if [ "$i" -le 9 ];then
        USER_NAME+="0$i"
        purge "$USER_NAME"
        echo "$USER_NAME is purged!"
    else
        USER_NAME+="$i"
        purge "$USER_NAME"
        echo "$USER_NAME is purged!"
    fi
USER_NAME="group"
done
