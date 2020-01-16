#!/bin/bash

# Make sharable function
make_sharable () {
    mv "$1.pem" "$1.txt" 
}

echo "Start making private keys sharable..."

USER_NAME="group"

for i in {1..40}
do
    if [ "$i" -le 9 ];then
        USER_NAME+="0$i"
        make_sharable "$USER_NAME"
        echo "$USER_NAME is sharable!"
    else
        USER_NAME+="$i"
        make_sharable "$USER_NAME"
        echo "$USER_NAME is sharable!"
    fi
USER_NAME="group"
done