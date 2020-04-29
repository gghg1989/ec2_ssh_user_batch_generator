#!/bin/bash

# Expire function
expire() {
        echo "Expiring $1..."
        usermod --expiredate 1 "$1"
}

# Validate function
validate() {
        echo "Validating $1..."
        usermod --expiredate "" "$1"
}

echo "Start expiring users..."

USER_NAME="group"

for i in {14..40}
do
        if [ "$i" -le 9 ];then
                USER_NAME+="0$i"
        else
                USER_NAME+="$i"
        fi
expire "$USER_NAME"
echo "$USER_NAME is expired!"
# validate "$USER_NAME"
#echo "$USER_NAME is validated!"

USER_NAME="group"
done
