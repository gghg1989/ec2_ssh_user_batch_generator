#!/bin/bash

# Purge function
enable_copy () {
    chmod 604 "keypairs/$1.pem"
}

disable_copy () {
    chmod 600 "keypairs/$1.pem" 
}

echo "Start literating..."

USER_NAME="group"

for i in {1..40}
do
    if [ "$i" -le 9 ];then
        USER_NAME+="0$i"
        #enable_copy "$USER_NAME"
        #echo "$USER_NAME is allowed to copy!"
        disable_copy "$USER_NAME"
        echo "$USER_NAME is disabled to copy!"
    else
        USER_NAME+="$i"
        #enable_copy "$USER_NAME"
        #echo "$USER_NAME is allowed to copy!!"
        disable_copy "$USER_NAME"
        echo "$USER_NAME is disabled to copy!"
    fi
USER_NAME="group"
done
